package com.example.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import com.example.common.enums.OrderStatusEnum;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Goods;
import com.example.entity.Orders;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.example.mapper.OrdersMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT = '订单表业务处理
 **/
@Service
public class OrdersService {

    @Resource
    private OrdersMapper ordersMapper;

    @Resource
    UserService userService;

    @Resource
    GoodsService goodsService;

    /**
     * 下单
     */
    public void add(Orders orders) {
        // 1. 校验用户的余额
        Account currentUser = TokenUtils.getCurrentUser();
        if (!RoleEnum.USER.name().equals(currentUser.getRole())) {
            throw new CustomException(ResultCodeEnum.ROLE_ERROR);
        }
        Integer userId = currentUser.getId();
        User user = userService.selectById(userId);
        BigDecimal account = user.getAccount();  // 用户余额
        Integer goodsId = orders.getGoodsId();
        Goods goods = goodsService.selectById(goodsId);
        if (goods == null) {
            throw new CustomException(ResultCodeEnum.GOODS_ERROR);
        }
        Integer num = orders.getNum();
        BigDecimal price = goods.getPrice();
        BigDecimal total = price.multiply(BigDecimal.valueOf(num));  // 总价格
        if (account.compareTo(total) < 0) {  // 余额不足
            throw new CustomException(ResultCodeEnum.ACCOUNT_ERROR);
        }
        Integer store = goods.getStore();
        if (store < num) {
            throw new CustomException(ResultCodeEnum.STORE_ERROR);
        }
        // 2. 扣减商品库存  更新商品信息
        goods.setStore(store - num);
        goodsService.updateById(goods);
        // 3. 扣减余额  更新用户信息
        user.setAccount(user.getAccount().subtract(total));
        userService.updateById(user);
        // 4. 创建订单  orderNo唯一
        String orderNo = IdUtil.getSnowflakeNextId() + "";
        orders.setOrderNo(orderNo);
        orders.setStatus(OrderStatusEnum.NO_SEND.getValue()); // 待支付
        orders.setTotal(total);
        orders.setTime(DateUtil.now());
        orders.setUserId(currentUser.getId());
        orders.setName(goods.getName());
        orders.setImg(goods.getImg());
        orders.setPrice(goods.getPrice());
        ordersMapper.insert(orders);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        ordersMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            ordersMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Orders orders) {
        ordersMapper.updateById(orders);
    }

    /**
     * 根据ID查询
     */
    public Orders selectById(Integer id) {
        return ordersMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Orders> selectAll(Orders orders) {
        return ordersMapper.selectAll(orders);
    }

    /**
     * 分页查询
     */
    public PageInfo<Orders> selectPage(Orders orders, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        // 如果是普通用户 那么只查询自己的订单
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            orders.setUserId(currentUser.getId());
        }
        List<Orders> list = ordersMapper.selectAll(orders);
        return PageInfo.of(list);
    }

    public void cancel(Orders orders) {
        orders.setStatus(OrderStatusEnum.CANCEL.getValue());
        this.updateById(orders);
        BigDecimal total = orders.getTotal();
        Account currentUser = TokenUtils.getCurrentUser();
        if (!RoleEnum.USER.name().equals(currentUser.getRole())) {
            throw new CustomException(ResultCodeEnum.ROLE_ERROR);
        }
        Integer userId = currentUser.getId();
        User user = userService.selectById(userId);
        BigDecimal account = user.getAccount();  // 用户余额
        user.setAccount(account.add(total));
        userService.updateById(user);
    }

}
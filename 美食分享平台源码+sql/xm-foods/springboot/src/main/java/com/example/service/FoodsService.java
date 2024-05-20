package com.example.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.RandomUtil;
import com.example.common.enums.ModuleEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Collect;
import com.example.entity.Foods;
import com.example.mapper.FoodsMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 美食业务处理
 **/
@Service
public class FoodsService {

    @Resource
    private FoodsMapper foodsMapper;
    @Resource
    CollectService collectService;

    /**
     * 新增
     */
    public void add(Foods foods) {
        foods.setTime(DateUtil.now());
        foodsMapper.insert(foods);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        foodsMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            foodsMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Foods foods) {
        foodsMapper.updateById(foods);
    }

    /**
     * 根据ID查询
     */
    public Foods selectById(Integer id) {
        Foods foods = foodsMapper.selectById(id);
        Account currentUser = TokenUtils.getCurrentUser();
        Integer userId = null;
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            userId = currentUser.getId();
        }
        List<Collect> collectList = collectService.selectCollect(id, userId, ModuleEnum.FOODS.getValue());
        foods.setUserCollect(CollUtil.isNotEmpty(collectList));

        List<Collect> list = collectService.selectCollect(id, null, ModuleEnum.FOODS.getValue());
        foods.setCollectCount(list.size());
        return foods;
    }

    /**
     * 查询所有
     */
    public List<Foods> selectAll(Foods foods) {
        // 如果是普通用户 那么只查询自己的菜谱
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            foods.setUserId(currentUser.getId());
        }
        return foodsMapper.selectAll(foods);
    }

    /**
     * 分页查询
     */
    public PageInfo<Foods> selectPage(Foods foods, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Foods> list = foodsMapper.selectAll(foods);
        return PageInfo.of(list);
    }

    /**
     * 查询推荐的菜谱
     * 浏览榜单前4
     * 从前10的菜谱里面随机找到4个
     */
    public List<Foods> selectRecommend() {
        List<Foods> foodsList = foodsMapper.selectTop10();
        if (foodsList.size() <= 4) {
            return foodsList;
        }
        List<Foods> foods = new ArrayList<>();
        Set<Integer> nums = new HashSet<>();
        while (nums.size() < 4) {
            int num = RandomUtil.randomInt(0, foodsList.size() - 1); // 随机找到一个序号 这个序号就是 foodsList 其中一个元素的序号
            if (!nums.contains(num)) {
                nums.add(num);
                Foods f = foodsList.get(num);
                foods.add(f);
            }
        }
        return foods;
    }

    public void updateCount(Integer id) {
        foodsMapper.updateCount(id);
    }

    public List<Foods> selectCollect(Foods foods) {
        // 如果是普通用户 那么只查询自己的菜谱
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            foods.setUserId(currentUser.getId());
        }
        return foodsMapper.selectCollect(foods);
    }

    // 统计最近7天每天发布的菜谱的数量
    public List<Dict> selectCount() {
        List<Foods> foodsList = foodsMapper.selectAll(null);  // 查出所有的美食菜谱
        // 先查最近一周的日期
        Date today = new Date();
        DateTime yesterday = DateUtil.offsetDay(today, -1);
        DateTime date = DateUtil.offsetDay(today, -7);
        List<DateTime> dateTimeList = DateUtil.rangeToList(date, yesterday, DateField.DAY_OF_YEAR);
        List<String> dateList = dateTimeList.stream().map(DateUtil::formatDate).collect(Collectors.toList());  //  2024-01-10
        List<Dict> dictList = new ArrayList<>();
        for (String dateStr : dateList) {  // 2024-01-10
            long count = foodsList.stream().filter(foods -> foods.getTime().contains(dateStr)).count();
            Dict dict = Dict.create().set("date", dateStr.substring(5)).set("count", count);
            dictList.add(dict);
        }
        return dictList;
    }

    public List<Dict> selectCategoryCount() {
        List<Foods> foodsList = foodsMapper.selectAll(null);
        Set<String> categorySet = foodsList.stream().map(Foods::getCategory).collect(Collectors.toSet());
        List<Dict> dictList = new ArrayList<>();
        for (String category : categorySet) {
            long count = foodsList.stream().filter(foods -> foods.getCategory().equals(category)).count();
            Dict dict = Dict.create().set("name", category).set("value", count);
            dictList.add(dict);
        }
        return dictList;
    }
}
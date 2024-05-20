package com.example.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Dict;
import com.example.common.enums.ModuleEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.mapper.NotebookMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 美食笔记业务处理
 **/
@Service
public class NotebookService {

    @Resource
    private NotebookMapper notebookMapper;

    @Resource
    private CollectService collectService;

    @Resource
    private LikesService likesService;

    /**
     * 新增
     */
    public void add(Notebook notebook) {
        notebook.setDate(DateUtil.today());
        notebookMapper.insert(notebook);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        notebookMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            notebookMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Notebook notebook) {
        notebookMapper.updateById(notebook);
    }

    /**
     * 根据ID查询
     */
    public Notebook selectById(Integer id) {
        Notebook notebook = notebookMapper.selectById(id);
        Account currentUser = TokenUtils.getCurrentUser();
        Integer userId = null;
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            userId = currentUser.getId();
        }
        List<Collect> collectList = collectService.selectCollect(id, userId, ModuleEnum.NOTEBOOK.getValue());
        notebook.setUserCollect(CollUtil.isNotEmpty(collectList));

        List<Collect> list = collectService.selectCollect(id, null, ModuleEnum.NOTEBOOK.getValue());
        notebook.setCollectCount(list.size());

        List<Likes> likesList = likesService.selectLikes(id, userId, ModuleEnum.NOTEBOOK.getValue());
        notebook.setUserLike(CollUtil.isNotEmpty(likesList));

        List<Likes> allLikesList = likesService.selectLikes(id, null, ModuleEnum.NOTEBOOK.getValue());
        notebook.setLikesCount(allLikesList.size());
        return notebook;
    }

    /**
     * 查询所有
     */
    public List<Notebook> selectAll(Notebook notebook) {
        // 如果是普通用户 那么只查询自己的菜谱
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            notebook.setUserId(currentUser.getId());
        }
        return notebookMapper.selectAll(notebook);
    }

    /**
     * 分页查询
     */
    public PageInfo<Notebook> selectPage(Notebook notebook, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notebook> list = notebookMapper.selectAll(notebook);
        return PageInfo.of(list);
    }

    public void updateCount(Integer id) {
        notebookMapper.updateCount(id);
    }

    public List<Notebook> selectCollect() {
        Integer userId = null;
        // 如果是普通用户 那么只查询自己的菜谱
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            userId = currentUser.getId();
        }
        return notebookMapper.selectCollect(userId);
    }


    // 统计最近7天每天发布的笔记的数量
    public List<Dict> selectCount() {
        List<Notebook> notebookList = notebookMapper.selectAll(null);  // 查出所有的美食菜谱
        // 先查最近一周的日期
        Date today = new Date();
        DateTime yesterday = DateUtil.offsetDay(today, -1);
        DateTime date = DateUtil.offsetDay(today, -7);
        List<DateTime> dateTimeList = DateUtil.rangeToList(date, yesterday, DateField.DAY_OF_YEAR);
        List<String> dateList = dateTimeList.stream().map(DateUtil::formatDate).collect(Collectors.toList());  //  2024-01-10
        List<Dict> dictList = new ArrayList<>();
        for (String dateStr : dateList) {  // 2024-01-10
            long count = notebookList.stream().filter(foods -> foods.getDate().contains(dateStr)).count();
            Dict dict = Dict.create().set("date", dateStr.substring(5)).set("count", count);
            dictList.add(dict);
        }
        return dictList;
    }

}
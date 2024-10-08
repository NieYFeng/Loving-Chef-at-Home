package com.yupi.project.model.dto.menu;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户创建请求
 *
 * @author nyf
 */
@Data
public class MenuAddRequest implements Serializable {

    /**
     * 家的id
     */
    private Long homeId;

    /**
     * 菜品昵称
     */
    private String dishName;

    private Integer price;

    /**
     * 菜品分类
     */
    private String category;

    /**
     * 菜品介绍
     */
    private String dishText;

    /**
     * 菜品图片
     */
    private String dishPhoto;

    private static final long serialVersionUID = 1L;
}
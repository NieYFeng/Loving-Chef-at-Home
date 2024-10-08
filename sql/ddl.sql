-- 创建库
create database if not exists my_db;

-- 切换库
use my_db;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userName     varchar(256)                           null comment '用户昵称',
    openid       VARCHAR(128) NOT NULL UNIQUE,          -- 微信用户的唯一标识
    userAvatar   varchar(1024)                          null comment '用户头像',
    gender       tinyint                                null comment '性别',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user / admin',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除'
) comment '用户';

-- 帖子表
create table if not exists post
(
    postId            bigint auto_increment comment 'id' primary key,
    content       text                               null comment '内容',
    photo         varchar(1024)                      null comment '照片地址',
    reviewStatus  int      default 0                 not null comment '状态（0-待审核, 1-通过, 2-拒绝）',
    reviewMessage varchar(512)                       null comment '审核信息',
    viewNum       int                                not null default 0 comment '浏览数',
    thumbNum      int                                not null default 0 comment '点赞数',
    userId        bigint                             not null comment '创建用户 id',
    createTime    datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间'
) comment '帖子';

create table if not exists comment
(
    commentId     bigint auto_increment comment 'id' primary key,
    content       text                               null comment '内容',
    postId        int                                not null comment '对应的帖子',
    userId        int                                not null comment '发帖用户',
    createTime    datetime default CURRENT_TIMESTAMP not null comment '创建时间'
)comment '评论';

create table if not exists dish
(
    dishId           bigint auto_increment comment 'id' primary key,
    homeId       bigint                             not null comment '家的Id',-- 菜品表中的家的ID字段
    dishName     varchar(256)                       null comment '菜品名称',
    dishText     varchar(256)                       null comment '菜品描述',
    dishPhoto    varchar(256)                       null comment '菜品图片',
    price        tinyint default 0                  not null default 0 comment '菜品价格',
    category     varchar(256)                       null comment '菜品类别',
    updateTime    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    createTime    datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    isDelete      tinyint  default 0                 not null comment '是否删除'
)




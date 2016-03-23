//
//  GirlPublic.swift
//  Girl
//
//  Created by 梦想 on 16/3/23.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

/** 全局配色*/
let BASE_COLOR = UIColor.colorWithRGB(33, g: 198, b: 200, a: 1.0)

/** 服务器*/
/** 美女图库服务器列表*/
let GIRLS_HOST_LIST   = "http://apis.baidu.com/tngou/gallery/list"
/** 图库详情*/
let GIRLS_HOST_SHOW   = "http://apis.baidu.com/tngou/gallery/show"
/** 查看图片详情*/
let GIRLS_HOST_DETAIL = "http://tnfs.tngou.net/img"

/** 设备的宽*/
let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.size.width
/** 设备的高*/
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

/** 等比放大*/
func H(H:CGFloat)-> CGFloat  {
    return UIView.setHeight(H)
}
func W(W:CGFloat)-> CGFloat  {
    return UIView.setWidth(W)
}
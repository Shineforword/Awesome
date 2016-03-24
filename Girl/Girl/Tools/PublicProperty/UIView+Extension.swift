//
//  UIView+Extension.swift
//  Girl
//
//  Created by 梦想 on 16/3/23.
//  Copyright © 2016年 梦想. All rights reserved.
//

import Foundation
import UIKit
/** 当前设备的宽和320的比例*/
let WRATTO = SCREEN_WIDTH/320
/** 当前设备的高和480的比例*/
let HRATTO = SCREEN_HEIGHT/480

var width :CGFloat?
var height :CGFloat?

extension UIView {
    
    /** 等比例放大宽*/
   class func setWidth(width:CGFloat) ->CGFloat
   {
        return width * WRATTO
    
    }
    
    /** 等比例放大高*/
    class func setHeight(height:CGFloat) ->CGFloat
    {
        return height * HRATTO
        
    }
    
    /** 获取视图左*/
    public func left()->CGFloat{
        
        return self.frame.origin.x
    }
    
    /** 获取视图友*/
    public func right()->CGFloat{
        
        return self.frame.origin.x + self.frame.size.width
    }
    
    /** 获取视图上*/
    public func top()->CGFloat{
        
        return self.frame.origin.y
    }
    
    /** 获取视图底*/
    public func bottom()->CGFloat{
        
        return self.frame.origin.y + self.frame.size.height
    }
    
    /** 获取视图宽*/
    public func width()->CGFloat{
       
        return self.frame.size.width
    }
   
    /** 获取视图高*/
    public func height()->CGFloat{
       
        return self.frame.size.height
    }
    
    /** 给视图添加手势*/
    public func addTapGesturesTarget(target:AnyObject, action selector:Selector){
       
        self.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: target, action: selector)
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        
    }
    /** 将此视图上所有子视图移除*/
    public func removeAllSubviews(){
        while (self.subviews.count != 0)
        {
            let child = self.subviews.last
            child!.removeFromSuperview()
        }
    }
    /** 给此视图的所有子视图设置随机色*/
    public func makeSubviewRandomColor(){
        for view in self.subviews{
            view.backgroundColor = UIColor.randomColor()
        }
    }

    

}
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
    
   class func setWidth(width:CGFloat) ->CGFloat
   {
         return width * WRATTO
    
    }
    
    class func setHeight(height:CGFloat) ->CGFloat
    {
        return height * HRATTO
        
    }
    

}
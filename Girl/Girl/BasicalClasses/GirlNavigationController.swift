//
//  GirlNavigationController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class GirlNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //修改基本属性
//       let bar =  UINavigationBar.appearance()
//        bar.barTintColor = UIColor.clearColor()
       
        //状态栏样式
        UIApplication.sharedApplication().statusBarStyle = .Default
        
    }

    func popself(){
        
        self.popViewControllerAnimated(true)

    }
    
    func createBackButton() ->UIBarButtonItem{
        
        let image = UIImage.init(named: "nav_back")
        let backFrame = CGRectMake(0, 0, 20, 20)
        let backButton = UIButton.init(type: .Custom)
        backButton.frame = backFrame
        backButton.setImage(image, forState: .Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        backButton.titleLabel?.font = UIFont.systemFontOfSize(12)
        
        //定制自己风格的UIBarButtonItem
        let barButtonItem = UIBarButtonItem.init(customView: backButton)
        
        return barButtonItem
        
    }
    //返回
    override func pushViewController(viewController: UIViewController, animated: Bool) {
       super.pushViewController(viewController, animated: animated)
        if viewController.navigationItem.leftBarButtonItem == nil
            && self.viewControllers.count > 1
        {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = self.createBackButton()
            
        }
        //返回手势
        if self.respondsToSelector("interactivePopGestureRecognizer")
        {
            self.interactivePopGestureRecognizer?.enabled = true
            self.interactivePopGestureRecognizer?.delegate = nil
        }
        //禁用iOS 7 返回手势
        if ((viewController.navigationController?.respondsToSelector("interactivePopGestureRecognizer")) != nil)
        {
            
            viewController.navigationController?.interactivePopGestureRecognizer?.enabled = false
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

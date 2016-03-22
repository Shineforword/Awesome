//
//  GirlTabBarController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class GirlTabBarController: UITabBarController {

    var mainBarNav:GirlNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加所有子控制器
        self.addAllChildVC()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addAllChildVC(){
       
        //首页
        let homePageVC = HomePageController()
        self.addOneChildVC(homePageVC, title: "Home", imageName: "tab_home", selectImageName: "tab_home_pre")
        
        //进阶
        let progressVC = ProgressController()
        self.addOneChildVC(progressVC, title: "Progress", imageName: "tab_progress", selectImageName: "tab_progress_pre")

        //发现
        let discoverVC = DiscoverController()
        self.addOneChildVC(discoverVC, title: "Discover", imageName: "tab_discover", selectImageName: "tab_discover_pre")

        //我
        let meVC = FavourController()
        self.addOneChildVC(meVC, title: "Fav", imageName: "tab_fav", selectImageName: "tab_fav_pre")

    }
    
    //添加子控制器
    func addOneChildVC(childVC:UIViewController, title:String, imageName:String, selectImageName:String)
    {
        childVC.tabBarItem.title = title
        childVC.navigationItem.title = title;
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.colorWithRGB(33, g: 198, b: 200, a: 1.0)], forState: .Selected)
        //设置图标
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        //改变系统,显示原色
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectImageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //设置根导航控制器
        self.mainBarNav = GirlNavigationController(rootViewController:childVC)
        
        //
        self.addChildViewController(self.mainBarNav!)
        
    }


}
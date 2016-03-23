//
//  HomePageController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class HomePageController: GirlBaseUIViewController ,ChildrenViewProtcol ,ChildrenViewDelegate{

    var package:ChildrenView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //测试
        let  changeDic = ["title":"代理","goTitle":"变换"]
        let  changeColor = ChildrenView.init(
            frame: CGRectMake(0, 64, SCREEN_WIDTH , H(100)),
            model:ChildrenView.ChildrenModel.init(infoDic:changeDic))
        changeColor.delegate = self
        changeColor.optionalDelegate = self
        changeColor.type = actionType.changeColor
        self.view.addSubview(changeColor)
        
        //
        let  packageDic = ["title":"闭包","goTitle":"跳转"]
        package = ChildrenView.init(
            frame: CGRectMake(0, CGRectGetMaxY(changeColor.frame), SCREEN_WIDTH , H(100)),
            model:ChildrenView.ChildrenModel.init(infoDic:packageDic))
        package!.delegate = self
        package!.type = actionType.Push
        self.view.addSubview(package!)

        
        // Do any additional setup after loading the view.
    }
    //闭包函数指针
    func packageFunctionThatTakeClosure(color:UIColor) ->Void
    {
        
        // function body goes here
        self.package?.backgroundColor = color
        
    }

    //ChildrenViewProtcol-Delegate
   
    func gotoChangeViewColor(color:UIColor){
        self.view.backgroundColor = color
    }
    
    func gotoNextController() {
        let testVC = TestController()
        /*
         *将当前someFunctionThatTakesAClosure函数指针传到第二个界面，
         *第二个界面的闭包拿到该函数指针后会进行回调该函数*/
        testVC.initWithClosure(packageFunctionThatTakeClosure)
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    
    func defaultAction() {
        
    }
   
    //ChildrenViewDelegate 可选
    func testOptionalDelegateFour() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

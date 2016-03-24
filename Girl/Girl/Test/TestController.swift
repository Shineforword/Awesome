//
//  TestController.swift
//  Girl
//
//  Created by 梦想 on 16/3/23.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

/** 闭包:定义一个包()*/
typealias sendValueClosure = (color : UIColor)->()

class TestController: UIViewController,ChildrenViewProtcol{

    /** 声明一个包*/
    var myClosure:sendValueClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        //测试
        let  changeDic = ["title":"默认","goTitle":"返回"]
        let  changeColor = ChildrenView.init(
            frame: CGRectMake(0, 64, SCREEN_WIDTH , H(100)),
            model:ChildrenView.ChildrenModel.init(infoDic:changeDic))
        changeColor.delegate = self
        changeColor.type = actionType.defaultType
        self.view.addSubview(changeColor)

        // Do any additional setup after loading the view.
    }

    //ChildrenViewProtcol-Delegate(继承自NSObjectProtocol的协议需要实现所有协议方法)
    
    func gotoChangeViewColor(color:UIColor){
    
    }
    
    func gotoNextController() {
        
    }
    
    func defaultAction() {
        
        if (myClosure != nil) {
            //闭包隐式调用函数->回调执行上一界面的someFunctionThatTakesAClosure。
            myClosure!(color: UIColor.randomColor())
        }
        self.navigationController?.popViewControllerAnimated(true)

    }
    //
    func initWithClosure(closure:sendValueClosure?)
    {
        //将上个界面函数指针赋值给myClosure闭包
        myClosure = closure
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

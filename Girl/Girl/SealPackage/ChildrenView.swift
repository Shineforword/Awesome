//
//  ChildrenView.swift
//  Girl
//
//  Created by 梦想 on 16/3/23.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit
/** 模型与实现写在同一个文件中:使用extension或许更加方便*/
/** 继承自NSObjectProtocol协议,需要全部实现代理方法*/
 protocol ChildrenViewProtcol:NSObjectProtocol
{
    func gotoChangeViewColor(color:UIColor)
    func gotoNextController()
    func defaultAction()
}
/** 可选协议实现*/
@objc protocol ChildrenViewDelegate
{
    optional func testOptionalDelegateOne()
    optional func testOptionalDelegateTwo()
    optional func testOptionalDelegateThree()
    optional func testOptionalDelegateFour()
    
}
/** 动作枚举*/
enum actionType{
    /** 跳转*/
    case Push
    
    /** 变换颜色*/
    case changeColor
    
    /** 默认*/
    case defaultType
    
}
class ChildrenView: UIView {
    
    /** 设置代理*/
    weak    var delegate:ChildrenViewProtcol?
    weak    var optionalDelegate:ChildrenViewDelegate?
    
    var type:actionType?
    
    /** 私有全局变量*/
    private var titleLabel : UILabel?
    private var goButton:UIButton?

    init(frame: CGRect ,model:ChildrenModel) {
        super.init(frame: frame)
        
        //标题
        titleLabel = UILabel(frame: CGRectMake(W(10), 0, frame.width - W(20), H(30)))
        titleLabel?.numberOfLines = 0
        titleLabel?.font = UIFont.systemFontOfSize(15.0)
        titleLabel?.textColor = UIColor.randomColor()
        titleLabel?.textAlignment = .Center
        self.addSubview(titleLabel!)
        
        //按钮
        goButton = UIButton.init(type: .Custom)
        goButton?.frame = CGRectMake(W(50), CGRectGetMaxY((titleLabel?.frame)!), frame.width - W(100), H(40))
        goButton?.clipsToBounds = true
        goButton?.layer.cornerRadius = 3
        goButton?.setTitleColor(BASE_COLOR, forState: .Normal)
        goButton?.backgroundColor = UIColor.randomColor()
        goButton?.addTarget(self, action: "goClicked", forControlEvents: .TouchUpInside)
        self.addSubview(goButton!)
        //数据
        titleLabel?.text = model.title
        goButton?.setTitle(model.goButton, forState: .Normal)
        
    }
    
    /** 点击事件*/
    func goClicked()
    {
        if self.type == actionType.Push {
            //不携带参数的消息表达式写法
            let canDo = delegate!.respondsToSelector("gotoNextController")
            
            if canDo{
                
                delegate?.gotoNextController()
            }
 
            
        }else if self.type == actionType.changeColor{
           
            //携带参数的消息表达式写法
            let canDo = delegate!.respondsToSelector("gotoChangeViewColor:")
            
            if canDo{
                //代理的反向传值
                self.titleLabel?.textColor = UIColor.randomColor()
                self.goButton?.backgroundColor = UIColor.randomColor()
                self.backgroundColor = UIColor.randomColor()
                delegate?.gotoChangeViewColor(UIColor.randomColor())
            }
        
        }else if self.type == actionType.defaultType {
          
            //携带参数的消息表达式写法
            let canDo = delegate!.respondsToSelector("defaultAction")
            
            if canDo{
                
                delegate?.defaultAction()
            }
        }
        
        
    }
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChildrenView{
   
    class ChildrenModel {
        /** 标题 */
        var title: String!
        
        /** 按钮 */
        var goButton: String!
        
        
        /** 初始化  */
        init(infoDic:NSDictionary){
            
            self.title = infoDic.objectForKey("title") as? String
            self.goButton = infoDic.objectForKey("goTitle") as? String
            
        }

    }
    
}

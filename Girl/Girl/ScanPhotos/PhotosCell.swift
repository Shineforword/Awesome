//
//  PhotosCell.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    

    var photoDic:NSDictionary?
    var imgView : UIImageView?
    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //初始化各种控件
        imgView = UIImageView(frame: CGRectMake(0, 0, frame.width, frame.height - 15))
        self.addSubview(imgView!)
        titleLabel = UILabel(frame: CGRectMake(5, CGRectGetMaxY(imgView!.frame)+5, frame.width-10, 10))
        titleLabel?.numberOfLines = 0
        titleLabel?.font = UIFont.boldSystemFontOfSize(12.0)
        titleLabel?.textColor = UIColor.lightGrayColor()
        self .addSubview(titleLabel!)
    }
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

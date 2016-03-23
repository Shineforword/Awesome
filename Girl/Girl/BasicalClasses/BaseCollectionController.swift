//
//  BaseCollectionController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit
import MJRefresh

class BaseCollectionController: GirlBaseUIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    var collectionView:UICollectionView?
    var items:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置布局
        let Layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), collectionViewLayout: Layout)
        //设置代理
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        //注册集合视图
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "baseCollectionCell")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        
        self.items = NSMutableArray()
        //下拉刷新
        self.collectionView?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { () -> Void in
            //
            self.loadData()
        })
        //上拉刷新
        self.collectionView?.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: { () -> Void in
            //
            self.loadMoreData()
        })
        // Do any additional setup after loading the view.
    }
    //在继承中实现
    //加载数据
    func loadData(){
        
    }
    //加载更多数据
    func loadMoreData(){
        
    }
    
    //UICollectionViewDataSoure
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.items!.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("baseCollectionCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }

    //UICollectionViewDelegateFlowLayout布局
    //最小行间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return H(10.0)
    }
    //最小列间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return H(20.0)
    }
    //上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(W(5),H(5), W(5), H(5))
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(SCREEN_WIDTH/2 - W(10.0), SCREEN_WIDTH/2)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

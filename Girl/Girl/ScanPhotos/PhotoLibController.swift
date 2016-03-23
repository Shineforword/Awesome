//
//  PhotoLibController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class PhotoLibController: BaseCollectionController {

    //
    var severDic:NSDictionary?
    var index = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = severDic?.objectForKey("name") as? String
        self.loadData()
        self.collectionView?.registerClass(PhotosCell.self, forCellWithReuseIdentifier: "baseCollectionCell")

        // Do any additional setup after loading the view.
    }

    override func loadData() {
        //
        index = 1
        self.getLibruaryDataSource()
        self.collectionView?.mj_header.endRefreshing()

    }
    override func loadMoreData() {
        //
        index = index + 1
        self.getLibruaryDataSource()
        self.collectionView?.mj_footer.endRefreshing()

        

    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("baseCollectionCell", forIndexPath: indexPath)as!PhotosCell
        let tempDic = self.items?.objectAtIndex(indexPath.row) as? NSDictionary
        let imageUrl = GIRLS_HOST_DETAIL + (tempDic?.objectForKey("img")as?String)!
        cell.imgView!.setWebImage(imageUrl)
        cell.titleLabel?.text = tempDic?.objectForKey("title") as? String
        return cell
    }
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(SCREEN_WIDTH/2-W(10), SCREEN_WIDTH/1.5)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let detailVC = PhotoDetailController()
        detailVC.detailDic = self.items?.objectAtIndex(indexPath.row) as? NSDictionary
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    //获取数据
    func getLibruaryDataSource(){
        let manager = HTTPRequestManager()
        manager.dataRequest(
            method: HTTPRequestManager.Method.GET,
            urlString: GIRLS_HOST_LIST,
            parameter:
            [
                "id": (severDic?.objectForKey("id") as? String)!,
                "page":index,
                "row":"20"
            ]
            
            )
            {
                (responseObject, error) -> Void in
                print(responseObject)
                
                if self.index == 1{
                    
                    //注意小心保证items是可变数组
                    self.items = NSMutableArray.init(array:(responseObject?.objectForKey("tngou") as? NSArray)!)
                    
                }else{
                    
                    let tempArr = responseObject?.objectForKey("tngou") as? NSArray
                    self.items?.addObjectsFromArray(tempArr as! [AnyObject])
                
                }
                
                self.collectionView?.reloadData()
        }
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

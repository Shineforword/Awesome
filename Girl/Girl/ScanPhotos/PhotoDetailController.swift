//
//  PhotoDetailController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class PhotoDetailController: BaseCollectionController {

    var detailDic:NSDictionary?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarHidden = false
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = detailDic?.objectForKey("title") as? String
        self.collectionView?.registerClass(PhotosCell.self, forCellWithReuseIdentifier: "baseCollectionCell")
        self.getDetialDataSource()
    }
    override func loadData() {
        self.collectionView?.mj_header.endRefreshing()
    }
    override func loadMoreData() {
        self.collectionView?.mj_footer.endRefreshingWithNoMoreData()
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("baseCollectionCell", forIndexPath: indexPath)as!PhotosCell
        let tempDic = self.items?.objectAtIndex(indexPath.row) as? NSDictionary
        let imageUrl = "http://tnfs.tngou.net/img" + (tempDic?.objectForKey("src")as?String)!
        cell.imgView!.setWebImage(imageUrl)
        cell.titleLabel?.text = tempDic?.objectForKey("title") as? String
        return cell
    }
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(self.view.frame.width/2-10, self.view.frame.width/1.5)
    }
    //最小列间距
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.showHost(indexPath.row)
    }
    /** 网络相册相册 */
    func showHost(index: Int){
        
        let pbVC = PhotoBrowser()
        
        /**  设置相册展示样式  */
        pbVC.showType = PhotoBrowser.ShowType.Push
        /**  设置相册类型  */
        pbVC.photoType = PhotoBrowser.PhotoType.Host
        
        //强制关闭显示一切信息
        pbVC.hideMsgForZoomAndDismissWithSingleTap = true
        
        var models: [PhotoBrowser.PhotoModel] = []
        
        //模型数据数组
        for (var i=0; i<self.items?.count; i++){
            let Url = "http://tnfs.tngou.net/img" + ((self.items?.objectAtIndex(i).objectForKey("src"))! as! String)
            
            let imageView = UIImageView.init()
            imageView.setWebImage(Url)
            let model = PhotoBrowser.PhotoModel(hostHDImgURL: Url,
                hostThumbnailImg: imageView.image,
                titleStr: nil ,
                descStr: nil ,
                sourceView: imageView as UIView)
            models.append(model)
        }
        
        /**  设置数据  */
        pbVC.photoModels = models
        pbVC.show(inVC: self,index: index)
        
    }
    //获取数据
    func getDetialDataSource(){
        let manager = HTTPRequestManager()
        manager.dataRequest(
            method: HTTPRequestManager.Method.GET,
            urlString: "http://apis.baidu.com/tngou/gallery/show",
            parameter:
            [
                "id": (detailDic?.objectForKey("id") as! NSNumber),
            ]
            )
            {
                (responseObject, error) -> Void in
                print(responseObject)
                
                self.items = NSMutableArray.init(array:(responseObject?.objectForKey("list") as? NSArray)!)
                self.collectionView?.reloadData()
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

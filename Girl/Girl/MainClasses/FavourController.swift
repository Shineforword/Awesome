//
//  FavourController.swift
//  Girl
//
//  Created by 梦想 on 16/3/22.
//  Copyright © 2016年 梦想. All rights reserved.
//

import UIKit

class FavourController: GirlBaseUIViewController, UITableViewDataSource, UITableViewDelegate{

    var tableView:UITableView?
    var items:NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items =
            [
                ["id":"1","name":"SexGirl"],
                ["id":"2","name":"KoraJap"],
                ["id":"3","name":"LegBeauty"],
                ["id":"4","name":"NomalPhoto"],
                ["id":"5","name":"Portrait"],
                ["id":"6","name":"FreshGirl"],
                ["id":"7","name":"CarGirl"],
                ["id":"0","name":"NewGirl"],
             ]
        
        self.tableView = UITableView.init(frame: CGRectMake(0, 0, self.view.frame.height, self.view.frame.height - 64), style: .Plain)
        self.tableView?.separatorStyle = .SingleLine
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView()
        self.view.addSubview(tableView!)
        //
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "mineCell")
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (self.items?.count)!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 44
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mineCell", forIndexPath: indexPath)
        
        
        cell.textLabel?.text = self.items?.objectAtIndex(indexPath.row).objectForKey("name") as? String

        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let libVC = PhotoLibController()
        
        libVC.severDic = self.items?.objectAtIndex(indexPath.row) as? NSDictionary
        
        self.navigationController?.pushViewController(libVC, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

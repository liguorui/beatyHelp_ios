//
//  ViewController.swift
//  beatyHelp
//
//  Created by 李国锐 on 6/6/14.
//  Copyright (c) 2014 XIAOPIU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var indexTable : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // mainView 界面绘制
        setIndexTable()
        mainViewDraw(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 使顶部状态bar变为白色
    override func preferredStatusBarStyle()->UIStatusBarStyle{
        return UIStatusBarStyle.LightContent
    }
    
    func setIndexTable(){
        self.indexTable = UITableView(frame:CGRectMake(7,160,306,UIScreen.mainScreen().applicationFrame.height-179), style:UITableViewStyle.Plain)
        self.indexTable!.delegate = self
        self.indexTable!.dataSource = self
        self.indexTable!.rowHeight = 125
        self.indexTable!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.indexTable!.backgroundColor = UIColor.clearColor()
        self.indexTable!.separatorColor = UIColor.clearColor()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view?.addSubview(self.indexTable)
    }
    
    // UITableViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return 12
    }
    
    //创建一个单元格
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        return getTableView(tableView,cellForRowAtIndexPath:indexPath)
    }
    
    // UITableViewDelegate Methods
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.indexTable!.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func footBtn2Action(sender: UIButton!) {
        var manageCon = ManageController()
        self.presentModalViewController(manageCon, animated:false)
    }
    
    func footBtn3Action(sender: UIButton!) {
        var myDataCon = MyDataController()
        self.presentModalViewController(myDataCon, animated:false)
    }
}

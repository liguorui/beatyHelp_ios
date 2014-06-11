//
//  mainView.swift
//  beatyHelp
//
//  Created by 李国锐 on 6/6/14.
//  Copyright (c) 2014 XIAOPIU. All rights reserved.
//

import Foundation
import UIKit

func mainViewDraw(controller:UIViewController){
    // 为controller添加baseView
    GetUIBaseView(_controller: controller)
    getMainViewTop(controller,1)
    getMainViewMiddle(controller)
    getFootBar(controller,1)
}

func getMainViewTop(controller:UIViewController, pageNum:Int){
    var topValueBg:UIImageView! // 顶部框体包括背景图
    var userImage:UIImageView! // 顶部用户头像
    var userName:UILabel! // 顶部用户名
    var userSign:UILabel! // 顶部用户签名
    var labelArray:UILabel[] //顶部按钮goldIcon,upIcon,downIcon数值
    var phoneIcon:UIImageView!
    var phoneNum:UILabel!
    
    // 顶部框体包括背景图
    topValueBg = {
        () -> UIImageView in
        // 创建框体并设置尺寸
        topValueBg = UIImageView(frame:CGRectMake(0,20,320,108))
        //根据图片名，确定图片引用
        topValueBg.image = UIImage(named:"topBgImg.jpg")
        // 将圆图添加到UIView上
        controller.view.addSubview(topValueBg)
        return topValueBg
    }()
    
    
    // 用户头像
    userImage = {
        () -> UIImageView in
        // 在plist文件中获取用户头像信息
        var str2 = getDictionary("userInfo").objectForKey("headImage") as NSString
        // 添加圆形头像
        return creatRoundImage(topValueBg,CGRectMake(20,15,78,78),str2,3.0);
    }()
    
    // 用户名称
    userName = {
        () -> UILabel in
        userName = UILabel(frame:CGRectMake(110, 20, 200, 20))
        userName.text = toString(getDictionary("userInfo").objectForKey("userName"))
        userName.font = UIFont(name:"Arial",size:20)
        userName.textColor = UIColor.whiteColor()
        userName.shadowColor = UIColor(red:0,green:0,blue:0,alpha:0.75)
        userName.shadowOffset = CGSizeMake(0, 0.5)
        topValueBg.addSubview(userName)
        return userName
    }()
    
    // 用户签名
    userSign = {
        () -> UILabel in
        userSign = UILabel(frame:CGRectMake(110, 45, 200, 20))
        userSign.text = toString(getDictionary("userInfo").objectForKey("userSign"))
        userSign.font = UIFont(name:"Arial",size:14)
        userSign.textColor = UIColor.whiteColor()
        userSign.shadowColor = UIColor(red:0,green:0,blue:0,alpha:0.75)
        userSign.shadowOffset = CGSizeMake(0, 0.5)
        topValueBg.addSubview(userSign)
        return userSign
    }()
    
    if pageNum == 1{
        // 添加顶部按钮goldIcon,upIcon,downIcon
        labelArray = {
            () -> UILabel[] in
            //创建保存UILabel数组
            var labelArray:UILabel[] = []
            //创建需要在顶部添加的图片名称数组
            var topIconArray = ["goldIcon","upIcon","downIcon"]
            //创建需要在顶部添加的数值数组
            var labelTextArray = getDictionary("userInfo").objectForKey("iconValue") as NSArray
            
            for i in 0..topIconArray.count{
                // 添加圆形icon
                creatRoundImage(topValueBg,CGRectMake(CGFloat(106+i*68),70,21,21),topIconArray[i],1.5);
                //初始化label的尺寸
                var label = UILabel(frame:CGRectMake(CGFloat(131+i*68), 72, 0, 0))
                //获取文案
                var str = toString(labelTextArray[i])
                //设置文案
                label.text = str
                //设置文案颜色
                label.textColor = UIColor.whiteColor()
                //设置文案背景色，以及0.7透明
                label.backgroundColor = UIColor(red:0,green:0,blue:0,alpha:0.7)
                //设置文字居中
                label.textAlignment = NSTextAlignment.Center
                //设置文字字体以及字体大小
                label.font = UIFont(name:"Arial",size:12)
                //设置边框以及是否可见
                label.layer.masksToBounds = true
                //设置圆角尺寸
                label.layer.cornerRadius = 10.0
                //设置label宽高，使其根据文字内容自适应
                label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y,CGFloat(12/2*countElements(str)+14), 12+4)
                labelArray.insert(label, atIndex: i)
                topValueBg.addSubview(label)
            }
            return labelArray
        }()
    }else if pageNum == 2{
        phoneIcon = {
            () -> UIImageView in
            // 创建框体并设置尺寸
            phoneIcon = UIImageView(frame:CGRectMake(110,73,9,13))
            //根据图片名，确定图片引用
            phoneIcon.image = UIImage(named:"phoneIcon")
            // 将圆图添加到UIView上
            topValueBg.addSubview(phoneIcon)
            return phoneIcon
        }()
        
        phoneNum = {
            () -> UILabel in
            phoneNum = UILabel(frame:CGRectMake(122, 68, 97, 21))
            phoneNum.text = toString(getDictionary("userInfo").objectForKey("phoneNum"))
            phoneNum.font = UIFont(name:"Arial",size:12)
            phoneNum.textColor = UIColor.whiteColor()
            phoneNum.shadowColor = UIColor(red:0,green:0,blue:0,alpha:0.75)
            phoneNum.shadowOffset = CGSizeMake(0, 0.5)
            topValueBg.addSubview(phoneNum)
            return phoneNum
        }()
    }
}

func getMainViewMiddle(controller:UIViewController){
    var lineImgView:UIImageView! // 筛选栏
    var imgBtnView:UIImageView! // 按钮
    
    lineImgView = {
        () -> UIImageView in
        //创建图片并设置引用,根据宽高设置拉伸图片
        var lineImg = UIImage(named:"middleLine").stretchableImageWithLeftCapWidth(4,topCapHeight: 0)
        //根据拉伸后的图片创建imageView
        lineImgView = UIImageView(image:lineImg)
        //设置尺寸和位置
        lineImgView.frame = CGRectMake(0, 128, 234, 31)
        controller.view.addSubview(lineImgView)
        return lineImgView
    }()
    
    imgBtnView = {
        () -> UIImageView in
        var btnImg = UIImage(named:"middleBtn").stretchableImageWithLeftCapWidth(13,topCapHeight: 0)
        imgBtnView = UIImageView(image:btnImg)
        imgBtnView.frame = CGRectMake(229, 128, 90, 32)
        controller.view.addSubview(imgBtnView)
        return imgBtnView
    }()
}

func getTableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
    var arrayDic = getDictionary("list") as NSArray
    var rowNo = indexPath.row
    var identifier = arrayDic[rowNo%3].objectForKey("identifier") as String
    var imageName = arrayDic[rowNo%3].objectForKey("imageName") as String
    var dateText = arrayDic[rowNo%3].objectForKey("time") as String
    var userImage = arrayDic[rowNo%3].objectForKey("userImage") as String
    
    var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath:indexPath) as UITableViewCell
    cell.backgroundColor = UIColor.clearColor()
    
    var img = UIImage(named:imageName).stretchableImageWithLeftCapWidth(0, topCapHeight:70)
    var imgView = UIImageView(image:img)
    imgView.frame = CGRectMake(0, 10, 306 , 125)
    cell.addSubview(imgView)
    
    var dateLabel = UILabel(frame:CGRectMake(198, 14, 160, 20))
    dateLabel.text = dateText
    dateLabel.font = UIFont(name:"Arial",size:10)
    dateLabel.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    cell.addSubview(dateLabel)
    // 添加圆形头像
    creatRoundImage(cell,CGRectMake(3, 9, 64, 64),userImage,1.5);
    return cell
}


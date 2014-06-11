//
//  baseView.swift
//  beatyHelp
//
//  Created by 李国锐 on 6/6/14.
//  Copyright (c) 2014 XIAOPIU. All rights reserved.
//

import Foundation
import UIKit

/**
*  为controller添加baseView
*
*  @param view 需要添加的UIView
*/
class GetUIBaseView{
    init(_controller:UIViewController){
        // 为背景平铺背景图
        _controller.view.backgroundColor = UIColor(patternImage: UIImage(named:"bgMini"))
    }
}

func getFootBar(controller:UIViewController,index:Int){
    var footBg:UIImageView! // 底部框体包括背景图
    var footBtn1:UIButton!
    var footBtn2:UIButton!
    var footBtn3:UIButton!
    
    footBg = {
        () -> UIImageView in
        // 创建框体并设置尺寸
        footBg = UIImageView(frame:CGRectMake(0,UIScreen.mainScreen().applicationFrame.height+20-39,320,39))
        //根据图片名，确定图片引用
        footBg.image = UIImage(named:"footLine")
        // 将圆图添加到UIView上
        controller.view.addSubview(footBg)
        return footBg
        }()
    
    footBtn1 = {
        () -> UIButton in
        footBtn1 = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        footBtn1.frame = CGRectMake(0, UIScreen.mainScreen().applicationFrame.height+20-39, 111, 39)
        footBtn1.setImage(UIImage(named:(index==1 ? "footBtn01":"footBtn01x")), forState: UIControlState.Normal)
        if index != 1{
            footBtn1.addTarget(controller,action:"footBtn1Action:",forControlEvents:.TouchUpInside);
        }
        controller.view.addSubview(footBtn1)
        return footBtn1
        }()
    
    footBtn2 = {
        () -> UIButton in
        footBtn2 = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        footBtn2.frame = CGRectMake(112, UIScreen.mainScreen().applicationFrame.height+20-39, 104, 39)
        footBtn2.setImage(UIImage(named:(index==2 ? "footBtn02":"footBtn02x")), forState: UIControlState.Normal)
        if index != 2{
            footBtn2.addTarget(controller,action:"footBtn2Action:",forControlEvents:.TouchUpInside);
        }
        controller.view.addSubview(footBtn2)
        return footBtn2
        }()
    
    footBtn3 = {
        () -> UIButton in
        footBtn3 = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        footBtn3.frame = CGRectMake(217, UIScreen.mainScreen().applicationFrame.height+20-39, 103, 39)
        footBtn3.setImage(UIImage(named:(index==3 ? "footBtn03":"footBtn03x")), forState: UIControlState.Normal)
        if index != 3{
            footBtn3.addTarget(controller,action:"footBtn3Action:",forControlEvents:.TouchUpInside);
        }
        controller.view.addSubview(footBtn3)
        return footBtn3
        }()
}

class GetHeadBar{
    var headBg:UIImageView! // 顶部框体包括背景图
    var titleLabel:UILabel! // 顶部标题
    var backBtn:UIButton! // 顶部返回按钮
    
    init(_controller:UIViewController,_title:String){
        setHeadBg(_controller)
        setTitleLabel(_title)
        setBackBtn(_controller)
    }
    
    func setHeadBg(controller:UIViewController){
        // 创建框体并设置尺寸
        headBg = UIImageView(frame:CGRectMake(0,20,320,40))
        //根据图片名，确定图片引用以及拉伸
        headBg.image = UIImage(named:"headBg").stretchableImageWithLeftCapWidth(4, topCapHeight:0)
        // 将圆图添加到UIView上
        controller.view.addSubview(headBg)
    }
    
    func setTitleLabel(title:String){
        titleLabel = UILabel(frame:CGRectMake(60,11,200,16))
        titleLabel.text = title
        titleLabel.font = UIFont(name:"Arial",size:16)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.shadowColor = UIColor(red:0,green:0,blue:0,alpha:0.75)
        titleLabel.shadowOffset = CGSizeMake(0, 0.5)
        titleLabel.textAlignment = NSTextAlignment.Center
        headBg.addSubview(titleLabel)
    }
    
    func setBackBtn(controller:UIViewController){
        backBtn = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        backBtn.frame = CGRectMake(15, 31, 22, 16)
        backBtn.setImage(UIImage(named:"headBackBtn"), forState: UIControlState.Normal)
        backBtn.addTarget(controller,action:"goBackAction:",forControlEvents:.TouchUpInside);
        controller.view.addSubview(backBtn)
    }
}

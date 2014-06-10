//
//  myDataView.swift
//  beatyHelp
//
//  Created by 李国锐 on 6/9/14.
//  Copyright (c) 2014 XIAOPIU. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


func myDataViewDraw(controller:UIViewController){
    var scrollView:UIScrollView! //创建滚动并设置尺寸
    
    scrollView = {
        () -> UIScrollView in
        scrollView = UIScrollView(frame:CGRectMake(0, 128, 320, 317))
        controller.view.addSubview(scrollView)
        return scrollView
    }()
    
    // 为controller添加baseView
    getUIBaseView(controller)
    getMainViewTop(controller,2)
    getMyDataMiddle(scrollView)
    getMiddleList(scrollView)
    getFootBar(controller,3)
}

func getMyDataMiddle(scrollView:UIScrollView){
    var middleValueBg:UIView! // 创建框体并设置尺寸
    var leftValueBg:UIView! // 创建左边背景图片并设置尺寸
    var leftLabelValue:UILabel! // 左边的值
    var leftLabelName:UILabel! // 左边的名称
    var rightValueBg:UIView! // 创建右边背景图片并设置尺寸
    var rightLabelArray:UILabel[] // 右边的值
    
    var ListNum = 4
    var middleValueValue = getDictionary("myData").objectForKey("middleValue").objectForKey("middleValueValue") as NSArray
    var middleValueName = getDictionary("myData").objectForKey("middleValue").objectForKey("middleValueName") as NSArray
    var rightcolorArray:UIColor[] = [UIColor.whiteColor(), getColorFromDictionary("blue"), getColorFromDictionary("grey9b"), getColorFromDictionary("green"), getColorFromDictionary("red")]
    
    //创建框体并设置尺寸
    middleValueBg = {
        () -> UIView in
        middleValueBg = UIView(frame:CGRectMake(10, 10, 300, 64))
        var layer = middleValueBg.layer
        layer.shadowOffset = CGSizeMake(0, 1)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.05
        scrollView.addSubview(middleValueBg)
        return middleValueBg
    }()
    
    //创建图片并设置尺寸
    leftValueBg = {
        () -> UIView in
        //创建图片并设置尺寸
        leftValueBg = UIView(frame:CGRectMake(0, 0, 64, 64))
        //读取实例的layer属性
        var leftlayer = leftValueBg.layer
        //设置红色为控件背景
        leftlayer.backgroundColor = getColorFromDictionary("red").CGColor
        //设置只有左边的两个圆角
        var leftMaskPath = UIBezierPath(roundedRect:leftValueBg.bounds, byRoundingCorners: UIRectCorner.TopLeft|UIRectCorner.BottomLeft, cornerRadii:CGSizeMake(5, 5))
        var leftMaskLayer = CAShapeLayer()
        leftMaskLayer.frame = leftlayer.bounds
        leftMaskLayer.path = leftMaskPath.CGPath
        leftValueBg.layer.mask = leftMaskLayer
        middleValueBg.addSubview(leftValueBg)
        return leftValueBg
    }()
    
    // 左边的值
    leftLabelValue = {
        () -> UILabel in
        leftLabelValue = UILabel(frame:CGRectMake(0, 12, 64, 24))
        leftLabelValue.text = toString(middleValueValue[0])
        leftLabelValue.font = UIFont(name:"Arial",size:25)
        leftLabelValue.shadowOffset = CGSizeMake(0, 1)
        leftLabelValue.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        leftLabelValue.textColor = rightcolorArray[0]
        leftLabelValue.textAlignment = NSTextAlignment.Center
        leftValueBg.addSubview(leftLabelValue)
        return leftLabelValue
    }()
    
    // 左边的名称
    leftLabelName = {
        () -> UILabel in
        leftLabelName = UILabel(frame:CGRectMake(0, 37, 64, 24))
        leftLabelName.text = toString(middleValueName[0])
        leftLabelName.font = UIFont(name:"Arial",size:12)
        leftLabelName.shadowOffset = CGSizeMake(0, 0.5)
        leftLabelName.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
        leftLabelName.textColor = rightcolorArray[0]
        leftLabelName.textAlignment = NSTextAlignment.Center
        leftValueBg.addSubview(leftLabelName)
        return leftLabelName
    }()
    
    rightValueBg = {
        () -> UIView in
        //创建图片并设置尺寸
        rightValueBg = UIView(frame:CGRectMake(64, 0, 236, 64))
        //读取实例的layer属性
        var rightlayer = rightValueBg.layer
        //设置白色为控件背景
        rightlayer.backgroundColor = getColorFromDictionary("greyf3").CGColor
        //设置只有右边的两个圆角
        var rightMaskPath = UIBezierPath(roundedRect:rightValueBg.bounds, byRoundingCorners: UIRectCorner.TopRight|UIRectCorner.BottomRight, cornerRadii:CGSizeMake(5, 5))
        var rightMaskLayer = CAShapeLayer()
        rightMaskLayer.frame = rightlayer.bounds
        rightMaskLayer.path = rightMaskPath.CGPath
        rightValueBg.layer.mask = rightMaskLayer
        middleValueBg.addSubview(rightValueBg)
        return rightValueBg
    }()
    
    rightLabelArray = {
        () -> UILabel[] in
        var rightLabelArray:UILabel[] = []
        for i in 0..ListNum{
            var rightLabelValue = UILabel(frame:CGRectMake(CGFloat(i*59), 12, 59, 24))
            rightLabelValue.text = toString(middleValueValue[i+1])
            rightLabelValue.font = UIFont(name:"Arial",size:25)
            rightLabelValue.textColor = rightcolorArray[i+1]
            rightLabelValue.textAlignment = NSTextAlignment.Center
            rightValueBg.addSubview(rightLabelValue)
            rightLabelArray.insert(rightLabelValue, atIndex: i)
            
            var rightLabelName = UILabel(frame:CGRectMake(CGFloat(i*59), 37, 59, 24))
            rightLabelName.text = toString(middleValueName[i+1])
            rightLabelName.font = UIFont(name:"Arial",size:12)
            rightLabelName.textColor = getColorFromDictionary("grey33")
            rightLabelName.textAlignment = NSTextAlignment.Center
            rightValueBg.addSubview(rightLabelName)
            
            if i != ListNum-1{
                var rightLine = UIImageView(image: UIImage(named:"rightValueLine"))
                rightLine.frame = CGRectMake(CGFloat(58+i*59), 7, 0.5, 52)
                rightValueBg.addSubview(rightLine)
            }
        }
        return rightLabelArray
    }()
}


func getMiddleList(scrollView:UIScrollView){
    var middleListBg:UIView!  //创建框体并设置尺寸
    var topValueBg:UIView! //创建图片并设置尺寸
    var topLabelTitle:UILabel! //创建顶部title
    var topLabelMore:UILabel! //创建顶部more
    var middleValueBgArray:UIView[]
    
    var ListNum = 4
    
     //创建框体并设置尺寸
    middleListBg = {
        () -> UIView in
        middleListBg = UIView(frame: CGRectMake(10, 86, 300, CGFloat(28*ListNum)))
        var layer = middleListBg.layer
        layer.shadowOffset = CGSizeMake(0, 1)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.05
        scrollView.addSubview(middleListBg)
        return middleListBg
    }()
    
    //创建图片并设置尺寸
    topValueBg = {
        () -> UIView in
        topValueBg = UIView(frame:CGRectMake(0, 0, 300, 28))
        var topLayer = topValueBg.layer
        topLayer.backgroundColor = getColorFromDictionary("red").CGColor
        //设置只有右边的两个圆角
        var topMaskPath = UIBezierPath(roundedRect:topValueBg.bounds, byRoundingCorners: UIRectCorner.TopRight|UIRectCorner.TopLeft, cornerRadii:CGSizeMake(5, 5))
        var topMaskLayer = CAShapeLayer()
        topMaskLayer.frame = topLayer.bounds
        topMaskLayer.path = topMaskPath.CGPath
        topValueBg.layer.mask = topMaskLayer
        middleListBg.addSubview(topValueBg)
        return topValueBg
    }()
    
     //创建顶部title
    topLabelTitle = {
        () -> UILabel in
        topLabelTitle = UILabel(frame: CGRectMake(120, 8, 80, 12))
        topLabelTitle.text = "好人点:(452)"
        topLabelTitle.font = UIFont(name:"Arial",size:12)
        topLabelTitle.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        topLabelTitle.shadowOffset = CGSizeMake(0, 0.5)
        topLabelTitle.textColor = UIColor.whiteColor()
        topValueBg.addSubview(topLabelTitle)
        return topLabelTitle
    }()
    
    topLabelMore = {
        () -> UILabel in
        topLabelMore = UILabel(frame: CGRectMake(260, 8, 30, 12))
        var content = NSMutableAttributedString(string: String("更多"))
        var contentRange = NSRange(location: 0, length: content.length)
//        var getStyle = NSUnderlineStyle.StyleSingle
        var getValue = NSNumber(integer:2)
        content.addAttribute(NSUnderlineStyleAttributeName, value: getValue, range: contentRange)
        topLabelMore.attributedText = content
        topLabelMore.font = UIFont(name:"Arial",size:12)
        topLabelMore.shadowColor = UIColor(red:0, green:0, blue: 0, alpha:0.45)
        topLabelMore.shadowOffset = CGSizeMake(0, 0.5)
        topLabelMore.textColor = UIColor.whiteColor()
        topValueBg.addSubview(topLabelMore)
        return topLabelMore
    }()
    
    middleValueBgArray = {
        () -> UIView[] in
        var middleValueBgArray: UIView[] = []
        for i in 0..ListNum {
            var middleValueBg = UIView(frame:CGRectMake( 0, CGFloat(28*i), 300, 28))
            var middleLayer = middleListBg.layer
            if i%2 == 1{
                middleLayer.backgroundColor = getColorFromDictionary("greyf3").CGColor
            }else{
                middleLayer.backgroundColor = getColorFromDictionary("greyd8").CGColor
            }
            if i == ListNum-1 {
                var middleMaskPath = UIBezierPath(roundedRect: middleValueBg.bounds, byRoundingCorners: UIRectCorner.BottomLeft|UIRectCorner.BottomRight, cornerRadii:CGSizeMake(5, 5))
                var middleMaskLayer = CAShapeLayer()
                middleMaskLayer.frame = middleLayer.bounds
                middleMaskLayer.path = middleMaskPath.CGPath
                middleValueBg.layer.mask = middleMaskLayer
            }
            middleValueBgArray.insert(middleValueBg, atIndex: i)
            middleListBg.addSubview(middleValueBg)
        }
        return middleValueBgArray
    }()
}


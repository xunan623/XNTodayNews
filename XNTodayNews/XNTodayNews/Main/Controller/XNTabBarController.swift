//
//  XNTabBarController.swift
//  XNTodayNews
//
//  Created by Dandre on 2018/6/6.
//  Copyright © 2018年 Dandre. All rights reserved.
//

import UIKit

class XNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"

        // 添加子控制器
        addChildViewControllers()
        
        // 接收夜间模式按钮通知
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receiveDayOrNightButtonClicked),
                                               name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"),
                                               object: nil)
    }
    
    /// 接收按钮点击通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        let selected = notification.object as! Bool
        if selected {
            
            for childController in childViewControllers {
                switch childController.title! {
                case "首页":
                    setNightChildController(controller: childController, imageName: "home")
                case "西瓜视频":
                    setNightChildController(controller: childController, imageName: "video")
                case "小视频":
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "微头条":
                    setNightChildController(controller: childController, imageName: "weitoutiao")
                case "":
                    setNightChildController(controller: childController, imageName: "redpackage")
                default:
                    break
                }
            }
            
        } else {
            for childController in childViewControllers {
                switch childController.title! {
                case "首页":
                    setDayChildController(controller: childController, imageName: "home")
                case "西瓜视频":
                    setDayChildController(controller: childController, imageName: "video")
                case "小视频":
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "微头条":
                    setDayChildController(controller: childController, imageName: "weitoutiao")
                case "":
                    setDayChildController(controller: childController, imageName: "redpackage")
                default:
                    break
                }
            }
        }
    }

    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewControllers(XNHomeViewController(), title: "首页", imageName: "home")
        setChildViewControllers(UIViewController(), title: "西瓜视频", imageName: "video")
        setChildViewControllers(UIViewController(), title: "", imageName: "redpackage")
        setChildViewControllers(UIViewController(), title: "微头条", imageName: "weitoutiao")
        setChildViewControllers(UIViewController(), title: "小视频", imageName: "huoshan")
    }
    
    // 初始化子控制器
    private func setChildViewControllers(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        addChildViewController(XNNavigationController(rootViewController: childController))
    }
    
    // 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    // 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
}

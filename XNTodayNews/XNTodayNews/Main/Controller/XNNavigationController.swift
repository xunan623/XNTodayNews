//
//  XNNavigationController.swift
//  XNTodayNews
//
//  Created by Dandre on 2018/6/6.
//  Copyright © 2018年 Dandre. All rights reserved.
//

import UIKit

class XNNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationBar = UINavigationBar.appearance()
        navigationBar.theme_tintColor = "colors.black"
        navigationBar.setBackgroundImage(UIImage(named: "navigation_background" + (UserDefaults.standard.bool(forKey: isNight) ? "_night" : "")), for: .default)
        
        // 添加通知
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receiveDayOrNightButtonClicked),
                                               name: Notification.Name(rawValue: "dayOrNightButtonClicked"),
                                               object: nil)
    }
    
    // 接收到按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        
        // 设置为日间模式
        navigationBar.setBackgroundImage(UIImage(named: "navigation_background" + (notification.object as! Bool ? "_night" : "")), for: .default)
    }
    
    // 拦截 push 操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    /// 返回上一控制器
    @objc private func navigationBack() {
        popViewController(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

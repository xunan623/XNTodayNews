//
//  XNHomeViewController.swift
//  XNTodayNews
//
//  Created by Dandre on 2018/6/7.
//  Copyright © 2018年 Dandre. All rights reserved.
//

import UIKit
import SGPagingView

class XNHomeViewController: XNBaseViewController {
    
    // 标题和内容
    private var pageTitleView: SGPageTitleView?
    private var pageContentView: SGPageContentView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.windowColor"
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background" + (UserDefaults.standard.bool(forKey: isNight) ? "_night" : "")), for: .default)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

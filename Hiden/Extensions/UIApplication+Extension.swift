//
//  UIApplication+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/10.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    /**
     最前面のUIViewContollerを取得するよ
     */
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

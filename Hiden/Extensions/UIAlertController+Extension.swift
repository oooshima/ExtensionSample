//
//  UIAlertController+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/10.
//  Copyright © 2019 Oshima Haruna. All rights reserved.


import Foundation
import UIKit

extension UIAlertController {
    
    /**
     OKボタンの付いたアラートを表示できるよ
     - parameter title: タイトル
     - parameter message: メッセージ
     - parameter okAction: OKを押した時の処理(なくてもいいよ)
     */
    static func show(title: String, message: String?, okAction: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            if let okAction = okAction {
                okAction()
            }
        })
        
        alertController.addAction(defaultAction)
        
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    /**
     OKとキャンセルボタンの付いたアラートを表示できるよ
     - parameter title: タイトル
     - parameter message: メッセージ
     - parameter okAction: OKを押した時の処理(なくてもいいよ)
     - parameter cancelAction: キャンセルを押した時の処理(なくてもいいよ)
     */
    static func show(title: String, message: String?, okAction: (() -> Void)?, cancelAction: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
                if let okAction = okAction {
                    okAction()
                }
            })
        let cancelAction = UIAlertAction(title: "キャンセル", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            if let cancelAction = cancelAction {
                cancelAction()
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    /**
     ActionSheetを表示できるよ
     - parameter title: タイトル
     - parameter message: メッセージ
     - parameter cancelAction: キャンセルを押した時の処理(なくてもいいよ)
     - parameter defaultButton: defaultのボタンのタイトルを配列で渡してネ
     - parameter defaultAction: defaultのボタンを押した時の処理(ボタンのタイトルによって場合分けしてある処理がいいよ)
     */
    static func show(title: String, message: String?, cancelAction: (() -> Void)?, defaultButton: [String], defaultAction: @escaping (String) -> Void){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: {
            (action:UIAlertAction!) -> Void in
            if let cancelAction = cancelAction {
                cancelAction()
            }
        })
        alertController.addAction(cancelAction)
        
        for data in defaultButton {
            let defaultAction = UIAlertAction(title: data, style: .default, handler: {
                (action:UIAlertAction!) -> Void in
                    defaultAction(data)
            })
            alertController.addAction(defaultAction)
        }
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
}

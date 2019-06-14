//
//  ViewController.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/10.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var alertButton2: UIButton!
    @IBOutlet weak var alertButton3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        UIAlertController.show(title: "alart1", message: "OKとキャンセルだよ", okAction: printOK, cancelAction: nil)
    }
    
    @IBAction func showAlert2(_ sender: Any) {
        UIAlertController.show(title: "alart2", message: "OKだけだよ", okAction: nil)
    }
    
    @IBAction func showAlert3(_ sender: Any) {
        UIAlertController.show(title: "ActionSeet", message: "選択肢は増やせるよ", cancelAction: printCancel, defaultButton: ["Japan","Chaina","USA"], defaultAction: printName(name:))
    }
    
    func printOK(){
        print("ok")
    }
    
    func printCancel(){
        print("cancel")
    }
    
    func printName(name:String){
        print(name)
    }
    
}


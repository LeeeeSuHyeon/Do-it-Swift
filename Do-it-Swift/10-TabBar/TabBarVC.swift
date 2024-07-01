//
//  TabBarVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/1/24.
//

import UIKit

class TabBarVC : ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func bntMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

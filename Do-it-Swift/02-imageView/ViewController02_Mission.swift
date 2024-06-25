//
//  ViewController02-Mission.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/25/24.
//

import UIKit

class ViewController02_Mission : UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    let arr = ["MuhanEnd.png", "couple_01-1.png", "MuhanMiddle.png", "MuhanStart.png"]
    var num = 0
    let max = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: arr[num])
    }
    
    @IBAction func beforeBtn(_ sender: UIButton) {
        if num < 1 {
            num = max
        }
        else {
            num -= 1
        }
        imgView.image = UIImage(named: arr[num])
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        if num >= max {
            num = 0
        }
        else {
            num += 1
        }
        imgView.image = UIImage(named: arr[num])
    }
}

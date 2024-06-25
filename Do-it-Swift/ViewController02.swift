//
//  ViewController02.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/25/24.
//

import UIKit

class ViewController02 : UIViewController {
    var isZoom = false      // 확대 여부
    var imgLeft : UIImage?    // 왼쪽 화살표 이미지
    var imgRight : UIImage?   // 오른쪽 화살표 이미지
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        imgLeft = UIImage(named: "left.png")
        imgRight = UIImage(named: "right.png")
        imgView.image = imgLeft
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale : CGFloat = 2.0
        var newWidth : CGFloat, newHeight : CGFloat
        
        if isZoom {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgLeft
        } else{
            imgView.image = imgRight
        }
    }
}

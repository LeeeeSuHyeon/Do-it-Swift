//
//  PinchViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/12/24.
//

import UIKit

class PinchImageViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    var initialFontSize : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(PinchGestureViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }

}

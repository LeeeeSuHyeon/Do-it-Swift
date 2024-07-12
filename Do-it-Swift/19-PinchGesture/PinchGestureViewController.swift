//
//  PinchGestureViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/12/24.
//

import UIKit

class PinchGestureViewController: UIViewController {

    @IBOutlet weak var txtPinch: UILabel!
    
    var initialFontSize : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(PinchGestureViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        if pinch.state == UIGestureRecognizer.State.began {
            initialFontSize = txtPinch.font.pointSize
        } else {
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }
    


}

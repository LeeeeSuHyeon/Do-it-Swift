//
//  CoreGraphicsMissionViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/9/24.
//

import UIKit
import CoreGraphics

class CoreGraphicsMissionViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDraw(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(CGFloat(1.0))
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        
        context.fillPath()
        context.strokePath()
        
        context.setStrokeColor(UIColor.red.cgColor)
//        context.move(to: CGPoint(x: 120, y: 150))
        context.addEllipse(in: CGRect(x: 120, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 170, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 70, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120, y: 100, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120, y: 200, width: 100, height: 100))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        imgView.image = nil
    }
    

}

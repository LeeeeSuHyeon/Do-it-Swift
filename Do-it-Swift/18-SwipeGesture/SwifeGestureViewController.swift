//
//  SwifeGestureViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/11/24.
//

import UIKit

class SwifeGestureViewController: UIViewController {

    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        
        imgViewUp.image = imgUp[0]
        imgViewRight.image = imgRight[0]
        imgViewLeft.image = imgLeft[0]
        imgViewDown.image = imgDown[0]
        
        
        // 액션 인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(SwifeGestureViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(SwifeGestureViewController.respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SwifeGestureViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(SwifeGestureViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up :
                imgViewUp.image = imgUp[1]
                
            case UISwipeGestureRecognizer.Direction.down :
                imgViewDown.image = imgDown[1]
                
            case UISwipeGestureRecognizer.Direction.left :
                imgViewLeft.image = imgLeft[1]
                
            case UISwipeGestureRecognizer.Direction.right :
                imgViewRight.image = imgRight[1]
            default :
                break
            }
        }
    }

}

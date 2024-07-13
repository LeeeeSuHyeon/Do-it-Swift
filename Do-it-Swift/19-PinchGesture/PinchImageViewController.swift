//
//  PinchViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/12/24.
//

import UIKit

class PinchImageViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var initialFontSize : CGFloat!
    let images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(PinchGestureViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemBackground
        imgPinch.image = UIImage(named: images[0])
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(PinchImageViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(PinchImageViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @objc func respondToSwipeGesture(_ gestures : UIGestureRecognizer){
        let gesture = gestures as! UISwipeGestureRecognizer
        
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.left :
            pageControl.currentPage += 1
            imgPinch.image = UIImage(named: images[pageControl.currentPage])
        case UISwipeGestureRecognizer.Direction.right :
            pageControl.currentPage -= 1
            imgPinch.image = UIImage(named: images[pageControl.currentPage])
        default :
            break
        }
        
    }
    
    
    
    @IBAction func pageControl(_ sender: UIPageControl) {
        imgPinch.image = UIImage(named: images[sender.currentPage])
    }
    
}

//
//  SwipeGestureMissionViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/11/24.
//

import UIKit

class SwipeGestureMissionViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .blue
        
        imgView.image = UIImage(named: images[0])
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
    }
    
    @objc func respondToSwipeGesture(_ gestures : UIGestureRecognizer){
        if let gesture = gestures as? UISwipeGestureRecognizer {
            switch gesture.direction {
            case UISwipeGestureRecognizer.Direction.left :
                pageControl.currentPage += 1
                imgView.image = UIImage(named: images[pageControl.currentPage])
                
            case UISwipeGestureRecognizer.Direction.right :
                pageControl.currentPage -= 1
                imgView.image = UIImage(named: images[pageControl.currentPage])
                
            default :
                break
            }
        }
    }
    
    @IBAction func pageControl(_ sender: UIPageControl) {
        print(pageControl.currentPage)
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
    }
}

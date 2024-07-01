//
//  PageControlVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/30/24.
//

import UIKit

class PageControlVC : UIViewController {
    
    var images = ["MuhanEnd.png", "couple_01-1.png", "MuhanMiddle.png", "MuhanStart.png"]
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .green
        pageControl.currentPageIndicatorTintColor = .red
        imgView.image = UIImage(named: images[0])
    }
    
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}

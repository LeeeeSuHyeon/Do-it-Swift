//
//  PageControlMissionVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/1/24.
//

import UIKit

class PageControlMissionVC : UIViewController {
    @IBOutlet weak var lblPageNum: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .blue
        
        lblPageNum.text = "0"
        
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNum.text = String(pageControl.currentPage)
    }
}

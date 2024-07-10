//
//  TabTouchViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/10/24.
//

import UIKit

class TabTouchViewController: UIViewController {

    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var txtTapCount: UILabel!
    @IBOutlet weak var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 터치가 시작될 때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touchss Began"
        txtTapCount.text =  String(touch.tapCount)  // 연속으로 몇 번 터치했는지
        txtTouchCount.text =  String(touches.count) // 몇 개의 손가락으로 토치했는지
    }
    
    // 터치된 손가락이 움직였을 떄 호출
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touchss Moved"
        txtTapCount.text =  String(touch.tapCount)
        txtTouchCount.text =  String(touches.count)
    }
    
    // 화면에서 손가락을 떼었을 때 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touchss Ended"
        txtTapCount.text =  String(touch.tapCount)
        txtTouchCount.text =  String(touches.count)
    }
}

//
//  NavigationVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/2/24.
//

import UIKit

class NavigationVC : ViewController, EditDelegate{

    let imgOn = UIImage(named: "lampOn.png")
    let imgOff = UIImage(named: "lampOff.png")
    
    var isOn = true
    var isZoom = true
    
    let width = 100.0
    let height = 200.0
    
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
    }
    
    // 세그웨이를 이용하여 화면을 전환하기 위해 prepare 함수 사용
    // prepare 함수는 해당 세그웨이가 해당 뷰컨트롤러로 전환되기 직전에 호출되는 함수 (데이터 전달을 위해 사용)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Button"
            
        } else if segue.identifier == "editBarButton" {
            // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar Button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        if isZoom {
            let newWidth = width * 1.5
            let newHeight = height * 1.5
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            self.isZoom = true
        }
        else {
            imgView.frame.size = CGSize(width: self.width, height: self.height)
            self.isZoom = false
        }
    }
}

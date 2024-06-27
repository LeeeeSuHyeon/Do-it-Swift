//
//  AlertVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/27/24.
//

import UIKit

class AlertVC : UIViewController {
    let lampOn = UIImage(named: "lampOn.png")
    let lampOff = UIImage(named: "lampOff.png")
    let lampRemove = UIImage(named: "lampRemove.png")
    
    var isLampOn = true
    
    
    @IBOutlet weak var lampImg: UIImageView!
    override func viewDidLoad() {
        lampImg.image = lampOn
    }
    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = lampOn
            isLampOn = true
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { Action in self.lampImg.image = self.lampOff
                self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.cancel, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
            
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default){ Action in
            self.lampImg.image = self.lampOff
            self.isLampOn = false
        }
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default){ Action in
            self.lampImg.image = self.lampOn
            self.isLampOn = true
        }
        
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive){ Action in
            self.lampImg.image = self.lampRemove
            self.isLampOn = false
        }
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

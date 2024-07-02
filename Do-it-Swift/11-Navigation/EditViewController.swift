//
//  EditViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/2/24.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller : EditViewController, message : String)
    func didImageOnOffDone(_ controller : EditViewController, isOn : Bool)
}


class EditViewController: UIViewController {
    
    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate : EditDelegate?
    var isOn = false
    

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        
    }

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text ?? "")
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
}

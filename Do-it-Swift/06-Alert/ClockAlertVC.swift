//
//  ClockAlertVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/27/24.
//

import UIKit

class ClockAlertVC : ViewController {
    @IBOutlet weak var lblCurrnetTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    override func viewDidLoad() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        lblCurrnetTime.text = formatter.string(from: date as Date)
    }
    @IBAction func pickerView(_ sender: UIDatePicker) {
        let datePicker = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        lblSelectTime.text = formatter.string(from: datePicker.date)
        if lblCurrnetTime.text == lblSelectTime.text {
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다!!", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
}

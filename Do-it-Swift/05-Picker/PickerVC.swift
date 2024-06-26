//
//  PickerVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/26/24.
//

import UIKit

class PickerVC : ViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 9   // 이미지 파일명을 저장할 배열의 최대 크기
    let PICKER_VIEW_COLUMN = 1 // 피커 뷰의 열의 개수
    let PICEKR_VIEW_HEIGHT : CGFloat = 80   // 룰렛의 높이 설정
    var imageFileName = ["가천관.png","공과대학1.png","공과대학2.png","교육대학원.png","글로벌센터.png","대학원_평생교육원.png","바이오나노대학.png","바이오나노연구원.png", "반도체대학.png"]
    var imageArray = [UIImage?]()
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // 피커 뷰에게 컴포넌트의 수를 정수 값을 넘겨주는 델리게이트 메서드
    // 피커 뷰의 컴포넌트는 피커 뷰에 표시되는 열의 개수를 의미
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // numberOfRowsInComponent 인수를 가지는 메서드
    // 피커 뷰에게 컴포넌트의 행의 개수를 정수 값으로 넘겨줌
    // 이 값은 피커 뷰의 해당 열에서 선택할 수 있는 행의 개수 (데이터의 개수를 의미)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MAX_ARRAY_NUM
    }
    
//    // titleForRow 인수를 가지는 메서드
//    // 피커 뷰에게 컴포넌트의 각 행의 타이틀을 문자열(String) 값으로 넘겨줌
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // 각 row의 view를 정의하는 메서드
    // 각 row의 view를 설정하고 UIView 타입을 리턴
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return imageView
    }
    
    // 피커 뷰의 높이 설정 딜리게이트
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICEKR_VIEW_HEIGHT
    }
    
    // 사용자가 피커 뷰의 룰렛을 선택했을 때 호출됨
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    
}

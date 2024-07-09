//
//  CoreGraphicsViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/8/24.
//

import UIKit

class CoreGraphicsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // 선 그리기 버튼
    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // context를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()!    // 생성한 context 정보를 가져옴. context는 그림을 그리는 도화지라고 생각하면 됨
        
        // Draw Line
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 70, y: 50))         // 그림을 그리기 위하여 시작 위치로 커서 이동. (0,0)은 화면의 왼쪽 윗 부분
        context.addLine(to: CGPoint(x: 270, y: 250))    // 현재 위치에서 지정한 위치까지 선 추가
        
        context.strokePath()    // 추가한 경로를 context에 그림
        
        // Draw Traingle
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 콘텍스트에 그려진 이미지를 가져와 이미지 뷰에 나타냄
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
        
    }
    
    
    // 사각형 그리기 버튼
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size) // context를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()!    // 생성한 context 정보를 가져옴. context는 그림을 그리는 도화지라고 생각하면 됨
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    // 원 그리기 버튼
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size) // context를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()!    // 생성한 context 정보를 가져옴. context는 그림을 그리는 도화지라고 생각하면 됨
        
        // Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))   // 타원
        context.strokePath()
        
        // Draw Cicle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))  // 원
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
    // 호 그리기
    @IBAction func btnDrawArc(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size) // context를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()!    // 생성한 context 정보를 가져옴. context는 그림을 그리는 도화지라고 생각하면 됨
        
        // Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
    }
    
    // 채우기
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // context를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()!    // 생성한 context 정보를 가져옴. context는 그림을 그리는 도화지라고 생각하면 됨
        
        // Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.fill(rectangle)
        context.strokePath()

        
        // Draw Cicle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        
        // Draw Traingle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}

//
//  MapViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/29/24.
//

import UIKit
import MapKit

class MapViewController : UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        locationManager.delegate = self // 상수 locationManager의 델리게이트를 self로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization() // 위치 업데이트 시작
        myMap.showsUserLocation = true  // 사용자 위치 보기 true 설정
    }
    
    // 위도, 경도, 범위를 인수로 받음
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)   // 위도, 경도 값을 이용하여 location 설정
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 범위 값을 이용하여 span 설정
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)        // location, span을 이용하여 region 설정
        myMap.setRegion(pRegion, animated: true)        // 지도 위치 및 범위 설정
        
        return pLocation
    }
    
    // 원하는 위치에 핀 설치
    func setAnnotation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double, title strTitle : String, subtitle strSubtitle : String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    
    // 위치가 업데이트 되었을 때 실행되는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last  // 업데이트 된 마지막 위치 값
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        // Delta 값이 작을수록 지도를 확대, 0.01은 1의 값보다 지도를 100배로 확대해서 보여줌
        
        // 위도와 경도 값을 가지고 역으로 위치의 정보, 즉 주소를 찾음
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks?.first      // placemarks 값의 첫 부분만 pm 상수로 대입
            let country = pm?.country       // pm 상수에서 나라 값을 country 상수에 대입
            var address : String = country ?? ""    // 문자열 address에 country 값을 대입
            if pm?.locality != nil {        // pm 상수에서 지역 값이 존재하면 문자열에 추가
                address += " "
                address += pm!.locality!
            }
            if pm?.thoroughfare != nil {    // pm 상수에서 도로값이 존재하면 address 문자열에 추가
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재위치"
            self.lblLocationInfo2.text = address
        
        })
        
        self.locationManager.stopUpdatingLocation()  // 위치 업데이트 중지
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {           // 현재 위치
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1 {    // 폴리텍대학
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴레텍대학 강를캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
            
        } else if sender.selectedSegmentIndex == 2 {    // 이지스퍼블리싱
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914006, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        } else if sender.selectedSegmentIndex == 3 {    // 우리집
            setAnnotation(latitudeValue: 37.455161, longitudeValue: 127.133723, delta: 0.1, title: "우리집", subtitle: "경기도 성남시 수정구 복정동 도 495 가천대학교 글로벌캠퍼스 AI 공학관")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리집"
        }
    }
}

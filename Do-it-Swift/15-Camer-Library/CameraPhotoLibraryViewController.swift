//
//  CameraPhotoLibraryViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/7/24.
//

import UIKit
import MobileCoreServices

class CameraPhotoLibraryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    let imagePicker : UIImagePickerController! = UIImagePickerController()
    var captureImage : UIImage! // 촬영, 포토 라이브러리에서 불러온 사진을 저장할 변수
    var videoURL : URL!         // 녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = true    // 이미지 저장 여부를 나타낼 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // 사진 촬영
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    // 앨범에서 이미지 가져오기
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    // 동영상 촬영
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    // 앨범에서 동영상 가져오기
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    // 카메라 및 앨범에서 선택이 끝났을 떄 호출됨
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        else if mediaType.isEqual(to: "public.movie" as String){
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        self.dismiss(animated: true)
        
    }
    
    // 취소한 경우
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    func myAlert(_ title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

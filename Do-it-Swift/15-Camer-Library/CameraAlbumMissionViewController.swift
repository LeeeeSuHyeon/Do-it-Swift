//
//  CameraAlbumMissionViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/7/24.
//

import UIKit
import MobileCoreServices

class CameraAlbumMissionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgViewFirst: UIImageView!
    @IBOutlet weak var imgViewSecond: UIImageView!
    @IBOutlet weak var imgViewThird: UIImageView!
    
    var numImage = 0
    let imagePicker = UIImagePickerController()
    var image : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCamera(_ sender: UIButton) {
        numImage += 1
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true)
            
        }
    }
    
    @IBAction func btnAlbum(_ sender: UIButton) {
        numImage += 1
        
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true)
        }
    }
    
    
    @IBAction func btnReset(_ sender: UIButton) {
        imgViewFirst.image = nil
        imgViewSecond.image = nil
        imgViewThird.image = nil
        
        numImage = 0
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
//        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        
        addImage(image : image)
        
       
        
        self.dismiss(animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage -= 1
        
        self.dismiss(animated: true)
    }
    
    func addImage(image : UIImage){
        switch numImage {
        case 1 :
            imgViewFirst.image = image
            break
        case 2 :
            imgViewSecond.image = image
            break
        case 3 :
            imgViewThird.image = image
            break
        default:
            break
        }
    }
}

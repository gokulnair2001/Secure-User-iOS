//
//  EncryptViewController.swift
//  Dicee
//
//  Created by Piyush Bajaj on 2/19/20.
//  Copyright © 2020 Pranoy. All rights reserved.
//

import UIKit
import Vision
import CoreML

class EncryptViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var pickedimage: UIImageView!
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//
//            pickedimage.image = userPickedImage
//
//            guard let ciimage = CIImage(image: userPickedImage) else {
//                fatalError("Could not convert to Ci image")
//            }
//
//        }
//
//        imagePicker.dismiss(animated: true, completion: nil)
//
//    }
    
    
    private func imagePickerController(_ picker: UIImagePickerController,
                                       didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        pickedimage.image = image
    }
    
    @IBAction func imagepick(_ sender: Any) {
        
        
         present(imagePicker, animated: true, completion: nil)

        
    }
    

}

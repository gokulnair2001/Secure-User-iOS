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
    let imagePicker = UIImagePickerController()

    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
    }
    
    
    @IBOutlet weak var pickedimage: UIImageView!
    
//    override func viewDidAppear(_ animated: Bool) {
//        pickedimage.layer.cornerRadius = imageView.frame.size.width/2
//        pickedimage.layer.masksToBounds = true
//    }
    
    
    
    @IBOutlet weak var l1: UILabel!
    
    @IBAction func openLibraryAction(_ sender: UIButton) {
        openPhotoLibrary()
    }
    func openPhotoLibrary(){
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary)else{
            print("Photo library cannot be opened")
            return
        }
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker,animated: true)
        
    }
    
    @IBAction func didPseudEncrypt(_ sender: UIButton) {
        pickedimage.image = UIImage(named: "taala" )
        l1.text = "Encrypted!"
        l1.isEnabled = true
    }
}

//MARK:- imagePICKER
extension EncryptViewController{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    defer {
        picker.dismiss(animated: true)
    }
    
    print(info)
    // get the image
    guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
        return
    }
        pickedimage.image = image
    // do something with it
    
        
    }
}
    
//    let imagePicker = UIImagePickerController()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = false
//    }
//
//
////    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
////
////        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
////
////            pickedimage.image = userPickedImage
////
////            guard let ciimage = CIImage(image: userPickedImage) else {
////                fatalError("Could not convert to Ci image")
////            }
////
////        }
////
////        imagePicker.dismiss(animated: true, completion: nil)
////
////    }
//
//
//    private func imagePickerController(_ picker: UIImagePickerController,
//                                       didFinishPickingMediaWithInfo info: [String : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
//            return
//        }
//        pickedimage.image = image
//    }
//
//
//    @IBAction func imagepick(_ sender: Any) {
//
//
//         present(imagePicker, animated: true, completion: nil)
//
//
//
//    }
//
//
//}

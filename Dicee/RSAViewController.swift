//
//  RSAViewController.swift
//  Dicee
//
//  Created by Piyush Bajaj on 2/19/20.
//  Copyright © 2020 Pranoy. All rights reserved.
//

import UIKit

class RSAViewController: UIViewController {
    
    
    @IBOutlet weak var qrimage: UIImageView!
    
    @IBOutlet weak var inputtest: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //MARK: - Testing
        let rsa : RSAWrapper? = RSAWrapper()
        let success : Bool = (rsa?.generateKeyPair(keySize: 2048, privateTag: "in.piyushbajaj", publicTag: "in.piyushbajaj"))!
        if (!success) {
            print("Failed")
            return
        }
        let test : String = "PID001"
        let encryption = rsa?.encryptBase64(text: test)
        print(encryption as Any)
        let decription = rsa?.decpryptBase64(encrpted: encryption!)
        print(decription as Any)
        
        
    }
    

    @IBAction func ebcrypt(_ sender: UIButton) {
        
        // Setting up RSA wrapper
               let rsa : RSAWrapper? = RSAWrapper()
               let success : Bool = (rsa?.generateKeyPair(keySize: 2048, privateTag: "in.piyushbajaj", publicTag: "in.piyushbajaj"))!
               if (!success) {
                   print("Failed")
                   return
               }
               let test : String = inputtest.text!
               let encryption = rsa?.encryptBase64(text: test)
               print(encryption as Any)
               qrimage.image = generateQRCode(from: "\(String(describing: encryption))")
        
        
    }
    //MARK: - Generate QR function
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    

}

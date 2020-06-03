//
//  AESViewController.swift
//  Dicee
//
//  Created by Piyush Bajaj on 2/24/20.
//  Copyright © 2020 Pranoy. All rights reserved.
//

import UIKit
import CommonCrypto


class AESViewController: UIViewController {
    @IBOutlet weak var clearDataTextField: UITextField!
    @IBOutlet weak var keyDataTextField: UITextField!
//    let clearData = "clearData0123456".data(using:String.Encoding.utf8)!
//    let keyData   = "keyData890123456".data(using:String.Encoding.utf8)!
    
    var cryptData :Data?
    var decryptData :Data?
    @IBOutlet weak var decryptTextLabel: UILabel!
    @IBOutlet weak var CypherTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    enum AESError: Error {
        case KeyError((String, Int))
        case IVError((String, Int))
        case CryptorError((String, Int))
    }

    // The iv is prefixed to the encrypted data
    func aesCBCEncrypt(data:Data, keyData:Data) throws -> Data {
        let keyLength = keyData.count
        let validKeyLengths = [kCCKeySizeAES128, kCCKeySizeAES192, kCCKeySizeAES256]
        if (validKeyLengths.contains(keyLength) == false) {
            throw AESError.KeyError(("Invalid key length", keyLength))
        }

        let ivSize = kCCBlockSizeAES128;
        let cryptLength = size_t(ivSize + data.count + kCCBlockSizeAES128)
        var cryptData = Data(count:cryptLength)

        let status = cryptData.withUnsafeMutableBytes {ivBytes in
            SecRandomCopyBytes(kSecRandomDefault, kCCBlockSizeAES128, ivBytes)
        }
        if (status != 0) {
            throw AESError.IVError(("IV generation failed", Int(status)))
        }

        var numBytesEncrypted :size_t = 0
        let options   = CCOptions(kCCOptionPKCS7Padding)

        let cryptStatus = cryptData.withUnsafeMutableBytes {cryptBytes in
            data.withUnsafeBytes {dataBytes in
                keyData.withUnsafeBytes {keyBytes in
                    CCCrypt(CCOperation(kCCEncrypt),
                            CCAlgorithm(kCCAlgorithmAES),
                            options,
                            keyBytes, keyLength,
                            cryptBytes,
                            dataBytes, data.count,
                            cryptBytes+kCCBlockSizeAES128, cryptLength,
                            &numBytesEncrypted)
                }
            }
        }

        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.count = numBytesEncrypted + ivSize
        }
        else {
            throw AESError.CryptorError(("Encryption failed", Int(cryptStatus)))
        }

        return cryptData;
    }

    // The iv is prefixed to the encrypted data
    func aesCBCDecrypt(data:Data, keyData:Data) throws -> Data? {
        let keyLength = keyData.count
        let validKeyLengths = [kCCKeySizeAES128, kCCKeySizeAES192, kCCKeySizeAES256]
        if (validKeyLengths.contains(keyLength) == false) {
            throw AESError.KeyError(("Invalid key length", keyLength))
        }

        let ivSize = kCCBlockSizeAES128;
        let clearLength = size_t(data.count - ivSize)
        var clearData = Data(count:clearLength)

        var numBytesDecrypted :size_t = 0
        let options   = CCOptions(kCCOptionPKCS7Padding)

        let cryptStatus = clearData.withUnsafeMutableBytes {cryptBytes in
            data.withUnsafeBytes {dataBytes in
                keyData.withUnsafeBytes {keyBytes in
                    CCCrypt(CCOperation(kCCDecrypt),
                            CCAlgorithm(kCCAlgorithmAES128),
                            options,
                            keyBytes, keyLength,
                            dataBytes,
                            dataBytes+kCCBlockSizeAES128, clearLength,
                            cryptBytes, clearLength,
                            &numBytesDecrypted)
                }
            }
        }

        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            clearData.count = numBytesDecrypted
        }
        else {
            throw AESError.CryptorError(("Decryption failed", Int(cryptStatus)))
        }

        return clearData;
    }
    
    
    
    
    
    
    
    @IBAction func AESButtonPressed(_ sender: UIButton) {
        let data123 = clearDataTextField.text! + "o"
        let key123 = keyDataTextField.text! + "o"
        let clearData = data123.data(using:String.Encoding.utf8)!
        let keyData   = key123.data(using:String.Encoding.utf8)!
        
        CypherTextLabel.text = "Cypher text will come here"
        let crypted : String
        let Decrypted : String
        do {
            cryptData = try aesCBCEncrypt(data:clearData, keyData:keyData)
            print("cryptData:   \(cryptData! as NSData)")
            crypted = String(decoding: cryptData!, as: UTF8.self)
            CypherTextLabel.text = crypted
        }
            
        catch (let status) {
            print("Error aesCBCEncrypt: \(status)")
        }
    
        do {
            let decryptData = try aesCBCDecrypt(data:cryptData!, keyData:keyData)
            print("decryptData: \(decryptData! as NSData)")
            Decrypted = String(decoding: decryptData!, as: UTF8.self)
            decryptTextLabel.text = Decrypted
        
        }
        catch (let status) {
            print("Error aesCBCDecrypt: \(status)")
        }

    }
    
    
}

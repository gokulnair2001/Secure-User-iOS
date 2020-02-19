//
//  ViewController.swift
//  Dicee
//
//  Created by Piyush Bajaj on 17/02/20.
//  Copyright © 2017 Piyush Bajaj. All rights reserved.
//

import UIKit
//import LocalAuthentication

class ViewController: UIViewController {
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func showAlertController(_ message: String) {
//        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alertController, animated: true, completion: nil)
//    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
        
    }
    func updateDiceImages(){
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        diceImageView1.image = UIImage(named:diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named:diceArray[randomDiceIndex2])
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages() // Motion Sensor event triggers
    }
//
//    @IBAction func SecretPassageButtonPressed(_ sender: UIButton) {
        
//        let context = LAContext()
//        var error: NSError?
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "Authenticate with Touch ID"
//                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
//                    {(success, error) in
//                        // 4
//                        if success {
//                            self.showAlertController("Touch ID Authentication Succeeded")
////                            self.performSegue(withIdentifier: "goToSecretView", sender: nil)
//                        }
//                        else {
//                            self.showAlertController("Touch ID Authentication Failed")
//                        }
//                })
//            }
//        else {
//            showAlertController("Touch ID not available")
//        }
//    }
//    }
    
}


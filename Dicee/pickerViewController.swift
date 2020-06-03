//
//  pickerViewController.swift
//  Dicee
//
//  Created by Piyush Bajaj on 03/06/20.
//  Copyright © 2020 Pranoy. All rights reserved.
//

import Foundation
import UIKit

class PickerViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

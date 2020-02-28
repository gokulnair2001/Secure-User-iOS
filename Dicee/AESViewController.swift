//
//  AESViewController.swift
//  Dicee
//
//  Created by Piyush Bajaj on 2/24/20.
//  Copyright © 2020 Pranoy. All rights reserved.
//

import UIKit

class AESViewController: UIViewController {

    @IBOutlet weak var CypherTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AESButtonPressed(_ sender: UIButton) {
        CypherTextLabel.text = "Cypher text will come here"
    }
    
}

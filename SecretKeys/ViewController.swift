//
//  ViewController.swift
//  SecretKeys
//
//  Created by Brennan Stehling on 12/18/15.
//  Copyright © 2015 SecretKeys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel?
    @IBOutlet weak var secretCodeLabel: UILabel?
    @IBOutlet weak var secretTokenLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        greetingLabel?.text = Keys.sharedInstance().greeting
        secretCodeLabel?.text = Keys.sharedInstance().secretCode
        secretTokenLabel?.text = Keys.sharedInstance().secretToken
    }

}


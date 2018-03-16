//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Ryan Kohn on 2/28/18.
//  Copyright © 2018 johnherseyhighschool. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func BeginButtonPushed(_ sender: UIButton) {
        performSegue(withIdentifier: "IntitialSegue", sender: nil )
    }
    
  


}


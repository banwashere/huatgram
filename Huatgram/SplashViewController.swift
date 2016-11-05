//
//  ViewController.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 4/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginAction(_ sender: AnyObject) {
    }

    
    @IBAction func registerAction(_ sender: AnyObject) {
    }
  
    
    @IBAction func facebook(_ sender: AnyObject) {
    }
    
}


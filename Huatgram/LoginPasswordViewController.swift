//
//  LoginPasswordViewController.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import Firebase

class LoginPasswordViewController: UIViewController {

    @IBOutlet weak var passwordTxt: UITextField!
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextAction(_ sender: AnyObject) {
        FIRAuth.auth()?.signIn(withEmail: email!, password: passwordTxt.text!, completion: { (user, error) in
            
            if user != nil {
                self.performSegue(withIdentifier: "gotoHome", sender: nil)
            }

            }
        )
        
    }

    @IBAction func backAction(_ sender: AnyObject) {
      _ = self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

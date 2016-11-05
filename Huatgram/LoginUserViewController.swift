//
//  LoginUserViewController.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit

class LoginUserViewController: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextAction(_ sender: AnyObject) {
    }

    @IBAction func backAction(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPassword" {
            let detailViewController = segue.destination as! LoginPasswordViewController
            
            detailViewController.email = userNameTxt.text
            
            //detailViewController.selectedCoor = selectedLocation
        }

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

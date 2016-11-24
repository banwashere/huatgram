//
//  SendCommentPhotoViewController.swift
//  Huatgram
//
//  Created by Alientyc on 24/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import Firebase


class SendCommentPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var commenttxt: UITextField!
    
    @IBOutlet weak var photo: UIImageView!
    
      var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func takePic(_ sender: AnyObject) {
        self.imagePicker.sourceType = .photoLibrary
        self.present(self.imagePicker, animated: true, completion: nil)
        

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        photo.image = image
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendToFirebase(_ sender: AnyObject) {
        print("sendfirebase")
        let storageRef = FIRStorage.storage().reference()
        
        let imageRef = storageRef.child("images")
        
        let newImageRef = imageRef.child("filename.jpg")
        
        let imageData = UIImageJPEGRepresentation(photo.image!, 0.75)
        
        // Upload the file to the path "images/rivers.jpg"
        
        newImageRef.put(imageData!, metadata: nil) { (metadata, error) in
            
            if (error != nil) {
                // Uh-oh, an error occurred!
                print("Problem!!!")
            } else {
                // Metadata contains file metadata such as size, content-type, and download URL.
                print("Awesome!!!")
                
                let downloadURL = metadata!.downloadURL()
                print(downloadURL!.absoluteString)
                
                //create new huatpost with that image url
            }
        }
    }
}

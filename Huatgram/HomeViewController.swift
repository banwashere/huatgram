//
//  HomeViewController.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var arrayOfHuatPost : [HuatPost] = []
    @IBOutlet weak var huatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        huatTableView.delegate = self
        huatTableView.dataSource = self
        
        downloadDataFirebase()
        //show popup upon loading
        let alertController = UIAlertController(title: "Welcome", message: "Hello!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
//        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: goToNextPage())

        let okayAction = UIAlertAction(title: "Okay", style: .default ){
            
            (action) in
            //start of your code
            self.goToNextPage()
            //end of your code
        }
        
        
        alertController.addAction(cancelAction)
        
        alertController.addAction(okayAction)
    
        alertController.addTextField(configurationHandler: {(textField: UITextField)-> Void in
            textField.placeholder = "Email"
            textField.keyboardType = UIKeyboardType.emailAddress

            })
        
        alertController.addTextField(configurationHandler: {(textField: UITextField)-> Void in textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            
            })
        
        self.present(alertController, animated: true, completion: nil)
        
//        let alertController2 = UIAlertController(title: "This is action sheet", message: "sheeeeeet", preferredStyle: .actionSheet)
//        
//        let cancelAction2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        
//        let newAction = UIAlertAction(title: "ok", style: .default, handler: nil)
//        
//        alertController2.addAction(cancelAction2)
//        alertController2.addAction(newAction)
//        
//        self.present(alertController2, animated: true, completion: nil)
        
//        createTestData()
        
        // Do any additional setup after loading the view.
        
        
        
        //set up local notifications
//            let huatDate = NSDateComponents()
//            huatDate.hour = 21
//            huatDate.minute = 09
//            let trigger = UNCalendarNotificationTrigger.init(dateMatching: huatDate as DateComponents, repeats: true)
//            
//            let content = UNMutableNotificationContent()
//            content.title = "Huat!"
//            content.body = "Do you want to huat?"
//            content.sound = UNNotificationSound.default()
//            content.badge = (UIApplication.shared.applicationIconBadgeNumber) + 1 as NSNumber
//            content.categoryIdentifier = "com.huat.localNotification"
//            let request = UNNotificationRequest.init(identifier: "Huat2100", content: content, trigger: trigger)
//        
//            let center = UNUserNotificationCenter.current()
//            center.add(request)
//            
//            
//            //set up a time interval notifcation 
//            
//            let trigger2 = UNTimeIntervalNotificationTrigger.init(timeInterval: 30, repeats: false)
//            
//            let content2 = UNMutableNotificationContent()
//            content2.title = "Huat! Huat!"
//            content2.body = "Today your turn to huat!"
//            content2.sound = UNNotificationSound.default()
//            content2.badge = (UIApplication.shared.applicationIconBadgeNumber) + 1 as NSNumber
//            content2.categoryIdentifier = "com.huathuat.identifier2"
//
//            let request2 = UNNotificationRequest.init(identifier: "Huat2101", content: content2, trigger: trigger2)
//            
//            
//            //Dont need two notification centers, no point.
//            center.add(request2)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func createTestData(){
//        
//        let userId = FIRAuth.auth()!.currentUser!.uid
//        
//        
//        let newHuatPost = HuatPost(userId: userId, imageUrl: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg", contentText: "Cat is burrito", arrayOfLike: [], arrayOfComments: [])
//        
//        let newHuatPost2 = HuatPost(userId: userId, imageUrl: "https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/30423_pets-products_january-site-flip_3-cathealth_short-tile_592x304._CB286975940_.jpg", contentText: "Cat is family", arrayOfLike: [], arrayOfComments: [])
//        
//        
//        newHuatPost.savetoFirebase()
//        newHuatPost2.savetoFirebase()
//    
//    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfHuatPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "huatPostCell") as! HuatPostTableViewCell
        
        //access the array
        let post = arrayOfHuatPost[indexPath.row]
        
        cell.configureCell(huatPost: post)
        
        return cell

    
    }
    
    
    
    
    func downloadDataFirebase(){
        
        let databaseRef = FIRDatabase.database().reference()
        let postRef = databaseRef.child("HuatPost")
        //triggered every time there's a new item in huatpost
        postRef.observe(.childAdded, with: { (snapshot) in
        
        let result = snapshot.value as! [String: Any]
        let userId = result["userId"] as! String
        let imageUrl = result["imageUrl"] as! String
        let contentText = result["contentText"] as! String
            let huatPost = HuatPost(userId: userId, imageUrl: imageUrl, contentText: contentText, arrayOfLike: [], arrayOfComments: [], postId: snapshot.key)
            
            
            
            self.arrayOfHuatPost.append(huatPost)
            
        })
        
        postRef.observe(.value, with:{ (snapshot) in
            
            self.huatTableView.reloadData()
            
        })
    
    }
    
    func goToNextPage(){
        
        performSegue(withIdentifier: "toNext", sender: nil)
    }

}

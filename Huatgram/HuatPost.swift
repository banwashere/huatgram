//
//  HuatPost.swift
//  Huatgram
//
//  Created by Gabriele Castaldo on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import Foundation
import Firebase

class HuatPost {
    
    var postId: String?
    var userId: String
    var imageUrl: String
    var contentText: String
    var arrayOfLike: [String]
    var arrayOfComments: [HuatComment]
    
    init(userId: String, imageUrl: String, contentText: String, arrayOfLike: [String], arrayOfComments: [HuatComment], postId: String?){
        
        self.userId = userId
        self.imageUrl = imageUrl
        self.contentText = contentText
        self.arrayOfLike = arrayOfLike
        self.arrayOfComments = arrayOfComments
        
        if let postId = postId{
            
            self.postId = postId
        }
        
    }
    //save to firebase
    func savetoFirebase(){
        
        let databaseRef = FIRDatabase.database().reference()
        let postRef = databaseRef.child("HuatPost")
        
        //let firebase to create unique ID
        let newPost = postRef.childByAutoId()
        
        //create empty dict
        var parameter : [String:Any] = [:]
        
        parameter["userId"] = userId
        parameter["imageUrl"] = imageUrl
        parameter["contentText"] = contentText
        
        //save to server
        newPost.setValue(parameter) { (error, ref) in
            if error != nil{
                print("error saving")
            }
        }
    
    }
    
}











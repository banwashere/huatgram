//
//  HuatPost.swift
//  Huatgram
//
//  Created by Gabriele Castaldo on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import Foundation

class HuatPost {
    
    var userId: String
    var imageUrl: String
    var contentText: String
    var arrayOfLike: [String]
    var arrayOfComments: [HuatComment]
    
    init(userId: String, imageUrl: String, contentText: String, arrayOfLike: [String], arrayOfComments: [HuatComment]){
        
        self.userId = userId
        self.imageUrl = imageUrl
        self.contentText = contentText
        self.arrayOfLike = arrayOfLike
        self.arrayOfComments = arrayOfComments
        
        
    }
    
}











//
//  HuatComment.swift
//  Huatgram
//
//  Created by Gabriele Castaldo on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import Foundation

class HuatComment{
    
    var postId: String
    var userId: String
    var contentText: String
    var timeStamp: Date
    
    init(postId: String, userId: String, contentText: String, timeStamp: Date){
        
        self.postId = postId
        self.userId = userId
        self.contentText = contentText
        self.timeStamp = timeStamp
        
    }
    
}















//
//  HuatPostTableViewCell.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import KFSwiftImageLoader
import Firebase

class HuatPostTableViewCell: UITableViewCell {

    @IBOutlet weak var huatImageView : UIImageView!
    @IBOutlet weak var likeBtn : UIButton!
    @IBOutlet weak var commentBtn : UIButton!
    @IBOutlet weak var commentLbl : UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
    var currentPost: HuatPost?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeAction(_ sender: Any) {
        
        let databaseRef = FIRDatabase.database().reference()
        let postRef = databaseRef.child("HuatPost")
        let currentPostref = postRef.child(currentPost!.postId!)
        let arryOfLikeRef = currentPostref.child("arrayOfLike")
        let newLike = arryOfLikeRef.child(FIRAuth.auth()!.currentUser!.uid)
       
        
        newLike.setValue(true) { (error, ref) in
            
            if error != nil{
                
                print("error")
            }
        }
        
    }
    
    @IBAction func commentAction(_ sender: Any) {
    }
    
    func configureCell(huatPost:HuatPost){
        currentPost = huatPost
        huatImageView.loadImage(urlString: huatPost.imageUrl)
        commentLbl.text = huatPost.contentText
        likeCount.text = "\(huatPost.arrayOfLike.count) Likes"
    
    }

}

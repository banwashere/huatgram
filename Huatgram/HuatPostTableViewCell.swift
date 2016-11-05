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
        
        currentPost?.addLike()
        
    }
    
    @IBAction func commentAction(_ sender: Any) {
    }
    
    func checkLike(post : HuatPost) -> Bool{
        
        for userId in post.arrayOfLike{
            
            if userId == FIRAuth.auth()?.currentUser?.uid{
                return true
            }
        }
        return false
    }
    
    func configureCell(huatPost:HuatPost){
        currentPost = huatPost
        huatImageView.loadImage(urlString: huatPost.imageUrl)
        commentLbl.text = huatPost.contentText
        likeCount.text = "\(huatPost.arrayOfLike.count) Likes"
        
        if checkLike(post: huatPost) == true{
            likeBtn.setImage(UIImage(named: "likeFilled"), for: .normal)
        }
        else {
            likeBtn.setImage(UIImage(named: "like"), for: .normal)
        }
    }
    
}

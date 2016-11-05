//
//  HuatPostTableViewCell.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import KFSwiftImageLoader

class HuatPostTableViewCell: UITableViewCell {

    @IBOutlet weak var huatImageView : UIImageView!
    @IBOutlet weak var likeBtn : UIButton!
    @IBOutlet weak var commentBtn : UIButton!
    @IBOutlet weak var commentLbl : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(huatPost:HuatPost){
        
        huatImageView.loadImage(urlString: huatPost.imageUrl)
        commentLbl.text = huatPost.contentText
    
    }

}

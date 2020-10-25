//
//  VideoCell.swift
//  Project 03 - PlayLocalVideo
//
//  Created by 원현식 on 2020/10/23.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var source: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

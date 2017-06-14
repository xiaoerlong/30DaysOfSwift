//
//  VideoShotTableViewCell.swift
//  LocalVideo
//
//  Created by xiaoerlong on 2017/6/14.
//  Copyright © 2017年 xiaoerlong. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoShotTableViewCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    var delegate: VideoShotTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func playVideo(_ sender: Any) {
        delegate.playVideo(cell: self)
    }
}

protocol VideoShotTableViewCellDelegate {
    func playVideo(cell: VideoShotTableViewCell)
}

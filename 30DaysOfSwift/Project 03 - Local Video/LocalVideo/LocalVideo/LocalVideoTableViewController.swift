//
//  LocalVideoTableViewController.swift
//  LocalVideo
//
//  Created by xiaoerlong on 2017/6/14.
//  Copyright © 2017年 xiaoerlong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class LocalVideoTableViewController: UITableViewController {

    
    var data = [
    
        video(image: "videoScreenshot01", title: "Introduce 3DS Mari", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    let identifier = "VideoShotCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! VideoShotTableViewCell
        let video = data[indexPath.row]
        cell.shotImageView.image = UIImage.init(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}

extension LocalVideoTableViewController: VideoShotTableViewCellDelegate {
    func playVideo(cell: VideoShotTableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        var url = URL.init(string: "")
        
        if (indexPath?.row)! % 2 == 0 {
            // 播放网页视频
            url = URL.init(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
        } else {
            let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
            url = URL.init(fileURLWithPath: path!)
        }
        // 系统播放控制器
        let playViewController = AVPlayerViewController()
        let player = AVPlayer(url: url!)
        
        // 设置player
        playViewController.player = player
        self.present(playViewController, animated: true) {
            playViewController.player?.play()
        }
    }
    
}

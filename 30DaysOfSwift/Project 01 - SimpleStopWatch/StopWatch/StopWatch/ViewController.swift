//
//  ViewController.swift
//  StopWatch
//
//  Created by xiaoerlong on 2017/6/11.
//  Copyright © 2017年 xiaoerlong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var counter = 0.0
    var isPlaying = false
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(counter)
    }

    //MARK: - action
    
    @IBAction func play(_ sender: UIButton) {
        // 启动定时器
        if isPlaying {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(doSomeThing), userInfo: nil, repeats: true)
        isPlaying = true
        
        playButton.isEnabled = false
        pauseButton.isEnabled = true
    }
    
    @IBAction func pause(_ sender: UIButton) {
        // 暂停定时器
        timer.invalidate()
        isPlaying = false
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }

    @IBAction func reset(_ sender: UIButton) {
        // 关闭定时器，永久关闭定时器
        timer.invalidate()
        counter = 0.0
        isPlaying = false
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        resultLabel.text = String(counter)
    }
    
    func doSomeThing() {
        counter = counter + 0.1
        resultLabel.text = String.init(format: "%.1f", counter)
    }

}


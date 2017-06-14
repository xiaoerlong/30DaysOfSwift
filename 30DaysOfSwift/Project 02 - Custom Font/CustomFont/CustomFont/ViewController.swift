//
//  ViewController.swift
//  CustomFont
//
//  Created by xiaoerlong on 2017/6/12.
//  Copyright © 2017年 xiaoerlong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let identifier = "customFontCell"

    var dataArray: [String] = NSArray() as! [String]
    var fontNames = [String]()
    var fontRowIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArray = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                     "测试测试测试测试测试测试",
                     "123",
                     "Alex",
                     "@@@@@@"]
         fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
    }

    @IBAction func changeFont(_ sender: Any) {
        fontRowIndex = (1 + fontRowIndex) % 5
        print(fontNames[fontRowIndex])
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! CustomFontTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = dataArray[indexPath.row]
        cell.titleLabel.font = UIFont.init(name: fontNames[fontRowIndex], size: 17)
        return cell
    }
}


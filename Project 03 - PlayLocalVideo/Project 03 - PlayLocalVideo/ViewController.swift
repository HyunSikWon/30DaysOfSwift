//
//  ViewController.swift
//  Project 03 - PlayLocalVideo
//
//  Created by 원현식 on 2020/10/23.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var videoData = [
        Video(thumbnail: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(thumbnail: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(thumbnail: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(thumbnail: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(thumbnail: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(thumbnail: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        cell.thumbnail.image = UIImage(named: videoData[indexPath.row].thumbnail)
        cell.title.text = videoData[indexPath.row].title
        cell.source.text = videoData[indexPath.row].source
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let path = Bundle.main.path(forResource: "wwdc2020", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playerItem)
        
        let playVC = AVPlayerViewController()
        playVC.player = player
        
        self.present(playVC, animated: true) {
            playVC.player?.play()
        }
    }
}


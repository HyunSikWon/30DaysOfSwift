//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by 원현식 on 2020/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    var counter: Float = 0.0 {
        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
    
    var timer: Timer?
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBAction
    @IBAction func startButton(_ sender: Any) {
        guard isPlaying == false else { return }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(setTime),
            userInfo: nil,
            repeats: true)
        isPlaying = true;
    }
    
    @IBAction func stopButton(_ sender: Any) {
        guard isPlaying == true else { return }
        timer!.invalidate()
        timer = nil
        isPlaying = false
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        guard isPlaying == false else {return}
        timer = nil
        counter = 0.0
    }
    
    // MARK: - Helper
    @objc private func setTime() {
        counter += 0.1
    }
}


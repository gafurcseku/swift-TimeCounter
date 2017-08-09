//
//  ViewController.swift
//  TimeCounter
//
//  Created by TISHI on 8/8/17.
//  Copyright © 2017 Builtechsoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var second:Double = 0.0;
    var timer = Timer();
    var isTimerRunning = false;
    var resume = false ;
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var playButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func TimerRun(_ sender: UIButton) {
        
        if !isTimerRunning {
            
            if let image = UIImage(named: "play") as UIImage! {
                playButton.setImage(image, for: UIControlState.normal)
            }
            isTimerRunning = true
            startTimer()
        } else if isTimerRunning {
            if let image = UIImage(named: "push") as UIImage! {
                playButton.setImage(image, for: UIControlState.normal)
            }
            timer.invalidate()
            isTimerRunning = false
        }

    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        timer.invalidate();
        isTimerRunning = false;
        second = 0.0;
        timeLabel.text="00 : 00 : 00";
        if let image = UIImage(named: "play") as UIImage! {
            playButton.setImage(image, for: UIControlState.normal)
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    func updateTimer() {
        second += 0.01;
        
        let secondInt = Int(second)
        
        let hours = getStringFrom(seconds: (secondInt / 3600))
        let minutes = getStringFrom(seconds: ((secondInt % 3600) / 60))
        let seconds = getStringFrom(seconds: ((secondInt % 3600) % 60))
        
        
        timeLabel.text="\(hours) : \(minutes) : \(seconds)"
    }
    
    
    func getStringFrom(seconds: Int) -> String {
        
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }

}


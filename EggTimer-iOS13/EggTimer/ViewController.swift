//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggTimerMessage: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    
    let eggTimes : [String : Int] = ["Soft": 4, "Medium": 7, "Hard": 12]
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {

        let hardness = sender.currentTitle!
        self.eggTimerMessage.text = hardness
        progressBar.progress = 0.0
        countDown(secondsToCountDown: eggTimes[hardness]!)
        timer.invalidate()

    }
    
    func countDown(secondsToCountDown: Int){
        var counter = secondsToCountDown;
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            t in
            
            print("Seconds To Count Down: " + String(secondsToCountDown))
            let progress = Float(Float(secondsToCountDown) - Float(counter)) / Float(secondsToCountDown)
            print("Calculated Progress: " + String(progress))
            self.progressBar.progress = progress

            self.timer = t
            print(counter)
            counter -= 1

            if counter < 0 {
                self.timer.invalidate()
                self.eggTimerMessage.text = "Done"
                print("Done")
                self.playSound()
            }
        }
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

    
}

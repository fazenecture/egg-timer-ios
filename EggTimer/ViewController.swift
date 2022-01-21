import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        progressBar.progress = 0.0
        totalTime = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer.invalidate()
        
        totalTime = eggTimes[hardness]!
//        print(secondsRemaning)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @objc func updateTimer(){
        if secondsPassed <= totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)

            progressBar.progress = Float(percentageProgress)
//            print("\(secondsRemaning) seconds")

        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
}

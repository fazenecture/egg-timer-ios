import UIKit

class ViewController: UIViewController {
    
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    
    var secondsRemaning = 60
    var timer = Timer()
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        
        secondsRemaning = eggTimes[hardness]!
        print(secondsRemaning)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @objc func updateTimer(){
        if secondsRemaning > 0 {
            print("\(secondsRemaning) seconds")
            secondsRemaning -= 1
        }else{
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
}

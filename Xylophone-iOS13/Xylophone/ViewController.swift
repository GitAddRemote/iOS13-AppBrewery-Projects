import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.50
        playSound(key: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02){
//            sleep(UInt32(2.02))
            sender.alpha = 1.00
        }
    }
    
    func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

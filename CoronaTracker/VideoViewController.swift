//
//  ViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 23/02/2022.
//

import UIKit
import AVFoundation
import AVKit

class VideoViewController: UIViewController {
     override func viewDidLoad() {
                super.viewDidLoad()
        
        
                // Modally present the player and call the player's play() method when complete.
        
    }

    @IBAction func clicked(_ sender: Any) {
        guard let url = URL(string: "https://media.praaly.fr/praaly/videos/8f27167ce98b97841471c274384d2935.mp4") else { return }
        print("yo")

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true) {
            player.play()
           
        }
    }
    

}


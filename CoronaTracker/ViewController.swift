//
//  ViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 23/02/2022.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1. Create a URL
        if let url = URL(string: "https://www.youtube.com/watch?v=t4h8j9xLyxQ") {
            
            //2. Create AVPlayer object
            let asset = AVAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            let player = AVPlayer(playerItem: playerItem)
            
            //3. Create AVPlayerLayer object
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds //bounds of the view in which AVPlayer should be displayed
            playerLayer.videoGravity = .resizeAspect
            
            //4. Add playerLayer to view's layer
            self.videoView.layer.addSublayer(playerLayer)
            
            //5. Play Video
            player.play()
        }
        
    }
    
    


}


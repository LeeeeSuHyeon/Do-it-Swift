//
//  MoviePlayerViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/6/24.
//

import UIKit
import AVKit


class MoviePlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 내부 비디오 재생 (mp4)
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // 내부 파일 mp4
        let filePath : String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    // 내부 비디오 재생 (mov)
    @IBAction func btnPlayInterMoviewMov(_ sender: UIButton) {
        // 내부 파일 mov
        let filePath : String? = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    
    // 외부 비디오 재생(mp4)
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        // 외부 파일 mp4
        let url = NSURL(string: "http://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url: url)
        

    }
    
    // 외부 비디오 재생(mov)
    @IBAction func btnPlayExternalMovieMov(_ sender: UIButton) {
        // 외부 파일 mov
        let url = NSURL(string: "http://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        
        playVideo(url: url)
    }
    
    private func playVideo(url : NSURL){
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true){
            player.play()
        }
    }

}

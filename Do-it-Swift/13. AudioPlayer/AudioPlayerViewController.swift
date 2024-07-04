//
//  AudioPlayerViewController.swift
//  Do-it-Swift
//
//  Created by 이수현 on 7/4/24.
//

import UIKit
import AVFoundation

class AudioPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!    // AVAudioPlayer 인스턴스 변수
    var audioFile : URL!                // 재생할 오디오의 파일명 변수
    let MAX_VOLUME : Float = 10.0       // 최대 볼륨 (실수형 상수)
    var progressTimer : Timer!          // 타이머를 위한 변수

    let timePlayerSelector : Selector = #selector(AudioPlayerViewController.updatePlayTime)
    
    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTIme: UILabel!
    @IBOutlet weak var lblEndTIme: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        audioFile = Bundle.main.url(forResource: "mp", withExtension: "mp3")
        initPlay()
        
    }
    
    func initPlay(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }
        catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTIme.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTIme.text = convertNSTimeInterval2String(0)
        
        setPlayButtons(true, pause: false, stop: false)
    }
    
    func setPlayButtons(_ play : Bool, pause : Bool, stop : Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    func convertNSTimeInterval2String(_ time : TimeInterval) -> String {
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy : 60))
        let strTime = String(format: "%02d:%02d", min, sec) // 00:00 포멧
        return strTime
    }
    

    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayTime(){
        lblCurrentTIme.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTIme.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
    }
     
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    
    // 오디오 재생이 끝나면 호출되는 함수
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

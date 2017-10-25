//
//  MusicPlayerViewController.swift
//  Task.3.Shop
//
//  Created by Natalia Kapusta on 26/06/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//


import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet var image:UIImageView!
    @IBOutlet var songTitle:UILabel!
    @IBOutlet var songArtist:UILabel!
    @IBOutlet var time:UISlider!
    @IBOutlet var playPause:UIButton!
    @IBOutlet var stop:UIButton!
    @IBOutlet var volume:UISlider!
    @IBOutlet var volumeLabel:UILabel!
    @IBOutlet var timeElapsed:UILabel!
    @IBOutlet var buyButton:UIButton!

    
    var index = 0
    var category = ""
    var song:Song = Song(title: "", artist: "", price: 0.0, image: "", song: "")
    var delegate = UIApplication.shared.delegate as! AppDelegate
    var player:AVAudioPlayer!
    
    @IBAction func addSongToCart(){
        
        var flag:Bool = false
        
        for song_ in Songs.shared.songsToBuy{
            if song_.image==song.image{
                let alertMessage = UIAlertController(title: ":(", message: "Piosenka jest już w koszyku zakupów.", preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "AHA", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.present(alertMessage, animated: true, completion: nil)
                flag=true
            }
        }
        
        if(flag==false){
            Songs.shared.songsToBuy.append(song)
            Songs.shared.quantity.append(1)
            
            let alertMessage = UIAlertController(title: ":)", message: "Piosenka została dodana do koszyka zakupów.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alertMessage, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        image.image = UIImage(named:song.image)
        songTitle.text = song.title
        songArtist.text = song.artist
        playPause.setImage(UIImage(named: "pause"), for: UIControlState.normal)
        buyButton.setTitle("Kup piosenkę za " + String(song.price) + "$", for: UIControlState.normal)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(trackAudioTime), userInfo: nil, repeats: true)
        time.value = 0
        time.minimumValue = 0
        
        volume.minimumValue = 0
        volume.maximumValue = 1
        
        //DEFAULT AUDIO FILE
        let path = Bundle.main.path(forResource: song.song, ofType:nil)!
        let audioFileURL = URL(fileURLWithPath: path)
        
        //START AUDIO
        do {
            player = try AVAudioPlayer(contentsOf: audioFileURL)
            player.prepareToPlay()
            player.play()
        }
        catch {
            print(error)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stop(sender: UIButton) {
        if(player.isPlaying){
            player.stop()
            player.currentTime = 0
            stop.isEnabled = false
            playPause.setImage(UIImage(named: "play"), for: UIControlState.normal)
        }
        else{
            player.currentTime = 0
            stop.isEnabled = false
        }
    }
    
    
    @IBAction func playPause(sender: UIButton) {
        if(player.isPlaying){
            player.pause()
            playPause.setImage(UIImage(named: "play"), for: UIControlState.normal)
        }
        else{
            playPause.setImage(UIImage(named: "pause"), for: UIControlState.normal)
            player.play()
            stop.isEnabled = true
        }
    }
    
    @IBAction func slideTime(slider: UISlider) {
        player.currentTime = TimeInterval(slider.value)
    }
    
    @IBAction func changeVolume(slider: UISlider) {
        player.volume = volume.value
        volumeLabel.text = "Volume " + String(Int(player.volume*100))
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag:Bool) {
        playPause.isSelected = false
        let alertMessage = UIAlertController(title: "Finish Playing", message:"Finish playing the recording!", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        present(alertMessage, animated: true, completion: nil)
    }
    
    func trackAudioTime() {
        
        //SET UISLIDER AS TIMER
        //let timeLabel = Float(player.currentTime * 100.0 / player.duration)
        //let normalizedTime = timeLabel/100
        time.maximumValue = Float(player.duration)
        time.value=Float(player.currentTime)
        
        //SET TIME LABEL
        let seconds = Int(player.currentTime)
        let minutes = Int(seconds/60)
        let del = minutes*60
        
        if(seconds-del<10){
            timeElapsed.text = String(minutes) + ":0" + String(seconds-del)
        }
        else{
            timeElapsed.text = String(minutes) + ":" + String(seconds-del)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

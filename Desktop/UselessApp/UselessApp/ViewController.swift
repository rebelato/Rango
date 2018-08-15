//
//  ViewController.swift
//  UselessApp
//
//  Created by Lucas Rebelato on 15/08/18.
//  Copyright © 2018 Lucas Rebelato. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController, AVAudioRecorderDelegate{
    
    @IBOutlet weak var bt: UIButton!
    @IBOutlet weak var dbLabel: UILabel!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var link: CADisplayLink!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordingSession = AVAudioSession.sharedInstance()
        
        AVAudioSession.sharedInstance().requestRecordPermission{ (hasPermission) in
            if hasPermission{
                print("boa")
            }
        }
        
        prepareMic()
        audioRecorder.record()
        startMetering()
    }
    
    
    @IBAction func start(_ sender: Any) {
        audioRecorder.stop()
    }
    
    func prepareMic(){
        let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filename = URL(fileURLWithPath: documentDir ).appendingPathComponent("teste.m4a")
        let settings = [AVFormatIDKey: NSNumber(value: Int32(kAudioFormatAppleLossless) as Int32), AVSampleRateKey: 44100.0, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue, AVEncoderBitRateKey: 192000] as [String : Any]
        
        do{
            audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
            audioRecorder.prepareToRecord()
            audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            
        }catch{
            print("Erro ao iniciar o mic")
        }
    }
    
    //Timer
    func startMetering(){
        link = CADisplayLink(target: self, selector: #selector(updateMeters))
        link?.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
    }
    
    //Atualiza a cada som, para medir o dB
    @objc func updateMeters(){
        audioRecorder.updateMeters()
        let db = audioRecorder.averagePower(forChannel: 0)
        dbLabel.text = "\(db)"
        
        let dbPositivo = db * (-1)
        
        if dbPositivo < 5{
            self.view.backgroundColor = .black
        }else if dbPositivo >= 5 && dbPositivo < 40{
            self.view.backgroundColor = .green
        }else if dbPositivo >= 40{
            self.view.backgroundColor = .blue
        }
    }
}


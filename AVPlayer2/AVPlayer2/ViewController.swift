//
//  ViewController.swift
//  AVPlayer2
//
//  Created by miyazawaryohei on 2020/09/09.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer


class ViewController: UIViewController {
    
    let playerController = AVPlayerViewController()
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //アプリがどのようにオーディオを扱うか示すオブジェクト
        //モードをAVAudioSessionModeMoviePlayback（ムービー再生用）に設定している
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        }catch{
            print("error")
        }
        //setActiveを使用してセッションをアクティブ化すると、オーディオセッションはこの構成を使用する
        do {
            try audioSession.setActive(true)
            print("セット完了")
        }catch{
            print("セットできませんでした")
        }
    }
    
    //動画プレイヤーにアイテムをセットして更新
    private func playMovie(FileName: String, FileExtension: String){
        guard let url = Bundle.main.url(forResource: FileName, withExtension: FileExtension)else {
            print("ファイルが見つかりません")
            return
        }
        
        //AVPlayerにアイテムをセット
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        
        //動画プレイヤーにPlayerをセット
        playerController.player = player
        
        //動画プレイやーを表示して再生
        self.present(playerController, animated: true){
            self.player.play()
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        playMovie(FileName: "Movie", FileExtension: "mp4")
    }
    
}


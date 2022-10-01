//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 石田翼 on 2022/09/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theBackButton: UIButton!
    @IBOutlet weak var theNextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
   
    // 配列に指定するindex番号を宣言
        var nowIndex:Int = 0
      
    

        // スライドショーに使用するタイマーを宣言
        var timer: Timer!

        // スライドショーさせる画像の配列を宣言
        var imageArray:[UIImage] = [
            UIImage(named: "apple1")!,
            UIImage(named: "apple2")!,
            UIImage(named: "apple3")!,
           
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
    }

    
    @IBAction func slideShowButton(_ sender: Any) {
        
        // 再生中か停止しているかを判定
               if (timer == nil) {
                   // 再生時の処理を実装

                   // タイマーをセットする
                   timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

                   // ボタンの名前を停止に変える
                   startButton.setTitle("停止", for: .normal)
                   
                   theNextButton.isEnabled = false
                   theBackButton.isEnabled = false

               } else {
                   // 停止時の処理を実装
                   // タイマーを停止する
                   timer.invalidate()

                   // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                   timer = nil

                   // ボタンの名前を再生に直しておく
                   startButton.setTitle("再生", for: .normal)
                   
                   theNextButton.isEnabled = true
                   theBackButton.isEnabled = true
               }
           }
    

           @objc func changeImage() {
               // indexを増やして表示する画像を切り替える
               nowIndex += 1

               // indexが表示予定の画像の数と同じ場合
               if (nowIndex == imageArray.count) {
                   // indexを一番最初の数字に戻す
                   nowIndex = 0
               }
               // indexの画像をstoryboardの画像にセットする
               imageView.image = imageArray[nowIndex]
               
                            
           }
    
    
   
    @IBAction func NextButton(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func BackButton(_ sender: Any) {

        if nowIndex == 0 {
            nowIndex = 2
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
            
        } else if nowIndex == 2 {
            nowIndex = 1
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
            
        } else if nowIndex == 1 {
            nowIndex = 0
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        }
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func tapAction(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let resultViewController: ResultViewController
                 = segue.destination as! ResultViewController

        resultViewController.image = imageArray[nowIndex]
        
    }

}


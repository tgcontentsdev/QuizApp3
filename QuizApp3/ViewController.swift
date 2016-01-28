//
//  ViewController.swift
//  QuizApp3
//
//  Created by tgaiacontentsdev on 2016/01/28.
//  Copyright © 2016年 tgaiacontentsdev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var qesLavel: UILabel!
    @IBOutlet weak var qesText: UITextView!
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var maruButton: UIButton!
    @IBOutlet weak var batsuButton: UIButton!
    @IBOutlet weak var onemoreButton: UIButton!
    
    var player : AVAudioPlayer!
    var timerCount: NSTimer!
    var answer = 1;
    var qesNumber = 1;
    var countNumber = 0;
    var score = 0;
    var error :NSError!
    
    let myImage = UIImage (named:"qes.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        first()
        
    }
    
        func first() {
            answer = 1;
            qesNumber = 1;
            let myImage = UIImage (named:"qes.jpg")
            backImage.image = myImage
            qesLavel.text = "第１問"
            qesText.text = "平成26年10月時点での日本の人口は、男性より女性の方が多い？"
            qesText.font = UIFont.systemFontOfSize(CGFloat(20))
            maruButton.hidden = false;
            batsuButton.hidden = false;
            onemoreButton.hidden = true;
            
            
        }

    @IBAction func oneMoreAction(sender: UIButton) {
     first()
    }
        
    @IBAction func maruButtonAction(sender: UIButton) {
    countNumber = 1;
    chackAns()
    
    //ボタン無効化
    maruButton.enabled = false;
    batsuButton.enabled = false;
    
    }
    
    @IBAction func batsuButtonAction(sender: UIButton) {
    countNumber = 2;
    chackAns()
    
    //ボタン無効化
    maruButton.enabled = false;
    batsuButton.enabled = false;
    
    }
    
    func chackAns() {
    if countNumber == answer {
    score++;
    let maruImage = UIImage (named: "sei.png")
    backImage.image = maruImage
    //let bundle = NSBundle.mainBundle()
    let path : NSString = NSBundle.mainBundle().pathForResource("maru", ofType:"mp3")!
    let url : NSURL = NSURL(fileURLWithPath:path as String)
    
    do {
            player = try AVAudioPlayer(contentsOfURL: url)
        } catch {
            // プレイヤー作成失敗
            
            return
        }
        
    player.play()
    
    }else{
    let batsuImage = UIImage (named: "zan.png")
    backImage.image = batsuImage
        
    let path : NSString = NSBundle.mainBundle().pathForResource("batsu", ofType:"mp3")!
    let url : NSURL = NSURL(fileURLWithPath:path as String)
    
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
        } catch {
            // プレイヤー作成失敗
            
           return
        }
        
        player.play()
       
    }
    
    timerCount = NSTimer.scheduledTimerWithTimeInterval(1, target:self,selector: Selector("next"), userInfo:nil, repeats: true)
    }
    
    func next() {
    qesNumber++;
    countNumber = 0;
    
    //ボタンを有効化したい
    maruButton.enabled = true;
    batsuButton.enabled = true;
    
    
    backImage.image = myImage
    switch qesNumber {
    case 2:
    qesLavel.text = "第２問"
    qesText.text = "iPhoneアプリの開発に使われる統合開発環境といえば■codeである。■に入るのはどっち？"
    answer = 2;
    break
        
    case 3:
    qesLavel.text = "第3問"
    qesText.text = "2015年現在日本で一番多い苗字は「鈴木」？"
    answer = 2;
    break
        
    case 4:
    qesLavel.text = "第4問"
    qesText.text = "サザエさんに登場するマスオさんの出身地は大阪？"
    answer = 1;
    break
        
    case 5:
    qesLavel.text = "第5問"
    qesText.text = "このクイズアプリは面白い？"
    answer = 1;
    break
    
    
    //結果表示
    default:
    let kekkaImage = UIImage (named: "kekka.png")
    backImage.image = kekkaImage
    qesLavel.text = "正解率は"
    qesText.text = "\(score)/5"
    qesText.textAlignment = NSTextAlignment.Center
    qesText.font = UIFont.systemFontOfSize(CGFloat(30))
    
    //ボタン非表示
    maruButton.hidden = true;
    batsuButton.hidden = true;
    onemoreButton.hidden = false;
    
    break
    }
    timerStop()
    
    }

    func timerStop() {
    if timerCount != nil {
    timerCount.invalidate()
    //timerCount = nil
    
    }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


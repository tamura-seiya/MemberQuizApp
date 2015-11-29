//
//  SecondViewController.swift
//  QuizApplication
//
//  Created by tamura seiya on 2015/10/18.
//  Copyright (c) 2015年 Seiya Tamura. All rights reserved.
//

import UIKit
import Social

class SecondViewController: UIViewController {
    
    
    var correctAnswer = 0
    
    var myComposeView : SLComposeViewController!
    var myTwitterButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    let member1: UIImage! = UIImage(named: "shinya2.jpg")
    let member2: UIImage! = UIImage(named: "komaru.png")
    let member3: UIImage! = UIImage(named: "happy2.jpg")
    let member4: UIImage! = UIImage(named: "happy.jpg")
    let member5: UIImage! = UIImage(named: "stevejobs.jpg")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (correctAnswer == 0){
        resultLabel.text = "しんやさん、タイキックお願いします"
        image1.image = member1
        }else if(correctAnswer > 0  &&  4 > correctAnswer ){
            resultLabel.text = "みんなのことが嫌い"
            image1.image = member2
        }else if(correctAnswer > 3  &&  6 > correctAnswer ){
            resultLabel.text = "みんなのことがそこそこ好きですね"
            image1.image = member3
        }else if(correctAnswer > 5 &&  8 > correctAnswer ){
            resultLabel.text = "なかなかいいです"
            image1.image = member4
        }else if(correctAnswer == 8){
            resultLabel.text = "Super Engineer!!!!"
            image1.image = member5
        }else{}

        
        // Twitter用のUIButtonの生成.
        let hex: Int = 0x55ACEE
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        var myColor: UIColor = UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(1.0))
        
        // ボタン.
        myTwitterButton = UIButton()
        myTwitterButton.frame = CGRectMake(0,0,100,100)
        myTwitterButton.backgroundColor = myColor
        myTwitterButton.layer.masksToBounds = true
        myTwitterButton.setTitle("Tweet", forState: UIControlState.Normal)
        myTwitterButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(20))
        myTwitterButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myTwitterButton.layer.cornerRadius = 50.0
        myTwitterButton.layer.position = CGPoint(x: self.view.frame.width/4, y:self.view.frame.height/1.2)
        myTwitterButton.tag = 1
        myTwitterButton.addTarget(self, action: "onPostToTwitter:", forControlEvents: .TouchUpInside)
        
        // buttonをviewに追加.
        self.view.addSubview(myTwitterButton)
        println("correctanswer = \(correctAnswer)")
    }
    
    // ボタンイベント.
    func onPostToTwitter(sender : AnyObject) {
        
        // SLComposeViewControllerのインスタンス化.
        // ServiceTypeをTwitterに指定.
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        // 投稿するテキストを指定.
        myComposeView.setInitialText("Twitter Test from Swift")
        
        // 投稿する画像を指定.
        myComposeView.addImage(UIImage(named: "oouchi.jpg"))
        
        // myComposeViewの画面遷移.
        self.presentViewController(myComposeView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

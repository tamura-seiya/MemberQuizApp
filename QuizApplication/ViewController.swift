//
//  ViewController.swift
//  QuizApplication
//
//  Created by tamura seiya on 2015/10/18.
//  Copyright (c) 2015年 Seiya Tamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    var quizArray = [AnyObject]()
    var correctAnswer = 0
    var Index : [String] = []
    
    
    
    @IBOutlet weak var quizTxt: UILabel!
    @IBOutlet weak var answerTxt: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var questionImage: UIImageView!
    let member1: UIImage! = UIImage(named: "akira.jpg")
    let member2: UIImage! = UIImage(named: "ami.jpg")
    let member3: UIImage! = UIImage(named: "iyo.jpg")
    let member4: UIImage! = UIImage(named: "keichiro.jpg")
    let member5: UIImage! = UIImage(named: "seiya.jpg")
    let member6: UIImage! = UIImage(named: "shinichi.jpg")
    let member7: UIImage! = UIImage(named: "migitama.jpg")
    let member8: UIImage! = UIImage(named: "shinya.jpg")
    
    @IBOutlet weak var answerBtn: UIButton!
    
    //時間計測用の変数.
    var cnt : Float = 5.0
    var bnt : Float = 0
    
    //時間表示用のラベル.
    var myLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answerField.delegate = self
        
        //palceholder 薄くなる
        answerField.placeholder = "ここに答えを入力してください"
        
        var tmpArray = [AnyObject]()
        
        tmpArray.append(["名前は??","akira",member1])
        tmpArray.append(["あみさんの現在の髪型は？？","short",member2])
        tmpArray.append(["名前は？？","iyo",member3])
        tmpArray.append(["けんいちろうくんの出身地は？？","osaka",member4])
        tmpArray.append(["この写真のスポーツ名は？am⚪︎foot","e",member5])
        tmpArray.append(["しんぺいさんの奥様の名前は？","ami",member6])
        tmpArray.append(["彼の愛称はhidaritama。正式名称は？","migitama",member7])
        tmpArray.append(["ニックネームは？baby ⚪︎⚪︎⚪︎⚪︎⚪︎","giant",member8])
        
        while(tmpArray.count > 0){
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
            
//            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
//            quizArray.append(tmpArray[index])
//            tmpArray.removeAtIndex(index)
        }
        
        choiceQuiz()
        
        //ラベルを作る.
        myLabel = UILabel(frame: CGRectMake(0,0,200,50))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Time:\(cnt)"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 250)
        self.view.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(myLabel)
        
        //タイマーを作る.
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        
        func performSegueToResult2() {
            performSegueWithIdentifier("toFirstView", sender: nil)
        }

        
        if(cnt == 0.0){
            performSegueToResult2()
        }

        
        
        
    }

    func choiceQuiz(){
          quizTxt.text = quizArray[0][0] as? String
//          questionImage.image = quizArray[0][2] as? UIImage
        questionImage.image = quizArray[0][2] as? UIImage
          println("\(quizArray[0][2)")
        }
//    
//    func performSegueToResult2() {
//        performSegueWithIdentifier("toFirstView", sender: nil)
//    }
//
    
    func onUpdate(timer : NSTimer){
        
        cnt -= 0.1
    
        //桁数を指定して文字列を作る.
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        
        myLabel.text = str
        
            
       
        
    }
    
    
    
    
    
    //キーボードのリターンが押された際に、呼ばれる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        println("リターン")
        
        //myLabelの表示文字をテキストフィールドに入力
        answerTxt.text = answerField.text
        
        //配列から、値を削除
//        Index.removeAtIndex(0)
//        println(Index)
        
//        if (answerField == quizArray[0][1] as! String){
//           correctAnswer++
//        }
        
        
        
//        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
//        if quizArray.count == 0 {
//            performSegueToResult()
//        } else {
//            choiceQuiz()
//        }
        
        answerField.text = ""
        
        //キーボードを閉じるという処理
        answerField.resignFirstResponder()
        return true
    }
//
//    func performSegueToResult() {
//        performSegueWithIdentifier("toResultView", sender: nil)
//}

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if (segue.identifier == "toResultView") {
//            
//            var newVC = segue.destinationViewController as! SecondViewController
//            newVC.correctAnswer = correctAnswer
//        }
//        
//        
//    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    @IBAction func tapBtn(sender: UIButton) {
        
        
        if (quizArray[0][1] as! String == answerTxt.text){
            correctAnswer++
        }
        
        println("クイズアレイの中身は？\(quizArray[0][1])")
        println("アンサーの中身は？\(answerTxt.text)")
        
        
        quizArray.removeAtIndex(0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
        
        answerTxt.text = ""
        
        
        println("correctAnswer=\(correctAnswer)")
    }
    
  

    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "toResultView") {
            
            var newVC = segue.destinationViewController as! SecondViewController
            newVC.correctAnswer = correctAnswer
        }else if (segue.identifier == "toFirstView") {
            
            var newVC = segue.destinationViewController as! FirstViewController
            
        }else{}
        
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}






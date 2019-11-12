//
//  StageOneGame2.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/28.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageOneGame2: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    @IBOutlet var button10: UIButton!
    
    @IBOutlet var infoTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet var shelfs: [UIButton]!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    var bookNumber = 0
    var bookColor = [UIColor(red: 232/255, green: 237/255, blue: 206/255, alpha: 1.0),UIColor(red: 239/255, green: 219/255, blue: 195/255, alpha: 1.0),UIColor(red: 180/255, green: 212/255, blue: 237/255, alpha: 1.0)] //[E8EDCE, EFDBC3,B4D4ED]
    var hintColor = [UIColor(red: 38/255, green: 166/255, blue: 142/255, alpha: 0.65),UIColor(red: 231/255, green: 144/255, blue: 135/255, alpha: 0.65),UIColor(red: 89/255, green: 149/255, blue: 229/255, alpha: 1.0)] //[26A68E,E79087,5995E5]
    var areaName = ["しちょうかくしりょう",
            "ぶんこしんしょ","コミュニケーション\nルーム","リフレッシュゾーン","セミナールーム", "しんちゃくとしょ","ほんがくかんけい\nしりょう","こくさいこうりゅう\nコーナー","レファレンス\nデスク","さんこうとしょ"]
    var areaExplain = ["DVD・CDなどがある。\nしりょうをそのばで\nみたりきいたり\nすることもできる。",
    "むかしからいまのじだいまで、たくさんのしゅるいの本がおいてある。",
    "はなしながら\nべんきょうができるへや。\nパソコンがある。",
        "たべたりのんだり\nおしゃべりをしながら\nやすむことができる。",
    "としょかんの本をつかって\nグループがくしゅうが\nできるへや。",
    "としょかんに\nあたらしくとどいた本が\nおいてある。",
    "つくばだいがくについての\nほんやしりょうが\nあつめられている。",
    "がいこくじんが\nにほんについて\nべんきょうするための\n本がおいてある。",
    "本のさがしかたや\nとしょかんについての\nそうだんができる。",
    "しらべものに\nつかう本が\nたくさんおいてある。\nじしょ・ひゃっかじてんなど。",
    ]
    var hintLists = ["手がかり\n1.DVDがおいてある\n2.「ぶんこしんしょ」エリアのとなり",
                     "手がかり\n1.あたらしくとしょかんに入った本がおいてある\n2.入り口にいちばんちかい",
                     "手がかり\n1.がいこくじんのための本がおいてある\n2.「だいがくの本があるエリアのとなり"]
    var hintLists2 = [
    "手がかり\n1.あたらしくとしょかんに入った本がおいてある\n2.入り口にいちばんちかい",
    
    "手がかり\n1.どのエリアともとなりあっていない\n2.しらべものにつかう本がおいてある",
    "手がかり\n1.パソコンがあるエリアのとなり\n2.たくさんのしゅるいの本がある"]
    var hintLists3 = ["手がかり\n1.がいこくじんのための本がおいてある\n2.だいがくの本があるエリアのとなり",
        "手がかり\n1.DVDがおいてある\n2.「ぶんこしんしょ」エリアのとなり",
        "手がかり\n1.あたらしくとしょかんに入った本がおいてある\n2.入り口にいちばんちかい"]
    var bookLists = ["ひみつのカギ①はどのエリアにあるかな？",
                     "ひみつのカギ②はどのエリアにあるかな？",
                     "ひみつのカギ③はどのエリアにあるかな？"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = ""
        bookLabel.text = bookLists[bookNumber]
        hintLabel.text = hintLists3[bookNumber]
        bookLabel.backgroundColor = bookColor[bookNumber]
        hintLabel.backgroundColor = hintColor[bookNumber]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func touchShelf(_ sender: UIButton) {
        
        if (sender.backgroundColor == UIColor.lightGray){
            sender.backgroundColor = UIColor(red:59/255,green:89/255,blue:152/255,alpha:0.7)
        }
        else{
            sender.backgroundColor = UIColor.lightGray
        }
        print(shelfs.firstIndex(of: sender) as Any)
    }
    
    func deleteStar(){
        button1.setTitle("", for: .normal)
        button2.setTitle("", for: .normal)
        button3.setTitle("", for: .normal)
        button4.setTitle("", for: .normal)
        button5.setTitle("", for: .normal)
        button6.setTitle("", for: .normal)
        button7.setTitle("", for: .normal)
        button8.setTitle("", for: .normal)
        button9.setTitle("", for: .normal)
        button10.setTitle("", for: .normal)
        
    }
    
    @IBAction func avButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[0]
        infoLabel.text = areaExplain[0]
        deleteStar()
        button1.setTitle("☆", for: .normal)
    }
    @IBAction func bunkoButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[1]
        infoLabel.text = areaExplain[1]
        deleteStar()
        button2.setTitle("☆", for: .normal)
    }
    @IBAction func comyuButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[2]
        infoLabel.text = areaExplain[2]
        deleteStar()
        button3.setTitle("☆", for: .normal)
    }
    @IBAction func refButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[3]
        infoLabel.text = areaExplain[3]
        deleteStar()
        button4.setTitle("☆", for: .normal)
    }
    @IBAction func semButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[4]
        infoLabel.text = areaExplain[4]
        deleteStar()
        button5.setTitle("☆", for: .normal)
    }
    @IBAction func newButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[5]
        infoLabel.text = areaExplain[5]
        deleteStar()
        button6.setTitle("☆", for: .normal)
    }
    @IBAction func tsukubaButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[6]
        infoLabel.text = areaExplain[6]
        deleteStar()
        button7.setTitle("☆", for: .normal)
    }
    @IBAction func intButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[7]
        infoLabel.text = areaExplain[7]
        deleteStar()
        button8.setTitle("☆", for: .normal)
    }
    @IBAction func deskButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[8]
        infoLabel.text = areaExplain[8]
        deleteStar()
        button9.setTitle("☆", for: .normal)
    }
    @IBAction func zisyoButton(sender: AnyObject) {
        infoTitleLabel.text = areaName[9]
        infoLabel.text = areaExplain[9]
        deleteStar()
        button10.setTitle("☆", for: .normal)
    }
    
    @IBAction func checkTheAnswer(_ sender: Any) {
        if (bookNumber == 0 && infoTitleLabel.text == areaName[7]){
            infoTitleLabel.text = ""
            infoLabel.text = ""
            deleteStar()
            print("せいかい")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: StageOnePopup = storyBoard.instantiateViewController(withIdentifier: "stage1Correct2") as! StageOnePopup
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
            bookNumber += 1
            bookLabel.text = bookLists[bookNumber]
            hintLabel.text = hintLists2[bookNumber]
            bookLabel.backgroundColor = bookColor[bookNumber]
            hintLabel.backgroundColor = hintColor[bookNumber]
            //shelfs[2].backgroundColor = UIColor.lightGray
        }
        else if (bookNumber == 1 && infoTitleLabel.text == areaName[0]){
            infoTitleLabel.text = ""
            infoLabel.text = ""
            deleteStar()
            print("せいかい")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: StageOnePopup = storyBoard.instantiateViewController(withIdentifier: "stage1Correct2") as! StageOnePopup
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
            bookNumber += 1
            bookLabel.text = bookLists[bookNumber]
            hintLabel.text = hintLists2[bookNumber]
            bookLabel.backgroundColor = bookColor[bookNumber]
            hintLabel.backgroundColor = hintColor[bookNumber]
            //shelfs[12].backgroundColor = UIColor.lightGray
        }
        else if (bookNumber == 2 && infoTitleLabel.text == areaName[3]){
            infoTitleLabel.text = ""
            infoLabel.text = ""
            deleteStar()
            print("せいかい")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: StageOnePopup = storyBoard.instantiateViewController(withIdentifier: "stage1Correct") as! StageOnePopup
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
            bookNumber += 1
        }
        else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: StageOnePopup = storyBoard.instantiateViewController(withIdentifier: "stage1Incorrect") as! StageOnePopup
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
           
        }
    }
}

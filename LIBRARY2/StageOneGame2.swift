//
//  StageOneGame2.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/28.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageOneGame2: UIViewController {


    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet var shelfs: [UIButton]!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    var bookNumber = 0
    var hintLists = ["手がかり\n①ぶんるいばんごうは「382」\n②としょきごうは「タ」",
                     "手がかり\n①ぶんるいばんごうは「596」\n②としょきごうは「ワ」",
                     "手がかり\n①ぶんるいばんごうは「291」\n②としょきごうは「ニ」"]
    var bookLists = ["「にっぽんの図鑑」はどこにあるかな？",
                     "「和食のすべてがわかる本」はどこにあるかな？",
                     "「日本の服装の歴史①」はどこにあるかな？"]
    
    var infoLists = ["このたなは、\nぶんるいばんごうが「300~330」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「331~360」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「361~399」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「400~420」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「421~430」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「431~440」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「441~460」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「461~480」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「481~490」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「491~510」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「511~530」の\n本がおいてあるよ",
                    "このたなは、\nぶんるいばんごうが「531~560」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「561~590」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「591~620」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「621~640」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「641~660」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「661~699」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「913」で\nとしょきごうが「ア〜カ」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「800~830」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「831~860」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「861~899」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「900~905」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「906~912」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「751~760」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「761~770」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「771~780」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「781~790」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「791~799」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「700~710」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「711~720」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「721~730」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「731~740」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「741~750」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「200~299」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「151~199」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「100~150」の\n本がおいてあるよ",
        "このたなは、\nぶんるいばんごうが「000~099」の\n本がおいてあるよ"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = ""
        bookLabel.text = bookLists[bookNumber]
        hintLabel.text = hintLists[bookNumber]
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
    
    @IBAction func checkTheAnswer(_ sender: Any) {
        if (bookNumber == 0 && shelfs[2].backgroundColor == UIColor(red:59/255,green:89/255,blue:152/255,alpha:0.7)){
            print("せいかい")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: StageOnePopup = storyBoard.instantiateViewController(withIdentifier: "stage1Correct2") as! StageOnePopup
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
            bookNumber += 1
            bookLabel.text = bookLists[bookNumber]
            hintLabel.text = hintLists[bookNumber]
            shelfs[2].backgroundColor = UIColor.lightGray
        }
        else if (bookNumber == 1 && shelfs[12].backgroundColor == UIColor(red:59/255,green:89/255,blue:152/255,alpha:0.7)){
            print("せいかい")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: StageOnePopup = storyBoard.instantiateViewController(withIdentifier: "stage1Correct2") as! StageOnePopup
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
            bookNumber += 1
            bookLabel.text = bookLists[bookNumber]
            hintLabel.text = hintLists[bookNumber]
            shelfs[12].backgroundColor = UIColor.lightGray
        }
        else if (bookNumber == 2 && shelfs[92].backgroundColor == UIColor(red:59/255,green:89/255,blue:152/255,alpha:0.7)){
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

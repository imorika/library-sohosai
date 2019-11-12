//
//  StageOne.swift
//  LIBRARY2
//
//  Created by moffy on 2019/09/26.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageOne: UIViewController {

    var imageLists = ["Stage1-2-1", "Stage1-2-2", "Stage1-2-3"]
    var stageOneTexts = [
        "きょうぼくは\n「むかしのくらし」について\nしらべたいんだ。",
        "そのためには3さつの本を\nいっしょにさがして欲しい。",
        "これが\nさがしたい本のリストだ。",
        "じょうけんから\n本がおいてあるたなを\n見つけていこう。"]
    var textNumber = 0
    @IBOutlet weak var stageOneView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var bookListText: UILabel!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isHidden = true
        stageOneView.image = UIImage(named: "Stage1-2-1")
        nextButton.imageView?.image = UIImage(named: "nextButton")
        nextButton.isHidden = false
        bookListText.isHidden = true
        //themeLabel.text = stageOneTexts[textNumber]
        xButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    func changeText(){
        textNumber += 1
        themeLabel.text = stageOneTexts[textNumber]
    }

    @IBAction func clickNextButton(_ sender: Any) {
        if (stageOneView.image == UIImage(named: "Stage1-2-1")){
            stageOneView.image = UIImage(named: "Stage1-2-2")
            backButton.isHidden = false
        }
        else if (stageOneView.image == UIImage(named: "Stage1-2-2")){
            stageOneView.image = UIImage(named: "Stage1-2-3")
        }
        else if (stageOneView.image == UIImage(named: "Stage1-2-3")){
             self.performSegue(withIdentifier: "toStageOneGame", sender: nil)
        }
        else{
            textNumber += 1
        }
        
        
        /*if (textNumber == 2){
            themeLabel.isHidden = true
            nextButton.isHidden = true
            bookListText.isHidden = false
            xButton.isHidden = false
            stageOneView.image = UIImage(named: "ブックリスト")
        }
        else if (textNumber == 1){
            stageOneView.image = UIImage(named: "Stage1_back2")
            changeText()
        }
        else if (textNumber == 3){
             self.performSegue(withIdentifier: "toStageOneGame", sender: nil)
        }
        else {
            changeText()
        }*/
    }
    
    @IBAction func clickBackButton(_ sender: Any) {
        if (stageOneView.image == UIImage(named: "Stage1-2-2")){
            stageOneView.image = UIImage(named: "Stage1-2-1")
            backButton.isHidden = true
        }
        else if (stageOneView.image == UIImage(named: "Stage1-2-3")){
            stageOneView.image = UIImage(named: "Stage1-2-2")
        }
        else{
            textNumber -= 1
        }
    }
        
        func clickXButton(_ sender: Any) {
        themeLabel.isHidden = false
        nextButton.isHidden = false
        bookListText.isHidden = true
        xButton.isHidden = true
        stageOneView.image = UIImage(named: "Stage1_back")
        changeText()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

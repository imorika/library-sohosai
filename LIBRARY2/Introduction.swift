//
//  Introduction.swift
//  LIBRARY2
//
//  Created by moffy on 2019/09/03.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class Introduction: UIViewController {

    var IntroImages = ["イントロ1", "イントロ2", "イントロ3", "イントロ4", "イントロ5", "イントロ6", "イントロ7", "イントロ8", "イントロ9", "イントロ10", "質問1","助けない","助ける","そろそろ助けよう"]
    var IntroNumber = 0
    var NoButtonTimes = 0
    @IBOutlet weak var introNextButton: UIButton!
    @IBOutlet weak var introView: UIImageView!
    @IBOutlet weak var charactorButton: UIButton!
    @IBOutlet weak var helpQuestion: UIView!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introNextButton.imageView?.image = UIImage(named: "nextButton")
        introNextButton.isHidden = false
        introView.image = UIImage(named: IntroImages[IntroNumber])
        charactorButton.isHidden = true
        helpQuestion.isHidden = true
        IntroNumber = 0
        NoButtonTimes = 0
        // Do any additional setup after loading the view.
    }
    
    func ChangeImage(){
        IntroNumber += 1
        introView.image = UIImage(named: IntroImages[IntroNumber])
    }
    
    @IBAction func ClickNextButton(_ sender: Any) {
        if (IntroNumber == 10){
            introNextButton.isHidden = true
            helpQuestion.isHidden = false
        }
        else if (IntroNumber == 2){
            charactorButton.isHidden = false
            ChangeImage()
        }
        else if (IntroNumber == 12){
            self.performSegue(withIdentifier: "toStage1", sender: nil)
        }
        else if (IntroNumber == 13){
            introNextButton.isHidden = true
            NoButtonTimes = 0
            helpQuestion.isHidden = false
            IntroNumber = 10
        }
        else{
            ChangeImage()
        }
    }
    
    @IBAction func answerYes(_ sender: Any) {
        helpQuestion.isHidden = true
        introView.image = UIImage(named: IntroImages[12])
        IntroNumber = 12
        introNextButton.isHidden = false
    }
    @IBAction func answerNo(_ sender: Any) {
        helpQuestion.isHidden = true
        introView.image = UIImage(named: IntroImages[11])
        introNextButton.isHidden = false
        NoButtonTimes += 1
        if (NoButtonTimes == 10){
            introView.image = UIImage(named: IntroImages[13])
            IntroNumber = 13
            introNextButton.isHidden = false
            
        }
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

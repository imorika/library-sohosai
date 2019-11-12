//
//  Introduction.swift
//  LIBRARY2
//
//  Created by moffy on 2019/09/03.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class Introduction: UIViewController {
    
    var IntroImages = ["イントロ0","イントロ1", "イントロ2", "イントロ3", "イントロ4",  "イントロ5", "イントロ6", "イントロ7","イントロ8質問1", "イントロ9助けない", "イントロ10助けてあげる","イントロ11そろそろ助けよう"]
    var IntroNumber = 0
    var NoButtonTimes = 0
    @IBOutlet weak var introNextButton: UIButton!
    @IBOutlet var introBackButton: UIButton!
    @IBOutlet weak var introView: UIImageView!
    //@IBOutlet weak var charactorButton: UIButton!
    @IBOutlet weak var helpQuestion: UIView!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introNextButton.imageView?.image = UIImage(named: "nextButton")
        introNextButton.isHidden = false
        introBackButton.isHidden = true
        introView.image = UIImage(named: IntroImages[IntroNumber])
        //charactorButton.isHidden = true
        helpQuestion.isHidden = true
        IntroNumber = 0
        NoButtonTimes = 0
        // Do any additional setup after loading the view.
    }
    
    func ChangeImage(){
        IntroNumber += 1
        introView.image = UIImage(named: IntroImages[IntroNumber])
    }
    func BackImage(){
        IntroNumber -= 1
        introView.image = UIImage(named: IntroImages[IntroNumber])
    }
    
    @IBAction func ClickNextButton(_ sender: Any) {
        if (IntroNumber == 8){
            introNextButton.isHidden = true
            helpQuestion.isHidden = false
        }
        else if (IntroNumber == 10){
            self.performSegue(withIdentifier: "toStage1", sender: nil)
        }
        else if (IntroNumber == 9){
            introNextButton.isHidden = true
            NoButtonTimes = 0
            helpQuestion.isHidden = false
            IntroNumber = 9
        }
        else if (IntroNumber == 11){
            introNextButton.isHidden = true
            helpQuestion.isHidden = false
            IntroNumber = 8
            introView.image = UIImage(named: IntroImages[IntroNumber])
        }
        else{
            ChangeImage()
            if (IntroNumber == 1){
                introBackButton.isHidden = false
            }
        }
    }
    
    @IBAction func clickBackButton(_ sender: Any) {
        if (IntroNumber == 1){
            introBackButton.isHidden = true
            BackImage()
        }
        else if (IntroNumber == 8){
            introNextButton.isHidden = false
            helpQuestion.isHidden = true
            BackImage()
        }
        else if (IntroNumber == 9){
            introNextButton.isHidden = true
            NoButtonTimes = 0
            helpQuestion.isHidden = false
            IntroNumber = 9
        }
        else if(IntroNumber == 10){
            IntroNumber = 8
            introView.image = UIImage(named: IntroImages[IntroNumber])
        }
        else if(IntroNumber == 11){
            helpQuestion.isHidden = true
            introView.image = UIImage(named: IntroImages[IntroNumber])
        }
        else{
            BackImage()
        }
    }
    @IBAction func answerYes(_ sender: Any) {
        helpQuestion.isHidden = true
        introView.image = UIImage(named: IntroImages[10])
        IntroNumber = 10
        introNextButton.isHidden = false
    }
    @IBAction func answerNo(_ sender: Any) {
        helpQuestion.isHidden = true
        introView.image = UIImage(named: IntroImages[9])
        introNextButton.isHidden = false
        NoButtonTimes += 1
        if (NoButtonTimes == 3){
            introView.image = UIImage(named: IntroImages[11])
            IntroNumber = 11
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


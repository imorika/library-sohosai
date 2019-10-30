//
//  PreQuiz.swift
//  LIBRARY2
//
//  Created by moffy on 2019/08/22.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class PreQuiz: UIViewController {
    
    @IBOutlet weak var PreButton11: UIButton!
    @IBOutlet weak var preButton12: UIButton!
    @IBOutlet weak var PreButton13: UIButton!
    @IBOutlet weak var PreButton14: UIButton!
    @IBOutlet weak var LabelEnd: UILabel!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var EndView: UIView!
    @IBOutlet weak var EndQuestion: UIButton!
    @IBOutlet weak var FirstPreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var QuestionNunber:Int = 1
    var CorrectAnswer = String()
    var UserAnswer = Array<Any>()
    var timer = Timer()
    var count = 0.00
    var PreTimes = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Hide()
        Questions()
        EndView.isHidden = true
        // Do any additional setup after loading the view.
        
        //timer開始処理
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(PreQuiz.updateTimer), userInfo: nil, repeats: true)
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
    
    @objc private func updateTimer() {
        count += 0.01
        timerLabel.text = String(format: "%.2f", count)
    }
    
    func Hide(){
        LabelEnd.isHidden = true
        Next.isHidden = true
    }
    func UnHide(){
        LabelEnd.isHidden = false
        Next.isHidden = false
    }
    func StopTimer(){
        if timer.isValid {
            timer.invalidate()
        }
        PreTimes.append(timerLabel.text!)
        count = 0.00
        timerLabel.text = String(format: "%.2f", count)
    }

    func Questions(){
        
        
        switch(QuestionNunber){
        case 1:
            
            FirstPreLabel.text = "だい1もん"
            PreButton11.setTitle("1", for: UIControl.State.normal)
            preButton12.setTitle("2", for: UIControl.State.normal)
            PreButton13.setTitle("3", for: UIControl.State.normal)
            PreButton14.setTitle("4", for: UIControl.State.normal)
            CorrectAnswer = "1"
            break
        case 2:
            
            FirstPreLabel.text = "だい2もん"
            PreButton11.setTitle("1", for: UIControl.State.normal)
            preButton12.setTitle("2", for: UIControl.State.normal)
            PreButton13.setTitle("3", for: UIControl.State.normal)
            PreButton14.setTitle("4", for: UIControl.State.normal)
            CorrectAnswer = "2"
            break
        case 3:
            
            FirstPreLabel.text = "だい3もん"
            PreButton11.setTitle("1", for: UIControl.State.normal)
            preButton12.setTitle("2", for: UIControl.State.normal)
            PreButton13.setTitle("3", for: UIControl.State.normal)
            PreButton14.setTitle("4", for: UIControl.State.normal)
            CorrectAnswer = "3"
            break
            
        case 4:
            
            FirstPreLabel.text = "だい4もん"
            PreButton11.setTitle("1", for: UIControl.State.normal)
            preButton12.setTitle("2", for: UIControl.State.normal)
            PreButton13.setTitle("3", for: UIControl.State.normal)
            PreButton14.setTitle("4", for: UIControl.State.normal)
            CorrectAnswer = "4"
            break
            
        default:
            break
        }
    }
    
    
    
    
    @IBAction func FirstPreButton1(_ sender: Any) {
        UnHide()
        StopTimer()
        if (CorrectAnswer == "1"){
            LabelEnd.text = "せいかい!"
        }
        else{
            LabelEnd.text = "はずれ…"
        }
        UserAnswer.append("1")
    }
    
    @IBAction func FirstPreButton2(_ sender: Any) {
        UnHide()
        StopTimer()
        if (CorrectAnswer == "2"){
            LabelEnd.text = "せいかい!"
        }
        else{
            LabelEnd.text = "はずれ…"
        }
        UserAnswer.append("2")
    }
    
    @IBAction func FirstPreButton3(_ sender: Any) {
        UnHide()
        StopTimer()
        if (CorrectAnswer == "3"){
            LabelEnd.text = "せいかい!"
        }
        else{
            LabelEnd.text = "はずれ…"
        }
        UserAnswer.append("3")
    }
    
    @IBAction func FirstPreButton4(_ sender: Any) {
        UnHide()
        StopTimer()
        if (CorrectAnswer == "4"){
            LabelEnd.text = "せいかい!"
        }
        else{
            LabelEnd.text = "はずれ…"
        }
        UserAnswer.append("4")
    }
    @IBAction func Next(_ sender: Any) {
        Hide()
        if (QuestionNunber == 4){
            EndView.isHidden = false
            print(PreTimes)
            print(UserAnswer)
        }
        else{
            QuestionNunber += 1
            Questions()
            //timer開始処理
            if !timer.isValid {
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(PreQuiz.updateTimer), userInfo: nil, repeats: true)
            }
        }
        
    }
}

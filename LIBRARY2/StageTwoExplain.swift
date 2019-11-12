//
//  StageTwoExplain.swift
//  LIBRARY2
//
//  Created by moffy on 2019/11/01.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageTwoExplain: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var stageTwoView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_  sender: Any) {
        if (stageTwoView.image == UIImage(named: "Stage2-2-1")){
            stageTwoView.image = UIImage(named: "Stage2-2-2")
            backButton.isHidden = false
        }
        else if (stageTwoView.image == UIImage(named: "Stage2-2-2")){
            self.performSegue(withIdentifier: "toStage2Game", sender: nil)
        }
    }
    
    @IBAction func touchBackButton(_  sender: Any) {
        stageTwoView.image = UIImage(named: "Stage2-2-1")
        backButton.isHidden = true
    }
    
    
    /*@IBAction func nextButton(sender: AnyObject) {
        if (stageTwoView.image == UIImage(named: "Stage2-2-1")){
            stageTwoView.image = UIImage(named: "Stage2-2-2")
        }
        else if (stageTwoView.image == UIImage(named: "Stage2-2-2")){
            self.performSegue(withIdentifier: "toStage2Game", sender: nil)
        }
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

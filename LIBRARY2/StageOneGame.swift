//
//  StageOneGame.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/22.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageOneGame: UIViewController {

    
    @IBOutlet weak var bookLabel: UILabel!
    
    
    var bookNumber = 0
    var hintLists = ["手がかり\n①ぶんるいばんごうは「382」\n②としょきごうは「タ」",
                     "手がかり\n①ぶんるいばんごうは「596」\n②としょきごうは「ワ」",
                     "手がかり\n①ぶんるいばんごうは「291」\n②としょきごうは「ニ」"]
    var bookLists = ["「にっぽんの図鑑」はどこにあるかな？",
                     "「和食のすべてがわかる本」はどこにあるかな？",
                     "「日本の服装の歴史①」はどこにあるかな？"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //bookLabel.text = bookLists[bookNumber]
        //hintLabel.text = hintLists[bookNumber]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkTheAnswer(_ sender: Any) {
        if (bookNumber != 2){
            bookNumber += 1
        }
        else{
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let second = storyboard.instantiateViewController(withIdentifier: "stage2top")
            //ここが実際に移動するコードとなります
            self.present(second, animated: true, completion: nil)
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

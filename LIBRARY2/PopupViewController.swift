//
//  PopupViewController.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/27.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 閉じるボタンがタップされた時
    @IBAction func onTapCancel(_ sender: UIButton) {
        if (self.restorationIdentifier == "popupViewIncorrect" || self.restorationIdentifier == "popupViewCorrect2" ){
            self.dismiss(animated: false, completion: nil)
        }
        if (self.restorationIdentifier == "popupViewCorrect"){
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let second = storyboard.instantiateViewController(withIdentifier: "clear")
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

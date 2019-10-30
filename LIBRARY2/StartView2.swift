//
//  StartView2.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/01.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StartView2: UIViewController {
    var charactorimage = ""
    @IBOutlet weak var charactorImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(charactorimage)
        charactorImage.image = UIImage(named: charactorimage)
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

}

//
//  StageTwoGame.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/23.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageTwoGame: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    private let photos = ["まえ", "まえ", "みぎをむく"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" の部分は　Storyboard でつけた cell の identifier。
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Tag番号を使ってインスタンスをつくる
        let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        
        
        
        return cell
        
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



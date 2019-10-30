//
//  StageTwoGame.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/24.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageTwoGame: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerMiniLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var masuCollectionView: UICollectionView!
    private let masume = ["マス目","にさつめ","マス目","マス目","マス目","マス目","マス目","さんさつめ","マス目",
                          "マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目",
                          "マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目",
                          "いっさつめ","マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目",
                          "マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目","はじめのます"]
    private var photos = ["はじめのます"]
    private let answerphotos = ["はじめのます", "まえ", "まえ", "まえ", "まえ","まえ", "まえ","まえ", "まえ", "みぎをむく", "まえ", "まえ", "まえ", "まえ", "みぎをむく","まえ", "まえ", "まえ", "まえ","まえ", "まえ","まえ",]
    var i = 0
  
    let collectionViewAIdentifier = "CollectionViewA"
    let collectionViewBIdentifier = "CollectionViewB"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerView.isHidden = true
        answerLabel.isHidden = true
        answerMiniLabel.isHidden = true
        changeButton.isHidden = true
        
        if ((collectionView.viewWithTag(200)) != nil){
            // レイアウト設定
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 24, bottom: 15, right: 24)
            layout.minimumLineSpacing = 5
            collectionView.collectionViewLayout = layout
            // Do any additional setup after loading the view.
        }
        //if ((collectionView.viewWithTag(100)) != nil){
            // レイアウト設定
            let layout2 = UICollectionViewFlowLayout()
            layout2.sectionInset = UIEdgeInsets(top: 20, left: 12, bottom: 15, right: 15)
            //let cellWidth = floor(collectionView.bounds.width / 12)
            layout2.itemSize = CGSize(width: 70, height: 70)
            layout2.minimumLineSpacing = 7
            layout2.minimumInteritemSpacing = 9
            masuCollectionView.collectionViewLayout = layout2
            // Do any additional setup after loading the view.
        //}
        
    }
    

    // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ((collectionView.viewWithTag(200)) != nil){
            return photos.count
        }
        else if((collectionView.viewWithTag(100)) != nil){
            return 45
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" の部分は　Storyboard でつけた cell の identifier。
        if ((collectionView.viewWithTag(200)) != nil){
            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            
            // Tag番号を使ってインスタンスをつくる
            let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
            let photoImage = UIImage(named: photos[indexPath.row])
            photoImageView.image = photoImage
            
            return cell
        }
        else if ((collectionView.viewWithTag(100)) != nil){
            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
            
            // Tag番号を使ってインスタンスをつくる
            let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
            let photoImage = UIImage(named: masume[indexPath.row])
            photoImageView.image = photoImage
            
            return cell
        }
        else{
            return UICollectionViewCell()
        }
        
        
    }
    
    
    
    @IBAction func deleteAction(_ sender: Any) {
        photos.removeLast()
        collectionView.reloadData()
        print(photos)
    }
    @IBAction func addMoveforward(_ sender: Any) {
        photos += ["まえ"]
        collectionView.reloadData()
        print(photos)
    }
    @IBAction func addTurnRight(_ sender: Any) {
        photos += ["みぎをむく"]
        collectionView.reloadData()
        print(photos)
    }
    
    @IBAction func addTurnLeft(_ sender: Any) {
        photos += ["ひだりをむく"]
        collectionView.reloadData()
        print(photos)
    }
    
    @IBAction func checkTheAnswer(_ sender: Any) {
        if (photos == answerphotos){
            answerLabel.text = "せいかい！"
            answerMiniLabel.text = "Stage3へすすもう"
            changeButton.setImage(UIImage(named: "nextButton"), for: .normal)
            changeButton.setTitle("", for: .normal)
            i = 1
        }
        else {
            answerLabel.text = "ざんねん…"
            answerMiniLabel.text = "もういちどやりなおしてみよう"
            changeButton.setTitle("もどる", for: .normal)
        }
        answerView.isHidden = false
        answerLabel.isHidden = false
        answerMiniLabel.isHidden = false
        changeButton.isHidden = false
    }
    
    @IBAction func touchChangeButton(_ sender: Any) {
        if (i == 0){
            answerView.isHidden = true
            answerLabel.isHidden = true
            answerMiniLabel.isHidden = true
            changeButton.isHidden = true
        }
        else {
            self.performSegue(withIdentifier: "toStage3", sender: nil)
        }
    }
}

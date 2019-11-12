//
//  StageTwoGame.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/24.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageTwoGame: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var mapImage: UIImageView!
    var quizNumber = 1
    @IBOutlet var quizLabel: UILabel!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerMiniLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var masuCollectionView: UICollectionView!
    var quiz = ["スタートからあるいて、1にある本をとるまでをプログラミングしよう","1からあるいて、2にある本をとるまでをプログラミングしよう","2からあるいて、3にある本をとるまでをプログラミングしよう"]
    var quizColor = [UIColor(red: 231/255, green: 126/255, blue: 127/255, alpha: 1.0),UIColor(red: 235/255, green: 214/255, blue: 242/255, alpha: 1.0),UIColor(red: 236/255, green: 224/255, blue: 170/255, alpha: 1.0)]
    private let masume = ["マス目","にさつめ","マス目","マス目","マス目","マス目","マス目","さんさつめ","マス目",
                          "マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目",
                          "マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目",
                          "いっさつめ","マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目",
                          "マス目","マス目","マス目","マス目","マス目","マス目","マス目","マス目","はじめのます"]
    var photos = [String]()
    private let answerphotos = [["前進", "前進", "前進", "前進", "ほんをとる"],["前進", "前進", "前進", "前進", "前進", "前進", "前進","ひだり", "前進", "前進", "前進", "前進", "前進", "ひだり", "ほんをとる"], ["前進", "前進", "前進", "前進", "前進", "前進", "前進",  "みぎ", "前進", "ほんをとる"]]
    private let answerphotos2 = [["前進", "前進", "前進", "ひだり","前進", "前進", "前進", "前進",  "前進", "ひだり","ほんをとる"],["前進", "前進", "前進", "前進", "前進", "前進", "前進","みぎ", "前進", "ひだり","前進", "前進", "前進", "前進", "ひだり", "ほんをとる"], ["前進", "前進", "前進", "前進", "みぎ","前進","ひだり", "前進", "前進",  "ひだり", "前進","前進", "前進", "前進", "前進",  "前進", "前進","みぎ","前進", "前進", "ひだり","ほんをとる"]]
    private let answerphotos3 = [["前進", "前進", "前進", "ひだり", "前進", "前進", "前進", "前進", "前進", "ひだり", "ほんをとる"],["前進", "前進", "前進", "前進", "前進", "前進", "前進","ひだり", "前進", "ほんをとる"], ["前進", "ひだり", "前進", "前進", "ひだり","前進", "前進", "前進",  "前進", "前進", "前進","前進", "ほんをとる"]]
    
    let maps = ["グループ1-1地図","グループ1-2地図","グループ1-3地図"]
    let maps2 = ["グループ2-1地図","グループ2-2地図","グループ2-3地図"]
    let maps3 = ["グループ3-1地図","グループ3-2地図","グループ3-3地図"]
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteButton.isHidden = true
        answerView.isHidden = true
        answerLabel.isHidden = true
        answerMiniLabel.isHidden = true
        changeButton.isHidden = true
        quizLabel.text = quiz[quizNumber-1]
        quizLabel.backgroundColor = quizColor[quizNumber-1]
        mapImage.image = UIImage(named: maps2[quizNumber - 1])
        
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
            //masuCollectionView.collectionViewLayout = layout2
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
        if (photos.count == 0){
            deleteButton.isHidden = true
        }
        print(photos)
    }
    @IBAction func addMoveforward(_ sender: Any) {
        photos += ["前進"]
        collectionView.reloadData()
        if (photos.count != 0){
            deleteButton.isHidden = false
        }
        print(photos)
    }
    @IBAction func addTurnRight(_ sender: Any) {
        photos += ["みぎ"]
        collectionView.reloadData()
        if (photos.count != 0){
            deleteButton.isHidden = false
        }
        print(photos)
    }
    
    @IBAction func addTurnLeft(_ sender: Any) {
        photos += ["ひだり"]
        collectionView.reloadData()
        if (photos.count != 0){
            deleteButton.isHidden = false
        }
        print(photos)
    }
    
    @IBAction func addpickbook(sender: AnyObject) {
        photos += ["ほんをとる"]
        collectionView.reloadData()
        if (photos.count != 0){
            deleteButton.isHidden = false
        }
        print(photos)
    }
    @IBAction func checkTheAnswer(_ sender: Any) {
            if (photos == answerphotos2[quizNumber-1]){
                answerLabel.text = "せいかい！"
                if (quizNumber != 3){
                    answerMiniLabel.text = "つぎのもんだいへすすもう"
                    i = 0
                }
                else if (quizNumber == 3){
                    answerMiniLabel.text = "ステージ3へすすもう"
                    i = 1
                }
                changeButton.setImage(UIImage(named: "nextButton"), for: .normal)
                changeButton.setTitle("", for: .normal)
                
            }
            else {
                answerLabel.text = "ざんねん…"
                answerMiniLabel.text = "もういちどやりなおそう"
                changeButton.setImage(UIImage(named:"もどる"), for: .normal)
                i = 2
            }
            answerView.isHidden = false
            answerLabel.isHidden = false
            answerMiniLabel.isHidden = false
            changeButton.isHidden = false
        }
    
    
    @IBAction func touchChangeButton(_ sender: Any) {
        if (i == 0){
            changeButton.setTitle("", for: .normal)
            answerView.isHidden = true
            answerLabel.isHidden = true
            answerMiniLabel.isHidden = true
            changeButton.isHidden = true
            quizNumber += 1
            quizLabel.text = quiz[quizNumber-1]
            quizLabel.backgroundColor = quizColor[quizNumber-1]
            photos.removeAll()
            collectionView.reloadData()
            mapImage.image = UIImage(named: maps2[quizNumber - 1])
            //mapimage.image = UIImage(named: "", for: .normal)
        }
        else if(i == 1){
            self.performSegue(withIdentifier: "toStage3", sender: nil)
        }
        else if(i == 2){
            changeButton.setImage(UIImage(named: ""), for: .normal)
            answerView.isHidden = true
            answerLabel.isHidden = true
            answerMiniLabel.isHidden = true
            changeButton.isHidden = true
        }
    }
}

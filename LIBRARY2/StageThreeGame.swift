//
//  StageThreeGame.swift
//  LIBRARY2
//
//  Created by moffy on 2019/10/27.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class StageThreeGame: UIViewController {


    @IBOutlet weak var quizNumLabel: UILabel!
    @IBOutlet weak var quizTextLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var questionNumber = 0
    var quizNumLists = ["いちもんめ", "にもんめ", "さんもんめ"]
    var questionLists = ["「にっぽんの図鑑」の52~53ページをみて、\nおまいりのしかたの正しいじゅんばんを\nこたえよう。", "「和食のすべてがわかる本」の4ページをみて、\n節句と食べ物の正しいじゅんばんをこたえよう", "「日本の服装の歴史①」の55ページをみて、\n5枚重ねの一例の「菖蒲」の\n正しいじゅんばんをこたえよう"]
    private var cellItemLists = [["2回おじぎする", "手を2回たたく", "いのる", "一回おじぎする"],["七夕の節句","七草の節句", "重陽の節句","桃の節句", "端午の節句"],["あお","うすきあお","うすきこうばい","こきあお","こきこうばい"]]
    let answerLists = [["2回おじぎする", "手を2回たたく", "いのる", "一回おじぎする"],["七草の節句", "桃の節句", "端午の節句", "七夕の節句", "重陽の節句"],["あお","こきあお","うすきあお","こきこうばい","うすきこうばい"]]
    //["手を2回たたく", "いのる", "2回おじぎする", "1回おじぎする"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem!.title = "ならびかえる"
        quizNumLabel.text = quizNumLists[questionNumber]
        quizTextLabel.text = questionLists[questionNumber]
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as? UITableViewDataSource
        // Do any additional setup after loading the view.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
        if(self.isEditing)
        {
            self.editButtonItem.title = "できた！"
        }else
        {
            self.editButtonItem.title = "やりなおす"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Cellの高さを決める
        return 100
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func answerCheck(_ sender: Any) {
        if ([cellItemLists[questionNumber]] == [answerLists[questionNumber]]){
            print("せいかい！")
            questionNumber += 1
            if (questionNumber == 3){
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let popupView: PopupViewController = storyBoard.instantiateViewController(withIdentifier: "popupViewCorrect") as! PopupViewController
                popupView.modalPresentationStyle = .overFullScreen
                popupView.modalTransitionStyle = .crossDissolve
                
                self.present(popupView, animated: false, completion: nil)
            }
            else{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let popupView: PopupViewController = storyBoard.instantiateViewController(withIdentifier: "popupViewCorrect2") as! PopupViewController
                popupView.modalPresentationStyle = .overFullScreen
                popupView.modalTransitionStyle = .crossDissolve
                
                self.present(popupView, animated: false, completion: nil)
                quizNumLabel.text = quizNumLists[questionNumber]
                quizTextLabel.text = questionLists[questionNumber]
                tableView.reloadData()
                navigationItem.rightBarButtonItem!.title = "ならびかえる"
            }
            
            
        }
        else{
            print("ざんねん…")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let popupView: PopupViewController = storyBoard.instantiateViewController(withIdentifier: "popupViewIncorrect") as! PopupViewController
            popupView.modalPresentationStyle = .overFullScreen
            popupView.modalTransitionStyle = .crossDissolve
            
            self.present(popupView, animated: false, completion: nil)
        }
    }
    
    @IBAction func onTapShowPopup(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let popupView: PopupViewController = storyBoard.instantiateViewController(withIdentifier: "popupView") as! PopupViewController
        popupView.modalPresentationStyle = .overFullScreen
        popupView.modalTransitionStyle = .crossDissolve
        
        self.present(popupView, animated: false, completion: nil)
    }
    
    
}

extension StageThreeGame: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceCellItem = cellItemLists[questionNumber][sourceIndexPath.row]
        guard let indexPath = cellItemLists[questionNumber].firstIndex(of: sourceCellItem) else { return }
        cellItemLists[questionNumber].remove(at: indexPath)
        cellItemLists[questionNumber].insert(sourceCellItem, at: destinationIndexPath.row)
    }
}

//DataSource
extension StageThreeGame: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItemLists[questionNumber].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        cell.textLabel?.text = cellItemLists[questionNumber][indexPath.row]
        cell.textLabel!.font = UIFont(name: "TsukuBRdGothic-Bold", size: 30)
        return cell
    }
}



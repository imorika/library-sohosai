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
    var questionLists = ["ひみつのカギ①をみて、\nおまいりのしかたのただしい\nじゅんばんをこたえよう。",  "ひみつのカギ②をみて、\nジャイアントインパクト説(せつ)の\nただしいじゅんばんをこたえよう","ひみつのカギ③をみて、\nひこうきのライン整備(せいび)の\nひこうきへいどうしたあとから\n離陸(りりく)するまえまでのながれの\nただしいじゅんばんをこたえよう"]
    //var questionLists = ["「にっぽんの図鑑」の52~53ページをみて、\nおまいりのしかたの正しいじゅんばんを\nこたえよう。", "「和食のすべてがわかる本」の4ページをみて、\n節句と食べ物の正しいじゅんばんをこたえよう", "「日本の服装の歴史①」の55ページをみて、\n5枚重ねの一例の「菖蒲」の\n正しいじゅんばんをこたえよう"]
    private var cellItemLists = [["手を2回たたく","いのる", "1回おじぎする", "2回おじぎする"],["岩石(がんせき)のかたまりが大きくなっていく","岩石(がんせき)が、円盤状(えんばんじょう)になる","かたまりが月になる","天体(てんたい)が地球(ちきゅう)にしょうとつ",],
["最終確認(さいしゅうかくにん)","機内確認(きないかくにん)","燃料給油(ねんりょうきゅうゆ)", "コックピット点検(てんけん)","外部点検(がいぶてんけん)"]]
    let answerLists = [["2回おじぎする", "手を2回たたく", "いのる", "1回おじぎする"],["天体(てんたい)が地球(ちきゅう)にしょうとつ","岩石(がんせき)が、円盤状(えんばんじょう)になる","岩石(がんせき)のかたまりが大きくなっていく","かたまりが月になる"],["外部点検(がいぶてんけん)", "機内確認(きないかくにん)", "コックピット点検(てんけん)", "燃料給油(ねんりょうきゅうゆ)", "最終確認(さいしゅうかくにん)"]]
    //["手を2回たたく", "いのる", "2回おじぎする", "1回おじぎする"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.setEditing(true, animated:true)
        //navigationItem.rightBarButtonItem = editButtonItem
        //navigationItem.rightBarButtonItem!.title = "ならびかえる"
        quizNumLabel.text = quizNumLists[questionNumber]
        quizTextLabel.text = questionLists[questionNumber]
        //tableView.delegate = self as? UITableViewDelegate
        //tableView.dataSource = self as? UITableViewDataSource
        // Do any additional setup after loading the view.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
        if(self.isEditing)
        {
          navigationItem.rightBarButtonItem = nil
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
                //navigationItem.rightBarButtonItem = editButtonItem
                //navigationItem.rightBarButtonItem!.title = "ならびかえる"
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
        if (questionNumber == 1){
           cell.textLabel!.font = UIFont(name: "TsukuBRdGothic-Bold", size: 20)
        }
        else{
        cell.textLabel!.font = UIFont(name: "TsukuBRdGothic-Bold", size: 30)
        }
        return cell
    }
}



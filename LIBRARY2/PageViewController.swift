//
//  PageViewController.swift
//  LIBRARY2
//
//  Created by moffy on 2019/08/29.
//  Copyright © 2019 Moffy. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewControllers([getFirst()], direction: .reverse, animated: true, completion: nil)
        //　最初のviewControllerを設定している
        
        self.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        //StoryBoard上のFirstViewControllerをインスタンス化している
        //withIdentifierはStoryBoard上で設定したStoryBoard Id
    }
    
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    
    func getThird() -> ThirdViewController {
        return storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 左に進む動き（前に戻る）
        
        if viewController.isKind(of: ThirdViewController.self)// 現在のviewControllerがThirdViewControllerかどうか調べる
        {
            // 3 -> 2
            return getSecond()
            
        } else if viewController.isKind(of: SecondViewController.self) {// 現在のviewControllerがSecondViewControllerかどうか調べる
            // 2 -> 1
            return getFirst()
            
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        // 右に進む（先に進む）
        
        if viewController.isKind(of: FirstViewController.self)//　現在のviewControllerがFirstViewControllerかどうか調べる
        {
            // 1 -> 2
            return getSecond()
            
        } else if viewController.isKind(of: SecondViewController.self) {//　現在のviewControllerがSecondViewCotrollerかどうか調べる
            // 2 -> 3
            return getThird()
            
        } else {
            // 3 -> end of the road
            return nil
        }
    }
    
}

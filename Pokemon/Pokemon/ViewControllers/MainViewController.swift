//
//  ViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    
    var score = DataManager.init().getHightScore().last!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scoreTextLabel.text = "HIGHSCORE: \(score)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MAKR: MOVE TO GAME VIEW
    @IBAction func invokeToPlayView(_ sender: Any) {
        let playView = self.storyboard?.instantiateViewController(withIdentifier: "PlayView") as! GamePlayViewController
        self.navigationController?.pushViewController(playView, animated: true)
    }
    
    @IBAction func invokeToSetting(_ sender: Any) {
        let settingView = self.storyboard?.instantiateViewController(withIdentifier: "Setting View")
        self.navigationController?.pushViewController(settingView!, animated: true)
    }

}


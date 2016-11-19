//
//  GamePlayViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var answer : String = "Pikachu"
    var score : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnA.layer.cornerRadius = 20
        btnB.layer.cornerRadius = 20
        btnC.layer.cornerRadius = 20
        btnD.layer.cornerRadius = 20
        
        self.nameLabel.isHidden = true
        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func touchedBtnA(_ sender: Any) {
        answer = (btnA.titleLabel?.text)!
        check()
    }
    @IBAction func touchedBtnB(_ sender: Any) {
        answer = (btnB.titleLabel?.text)!
        check()
    }
    @IBAction func touchedBtnC(_ sender: Any) {
        answer = (btnC.titleLabel?.text)!
        check()
    }
    @IBAction func touchedBtnD(_ sender: Any) {
        answer = (btnD.titleLabel?.text)!
        check()
    }
    
    func check() {
        if answer == "Pikachu" {
            print("Right")
            score += 1
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            self.nameLabel.isHidden = false
            self.nameLabel.text = answer
            self.scoreLabel.text = String(score)
        }
        else {
            print("False")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

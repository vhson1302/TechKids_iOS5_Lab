//
//  GamePlayViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    @IBOutlet var btnAnswers: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: RPCircularProgress!
    
    var answer : String = "Pikachu"
    var score : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnAnswerTouched(_ sender: UIButton) {
        if check(userInput: (sender.titleLabel?.text)!) == true {
            //sender.backgroundColor = UIColor.green
            print("true")
        }
        else {
            //sender.backgroundColor = UIColor.red
            print("false")
        }
    }
    
    
    
    
    
    //MARK: CONFIG
    func configure()  {
        //config button answer
        for button in self.btnAnswers {
            button.layer.cornerRadius = 20
        }
        //config main view
        self.mainView.layer.cornerRadius = 15
        //config image
        self.nameLabel.isHidden = true
        self.imageView.tintColor = UIColor.black
        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
        //config progress 
        self.progressView.updateProgress(1, animated: true, initialDelay: 0, duration: 8) {
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            self.nameLabel.isHidden = false
            self.nameLabel.text = "#1: \(self.answer)"
        }
    }

    //MARK: CHECK
    func check(userInput : String) -> Bool{
        let bool : Bool
        if userInput == "Pikachu" {
            print("Right")
            score += 1
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            self.nameLabel.isHidden = false
            self.nameLabel.text = userInput
            self.scoreLabel.text = String(score)
            bool = true
        }
        else {
            print("False")
            bool = false
        }
        return bool
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

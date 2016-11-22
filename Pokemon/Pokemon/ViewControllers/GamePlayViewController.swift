//
//  GamePlayViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

protocol GameView {
    func getscrore(score : Int)
}


class GamePlayViewController: UIViewController {
    var getscore : GameView?
    
    @IBOutlet var btnAnswers: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: RPCircularProgress!
    
    var nameArray : String = ""
    var answer : String = ""
    var score : Int = 0
    var lastHightScore = DataManager.init().getHightScore().last!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.defaultManager.copyDatabaseIfNeed()
        loadData()
        configure()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @IBAction func btnAnswerTouched(_ sender: UIButton) {
        if sender.titleLabel?.text == answer {
            print("Dung roi")
            self.nameLabel.text = answer
            self.nameLabel.isHidden = false
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            sender.backgroundColor = UIColor.green
            score += 1
        } else {
            print("Sai roi")
            self.nameLabel.text = answer
            self.nameLabel.isHidden = false
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            sender.backgroundColor = UIColor.red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
            self.loadData()
        }
        )
    }
    
    func loadData() {
        
        let randomImage = Int(arc4random_uniform(747) + 1)
        let randomAnswer = Int(arc4random_uniform(4))
        
        var arr : [Pokemon]
        var exceptArr : [Pokemon]
        
        arr = DataManager.init().selectRandomPokemon(randomNumber: randomImage)
        self.answer = arr.first!.name
        self.nameArray = arr.first!.img
        exceptArr = DataManager.init().selectAllExcept(id: arr.first!.id)
        
        print("Image: \(arr.first!.img)")
        self.nameLabel.isHidden = true
        self.scoreLabel.text = String(score)
        self.imageView.image = UIImage(named: arr.first!.img)
        self.imageView.tintColor = UIColor.black
        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
        
        for button in btnAnswers {
            if btnAnswers.index(of: button) == randomAnswer {
                button.setTitle(arr.first!.name, for: .normal)
            } else {
                let randomExcept = Int(arc4random_uniform(746) + 1)
                button.setTitle(exceptArr[randomExcept].name, for: .normal)
            }
            button.backgroundColor = UIColor.white
        }
    }
    
    
    //MARK: CONFIG
    func configure()  {
        //
        //config button answer
        for button in self.btnAnswers {
            button.layer.cornerRadius = 20
        }
        //config main view
        self.mainView.layer.cornerRadius = 15
        //config image
        self.nameLabel.isHidden = true
        self.imageView.image = UIImage(named: nameArray)
        self.imageView.tintColor = UIColor.black
        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
        //config progress
        self.progressView.updateProgress(1, animated: true, initialDelay: 0, duration: 30) {
            self.navigationController?.popToRootViewController(animated: true)
            if (self.score > self.lastHightScore) {
                DataManager.init().insertHighScore(score: self.score)
            } else {
                
            }
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

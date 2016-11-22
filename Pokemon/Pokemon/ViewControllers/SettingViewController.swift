//
//  SettingViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/20/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var switchSoundEffect: UISwitch!
    @IBOutlet weak var switchMusic: UISwitch!
    
    @IBOutlet var btnGensTouched: [UIButton]!
    @IBOutlet var genNumber: [UILabel]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        config()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var count = 0
    @IBAction func btnGenTouched(_ sender: UIButton) {
        let type : Int = sender.tag - 1

        if sender.alpha == 1 {
            sender.alpha = 0.5
            genNumber[type].alpha = 0.5
            count += 1
        }
        else {
            sender.alpha = 1
            genNumber[type].alpha = 1
            count -= 1
        }
        print(count)
        if count > 5 {
            sender.alpha = 1
            genNumber[type].alpha = 1
            count = 5
        }
    }
    
    @IBAction func backToRootView(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func config() {
        switchSoundEffect.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        switchMusic.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
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

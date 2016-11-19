//
//  ViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func invokeToPlayView(_ sender: Any) {
        print("Enter play view")
        let playView = self.storyboard?.instantiateViewController(withIdentifier: "PlayView") as! GamePlayViewController
        self.navigationController?.pushViewController(playView, animated: true)
    }
    

}


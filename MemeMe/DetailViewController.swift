//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Hessa Mohamed on 01/12/2018.
//  Copyright © 2018 Hessa Mohamed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var memeImageView: UIImageView!
    var meme: MemeModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        memeImageView.image = meme.memedImage
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
}

//
//  SentMemesTable&CollectionViewControllers.swift
//  MemeMe
//
//  Created by Hessa Mohamed on 01/12/2018.
//  Copyright © 2018 Hessa Mohamed. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController , UITableViewDelegate  , UITableViewDataSource{
    
   @IBOutlet var tableView: UITableView!
   var memes: [MemeModel]! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
 
    func setupNavTabBar(isHidden: Bool) {
        navigationController?.isNavigationBarHidden = isHidden
        tabBarController?.tabBar.isHidden = isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupNavTabBar(isHidden: false)
        self.tableView!.reloadData()
    }
    
      @IBAction func AddNewMeme(_ sender: AnyObject) {
        let memeController = storyboard!.instantiateViewController(withIdentifier: "Meme")
        setupNavTabBar(isHidden: true)
        self.navigationController!.pushViewController(memeController, animated: true)
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
     func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableCell
        let meme = memes[indexPath.row]
        cell.tableCellImageView.image = meme.memedImage
        cell.tableCellLabel.text = meme.topText + " " + meme.bottomText
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = storyboard!.instantiateViewController(withIdentifier: "DetailController") as! DetailViewController
        
        let meme = memes[indexPath.row]
        detailController.meme = meme

        let backButton = UIBarButtonItem()
        backButton.title = "Table View Controller"
        navigationItem.backBarButtonItem = backButton
        navigationController?.pushViewController(detailController, animated: true)
        
        
    }
    
}

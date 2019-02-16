//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Hessa Mohamed on 01/12/2018.
//  Copyright © 2018 Hessa Mohamed. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var layoutFlow: UICollectionViewFlowLayout!
    @IBOutlet var collectionView: UICollectionView!
    
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupCollectionViewFlowLayout(){
        let space:CGFloat =  0.5
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        layoutFlow.minimumInteritemSpacing = space
        layoutFlow.minimumLineSpacing = space
        
        if self.view.frame.width < self.view.frame.height{
            layoutFlow.itemSize = CGSize( width: dimension , height: dimension)}
        else{
            layoutFlow.itemSize = CGSize( width: dimension/1.5 , height: dimension/1.5)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupCollectionViewFlowLayout()
        
        setupNavTabBar(isHidden: false)
        self.collectionView?.reloadData()
    }
    
   @IBAction func AddNewMeme(_ sender: AnyObject) {
      let memeController = storyboard!.instantiateViewController(withIdentifier: "Meme")
      setupNavTabBar(isHidden: true)
      self.navigationController!.pushViewController(memeController, animated: true)
    } 
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionCell
        let meme = memes[indexPath.row]
        cell.collectionCellImageView.image = meme.memedImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailViewController
        let meme = memes[indexPath.row]
        detailController.meme = meme
        
        let leftBackButton = UIBarButtonItem()
        leftBackButton.title = "Collection View"
        navigationItem.backBarButtonItem = leftBackButton
        navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}

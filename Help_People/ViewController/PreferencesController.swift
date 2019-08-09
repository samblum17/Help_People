//
//  PreferencesController.swift
//  Help_People
//
//  Created by Jacobia Johnson on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class PreferencesController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var moneyRequiredSlider: UISlider!
    @IBOutlet weak var eventSizeSlider: UISlider!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var textArray = ["Marathon Fundraisers","Food Banks", "Clothing Drives","Blood Donation"]
    var imgArray: [UIImage] = [UIImage(named: "marathons")!,(UIImage(named: "foodBank"))! ,UIImage(named: "clothesDrive")!,UIImage(named: "bloodDrive")!]
    
    var data: [String: Any]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("data is", data)
        collectionView.dataSource = self
        collectionView.delegate = self
            }
    
    @IBAction func nextButton(_ sender: Any) {
        var preferences = ["true","true","true","true"]
        
        let cells = collectionView.visibleCells
        for cell in cells {
            let cell = cell as! preferencesEventCell
            if cell.preferencesImg.alpha < 1.0{
                var index = collectionView.indexPath(for: cell)
                preferences[index!.row] = "false"
            }
        
        }
        let data: [String: Any] = [
            "preference": preferences,
            "eventSize": Int(eventSizeSlider.value)
        ]
        print(data)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "preferencesEventCell", for: indexPath) as! preferencesEventCell
        
        cell.preferencesLabel.text = textArray[indexPath.row]
        cell.preferencesImg.image = imgArray[indexPath.row]
        
        
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sWidth = Double(view.frame.width)
        let oneBox = Double(sWidth / 2)
        let inbetweenDistance = 4.0
        let sideSpace = 24.0
        return CGSize(width: oneBox - inbetweenDistance - sideSpace, height: 150)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! preferencesEventCell
        if cell.preferencesImg.alpha == 1{
            cell.preferencesImg.alpha = 0.6
        }
        else{
            cell.preferencesImg.alpha = 1
        }
        
    }
    
}

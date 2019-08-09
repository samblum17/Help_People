//
//  PreferencesController.swift
//  Help_People
//
//  Created by Jacobia Johnson on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class PreferencesController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    struct ret: Decodable {
        var success: Bool
    }
    @IBOutlet weak var moneyRequiredSlider: UISlider!
    @IBOutlet weak var eventSizeSlider: UISlider!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var textArray = ["Marathon Fundraisers","Food Banks", "Clothing Drives","Blood Donation"]
    var imgArray: [UIImage] = [UIImage(named: "marathons")!,(UIImage(named: "foodBank"))! ,UIImage(named: "clothesDrive")!,UIImage(named: "bloodDrive")!]
    
    var data: [String: Any]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
                    }
    
    @IBAction func nextButton(_ sender: Any) {
        var eventVal = String(eventSizeSlider.value)
        var moneyVal = String(moneyRequiredSlider.value)
        data?.updateValue(Int(eventVal), forKey: "eventSize")
        data?.updateValue(Int(moneyVal), forKey: "moneyRequired")
        data?.updateValue(true, forKey: "marathons")
        data?.updateValue(true, forKey: "foodBank")
        data?.updateValue(true, forKey: "clothesDrive")
        data?.updateValue(true, forKey: "bloodDrive")

        let cells = collectionView.visibleCells
        for cell in cells {
            let cell = cell as! preferencesEventCell
            if cell.preferencesImg.alpha == 1.0{
                var index = collectionView.indexPath(for: cell)
                switch index?.row {
                case 0:
                    data?.updateValue(false, forKey: "marathons")
                case 1:
                    data?.updateValue(false, forKey: "foodBank")
                case 2:
                    data?.updateValue(false, forKey: "clothesDrive")
                case 3:
                    data?.updateValue(false, forKey: "bloodDrive")
                default:
                    return print("you are a failure")
                }
            }
        
        }
        
        let url_base = "https://c1hack.localtunnel.me"
        
        var query_params = ["username=", "&password=", "&name=", "&event_type=", "&money_req=", "&event_size="]
        
        var pref_array = ""
        
        textArray = ["clothesDrive","foodBank", "bloodDrive", "marathons"]
        
        for event in textArray {
            print(event)
            if data![event] as! Bool == true {
                pref_array += "0"
            } else {
                pref_array += "1"
            }
        }
        
        let username =  data!["username"]! as! String
        let password = data!["password"]! as! String
        let name = data!["name"]! as! String
        
        var link = query_params[0] + username + query_params[1] + password + query_params[2] + name
        
        let event_size = String(eventVal)
        let moneyRequired = String(moneyVal)
        
        link += query_params[3] + pref_array + query_params[4] + moneyRequired + query_params[5] + event_size
        var url_prior = url_base + "/register?" + link
        let url = URL(string: url_prior)!
        //        var request = URLRequest(url: url)
        //        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //        request.httpMethod = "GET"
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(data)
            print(String(data: data, encoding: .utf8)!)
            do{
                let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
            } catch {
                
            }
            //let decoder = JSONDecoder()
        }
        task.resume()
        
        //let ret = try decoder.decode(,)
        //        request.httpBody = link.percentEscaped().data(using: .utf8)

    
        print(data)
    
        performSegue(withIdentifier: "toProfile", sender: nil)
        
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

//
//  CityWeatherVC.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import UIKit
import Moya


class CityWeatherVC: UIViewController {
    
    
    let nib = UINib(nibName: "CityWeatherCell", bundle: nil)
    let nibCollection = UINib(nibName: "CityWeatherCollection", bundle: nil)
    let provider = MoyaProvider<WeatherService>()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: "CityWeatherCell")
        tableView.register(nibCollection, forCellReuseIdentifier: "CityWeatherCollection")
        loadWeatherInfo()
    }
    
    
    
    
    
    
    func loadWeatherInfo() {
        provider.request(.weatherDetail(lat: 43.25667, lon: 76.92861)) { [weak self](result) in
            guard let strongSelf = self else {return}
            switch result {
            case .success(let reponse):
                do {
                    let jsondata = try reponse.mapJSON() as! [String : Any]
                    
                } catch {
                    
                }
            case .failure(let error):
                print("Error : \(error)")
            }
        }
        
        
        
        
    }
    

   
}


extension CityWeatherVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstIndex = IndexPath(row: 0, section: 0)
        let secondIndex = IndexPath(row: 1, section: 0)
        switch indexPath {
        case firstIndex:
            if let firstCell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: firstIndex) as? CityWeatherCell {
                
                return firstCell
            }
        case secondIndex:
            if let secondCell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCollection", for: secondIndex) as? CityWeatherCollection {
                
                return secondCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
       
    }
    
    
    
}

extension CityWeatherVC : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
    
}

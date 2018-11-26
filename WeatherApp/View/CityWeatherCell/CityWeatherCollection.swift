//
//  CityWeatherCollection.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import UIKit

class CityWeatherCollection: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let nib = UINib(nibName: "CityWeatherCollectionCell", bundle: nil)
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(nib, forCellWithReuseIdentifier: "CityWeatherCollectionCell")
    }

   
}

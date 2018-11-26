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
    var weatherData : WeatherData?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: "CityWeatherCell")
        tableView.register(nibCollection, forCellReuseIdentifier: "CityWeatherCollection")
        loadWeatherInfo()
        navigationItem.title = "Погода"
        UIApplication.shared.statusBarView?.backgroundColor = #colorLiteral(red: 0.9139772058, green: 0, blue: 0, alpha: 1)
        LoadingIndicator().showActivityIndicator(uiView: self.view)
        }
    
    
    func getDayOfWeek(_ today: String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return (weekDay - 1)
    }
    
   
    
    
    
    
    
    func loadWeatherInfo() {
        provider.request(.weatherDetail(lat: 43.25667, lon: 76.92861)) { [weak self](result) in
            guard let strongSelf = self else {return}
            switch result {
            case .success(let response):
                do {
                    let jsondata = try response.mapJSON() as! [String : Any]
                    strongSelf.weatherData = WeatherData(JSON: jsondata)
                   
                    strongSelf.tableView.reloadData()
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
                guard let data = weatherData else {return firstCell}
                guard let condition = data.fact?.condition else {return firstCell}
                firstCell.weatherOverviewLbl.text = "\(String(describing: weatherCondition[condition]!).capitalizingFirstLetter())"
                
                var todayData = data.now_dt
                todayData.removeLast(min(todayData.count, 14))
                let dayOfWeek = getDayOfWeek(todayData)
                firstCell.todayDateLbl.text = "\(DaysOfWeek[dayOfWeek!]), \(day) \(MonthOfYear[month])"
                firstCell.averageTempLbl.text = "\(data.fact?.temp as! Int)ºC"
                guard let icon = data.fact?.icon else {return firstCell}
                firstCell.configureCell(icon_path: icon as! String)
                firstCell.cityNameLbl.text = "Алматы"
                return firstCell
            }
        case secondIndex:
            if let secondCell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCollection", for: secondIndex) as? CityWeatherCollection {
                secondCell.collectionView.delegate = self
                secondCell.collectionView.dataSource = self
                secondCell.collectionView.reloadData()
                return secondCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return 200
      
        default:
            return 300
            
        }
    }
    
    
    
}

extension CityWeatherVC : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfItmes = weatherData?.foreCast.count else {return 1}
        return numberOfItmes
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityWeatherCollectionCell", for: indexPath) as? CityWeatherCollectionCell {
            guard let data = weatherData else {return cell}
            let weatherdata = data.foreCast[indexPath.row]
            cell.dayTempLbl.text = "\(String(describing: weatherdata.parts?.dayShort?.temp as! Int))ºC"
            cell.nightTempLbl.text = "\(String(describing: weatherdata.parts?.nightShort?.temp as! Int))ºC"
            var todayData = data.now_dt
            todayData.removeLast(min(todayData.count, 14))
            if todayData == weatherdata.date {
                cell.dayLbl.text = "Сегодня"
            } else {
               let dayOfWeek = getDayOfWeek(weatherdata.date!)
                cell.dayLbl.text = DaysOfWeek[dayOfWeek!]
            }
            LoadingIndicator().hideActivityIndicator(uiView: self.view)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 125)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    
    
}

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
}

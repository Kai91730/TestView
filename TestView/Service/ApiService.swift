//
//  GetDataFromApiService.swift
//  TableViewText
//
//  Created by Kai on 2021/12/28.
//

import Foundation
import Alamofire

class ApiService {
    
    var regionText:String = ""
    var address: String = ""
    
    func getDataFromApi( completion: @escaping ( _ coffeeShopDatas: [CoffeeShopData] ) -> () ) {
        
        let baseUrl: String = "https://cafenomad.tw/api/v1.2/cafes/"
        let region = Regions(rawValue: regionText)
        var regionUrl = ""
        
        switch region {
        
        case .taipei:
            regionUrl = Regions.taipei.text()
        case .taoyuan:
            regionUrl = Regions.taoyuan.text()
        case .taichung:
            regionUrl = Regions.taichung.text()
        case .kaohsiung:
            regionUrl = Regions.kaohsiung.text()
        case .pingtung:
            regionUrl = Regions.pingtung.text()
        default:
            print("查無此地點")
//            baseUrl = ""
            //跳錯誤
        }
        
        let url = URL(string: (baseUrl + regionUrl))
        if let url = url {

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.timeoutInterval = 5
            URLSession.shared.dataTask(with: request) { (data, response ,error) in

                if let error = error {
                    print("Error type: \(error.localizedDescription) occured when calling API \(url)")
                    return
                }

                if let response = response as? HTTPURLResponse,
                   let data = data {
                    print("Status code is : \(response.statusCode)")

                    let decoder = JSONDecoder()

                    if let coffeeDatas = try? decoder.decode([CoffeeShopData].self, from: data) {

                        completion(coffeeDatas)
                    }
                }

            }.resume()

        } else {
            print("invalid URL")
        }
    }
    
    func getCoordinateFromApi( completion: @escaping (_ datas: GoogleMapGeocodingData) -> () ) {
        
        let url = "https://maps.googleapis.com/maps/api/geocode/json?address=\(address)&key=\(AppDelegate.googleApiKey)"
        
        print("url is : \(url)")
        
        Alamofire.request(url).responseJSON { response in
            
            if let data = response.data {
                
                let decoder = JSONDecoder()
                
                do {
                    if let coordinateData = try? decoder.decode(GoogleMapGeocodingData.self, from: data) {
                    
                    completion(coordinateData)
                    
                    print("getCoordinate done")
                }
                    
                } catch {
                    print(error)
                }
                    
                
                
            } else {
                print("error: \(response.error)")
            }
        }
    }

}


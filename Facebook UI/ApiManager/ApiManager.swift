////
////  ApiManager.swift
////  Facebook UI
////
////  Created by Bthloo on 28/09/2024.
////
//
//import Foundation
//
//class ApiManager{
//    
//    var delegate : WeatherAppDelegate?
//    
//    // https://api.weatherapi.com/v1/current.json?key=8e2699296de143708ad173859230207&q=Cairo
//    
//    
//    static let sharedService = ApiManager()
//    func getWeatherData(cityName : String, completion : @escaping (_ weather : Weather? ,_ error : Error?) -> Void){
//        
//        self.delegate?.loading()
//        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=8e2699296de143708ad173859230207&q=\(cityName)")else{return}
//        let session = URLSession.shared
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            
//            
//            if error != nil{
//                self.delegate?.didFail(error: error)
//                completion(nil ,error)
//            }else{
//                
//                do{
//                    
//                    let weather = try JSONDecoder().decode(Weather.self, from: data!)
//                    
//                    
//                   
//                    self.delegate?.didFetchData(weather: weather)
//                    completion(weather ,nil)
//                }catch{
//                    
//                    
//                    self.delegate?.didFail(error: error)
//                    completion(nil ,error)
//                    
//                }
//            }
//            
//            
//        }
//        task.resume()
//    }
//    
//}

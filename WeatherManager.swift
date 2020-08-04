//
//  WeatherManager.swift
//  Clima
//
//  Created by Nicolas Villetelle on 04/08/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=0290de8c73e090e33e43fc04858308d6&lang=fr"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // Create a URL
        if let url = URL(string: urlString){
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a Task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // Start the task
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            print(error)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}

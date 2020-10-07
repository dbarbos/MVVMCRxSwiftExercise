//
//  RestaurantService.swift
//  MVVMCRxSwift
//
//  Created by Diler Barbosa on 07/10/20.
//

import Foundation
import RxSwift


protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}


class RestaurantService : RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        
//        let task = URLSession.shared.dataTask(with: URL(string: "url")!) { data, _, _ in
//            
//        }
        
        return Observable.create { observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {
                    
                }
            }
            
            do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                
                observer.onNext(restaurants)
            
            } catch {
                observer.onError(error)
            }
            
            //task.resume()
            
            return Disposables.create {
                //task.cancel()
            }
            
        }
        
    }
    
}

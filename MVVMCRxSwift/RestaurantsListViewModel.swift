//
//  RestaurantsListViewModel.swift
//  MVVMCRxSwift
//
//  Created by Diler Barbosa on 07/10/20.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]>{
        restaurantService.fetchRestaurants().map { $0.map { RestaurantViewModel(restaurant: $0) } }
    }
    
    
    
}

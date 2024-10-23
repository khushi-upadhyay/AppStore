//
//  DataModel.swift
//  AppStore
//
//  Created by admin70 on 23/10/24.
//
import Foundation
import UIKit

struct App {
    var title: String
    var subtitle: String
    var price: Double
    var descriptions: String
    var id = UUID()
    var color: UIColor
    
}

var randomColor:UIColor {
    UIColor(red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1)
}


class DataModel {
    
    static let sections: [Section] = [.promoted, .standard, .category, .regular]
    static let promotedApps = [
                        App(title: "App1", subtitle: "Awesome App", price: 0.0, descriptions: "Amazing app to use", color: randomColor),
                       App(title: "Zomato", subtitle: "Zomato App", price: 5.9, descriptions: "Amazing food delivery app to use", color: randomColor),
                       App(title: "Swiggy", subtitle: "Swiggy App", price: 0.0, descriptions: "Amazing food delivery app to use", color: randomColor),
                       App(title: "MilkBasket", subtitle: "MilkBasket App", price: 7.2, descriptions: "Amazing food grocery app to use", color: randomColor),
                       App(title: "BigBasket", subtitle: "BigBasket App", price: 4.1, descriptions: "Amazing food grocery  app to use", color: randomColor),
                       App(title: "Audible", subtitle: "Audible App", price: 0.0, descriptions: "Amazing audible app to use", color: randomColor),]
    
    enum Section {
        case promoted, standard, category, regular
    }

}



//
//  UIViewController+Storyboarded.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import UIKit

protocol Storyboarded {
    static func instantiate(fromStoryboard storyboardName: StoryBoardEnum) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(fromStoryboard storyboardName: StoryBoardEnum) -> Self {
        let fullName = NSStringFromClass(self)

        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

enum StoryBoardEnum: String {
    case Main = "Main"
}

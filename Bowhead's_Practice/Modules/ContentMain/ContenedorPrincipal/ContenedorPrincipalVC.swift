//
//  ContenedorPrincipalVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import UIKit

class ContenedorPrincipalVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var tabBarOpciones: UITabBar!
    @IBOutlet weak var contenedorControladorView: UIView!
    
    var controladorActual: UIViewController?
    var tagActual = 0
    
    internal enum ImageTab: String {
        case home = "house"
        case list = "list.bullet.indent"
        
        var image: UIImage {
            return UIImage(systemName: self.rawValue)!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let vc = controladorActual {
            loadChild(vc)
        }
    }

}


extension ContenedorPrincipalVC {
    
    func setup(){
   
        tabBarOpciones.delegate = self
        tabBarOpciones.isTranslucent = false
        tabBarOpciones.backgroundColor = BowHeadColor.Background.color
        
        self.tabBarOpciones.items?.removeAll()
        self.tabBarOpciones.items?.append(UITabBarItem(title: "", image: ImageTab.home.image, tag: 0))
        self.tabBarOpciones.items?.append(UITabBarItem(title: "", image: ImageTab.list.image, tag: 1))
        self.tabBarOpciones.selectedItem = tabBarOpciones.items![0] as UITabBarItem
        
        self.tabBarOpciones.tintColor = BowHeadColor.GreenAqua.color
        UITabBar.appearance().unselectedItemTintColor = .black
        
        
        
//        self.tabBarOpciones.layer.shadowOffset = CGSize(width: 5, height: 5)
//        self.tabBarOpciones.layer.shadowOpacity = 0.8
//        self.tabBarOpciones.layer.shadowRadius = 4
//        self.tabBarOpciones.clipsToBounds = false
//        self.tabBarOpciones.layer.shadowColor = UIColor(red: 47.0/255.0, green: 79.0/255.0, blue: 79.0/255.0, alpha: 1.0).cgColor
        
        
//        tabBarOpciones.layer.shadowColor = UIColor.lightGray.cgColor
//        tabBarOpciones.layer.shadowOpacity = 0.5
//        tabBarOpciones.layer.shadowOffset = CGSize.zero
//        tabBarOpciones.layer.shadowRadius = 5
//        self.tabBarOpciones.layer.borderColor = UIColor.clear.cgColor
//        self.tabBarOpciones.layer.borderWidth = 0
//        self.tabBarOpciones.clipsToBounds = false
//        self.tabBarOpciones.backgroundColor = UIColor.white
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundImage = UIImage()
        
        
//        tabBarOpciones.layer.shadowOffset = CGSize(width: 5, height: 5)
//        tabBarOpciones.layer.shadowRadius = 2;
//        tabBarOpciones.layer.shadowColor = UIColor.black.cgColor
//        tabBarOpciones.layer.shadowOpacity = 0.3;
//        
//        self.view.setNeedsLayout()
//        self.view.setNeedsDisplay()
//        
//        tabBarOpciones.layer.shadowOffset = CGSize(width: 0, height: 0)
//        tabBarOpciones.layer.shadowRadius = 2
//        tabBarOpciones.layer.shadowColor = UIColor.black.cgColor
//        tabBarOpciones.layer.shadowOpacity = 0.3
        
    }
    
    
    func loadChild (_ controlador: UIViewController) {
        
        if controladorActual != nil {
            remove(child: controladorActual!)
        }
        add(child: controlador, intoContainer: contenedorControladorView)
        controladorActual = controlador
        
    }
}

extension ContenedorPrincipalVC : UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let tag = item.tag
        guard item.tag != tagActual else { return }
        
        switch tag {
        case 0:
            loadChild(StartTestVC.instantiate(fromStoryboard: .Main))
            tagActual = 0
        case 1:
            loadChild(TestControlVC.instantiate(fromStoryboard: .Main))
            tagActual = 1
        default:
            break
        }
    }
    
}

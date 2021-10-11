//
//  ContenedorPrincipalVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import UIKit

class ContainerMainVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var contenedorControladorView: UIView!
    
    var currentController: UIViewController?
    var currentTag = 0
    
    internal enum ImageTab: String {
        case home = "house"
        case list = "list.bullet.indent"
        
        var image: UIImage {
            return UIImage(systemName: self.rawValue)!
        }
    }

    //MARK: LIFECICLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let vc = currentController {
            loadChild(vc)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableSetup()
    }

}


extension ContainerMainVC {
    
    //MARK: CONFIG
    func setupUI(){
   
        tabBar.delegate = self
        tabBar.isTranslucent = false
        tabBar.backgroundColor = BowHeadColor.Background.color
        
        self.tabBar.items?.removeAll()
        self.tabBar.items?.append(UITabBarItem(title: "", image: ImageTab.home.image, tag: 0))
        self.tabBar.items?.append(UITabBarItem(title: "", image: ImageTab.list.image, tag: 1))
        self.tabBar.selectedItem = tabBar.items![0] as UITabBarItem
        
        self.tabBar.tintColor = BowHeadColor.GreenAqua.color
        UITabBar.appearance().unselectedItemTintColor = .black
        
    }
    
    func setup(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddChild(_:)), name: BowInternalNotification.hijoControlador.name, object: nil)
    }
    
    func disableSetup() {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func loadChild (_ controlador: UIViewController) {
        
        if currentController != nil {
            remove(child: currentController!)
            currentController = nil
            //print("heelo")
        }
        add(child: controlador, intoContainer: contenedorControladorView)
        currentController = controlador
        
    }
    
    //MARK: ACTIONS
    @objc func handleAddChild(_ notification: NSNotification) {
        if let vc = notification.userInfo?["child"] as? UIViewController, let tag = notification.userInfo?["tag"] as? String
           {
            loadChild(vc)
            
            if tag == "0" {
                tabBar.selectedItem = tabBar.items?.first
                currentTag = 0
            }else {
                tabBar.selectedItem = tabBar.items?[1]
                currentTag = 1
            }
            
        }
    }
}

extension ContainerMainVC : UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let tag = item.tag
        guard item.tag != currentTag else { return }
        
        switch tag {
        case 0:
            loadChild(StartTestVC.instantiate(fromStoryboard: .Main))
            currentTag = 0
        case 1:
            loadChild(TestControlVC.instantiate(fromStoryboard: .Main))
            currentTag = 1
        default:
            break
        }
    }
    
}

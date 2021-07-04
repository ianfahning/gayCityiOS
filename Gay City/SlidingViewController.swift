//
//  SlidingViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 4/13/21.
//
import UIKit
import Foundation
import NavigationDrawer
import CollapsibleTableSectionViewController

class SlidingViewController: UIViewController{

    @IBOutlet weak var closeButton: UIButton!
    var interactor:Interactor? = nil

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
    
}

//Handle Gesture
@IBAction func handleGesture(sender: UIPanGestureRecognizer) {
let translation = sender.translation(in: view)

let progress = MenuHelper.calculateProgress(translationInView: translation, viewBounds: view.bounds, direction: .Left)

MenuHelper.mapGestureStateToInteractor(
gestureState: sender.state,
progress: progress,
interactor: interactor){
self.dismiss(animated: true, completion: nil)
}
}

@IBAction func closeBtnPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
}
    
    @IBAction func presentSecondViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeView  = storyboard.instantiateViewController(withIdentifier: "new")
        
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true, completion: nil)
    }
    
    public func changeView(_ identifier: String) {
        if identifier != "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view  = storyboard.instantiateViewController(withIdentifier: identifier)
            view.modalPresentationStyle = .fullScreen
            //must get the top most view controller or it will say it is not in the window heirarcy
            UIApplication.topViewController()?.present(view, animated: true, completion: nil)
        }

    }
}

extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
}


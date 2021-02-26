//
//  SecondViewController.swift
//  TwoViewControllers
//
//  Created by Kate Baumstein on 2/22/21.
//

import UIKit



protocol SendDataProtocol {
    func sendPenneFavoriteInformationToFirstController(isFavorited: Bool)
}


class SecondViewController: UIViewController {
   
    var delegate: SendDataProtocol? = nil
    @IBOutlet var favoritePenneButton: UIButton!
    var isPenneFavorited2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isPenneFavorited2 == false){
            markPenneAsNotFavorited()
        }
        else {
            markPenneAsFavorited()
        }
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func secondMethod(sender: UIButton) {
        print("CLICKING IN SECOND VIEW CONTROLLER ")
    }
    
    @IBAction func clickFavoriteButton(sender: UIButton){
        if(isPenneFavorited2){
            markPenneAsNotFavorited()
        }
    else{
     //   else if (favoritePenneButton.currentImage ==  UIImage(systemName: "squareshape")){
            markPenneAsFavorited()
        }
        
        if self.delegate != nil {
            print("HERE 2")
            self.delegate?.sendPenneFavoriteInformationToFirstController(isFavorited: isPenneFavorited2)
            //dismiss(animated: true, completion: nil)
        }
        
    }
        
    func markPenneAsFavorited(){
        favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
        favoritePenneButton.setTitle("Added to favorites", for: .normal)
        favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        isPenneFavorited2 = true
    }
    
    func markPenneAsNotFavorited(){
        favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
        favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
        favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
        isPenneFavorited2 = false
    }
    
    
    
    
}

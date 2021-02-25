//
//  ViewController.swift
//  TwoViewControllers
//
//  Created by Kate Baumstein on 2/22/21.
//

import UIKit


protocol SendDataToSecondViewProtocol {
    func sendPenneFavoriteInformationToSecondController(isFavorited: Bool)
}

class ViewController: UIViewController, SendDataProtocol {


    var delegate: SendDataToSecondViewProtocol? = nil
    var isPenneFavorited = false
    @IBOutlet var favoritePenneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickSecondViewController(sender: UIButton) {
        print("CLICKING NEXT ")
    }
    
    @IBAction func clickFavoriteButton(sender: UIButton){
        if(isPenneFavorited){
        //if(favoritePenneButton.currentImage ==  UIImage(systemName: "checkmark.square")){
            favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
            favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
            isPenneFavorited = false
        }
        else{
   //     else if (favoritePenneButton.currentImage ==  UIImage(systemName: "squareshape")){
            favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
            favoritePenneButton.setTitle("Added to favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            isPenneFavorited = true
        }
        print("HERE OUT")
        if self.delegate != nil {
            print("HERE")
            self.delegate?.sendPenneFavoriteInformationToSecondController(isFavorited: isPenneFavorited)
            //dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    // Delegate Method
    func sendPenneFavoriteInformationToFirstController(isFavorited: Bool) {
            if(isFavorited == true){
                favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
                favoritePenneButton.setTitle("Added to favorites", for: .normal)
                favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                isPenneFavorited = true
            }
            else {
                favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
                favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
                favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
                isPenneFavorited = false
            }
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "penneRecipeSegue" {
                let secondVC: SecondViewController = segue.destination as! SecondViewController
                secondVC.isPenneFavorited2 = isPenneFavorited
                secondVC.delegate = self
            }
        }
    
}


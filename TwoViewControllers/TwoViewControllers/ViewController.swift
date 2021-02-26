//
//  ViewController.swift
//  TwoViewControllers
//
//  Created by Kate Baumstein on 2/22/21.
//

import UIKit

class ViewController: UIViewController, SendDataProtocol {


    //var delegate: SendDataToSecondViewProtocol? = nil
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
            markPenneAsNotFavorited()
        }
        else{
            markPenneAsFavorited()
        }        
    }
    
    // Delegate Method
    func sendPenneFavoriteInformationToFirstController(isFavorited: Bool) {
            if(isFavorited == true){
                markPenneAsFavorited()
            }
            else {
               markPenneAsNotFavorited()
            }
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "penneRecipeSegue" {
                let secondVC: SecondViewController = segue.destination as! SecondViewController
                secondVC.isPenneFavorited2 = isPenneFavorited
                secondVC.delegate = self
            }
        }
    
    
    func markPenneAsFavorited(){
        favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
        favoritePenneButton.setTitle("Added to favorites", for: .normal)
        favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        isPenneFavorited = true
    }
    
    func markPenneAsNotFavorited(){
        favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
        favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
        favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
        isPenneFavorited = false
    }
    
}


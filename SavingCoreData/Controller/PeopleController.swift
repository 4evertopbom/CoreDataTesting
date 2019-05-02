//
//  PeopleController.swift
//  SavingCoreData
//
//  Created by Hoang Anh Tuan on 3/11/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit

class PeopleController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var people = [People]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
    }
    
    fileprivate func setUpNavigation(){
        collectionView.backgroundColor = .yellow
        collectionView.register(PeopleCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "PEOPLE"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAdding))
    }
    
    @objc func handleAdding(){
        let alert:UIAlertController = UIAlertController(title: "New Person", message: nil, preferredStyle: .alert)
        alert.addTextField { (nametf) in
            nametf.placeholder = "Enter person's name.."
        }
        let cancelButton:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let okButton:UIAlertAction = UIAlertAction(title: "OK", style: .default) { (_ ) in
            let namePersontf = alert.textFields![0] as UITextField
            
            self.addnewPerson(personName: namePersontf.text ?? "")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func addnewPerson(personName: String){
        let person = People(entity: People.entity(), insertInto: self.context)
        person.name = personName
        self.appDelegate.saveContext()
        self.people.append(person)
        let index = IndexPath(row:self.people.count - 1, section:0)
        self.collectionView?.insertItems(at: [index])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            people = try context.fetch(People.fetchRequest())
        } catch let err as NSError {
            print("Cant not fetch people: ",err)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PeopleCell
        cell.nameLB.text = people[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 60)/2
        return CGSize(width: width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PetController(collectionViewLayout: UICollectionViewFlowLayout())
        vc.index = indexPath.item
        vc.pets = people[indexPath.item].pet!
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



//
//  AdoptionListViewController.swift
//  Resq UiKit
//
//  Created by Bryan Khufa on 15/07/21.
//

import UIKit

class AdoptionListViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    var selectedFilter = [String:String]()
    var selectedFilter2 = ["Male", "Puppy", ""]
    
    var dogList = [DogFile]()
    var filteredDogs = [DogFile]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let itemsPerRow: CGFloat = 2
    private let gapPerItem: CGFloat = 10
    
    private let adoptionCard = "adoptionCard"
    private let nibIdentifier = "AdoptionCollectionViewCell"
    
    @IBAction func filterAction(_ sender: Any) {
        let filterVc = CustomModalViewController()
        filterVc.delegate = self
        filterVc.modalPresentationStyle = .overCurrentContext
        
        // Keep animated value as false
        // Custom Modal presentation animation will be handled in VC itself
        self.present(filterVc, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        collectionView.register(UINib(nibName:nibIdentifier, bundle: nil), forCellWithReuseIdentifier: adoptionCard)
        
        filterBtnSetup()
        appendDoglist()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let data = UserDefaults.standard.value(forKey:"selectedDog") as? Data {
            let selectedDog = try! PropertyListDecoder().decode(DogFilter.self, from: data)
            addFilter(selected: selectedDog)
        }
    }
    
    private func appendDoglist(){
        dogList.append(DogFile(dogImage: "Bailey", dogName: "Bailey", dogSex: "Male", dogAge: "3", dogLocation: "Jakarta", vaccineStatus: "lalalala", communityName: "Lalalala", dogDescription: "alalalalal"))
        dogList.append(DogFile(dogImage: "Oreo", dogName: "Oreo", dogSex: "Male", dogAge: "1", dogLocation: "Surabaya", vaccineStatus: "lalalala", communityName: "Lalalala", dogDescription: "alalalalal"))
        dogList.append(DogFile(dogImage: "Magie", dogName: "Magie", dogSex: "Female", dogAge: "0.5", dogLocation: "Bali", vaccineStatus: "lalalala", communityName: "Lalalala", dogDescription: "alalalalal"))
        dogList.append(DogFile(dogImage: "Cappie", dogName: "Cappie", dogSex: "Female", dogAge: "6", dogLocation: "Surabaya", vaccineStatus: "lalalala", communityName: "Lalalala", dogDescription: "alalalalal"))
        
        filteredDogs = dogList
    }
    
    private func filterBtnSetup() {
        filterBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        filterBtn.imageView?.contentMode = .scaleAspectFit
        filterBtn.imageEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func searchAndFilter() {
        let searchText = searchBar.text!
        if !searchText.isEmpty {
            filteredDogs.removeAll(where: {$0.dogName.range(of: searchText,options: .caseInsensitive) == nil})
            collectionView.reloadData()
        }
    }
    
    func filterDogs(dogs: [DogFile], by filters: DogFilter) -> [DogFile]{
        
        var dogsFiltered = dogs
        
        switch filters.byAge {
        case "Puppy":
            dogsFiltered.removeAll(where: {$0.dogAge.floatValue > 1})
        case "Adult":
            dogsFiltered.removeAll(where: {$0.dogAge.floatValue <= 1})
        default:
            break
        }
        
        switch filters.byGender {
        case "Male":
            dogsFiltered.removeAll(where: {$0.dogSex.lowercased() == "female"})
        case "Female":
            dogsFiltered.removeAll(where: {$0.dogSex.lowercased() == "male"})
        default:
            break
        }
        
        if !filters.byLocation.isEmpty {
            dogsFiltered.removeAll(where: {$0.dogLocation.range(of: filters.byLocation,options: .caseInsensitive) == nil})
        }
        
        print(dogsFiltered)
        
        return dogsFiltered
    }
}

extension AdoptionListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: Menentukan jumlah item yang akan di tampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredDogs.count
    }
    
    // MARK: mengatur view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: adoptionCard, for: indexPath) as! AdoptionCollectionViewCell
        cell.petImage.image = UIImage(named: filteredDogs[indexPath.row].dogImage)
        cell.petName.text = filteredDogs[indexPath.row].dogName
        cell.petAge.text = "\(filteredDogs[indexPath.row].dogAge) years"
        cell.petGender.text = filteredDogs[indexPath.row].dogSex
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "PetInfoDetails", bundle: nil)
        guard let petInfoDetail = storyboard.instantiateViewController(withIdentifier: "PetInfoDetailsViewController") as? PetInfoDetailsViewController else {fatalError("Failed on getting the Page")}
        petInfoDetail.dogFile = filteredDogs[indexPath.row]
        self.navigationController?.pushViewController(petInfoDetail, animated: true)
    }
    
    // MARK: mengatur layout view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / itemsPerRow - gapPerItem
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

extension AdoptionListViewController: FilterDelegate {
    func addFilter(selected: DogFilter) {
        print(selected)
        filteredDogs = filterDogs(dogs: dogList, by: selected)
        collectionView.reloadData()
    }
}

extension AdoptionListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!
        filteredDogs = dogList
        if !searchText.isEmpty {
            filteredDogs.removeAll(where: {$0.dogName.range(of: searchText,options: .caseInsensitive) == nil})
        }
        else {
            filteredDogs = dogList
        }
        collectionView.reloadData()
        view.endEditing(true)
        print(searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredDogs = dogList
            view.endEditing(true)
        }
        collectionView.reloadData()
    }
    
}

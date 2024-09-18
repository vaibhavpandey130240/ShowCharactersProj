//
//  CHCharacterListsVC+Delegate.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import UIKit

extension CHCharacterListsVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.height
        
        if bottomEdge >= scrollView.contentSize.height {    //We reached bottom
            loadMoreData()
        }
    }
}

extension CHCharacterListsVC: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCharacters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.cellIdentifier, for: indexPath) as? CharactersTableViewCell
        
        let infoObj = listCharacters?[indexPath.row]
        
        cell?.cellData = infoObj
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let infoObj = listCharacters?[indexPath.row] else { return }
        pushModelsScene(with: infoObj)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

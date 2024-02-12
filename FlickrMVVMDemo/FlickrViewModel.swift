//
//  FlickrViewModel.swift
//  FlickrMVVMDemo
//
//  Created by Ravikanth  on 2/12/24.
//

import Foundation
import Combine

class FlickrViewModel: ObservableObject {
    @Published var photos: [FlickrPhoto] = []
    private var cancellables = Set<AnyCancellable>()

    private let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="

    func fetchPhotos(withTags tags: String) {
        guard let url = URL(string: "\(baseURL)\(tags)") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: FlickrFeed.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] feed in
                self?.photos = feed.items
            })
            .store(in: &cancellables)
    }
}

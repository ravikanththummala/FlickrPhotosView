//
//  ContentView.swift
//  FlickrMVVMDemo
//
//  Created by Ravikanth  on 2/12/24.
//

import SwiftUI

struct FlickrPhotosView: View {
    @ObservedObject var viewModel = FlickrViewModel()

        var body: some View {
            NavigationView {
                List(viewModel.photos, id: \.link) { photo in
                    VStack(alignment: .leading) {
                        Text(photo.title)
                            .font(.headline)
                        Text(photo.tags)
                            .font(.caption)
                        AsyncImage(url: URL(string: photo.media.m))
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .navigationBarTitle("Flickr Photos")
                .onAppear {
                    viewModel.fetchPhotos(withTags: "yourTagHere")
                }
            }
        }
}

#Preview {
    FlickrPhotosView()
}

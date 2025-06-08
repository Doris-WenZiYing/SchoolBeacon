//
//  LibraryView.swift
//  SchoolBeacon
//
//  Created by Doris on 3/21/22.
//

import SwiftUI

struct LibraryView: View
{
    
    @State var objs: [OfficeObject] = LibraryViewModel.build()
    
    var body: some View
    {
        ScrollView
        {
            ForEach(objs) { obj in
                CustomNavigationLink(title: obj.name) {
                    ListDetailView(obj: obj)
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping () -> Detail) -> some View
    {
        NavigationLink
        {
            content()
        } label: {
            HStack()
            {
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.white.cornerRadius(12))
            .shadow(radius: 8)
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct LibraryView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LibraryView()
    }
}

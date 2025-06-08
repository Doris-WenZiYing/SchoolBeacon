//
//  ListView.swift
//  SchoolBeacon
//
//  Created by Doris on 3/14/22.
//

import SwiftUI

struct ListView: View
{
    @State var objs: [OfficeObject] = LibraryViewModel.build()
    
    var body: some View
    {
        // 在LandMark裡面已經包在NavigationView裡面了
        ScrollView
        {
            ForEach(objs) { obj in
                CustomNavigationLink(title: obj.name) {
                    ListDetailView(obj: obj)
                }
            }
        }
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
            .padding(.bottom, 20)
        }
    }
}

struct ListDetailView: View
{
    @State var obj: OfficeObject?
    
    var body: some View
    {
        VStack
        {
            Text("分機號碼：\(obj?.phone ?? "")")
                .padding()
            Text("辦公室位置：\(obj?.office ?? "")")
                .padding()
        }
    }
}

struct ListView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ListView()
    }
}

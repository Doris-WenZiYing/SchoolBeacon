//
//  LandMarkView.swift
//  SchoolBeacon
//
//  Created by Doris on 3/10/22.
//

import SwiftUI
import MapKit

struct LandMarkView: View
{
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var LandMark: LandmarkNode?
    @State var Objects = LocationViewModel.build()
    
    @State var imagePlaceHolder: UIImage = UIImage(named: "placeHolder")!
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                ForEach(Objects) { object in
                    if object.name == LandMark?.title {
                        
                        // 這個變數用來存儲object的經緯度，傳入MapView之後才能顯示正確的位置
                        let coordinate = CLLocationCoordinate2D(latitude: object.latitude, longitude: object.longitude)
                        
                        MapView(coordinate: coordinate)
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                        
                        Image(uiImage: object.image ?? imagePlaceHolder)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7)
                            .offset(y: -80)
                            .padding(.bottom, -80)
                        
                        VStack(alignment: .leading, spacing: 0)
                        {
                            ScrollView
                            {
                                Text(object.name)
                                    .font(.title)
                                
                                HStack
                                {
                                    Text("Feng Chia University")
                                    Spacer()
                                    Text("FCU")
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                
                                Divider()
                                
                                HStack
                                {
                                    Text("緯度：\(object.latitude)")
                                    Spacer()
                                    Text("精度：\(object.longitude)")
                                }
                                .font(.title2)
                                .padding(.vertical)
                                
                                Text(object.description)
                                    .padding()
                                
                                // TODO: 放各個大樓的師長辦公室
                                Group
                                {
                                    
                                }
                                
                            }
                        }
                        .padding()
                        
                    }
                }
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("關閉")
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct LandMarkView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkView()
    }
}

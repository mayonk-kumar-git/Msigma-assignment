//
//  CourseDetailsView.swift
//  Msigma-assignment
//
//  Created by Mayonk Kumar Behera on 14/11/23.
//

import SwiftUI

struct CourseDetailsView: View {
    
    @ObservedObject var viewModel = CourseDetailsViewModel()
    @State var searchText = ""
    
    let screenWidth = UIScreen.main.bounds.width
    var courseName: String
    var courseImage: String
    
    var filteredBranches: [Branch] {
        if searchText.isEmpty {
            return viewModel.branches
        } else {
            return viewModel.branches.filter { branch in
                branch.name.lowercased().contains(searchText.lowercased()) || branch.short.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(ImageNames.courseDetailsBackground)
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text("All \(courseName) Courses")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text("Find your branch")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: screenWidth * 0.9, height: 45)
                        .background(.white)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .inset(by: 0.5)
                                .stroke(.black.opacity(0.1), lineWidth: 1)
                        )
                        .overlay(
                            HStack {
                                Image("search")
                                    .padding(.leading, 10)
                                
                                TextField("Search course, program", text: $searchText)
                                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 10))
                            }
                        )
                    
                }
                .padding(.top, 50)
            }
            if viewModel.isLoading == true {
                ProgressView()
                    .padding(.top, 70)
            }
            
            LazyVGrid(columns: [GridItem(spacing: 16), GridItem(spacing: 16)], spacing: 16) {
                ForEach(filteredBranches, id: \.self) { branch in
                    BranchCardView(courseShortName: branch.short, courseName: branch.name, courseImage: courseImage)
                }
            }
            .padding()
            .padding(.top, -50)
            .padding(.bottom, 60)
        }
        .onAppear{
            viewModel.getBranches()
        }
        .ignoresSafeArea()
    }
    
}

struct BranchCardView: View {
    var courseShortName: String
    var courseName: String
    var courseImage: String
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("\(courseImage)")
                    Text("\(courseShortName)")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(red: 0.04, green: 0.33, blue: 0.5))
                    Spacer()
                }
                .padding(.leading, 16)
                
                Text("\(courseName)")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    .frame(width: 134, alignment: .topLeading)
                    .padding(.leading, 16)
            }
        }
            .foregroundColor(.clear)
            .frame(height: 100)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color(red: 0.2, green: 0.27, blue: 0.34).opacity(0.1), radius: 10, x: 0, y: 4)
         
        }
}

#Preview {
    CourseDetailsView(courseName: "B.tech", courseImage: "engineering_icon")
}

//
//  HomeView.swift
//  Msigma-assignment
//
//  Created by Mayonk Kumar Behera on 14/11/23.
//

import SwiftUI

struct HomeView: View {
    var fullName = "Mayonk Kumar"
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TopView(fullName: fullName)
                    PromotionalBanner()
                    ResumeView()
                    ExploreCoursesView()
                    FeaturedCourseView()
                }
            }
            .background(
                Image(ImageNames.homeBackground)
                    .resizable()
                    .scaledToFill()
            )
            .ignoresSafeArea(.all)
        }
    }
}

struct TopView: View {
    var fullName: String
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Hey " + fullName + " !")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                Spacer()
                Text("Let’s learn something new today")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
            }
            .padding(.leading, 25)
            
            Spacer()
            
            Button(action: {
                // on tap action
            }, label: {
                Image("search")
                .foregroundColor(.clear)
                .frame(width: 40, height: 40)
                .background(.white)
                .cornerRadius(20)
            })
            .padding(.trailing, 16)
            
            Button(action: {
              // on tap action
            }, label: {
                Image("bell")
                .foregroundColor(.clear)
                .frame(width: 40, height: 40)
                .background(.white)
                .cornerRadius(20)
            })
            .padding(.trailing, 25)
        }
        .padding(.top, 65)
    }
}

struct PromotionalBanner: View {
    var body: some View {
        Image(ImageNames.promotionalBanner)
            .resizable()
            .scaledToFill()
            .padding()
    }
}

struct ResumeView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Resume from where you left")
              .font(.system(size: 16, weight: .medium))
              .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
            
            HStack{
                VStack(alignment: .leading) {
                    Text("Z Transform using EQN I")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    
                    Text("Digital Signal Processing")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                        .padding(.top, 4)
                    
                    Text("9mins left")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(red: 0.92, green: 0.59, blue: 0.15))
                        .padding(.top)
                }
                .padding(.vertical)
                
                Spacer()
                
                Image(ImageNames.resumeVideoThumbnail)
                    .resizable()
                    .frame(width: 130)
            }
            .padding(.leading, 16)
            .background(.white)
            .foregroundColor(.clear)
            .cornerRadius(10)
            .shadow(color: Color(red: 0.2, green: 0.27, blue: 0.34).opacity(0.1), radius: 10, x: 0, y: 4)
            
        }
        .padding()
        
    }
}

struct ExploreCoursesView: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        VStack {
            HStack {
                Text("Explore courses")
                    .font(.system(size: 14, weight: .medium))
                  .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                Spacer()
                Text("see all")
                  .font(Font.custom("Inter", size: 14))
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
            }
            .padding(.horizontal, 25)
            LazyVGrid(columns: columns) {
                ForEach(ExploreCourses.courses) { course in
                    CourseCardView(courseName: course.courseName, courseImage: course.courseImage, numberOfStudents: course.numberOfStudents, percentOff: course.percentOff)
                }
            }
            .padding()
        }
    }
}

struct CourseCardView: View {
    var courseName: String
    var courseImage: String
    var numberOfStudents: Float
    var percentOff: Int
    @State var showCourseDetailsScreen: Bool = false
    var body: some View {
        Button(action: {
            showCourseDetailsScreen = true
        }, label: {
            ZStack {
                if percentOff > 0 {
                    VStack {
                        Text("\(percentOff)% OFF")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color(red: 0.92, green: 0.59, blue: 0.15))
                    }
                    .frame(width: 70,height: 30)
                    .background(Color(red: 1, green: 0.94, blue: 0.85))
                    .cornerRadius(5)
                    .padding(.leading, 110)
                    .padding(.bottom, 75)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Image("\(courseImage)")
                        Text("\(courseName)")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(red: 0.04, green: 0.33, blue: 0.5))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    HStack{
                        Image("profile")
                        Text(String(format: "%.1fK Enrolled", numberOfStudents))
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0.15, green: 0.53, blue: 0.75))
                    }
                    .padding(.leading, 16)
                }
                NavigationLink(destination: CourseDetailsView( courseName: courseName, courseImage: courseImage), isActive: $showCourseDetailsScreen) {
                    EmptyView()
                }
            }
            .foregroundColor(.clear)
            .frame(height: 95)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color(red: 0.2, green: 0.27, blue: 0.34).opacity(0.1), radius: 10, x: 0, y: 4)
        })
    }
}

struct FeaturedCourseView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        VStack {
            HStack {
                Text("Featured Subject")
                    .font(.system(size: 14, weight: .medium))
                  .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                Spacer()
                Text("see all")
                    .font(.system(size: 14))
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
            }
            .padding(.horizontal, 25)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(FeaturedCourses.courses) { course in
                        FeaturedCourseCardView(courseImage: course.courseImage, courseCategory: course.courseCategory, courseName: course.courseName, instructorName: course.instructorName, price: course.price)
                        
                    }
                }
                .padding()
            }
        }
    }
}

struct FeaturedCourseCardView: View {
    var courseImage: String
    var courseCategory: String
    var courseName: String
    var instructorName: String
    var price: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            Image(courseImage)
                .resizable()
                .frame(width: 200, height: 200)
            Text(courseCategory)
                .font(.system(size: 10))
                .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
                .frame(width: 86.47773, height: 12.50769, alignment: .topLeading)
            
            Text(courseName)
              .font(.system(size: 14, weight: .semibold))
              .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
            
            Text("By " + instructorName)
                .font(.system(size: 10))
              .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
            
            Text(price)
              .font(.system(size: 12, weight: .semibold))
              .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
        }
    }
}


#Preview{
    HomeView()
}

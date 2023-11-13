//
//  ExploreCourse.swift
//  Msigma-assignment
//
//  Created by Mayonk Kumar Behera on 14/11/23.
//

import Foundation

struct Course: Hashable, Identifiable {
    let id = UUID()
    let courseName: String
    let courseImage: String
    let numberOfStudents: Float
    let percentOff: Int
}

struct FeaturedCourse: Hashable, Identifiable {
    let id = UUID()
    let courseImage: String
    let courseCategory: String
    let courseName: String
    let instructorName: String
    let price: String
}

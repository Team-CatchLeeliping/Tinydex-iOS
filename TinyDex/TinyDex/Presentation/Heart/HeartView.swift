//
//  HeartView.swift
//  TinyDex
//
//  Created by kyungsoolee on 9/18/24.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        VStack(spacing: 0) {
            Header()
            Spacer()
                .frame(height: 20)
            HStack {
                Text("즐겨찾기")
                    .font(.Head.head3)
                    .foregroundStyle(.tinyPink)
            }
            Spacer()
                .frame(height: 28)
            ScrollView {
                VStack(spacing: 0) {
                    TinypingList()
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background {
            Image(.imgHomebackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }

    }
}

// MARK: - 헤더
private struct Header: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("티니핑 도감")
                .font(.Head.head5)
                .foregroundStyle(.tinyPink)
            Spacer()
            SearchView()
        }
    }
}

// MARK: - 검색창
private struct SearchView: View {
    @State private var searchKeyword: String = ""
    var body: some View {
        HStack(spacing: 0) {
            TextField("티니핑을 찾아봐요♥", text: $searchKeyword)
                .font(.Body.body4)
            Image(systemName: SystemImage.search)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.tinyLightpink)
        }
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 40)
                .stroke(.tinyPink, lineWidth: 4)
        }
        .background(.tinyWhite)
        .cornerRadius(40)
        .contentShape(Rectangle())
    }
}

// MARK: - 티니핑 리스트
private struct TinypingList: View {
    private let columns: [GridItem] = Array(repeating: .init(.fixed(180), spacing: nil), count: 2)
    var body: some View {
        LazyVGrid(columns: columns , spacing: 8) {
            ForEach(0..<100, id: \.self) { index in
                TinypingCell()
            }
        }
    }
}

// MARK: - 티니핑 리스트 셀
private struct TinypingCell: View {
    let name: String = "플로라 하츄핑"
    let image: ImageResource = .imgHeartyouping
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text("♡\(name)♡")
                    .font(.Body.body1)
                    .foregroundStyle(.tinyPink)
                Spacer()
                    .frame(height: 10)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
            }
            .frame(width: 180, height: 180)
            .background(.tinyWhite)
            .cornerRadius(20)
            .contentShape(Rectangle())
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
            Image(systemName: SystemImage.heart)
                .resizable()
                .scaledToFit()
                .frame(width: 36)
                .foregroundStyle(.gray5)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                .offset(x: 60 ,y: 60)
        }
    }
}

#Preview {
    HeartView()
}

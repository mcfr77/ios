//
//  DashboardWidgetView.swift
//  Widget
//
//  Created by Marino Faggiana on 20/08/22.
//  Copyright © 2022 Marino Faggiana. All rights reserved.
//
//  Author Marino Faggiana <marino.faggiana@nextcloud.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import SwiftUI
import WidgetKit

struct DashboardWidgetView: View {
    var entry: DashboardDataEntry
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Text(entry.title)
                    .font(.title3)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                VStack(spacing: 5) {
                    ForEach(entry.datas, id: \.id) { element in
                        Link(destination: element.url) {
                            HStack {
                                Image(uiImage: element.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(element.title)
                                        .font(.headline)
                                    Text(element.subTitle)
                                        .font(.subheadline)
                                        .foregroundColor(Color(white: 0.4745))
                                }
                                Spacer()
                            }
                            .padding(5)
                        }
                    }
                }
            }.padding(5)
                .redacted(reason: entry.isPlaceholder ? .placeholder : [])
            Text(entry.footerText)
                    .font(.caption2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.trailing, 10.0)
                    .padding(.bottom, 5.0)
        }
    }
}

struct DashboardWidget_Previews: PreviewProvider {
    static var previews: some View {
        let datas = Array(dashboardDatasTest[0...3])
        let entry = DashboardDataEntry(date: Date(), datas: datas, isPlaceholder: false, title: "Dashboard", footerImage: "checkmark.icloud", footerText: "Nextcloud widget")
        DashboardWidgetView(entry: entry).previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
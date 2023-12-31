import SwiftUI

struct GetStartedView: View {
    
    @State var activePage = 0;
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ContentView(selectedTab: "Home"), label: {
                        Text("Slip to main").fontWeight(.medium)
                        Image(systemName: "chevron.right").font(.subheadline).fontWeight(.semibold)
                    }).foregroundColor(Color.black.opacity(0.7))
                }.padding(15)
                TabView(selection: $activePage) {
                    VStack {
                        Spacer()
                        Image ("mobile")
                            .resizable()
                            .aspectRatio (contentMode: .fit)
                            .frame (height:300)
                        VStack(alignment: .center) {
                            Text ("Order Food")
                                .font(.largeTitle)
                                .fontWeight (.bold)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.ascentDark)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
                                .font(.subheadline)
                                .lineSpacing(5)
                                .fontWeight (.regular)
                        }.multilineTextAlignment(.center).padding(.bottom, 70)
                        Spacer()
                        ButtonPrimary(handleClick: {
                            activePage = 1
                        }, rightIcon: "chevron.right", text: "Next")
                    }.tag(0).padding(10)
                    VStack {
                        Spacer()
                        Image ("shopping")
                            .resizable()
                            .aspectRatio (contentMode: .fit)
                            .frame (height:300)
                        VStack(alignment: .center) {
                            Text ("Easy Payment")
                                .font(.largeTitle)
                                .fontWeight (.bold)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.ascentDark)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
                                .font(.subheadline)
                                .lineSpacing(5)
                                .fontWeight (.regular)
                        }.multilineTextAlignment(.center).padding(.bottom, 70)
                        Spacer()
                        ButtonPrimary(handleClick: {
                            activePage = 2
                        }, rightIcon: "chevron.right", text: "Next")
                    }.tag(1).padding(10)
                    VStack {
                        Spacer()
                        Image ("delivery")
                            .resizable()
                            .aspectRatio (contentMode: .fit)
                            .frame (height:300)
                        VStack(alignment: .center) {
                            Text ("Fast Delivery")
                                .font(.largeTitle)
                                .fontWeight (.bold)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.ascentDark)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
                                .font(.subheadline)
                                .lineSpacing(5)
                                .fontWeight (.regular)
                        }.multilineTextAlignment(.center).padding(.bottom, 70)
                        Spacer()
                        ButtonPrimary(handleClick: {
                            activePage = 1
                        }, rightIcon: "chevron.right", text: "Next")
                    }.tag(2).padding(10)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }.padding(.horizontal, 15)
        }
    }
}


#Preview {
    GetStartedView()
}

//
//  SERIES.swift
//  PrimerParcial_DavidCastillo
//
//  Created by Americo Granados on 06/09/26.
//

import SwiftUI
struct Netflix: Identifiable {
    var id = UUID()
    var nombre: String
    var genero: String
    var imagen: String
    var Temporada: String
    var top10: Bool
    var diamante: Bool
    var episodiogratis: Bool
    
}

struct ContenidoSerieView: View {
    @State private var misSeries = [
        
        Netflix(nombre: "OuterBanks", genero: "Aventura", imagen: "outerbanks", Temporada: "5ta Tenporada", top10: false, diamante: false, episodiogratis: false),
        
        Netflix(nombre: "Gossip girl", genero: "Drama", imagen: "gossipgirl", Temporada: "7ma Tenporada", top10: true, diamante: true, episodiogratis: false),
        
        Netflix(nombre: "Pretty little Liars", genero: "Drama", imagen: "pll", Temporada: "9na Tenporada", top10: false, diamante: true, episodiogratis: true),
        
        Netflix(nombre: "Stranger Things", genero: "Ciencia Ficción", imagen: "strangerthings", Temporada: "Ultima Tenporada", top10: false, diamante: false, episodiogratis: false)
    ]

    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("Lo mas buscado")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundStyle(Color.white)
    
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach(misSeries){
                            NetflixCardView(netflix: $0)
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
    struct NetflixCardView: View{
        let netflix : Netflix
        
        var body: some View{
            VStack(alignment: .leading){//TODO SE VAYA PONIENDO ABAJO
                HStack(spacing: 0){
                    Image(netflix.imagen)
                        .resizable()
                        .scaledToFill()//para que se pueda redondear
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))//redondeo de esquinas
                        .overlay(
                            VStack(alignment: .leading, spacing: 0){
                                VStack(alignment: .leading, spacing: 4){
                                    if netflix.top10{
                                        Text("TOP 10")
                                            .bold()
                                            .padding(4)
                                            .foregroundStyle(Color.white)
                                            .background(Color.red)
                                            .cornerRadius(4)
                                    }
                                    if netflix.diamante{
                                        Image(systemName: "diamond.fill")
                                            .padding(4)
                                            .foregroundColor(.red)
                                            .background(Color.white)
                                            .cornerRadius(4)
                                    }
                                    Spacer()
                                    if netflix.episodiogratis{
                                        Text("Episodio gratis")
                                            .bold()
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .foregroundStyle(Color.black)
                                            .background(Color.white)
                                            .cornerRadius(4)
                                    }
                                }
                            }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(0)
                        )
                    
                    
                }
                HStack{
                    Text(netflix.genero)
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                        .font(Font.body.weight(.semibold))
                }
                HStack{
                    Text(netflix.nombre)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(Font.body.weight(.semibold))
                }
                HStack{
                    Text(netflix.Temporada)
                        .font(.caption)
                        .bold()
                        .foregroundStyle(Color.gray)
                        .font(Font.body.weight(.semibold))
                }
                
                Spacer()
            }
        }
    }
}
    


#Preview {
    ContenidoSerieView()
}

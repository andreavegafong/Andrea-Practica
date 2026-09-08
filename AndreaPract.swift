//
//  AndreaPract.swift
//  PrimerParcial_DavidCastillo
//
//  Created by Americo Granados on 06/09/26.
//

import SwiftUI

//1. La "ficha tecnica" de que datos tiene cada tarjeta
struct Tarjeta: Identifiable {
    var id = UUID()
    var banco: String
    var logo: String
    var digitos: String
    var colorFondo: Color
    var titular: String
    var isVisa: Bool
    
}
struct ContenidoView: View {
    //2. DATOS: Arriva declaramos todas las partes que iran escritas en la tarjeta, aqui escribes esos datos.
    
    @State private var misTarjetas = [
        Tarjeta(banco: "Banamex", logo: "banamex", digitos: "1111 2222 3333 4444", colorFondo: Color.blue, titular: "Andrea Vega Fong", isVisa: true),
        
        Tarjeta(banco: "HeyBanco", logo: "heybanco", digitos: "0000 3232 1212 8989", colorFondo: Color.pink.opacity(0.2), titular: "Andrea Vega Fong", isVisa: false),
        
        Tarjeta(banco: "Mercado Pago", logo: "mercadopago", digitos: "7878 6767 5656 4545 ", colorFondo: Color.yellow, titular: "Andrea Vega Fong", isVisa: true),
        
        Tarjeta(banco: "Nu", logo: "nu", digitos: "7777 8888 9999 1010", colorFondo: Color.purple, titular: "Andrea Vega Fong", isVisa: false),
        
        Tarjeta(banco: "Stori", logo: "stori", digitos: "6543 2347 9678 0109", colorFondo: Color.green, titular: "Andrea Vega Fong", isVisa: false)
    ]
    var body: some View {
        VStack(alignment: .leading){
            Text("Tarjetas de crédito")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView{
                VStack(spacing : -10){
                    ForEach(misTarjetas) { tarjeta in
                        TarjetaCardView(tarjeta: tarjeta)}
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }
}

struct TarjetaCardView: View{
    let tarjeta: Tarjeta //recibe informacion de una sola tarjera
    //FUNCIONALIDAD
    @State private var estaBloqueada = false
    var body: some View{
        VStack(alignment: .leading){
            
            HStack{
                HStack{
                    Text(tarjeta.banco)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                    Image(tarjeta.logo)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Spacer()
                
                HStack{
                    Image("pin")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            HStack{
                //DESAPARECE LOS DIGITOS
                if !estaBloqueada{
                    Text(tarjeta.digitos)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            Spacer()
            HStack{
                //DESAPARECE EL TITULAR
                if !estaBloqueada{
                    Text(tarjeta.titular)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
            }
            Spacer()
            
            HStack{
                //BOTON DE ACCIÓN
                Button(action:{
                    withAnimation(.easeInOut(duration: 0.4)){
                        estaBloqueada.toggle()
                    }
                }){
                    HStack{
                        //candado abuerto -> candado cerrado
                    Image(systemName: estaBloqueada ? "lock.fill" : "lock.open.fill")
                        .foregroundColor(.white)
                    Text(estaBloqueada ? "desbloquear" :"bloquear")
                        .font(.caption)
    
                }
            }
            .foregroundColor(.white)
                Spacer()
                
                if tarjeta.isVisa{
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                        Text("VISA")
                            .foregroundStyle(Color.white)
                            .bold()
                            .italic()
                    }
                }else{
                    VStack(spacing: 2){
                        HStack(spacing: -2){//encima ambos circulos
                            Circle()
                                .fill(Color.red)
                                .frame(width: 30, height: 30)
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 30, height: 30)
                        }
                        Text("Mastercard")
                            .foregroundStyle(Color.white)
                    }
                }
            }
            
                
            }
            .padding()
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            //cambiar a gris si esta bloqueada
            .background(estaBloqueada ? Color.gray : tarjeta.colorFondo)
            .cornerRadius(15)
            .shadow(radius: 5)
            //ROTA SI ESTA BLOQUEADO
            .rotationEffect(.degrees(estaBloqueada ? 180 : 0))
            
        }
        
        
    }
    
    #Preview {
        ContenidoView()
    }

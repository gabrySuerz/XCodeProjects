//
//  Pacco.h
//  Stoccaggio_08-02-2017
//
//  Created by Gabriele Suerz on 08/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Materiale) {
    MaterialeFerro = 0,
    MaterialePlastica = 1,
    MaterialeCarta = 2
};

@interface Pacco : NSObject

    /// Costruttore
-(id) initWithCodice:(NSString *)codice mittente:(NSString *)mittente destinatario:(NSString *)destinario lunghezza:(NSInteger)lunghezza profondita:(NSInteger)profondita altezza:(NSInteger)altezza andMateriale:(Materiale)materiale;

    /// Il codice identificativo del pacco
@property (nonatomic, strong, readonly) NSString *codice;

    /// Il mittente che ha spedito il pacco
@property (nonatomic, strong, readonly) NSString *mittente;

    ///Il destinatario del pacco
@property (nonatomic, strong) NSString *destinatario;

    /// Lunghezza del pacco
@property (nonatomic, readonly) NSInteger lunghezza;

    /// Profondita del pacco
@property (nonatomic, readonly) NSInteger profondita;

    /// Altezza del pacco
@property (nonatomic, readonly) NSInteger altezza;

    ///  Volume del pacco
@property (nonatomic, readonly) NSInteger volume;

    /// Peso del pacco
@property (nonatomic, readonly) NSInteger peso;

    /// Tipo di Materiale del pacco
@property (nonatomic, readonly) Materiale materiale;

@end

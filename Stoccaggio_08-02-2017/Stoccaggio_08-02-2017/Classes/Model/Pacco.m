//
//  Pacco.m
//  Stoccaggio_08-02-2017
//
//  Created by Gabriele Suerz on 08/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "Pacco.h"
#import "Utils.h"

@implementation Pacco

-(id) initWithCodice:(NSString *)codice mittente:(NSString *)mittente destinatario:(NSString *)destinario lunghezza:(NSInteger)lunghezza profondita:(NSInteger)profondita altezza:(NSInteger)altezza andMateriale:(Materiale)materiale {
        // chiamo il costruttore del oggetto da cui eredito (NSObject)
    self = [super init];
        // se costruttore allocato
    if (self) {
        _codice = codice;
        _mittente = mittente;
        _destinatario = destinario;
        _lunghezza = lunghezza;
        _profondita = profondita;
        _altezza = altezza;
        _materiale = materiale;
    }
    
        //ritorna self anche nel caso sia null
    return self;
}

#pragma mark - Getters

-(NSInteger)volume{
    return _lunghezza * _profondita * _altezza;
}

-(NSInteger)peso{
    NSInteger pesoSpecifico = 0;
    
    switch (_materiale) {
        case MaterialeFerro:
            pesoSpecifico = kPesoSpecificoFerro;
            break;
        case MaterialePlastica:
            pesoSpecifico = kPesoSpecificoPlastica;
            break;
        case MaterialeCarta:
            pesoSpecifico = kPesoSpecificoCarta;
            break;
        default:
            break;
    }
    return [self volume] * pesoSpecifico;
}

#pragma mark - Override

-(NSString *)description {
    NSString *newDescription = [NSString stringWithFormat:@"%@\nCodice: %@\nMittente: %@\nDestinatario: %@\nLunghezza: %li\nProfondita: %li\nAltezza: %li\nMateriale: %li\n", [super description], self.codice, self.mittente, self.destinatario, self.lunghezza, self.profondita, self.altezza, self.materiale];
    return newDescription;
}

@end

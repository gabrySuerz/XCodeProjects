//
//  ViewController.m
//  Stoccaggio_08-02-2017
//
//  Created by Gabriele Suerz on 08/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"
#import "CorrieriTableViewController.h"

#import "Pacco.h"
#import "Corriere.h"

@interface ViewController (){
    
    NSInteger totaleVolume, totalePeso, vCorriere;
    NSMutableArray *corrieri;
    NSArray *pacchi;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    totaleVolume = 0;
    totalePeso = 0;
    vCorriere = 300;
    
    pacchi = [self generate:10];
    
    int nCorrieri = [self countCorriere:totaleVolume nCorrieri:0];
    if ([self generateCouriers:nCorrieri]){
        CorrieriTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CorrieriTableViewController"];
        NSLog(@"%@",corrieri);
        [tableViewController setCorrieri:corrieri];
        
            //tableViewController.delegate = self;
        
        [self.navigationController pushViewController:tableViewController animated:true];
    }
    
}

#pragma mark - initialization

    ///Generate with dictionary then added to array
-(NSArray *)generate:(NSInteger)num {
    Pacco *pacco;
    NSMutableArray *arrayPacchi = @[].mutableCopy;
    NSString *codice, *mittente, *destinatario;
    NSInteger lunghezza, profondita, altezza;
    Materiale mat = MaterialeCarta;
    for (int i = 0; i < num; i++){
        switch (arc4random_uniform(3)) {
            case 0:
                mat = MaterialeFerro;
                break;
            case 1:
                mat = MaterialePlastica;
                break;
            case 2:
                mat = MaterialeCarta;
                break;
            default:
                break;
        }
        codice = [NSString stringWithFormat:@"C %i", arc4random_uniform(5000)];
        mittente = [NSString stringWithFormat:@"M %i", arc4random_uniform(5000)];
        destinatario = [NSString stringWithFormat:@"D %i", arc4random_uniform(5000)];
        lunghezza = arc4random_uniform(50);
        profondita = arc4random_uniform(25);
        altezza = 1 + arc4random_uniform(4);
        
        pacco = [[Pacco alloc] initWithCodice:codice mittente:mittente destinatario:destinatario lunghezza:lunghezza profondita:profondita altezza:altezza andMateriale:mat];
        
        /*NSDictionary *paccoD = @{@"codice":codice, @"mittente":mittente, @"destinatario":case .secondo:
         return "Second", @"lunghezza":@(lunghezza), @"profondita":@(profondita), @"altezza":@(altezza), @"materiale":@(mat)};*/
        
        [arrayPacchi addObject:pacco];
        totaleVolume += pacco.volume;
        totalePeso += pacco.peso;
        NSLog(@"%@", pacco);

    }

    return arrayPacchi;
}

    /// Generate the array of couriers
-(bool) generateCouriers:(int)nCorrieri {
    int i = 0, spaceOccupied = 0;
    if (nCorrieri == 0) {
        return true;
    } else {
        Corriere *tempCorriere = [[Corriere alloc] initWithVolume:vCorriere targa:[NSString stringWithFormat:@"T%i", arc4random_uniform(5000)]];
        while (spaceOccupied < vCorriere) {
            Pacco *temp = [pacchi objectAtIndex:i];
            if(temp.volume <= 300){
                [tempCorriere.pacchi addObject:temp];
                spaceOccupied += temp.volume;
                NSLog(@"%li",temp.volume);
            } 
            i++;
        }
        [corrieri addObject:tempCorriere];
        return [self generateCouriers:nCorrieri - 1];
    }
}

#pragma mark - calcutation

-(int)countCorriere:(NSInteger)totVolume nCorrieri:(int)nCor {
    if(totVolume <= vCorriere) {
        return nCor + 1;
    } else {
        return [self countCorriere:totVolume - vCorriere nCorrieri:nCor + 1];
    }
}

#pragma mark - ScoreTableViewDelegate

-(NSArray *)scoreTableViewFetchResults {
    return corrieri;
}

-(void)scoreTableViewDidFetchResults {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end

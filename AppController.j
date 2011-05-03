/*
 * AppController.j
 * SBIF
 *
 * Created by You on April 27, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    @outlet CPWindow        theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPTabView       tabView;
    @outlet CPTableView     table;
    @outlet CPPopUpButton   yearPopUpButton;
    @outlet CPImageView     buscarSpinner;
    @outlet CPButton        buscarButton;
    @outlet GRaphael        raphael;
    @outlet CPCheckBox      checkUF;
    @outlet CPCheckBox      checkDolar;
    @outlet CPCheckBox      checkEuro;
    @outlet CPCheckBox      checkLog;
    
    @outlet CPView          paso1;
    
    JSObject                datos;
    JSObject                fechas;
    
    CPObject                urlUF;
    CPObject                urlUTM;
    CPObject                urlDolar;
    CPObject                urlEuro;
    JSObject                count;

    JSObject                datasetUF;
    JSObject                datasetDolar;
    JSObject                datasetEuro;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification {
    CPLog.debug('termine!');
    [self buscar:self];
}

- (void)awakeFromCib {
    datos = null;
    fechas = new Array();
    datasetUF = [[],[],[]];
    datasetDolar = [[],[],[]];
    datasetEuro = [[],[],[]];

    [tabView setBackgroundColor:[CPColor whiteColor]];
    
    var tabViewItem1 = [[CPTabViewItem alloc] initWithIdentifier:"Indicadores"];
    [tabViewItem1 setView:paso1];
    [tabViewItem1 setLabel:"Indicadores Financieros"];
    [tabView addTabViewItem:tabViewItem1];
    
    [table setDataSource:self];
    [buscarSpinner setHidden:YES];
    
    [yearPopUpButton removeAllItems];
    for (var i = 2011; i > 2000; i--) {
        [yearPopUpButton addItemWithTitle:"" + i];
    }
}

- (@action)buscar:(id)sender {
    var year = [[yearPopUpButton selectedItem] title];
    [buscarSpinner setHidden:NO];
    [buscarButton setEnabled:NO];
    [yearPopUpButton setEnabled:NO];
    [raphael removeAllDatasets];

    var prefix = "http://aldrin.martoq.cl/huevapi/SBIF/api-sbif.php/recursos/";
    
    var urlUF = prefix + "uf/" + year;
    var urlDolar = prefix + "dolar/" + year;
    var urlEuro = prefix + "euro/" + year;
    
    CPLog.debug('uf   : ' + urlUF);
    CPLog.debug('dolar: ' + urlDolar);
    CPLog.debug('euro : ' + urlEuro);
    
    var reqUF = [[CPURLRequest alloc] initWithURL:urlUF];
    var reqDolar = [[CPURLRequest alloc] initWithURL:urlDolar];
    var reqEuro = [[CPURLRequest alloc] initWithURL:urlEuro];
    
    count = 3;
    
    datos = {};
    fechas = [];
    [table reloadData];

    urlUF = [CPURLConnection connectionWithRequest:reqUF delegate:self];
    urlDolar = [CPURLConnection connectionWithRequest:reqDolar delegate:self];
    urlEuro = [CPURLConnection connectionWithRequest:reqEuro delegate:self];
    
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)data {
    try {
        var tmp = [data objectFromJSON];

        if (aConnection == urlUF) {
            for (var i in tmp.UFs) {
                var f = tmp.UFs[i].Fecha;
                var v = tmp.UFs[i].Valor;

                if (!f && !v) {
                    break;
                }

                if (!datos[f]) {
                    datos[f] = {};
                    datos[f].fecha = f;
                    fechas.push(f);
                }
                v = v.replace('.', '');
                v = v.replace(',', '.');

                datos[f].uf = parseFloat(v);
            }
        } else if (aConnection == urlDolar) {
            for (var i in tmp.Dolares) {
                var f = tmp.Dolares[i].Fecha;
                var v = tmp.Dolares[i].Valor;

                if (!f && !v) {
                    break;
                }

                if (!datos[f]) {
                    datos[f] = {};
                    datos[f].fecha = f;
                    fechas.push(f);
                }
                v = v.replace('.', '');
                v = v.replace(',', '.');

                datos[f].dolar = parseFloat(v);
            }
        } else if (aConnection == urlEuro) {
            for (var i in tmp.Euros) {
                var f = tmp.Euros[i].Fecha;
                var v = tmp.Euros[i].Valor;

                if (!f && !v) {
                    break;
                }

                if (!datos[f]) {
                    datos[f] = {};
                    datos[f].fecha = f;
                    fechas.push(f);
                }
                v = v.replace('.', '');
                v = v.replace(',', '.');

                datos[f].euro = parseFloat(v);
            }
        }        
    } catch (err) {
        CPLog.debug('error: ' + err);
    }
    
    count--;
    fechas.sort();
    [table reloadData];

    if (count == 0) {

        [buscarSpinner setHidden:YES];
        [buscarButton setEnabled:YES];        
        [yearPopUpButton setEnabled:YES];

        var ex = [],
            ey = [],
            el = [],
            ux = [],
            uy = [],
            ul = [],
            dx = [],
            dy = [],
            dl = [];

        for (var i in fechas) {
            var x = datos[fechas[i]];
            if (x) {
                if (x.dolar) {
                    dx.push(i);
                    dy.push(x.dolar);
                    dl.push(Math.log(x.dolar));
                }
                if (x.euro) {
                    ex.push(i);
                    ey.push(x.euro);
                    el.push(Math.log(x.euro));
                }
                if (x.uf) {
                    ux.push(i);
                    uy.push(x.uf);
                    ul.push(Math.log(x.uf));
                }
            }
        }
        datasetUF = [ux, uy, ul];
        datasetDolar = [dx, dy, dl];
        datasetEuro = [ex, ey, el];
        
        [self redibujar:self];
    }
}

- (@action)redibujar:(id)sender {
    [raphael removeAllDatasets];

    if ([checkUF state]) {
        if ([checkLog state]) {
            [raphael addDataset:"UF" ValuesX:datasetUF[0] ValuesY:datasetUF[2]];
        } else {
            [raphael addDataset:"UF" ValuesX:datasetUF[0] ValuesY:datasetUF[1]];
        }
    }
    if ([checkDolar state]) {
        if ([checkLog state]) {
            [raphael addDataset:"Dolar" ValuesX:datasetDolar[0] ValuesY:datasetDolar[2]];
        } else {
            [raphael addDataset:"Dolar" ValuesX:datasetDolar[0] ValuesY:datasetDolar[1]];
        }
    }
    if ([checkEuro state]) {
        if ([checkLog state]) {
            [raphael addDataset:"Euro" ValuesX:datasetEuro[0] ValuesY:datasetEuro[2]];
        } else {
            [raphael addDataset:"Euro" ValuesX:datasetEuro[0] ValuesY:datasetEuro[1]];
        }
    }

    [raphael drawRaphael];
}

// {'2011-04-27' : {
//     'uf' : 1000,
//     'dolar' : 2000,
//     'euro'   : 4000
// }}

- (int)numberOfRowsInTableView:(CPTableView)aTableView {
    return fechas.length;
}


- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRowIndex {
    var identifier = [aColumn identifier];
    
    return datos[fechas[aRowIndex]][identifier];
}

@end

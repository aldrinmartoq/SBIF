/*
 * AppController.j
 * SBIF
 *
 * Created by You on April 27, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

function graphSBIF(w,h,a,b) {
    var urlPart1 = "https://chart.googleapis.com/chart?cht=lc&chd=t:";
    var urlPart2 = "&chs=" + w + "x" + h + "&chco=0000FF,00FF00&chtt=Powered+by+Huevapi|Valores+financieros+2011&chxl=0:|Ene|Feb|Mar|Abr&chxt=x,y";
    var urlData = "";
    for(var i =0;i<a.length;i++)    {
        urlData = urlData + a[i]
        if(i!=a.length-1) {
            urlData = urlData + ",";
        } 
    }
    urlData = urlData + "|";
    for(var i =0;i<b.length;i++)    {
        urlData = urlData + b[i]
        if(i!=b.length-1) {
            urlData = urlData + ",";
        }
    }
    return urlPart1+urlData+urlPart2;
}


@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    @outlet CPWindow        theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPTableView     table;
    @outlet CPPopUpButton   yearPopUpButton;
    @outlet CPImageView     buscarSpinner;
    @outlet CPButton        buscarButton;
    @outlet CPWebView       webView;
    @outlet CPTabView       tabView;
    
    @outlet CPView          paso1;
    
    JSObject                datos;
    JSObject                fechas;
    
    CPObject                urlUF;
    CPObject                urlUTM;
    CPObject                urlDolar;
    CPObject                urlEuro;
    JSObject                count;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib {
    datos = null;
    fechas = new Array();
    
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
    [webView setMainFrameURL:"t.html"];
}

- (@action)buscar:(id)sender {
    var year = [[yearPopUpButton selectedItem] title];
    [buscarSpinner setHidden:NO];
    [buscarButton setEnabled:NO];
    
    var urlUF = "http://api.sbif.cl/api-sbif/recursos/uf/" + year + "?apikey=b7e4ef2d3b8ed7e62a1fba8bcc50a97a536e6d98&formato=json";
    var urlDolar = "http://api.sbif.cl/api-sbif/recursos/dolar/" + year + "?apikey=b7e4ef2d3b8ed7e62a1fba8bcc50a97a536e6d98&formato=json";
    var urlEuro = "http://api.sbif.cl/api-sbif/recursos/euro/" + year + "?apikey=b7e4ef2d3b8ed7e62a1fba8bcc50a97a536e6d98&formato=json";
    
    CPLog.debug('uf   : ' + urlUF);
    CPLog.debug('dolar: ' + urlDolar);
    CPLog.debug('euro : ' + urlEuro);
    
    var reqUF = [[CPURLRequest alloc] initWithURL:urlUF];
    var reqDolar = [[CPURLRequest alloc] initWithURL:urlDolar];
    var reqEuro = [[CPURLRequest alloc] initWithURL:urlEuro];
    
    count = 3;
    
    datos = {};
    fechas = [];
    
    urlUF = [CPURLConnection connectionWithRequest:reqUF delegate:self];
    urlDolar = [CPURLConnection connectionWithRequest:reqDolar delegate:self];
    urlEuro = [CPURLConnection connectionWithRequest:reqEuro delegate:self];
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)data {
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
            datos[f].uf = v;
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
    
    count--;

    if (count == 0) {
        fechas.sort();
        [table reloadData];
        [buscarSpinner setHidden:YES];
        [buscarButton setEnabled:YES];        
        
        
        
        var d1 = new Array();
        var e1 = new Array();
        var d2 = new Array();
        var e2 = new Array();
        
        // [webView loadHTMLString:s];
        
        var labels = [1,2,3,4];
        var datas = [5,6,7,8];
        CPLog.debug('labels: ' + labels + ' datas: ' + datas);
        var r = [webView objectByEvaluatingJavaScriptFromString:"ejecuta([0,1,2],[0,'',2])"];
        // var r = [[webView windowScriptObject] callWebScriptMethod:"ejecuta" withArguments:[labels, datas]];
        CPLog.debug('r: ' + r);
        
        
        // for (var i in fechas) {
        //     var x = datos[fechas[i]];
        //     var ii = Math.floor(i/4);
        //     d1.push(x ? x.dolar : d1[d1.length - 1]);
        //     e1.push(x ? x.euro : e1[e1.length - 1]);
        //     if (i % 4 == 1) {
        //         d2[ii] = (d1[i] + d1[i-1] + d1[i-2] + d1[i-3]) / 4;
        //         e2[ii] = (e1[i] + e1[i-1] + e1[i-2] + e1[i-3]) / 4;
        //         d2[ii] = d2[ii] ? d2[ii] : 0;
        //         e2[ii] = e2[ii] ? e2[ii] : 0;
        //         CPLog.debug(' i:' + i + ' ' + ii + ' d: ' + d1[i] + ' / ' + d2[ii] + ' e: ' + e1[i] + ' / ' + e2[ii]);
        //     }
        // }
        // 
        // var frame = [webView frame];
        // [webView setMainFrameURL:graphSBIF(frame.size.width, frame.size.height, d2,e2)];
    }
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

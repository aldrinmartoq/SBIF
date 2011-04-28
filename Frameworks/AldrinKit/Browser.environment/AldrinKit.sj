@STATIC;1.0;p;11;AldrinKit.jt;211;@STATIC;1.0;I;20;AppKit/CPTableView.ji;16;GoogleMapsView.ji;14;RutTextField.jt;128;
objj_executeFile("AppKit/CPTableView.j",NO);
objj_executeFile("GoogleMapsView.j",YES);
objj_executeFile("RutTextField.j",YES);
p;23;CPControl+Integration.jt;589;@STATIC;1.0;i;29;CPControlAttributeInspector.jt;537;
objj_executeFile("CPControlAttributeInspector.j",YES);
var _1=objj_getClass("CPControl");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("atlasPopulateAttributeInspectorClasses:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl").super_class},"atlasPopulateAttributeInspectorClasses:",_5);
objj_msgSend(_5,"addObject:",objj_msgSend(CPControlAttributeInspector,"class"));
}
})]);
p;29;CPControlAttributeInspector.jt;3610;@STATIC;1.0;I;19;AtlasKit/AtlasKit.jt;3567;
objj_executeFile("AtlasKit/AtlasKit.j",NO);
var _1=objj_allocateClassPair(AKInspector,"CPControlAttributeInspector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("align"),new objj_ivar("fontSize"),new objj_ivar("bold"),new objj_ivar("underline"),new objj_ivar("italic"),new objj_ivar("bordered"),new objj_ivar("selectable"),new objj_ivar("editable"),new objj_ivar("enabled")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("label"),function(_3,_4){
with(_3){
return "Extras";
}
}),new objj_method(sel_getUid("viewCibName"),function(_5,_6){
with(_5){
return "CPControlAttributeInspector";
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_7,_8){
with(_7){
objj_msgSend(align,"removeAllItems");
objj_msgSend(align,"addItemWithTitle:","Left");
objj_msgSend(align,"addItemWithTitle:","Right");
objj_msgSend(align,"addItemWithTitle:","Center");
objj_msgSend(align,"addItemWithTitle:","Justified");
objj_msgSend(align,"addItemWithTitle:","Natural");
objj_msgSend(align,"setTarget:",_7);
objj_msgSend(align,"setAction:",sel_getUid("textAlign:"));
objj_msgSend(bold,"setButtonType:",6);
objj_msgSend(underline,"setButtonType:",6);
objj_msgSend(italic,"setButtonType:",6);
}
}),new objj_method(sel_getUid("textAlign:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(_9,"inspectedObjects");
var a=objj_msgSend(align,"indexOfItem:",objj_msgSend(align,"selectedItem"));
for(var i=0,_d=_c.length;i<_d;i++){
objj_msgSend(_c[i],"setAlignment:",a);
}
}
}),new objj_method(sel_getUid("changeBordered:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(_e,"inspectedObjects");
var v=objj_msgSend(bordered,"state");
CPLog.debug("bordered change: "+v);
for(var i=0,len=_11.length;i<len;i++){
var o=_11[i];
if(objj_msgSend(o,"respondsToSelector:",sel_getUid("setBordered:"))){
objj_msgSend(o,"setBordered:",v);
}
}
}
}),new objj_method(sel_getUid("changeSelectable:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"inspectedObjects");
var v=objj_msgSend(selectable,"state");
CPLog.debug("selectable change: "+v);
for(var i=0,len=_15.length;i<len;i++){
var o=_15[i];
if(objj_msgSend(o,"respondsToSelector:",sel_getUid("setSelectable:"))){
objj_msgSend(o,"setSelectable:",v);
}
}
}
}),new objj_method(sel_getUid("changeEditable:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(_16,"inspectedObjects");
var v=objj_msgSend(editable,"state");
CPLog.debug("editable change: "+v);
for(var i=0,len=_19.length;i<len;i++){
var o=_19[i];
if(objj_msgSend(o,"respondsToSelector:",sel_getUid("setEditable:"))){
objj_msgSend(o,"setEditable:",v);
}
}
}
}),new objj_method(sel_getUid("changeEnabled:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1a,"inspectedObjects");
var v=objj_msgSend(enable,"state");
CPLog.debug("enabled change: "+v);
for(var i=0,len=_1d.length;i<len;i++){
var o=_1d[i];
if(objj_msgSend(o,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(o,"setEnabled:",v);
}
}
}
}),new objj_method(sel_getUid("refresh"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(_1e,"inspectedObjects");
var _21=null;
for(var i=0,len=_20.length;i<len;i++){
var o=_20[i];
var _22=objj_msgSend(o,"alignment");
if(_21!=null&&_21!=_22){
_21=null;
break;
}
_21=_22;
}
objj_msgSend(align,"selectItemAtIndex:",_21);
objj_msgSend(bordered,"takeValueFromKeyPath:ofObjects:","bordered",_20);
objj_msgSend(selectable,"takeValueFromKeyPath:ofObjects:","selectable",_20);
objj_msgSend(editable,"takeValueFromKeyPath:ofObjects:","editable",_20);
objj_msgSend(enabled,"takeValueFromKeyPath:ofObjects:","enabled",_20);
}
})]);
p;25;CPTableView+Integration.jt;601;@STATIC;1.0;i;31;CPTableViewAttributeInspector.jt;547;
objj_executeFile("CPTableViewAttributeInspector.j",YES);
var _1=objj_getClass("CPTableView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("atlasPopulateAttributeInspectorClasses:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTableView").super_class},"atlasPopulateAttributeInspectorClasses:",_5);
objj_msgSend(_5,"addObject:",objj_msgSend(CPTableViewAttributeInspector,"class"));
}
})]);
p;31;CPTableViewAttributeInspector.jt;6382;@STATIC;1.0;I;19;AtlasKit/AtlasKit.jt;6339;
objj_executeFile("AtlasKit/AtlasKit.j",NO);
var _1=objj_allocateClassPair(AKInspector,"CPTableViewAttributeInspector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("allowsColumnReordering"),new objj_ivar("allowsColumnResizing"),new objj_ivar("allowsColumnSelection"),new objj_ivar("allowsEmptySelection"),new objj_ivar("allowsMultipleSelection"),new objj_ivar("usesAlternatingRowBackgroundColors"),new objj_ivar("hiddenTableHeaders"),new objj_ivar("tableColumnsTable"),new objj_ivar("tableColumnsTableName"),new objj_ivar("tableColumnsTableIdentifier"),new objj_ivar("tableColumnsAdd"),new objj_ivar("tableColumnsRemove"),new objj_ivar("tableView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("label"),function(_3,_4){
with(_3){
return "Table View";
}
}),new objj_method(sel_getUid("viewCibName"),function(_5,_6){
with(_5){
return "CPTableViewAttributeInspector";
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_7,_8){
with(_7){
var _9=objj_msgSend(tableColumnsTable,"tableColumns");
tableColumnsTableName=_9[0];
tableColumnsTableIdentifier=_9[1];
objj_msgSend(tableColumnsTable,"setDelegate:",_7);
objj_msgSend(tableColumnsTable,"setDataSource:",_7);
}
}),new objj_method(sel_getUid("refresh"),function(_a,_b){
with(_a){
var _c=objj_msgSend(_a,"inspectedObjects");
if(objj_msgSend(_c,"count")>0){
tableView=_c[0];
}
objj_msgSend(allowsColumnReordering,"takeValueFromKeyPath:ofObjects:","allowsColumnReordering",_c);
objj_msgSend(allowsColumnResizing,"takeValueFromKeyPath:ofObjects:","allowsColumnResizing",_c);
objj_msgSend(allowsColumnSelection,"takeValueFromKeyPath:ofObjects:","allowsColumnSelection",_c);
objj_msgSend(allowsEmptySelection,"takeValueFromKeyPath:ofObjects:","allowsEmptySelection",_c);
objj_msgSend(allowsMultipleSelection,"takeValueFromKeyPath:ofObjects:","allowsMultipleSelection",_c);
objj_msgSend(usesAlternatingRowBackgroundColors,"takeValueFromKeyPath:ofObjects:","usesAlternatingRowBackgroundColors",_c);
objj_msgSend(hiddenTableHeaders,"takeValueFromKeyPath:ofObjects:","headerView.hidden",_c);
objj_msgSend(tableColumnsTable,"reloadData");
}
}),new objj_method(sel_getUid("takeAllowsColumnReorderingFrom:"),function(_d,_e,_f){
with(_d){
objj_msgSend(objj_msgSend(_d,"inspectedObjects"),"makeObjectsPerformSelector:withObject:",sel_getUid("setAllowsColumnReordering:"),objj_msgSend(_f,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("takeAllowsColumnResizingFrom:"),function(_10,_11,_12){
with(_10){
objj_msgSend(objj_msgSend(_10,"inspectedObjects"),"makeObjectsPerformSelector:withObject:",sel_getUid("setAllowsColumnResizing:"),objj_msgSend(_12,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("takeAllowsColumnSelectionFrom:"),function(_13,_14,_15){
with(_13){
objj_msgSend(objj_msgSend(_13,"inspectedObjects"),"makeObjectsPerformSelector:withObject:",sel_getUid("setAllowsColumnSelection:"),objj_msgSend(_15,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("takeAllowsEmptySelectionFrom:"),function(_16,_17,_18){
with(_16){
objj_msgSend(objj_msgSend(_16,"inspectedObjects"),"makeObjectsPerformSelector:withObject:",sel_getUid("setAllowsEmptySelection:"),objj_msgSend(_18,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("takeAllowsMultipleSelectionFrom:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(objj_msgSend(_19,"inspectedObjects"),"makeObjectsPerformSelector:withObject:",sel_getUid("setAllowsMultipleSelection:"),objj_msgSend(_1b,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("takeUsesAlternatingRowBackgroundColorsFrom:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(objj_msgSend(_1c,"inspectedObjects"),"makeObjectsPerformSelector:withObject:",sel_getUid("setUsesAlternatingRowBackgroundColors:"),objj_msgSend(_1e,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("takeHiddenTableHeadersFrom:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(objj_msgSend(tableView,"headerView"),"setHidden:",objj_msgSend(_21,"intValue"));
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(tableView,"tableColumns");
var _26=""+_25.length;
var _27="Column "+_26;
var col=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:",_26);
objj_msgSend(objj_msgSend(col,"headerView"),"setStringValue:",_27);
objj_msgSend(objj_msgSend(col,"headerView"),"sizeToFit");
objj_msgSend(tableView,"addTableColumn:",col);
objj_msgSend(tableColumnsTable,"reloadData");
objj_msgSend(tableView,"display");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(tableColumnsTable,"selectedRow");
var _2c=objj_msgSend(tableView,"tableColumns");
if(_2b<0){
return;
}
var _2d=_2c[_2b];
objj_msgSend(tableView,"removeTableColumn:",_2d);
objj_msgSend(tableColumnsTable,"reloadData");
objj_msgSend(tableView,"display");
}
})]);
var _1=objj_getClass("CPTableViewAttributeInspector");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableViewAttributeInspector\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(tableView,"numberOfColumns");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_31,_32,_33,_34,_35){
with(_31){
var _36=objj_msgSend(tableView,"tableColumns");
if(_34==tableColumnsTableName){
return objj_msgSend(objj_msgSend(_36[_35],"headerView"),"stringValue");
}else{
if(_34==tableColumnsTableIdentifier){
return objj_msgSend(_36[_35],"identifier");
}
}
return "-";
}
}),new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"),function(_37,_38,_39,_3a,_3b,_3c){
with(_37){
var _3d=objj_msgSend(tableView,"tableColumns");
if(_3b==tableColumnsTableName){
objj_msgSend(objj_msgSend(_3d[_3c],"headerView"),"setStringValue:",_3a);
}else{
if(_3b==tableColumnsTableIdentifier){
objj_msgSend(_3d[_3c],"setIdentifier:",_3a);
}
}
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(tableColumnsTable,"selectedRow");
objj_msgSend(tableColumnsRemove,"setEnabled:",(_41>=0));
}
})]);
p;23;CPTabView+Integration.jt;589;@STATIC;1.0;i;29;CPTabViewAttributeInspector.jt;537;
objj_executeFile("CPTabViewAttributeInspector.j",YES);
var _1=objj_getClass("CPTabView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTabView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("atlasPopulateAttributeInspectorClasses:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTabView").super_class},"atlasPopulateAttributeInspectorClasses:",_5);
objj_msgSend(_5,"addObject:",objj_msgSend(CPTabViewAttributeInspector,"class"));
}
})]);
p;29;CPTabViewAttributeInspector.jt;3110;@STATIC;1.0;I;19;AtlasKit/AtlasKit.jt;3067;
objj_executeFile("AtlasKit/AtlasKit.j",NO);
var _1=objj_allocateClassPair(AKInspector,"CPTabViewAttributeInspector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("viewsTable"),new objj_ivar("viewsTableTitle"),new objj_ivar("viewsTableIdentifier"),new objj_ivar("viewsAdd"),new objj_ivar("viewsRemove"),new objj_ivar("tabView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("label"),function(_3,_4){
with(_3){
return "Tab View";
}
}),new objj_method(sel_getUid("viewCibName"),function(_5,_6){
with(_5){
return "CPTabViewAttributeInspector";
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_7,_8){
with(_7){
var _9=objj_msgSend(viewsTable,"tableColumns");
viewsTableTitle=_9[0];
viewsTableIdentifier=_9[1];
objj_msgSend(viewsTable,"setDelegate:",_7);
objj_msgSend(viewsTable,"setDataSource:",_7);
}
}),new objj_method(sel_getUid("refresh"),function(_a,_b){
with(_a){
var _c=objj_msgSend(_a,"inspectedObjects");
if(objj_msgSend(_c,"count")!=1){
objj_msgSend(viewsTable,"setEnabled:",NO);
tabView=null;
}else{
objj_msgSend(viewsTable,"setEnabled:",YES);
tabView=_c[0];
}
objj_msgSend(viewsTable,"reloadData");
}
}),new objj_method(sel_getUid("addView:"),function(_d,_e,_f){
with(_d){
var len=objj_msgSend(tabView,"numberOfTabViewItems");
var _10=""+(len+1);
var _11="Tab "+_10;
var v=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(tabView,"bounds")),50));
var _12=objj_msgSend(objj_msgSend(CPTabViewItem,"alloc"),"initWithIdentifier:",_10);
objj_msgSend(_12,"setLabel:",_11);
objj_msgSend(_12,"setView:",v);
objj_msgSend(tabView,"addTabViewItem:",_12);
objj_msgSend(tabView,"selectLastTabViewItem:",null);
objj_msgSend(viewsTable,"reloadData");
}
}),new objj_method(sel_getUid("removeView:"),function(_13,_14,_15){
with(_13){
}
})]);
var _1=objj_getClass("CPTabViewAttributeInspector");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTabViewAttributeInspector\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_16,_17,_18){
with(_16){
return objj_msgSend(tabView,"numberOfTabViewItems");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
var _1e=objj_msgSend(tabView,"tabViewItems");
if(_1c==viewsTableTitle){
return objj_msgSend(_1e[_1d],"label");
}else{
if(_1c==viewsTableIdentifier){
return objj_msgSend(_1e[_1d],"identifier");
}
}
return "-";
}
}),new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"),function(_1f,_20,_21,_22,_23,_24){
with(_1f){
var _25=objj_msgSend(tabView,"tabViewItems");
if(_23==viewsTableTitle){
objj_msgSend(_25[_24],"setLabel:",_22);
objj_msgSend(tabView,"_updateItems");
}else{
if(_23==viewsTableIdentifier){
objj_msgSend(_25[_24],"setIdentifier:",_22);
}
}
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(viewsTable,"selectedRow");
objj_msgSend(viewsRemove,"setEnabled:",(_29>=0));
}
})]);
p;16;GoogleMapsView.jt;8692;@STATIC;1.0;I;15;AppKit/CPView.jt;8653;
objj_executeFile("AppKit/CPView.j",NO);
var _1="GoogleMapsViewDidChangeBoundsNotification",_2="GoogleMapsViewWillGeocodeNotification",_3="GoogleMapsViewDidGeocodeNotification",_4="GoogleMapsViewWillGeolocateNotification",_5="GoogleMapsViewDidGeolocateNotification";
var _6=objj_allocateClassPair(CPView,"GoogleMapsView"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_delegate"),new objj_ivar("m_mapRegion"),new objj_ivar("m_DOMMapElement"),new objj_ivar("m_map"),new objj_ivar("m_geocoder"),new objj_ivar("m_mainMark"),new objj_ivar("m_markers"),new objj_ivar("m_infoWindow")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GoogleMapsView").super_class},"initWithFrame:",_a);
if(_8){
objj_msgSend(_8,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",229/255,227/255,223/255,0.5));
objj_msgSend(_8,"_buildDOM");
}
return _8;
}
}),new objj_method(sel_getUid("_buildDOM"),function(_b,_c){
with(_b){
_d(function(){
m_DOMMapElement=document.createElement("div");
m_DOMMapElement.id="MKMapView"+objj_msgSend(_b,"UID");
var _e=m_DOMMapElement.style,_f=objj_msgSend(_b,"bounds"),_10=CGRectGetWidth(_f),_11=CGRectGetHeight(_f);
_e.overflow="hidden";
_e.position="absolute";
_e.visibility="visible";
_e.zIndex=0;
_e.left=-_10+"px";
_e.top=-_11+"px";
_e.width=_10+"px";
_e.height=_11+"px";
var _12={zoom:14,streetViewControl:false,center:new google.maps.LatLng(-33.44,-70.633),mapTypeId:google.maps.MapTypeId.ROADMAP};
m_map=new google.maps.Map(m_DOMMapElement,_12);
m_markers=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
google.maps.event.addListener(m_map,"dragend",function(){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_b);
});
var x=new Array();
x.push(google.maps.event.addListener(m_map,"idle",function(){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_b);
google.maps.event.removeListener(x[0]);
}));
_e.left="0px";
_e.top="0px";
_DOMElement.appendChild(m_DOMMapElement);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_b);
});
}
}),new objj_method(sel_getUid("delegate"),function(_13,_14){
with(_13){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_18,"removeObserver:name:object:",_delegate,_1,_15);
}
_delegate=_17;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("googleMapsViewDidChangeBounds:"))){
objj_msgSend(_18,"addObserver:selector:name:object:",_delegate,sel_getUid("googleMapsViewDidChangeBounds:"),_1,_15);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("googleMapsViewWillGeocode:"))){
objj_msgSend(_18,"addObserver:selector:name:object:",_delegate,sel_getUid("googleMapsViewWillGeocode:"),_2,_15);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("googleMapsViewDidGeocode:"))){
objj_msgSend(_18,"addObserver:selector:name:object:",_delegate,sel_getUid("googleMapsViewDidGeocode:"),_3,_15);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("googleMapsViewWillGeolocate:"))){
objj_msgSend(_18,"addObserver:selector:name:object:",_delegate,sel_getUid("googleMapsViewWillGeolocate:"),_4,_15);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("googleMapsViewDidGeolocate:"))){
objj_msgSend(_18,"addObserver:selector:name:object:",_delegate,sel_getUid("googleMapsViewDidGeolocate:"),_5,_15);
}
}
}),new objj_method(sel_getUid("map"),function(_19,_1a){
with(_19){
return m_map;
}
}),new objj_method(sel_getUid("mapRegion"),function(_1b,_1c){
with(_1b){
return m_mapRegion;
}
}),new objj_method(sel_getUid("setMapRegion:"),function(_1d,_1e,_1f){
with(_1d){
m_mapRegion=_1f;
}
}),new objj_method(sel_getUid("mainMark"),function(_20,_21){
with(_20){
return m_mainMark;
}
}),new objj_method(sel_getUid("mapCenter"),function(_22,_23){
with(_22){
return m_map.getCenter();
}
}),new objj_method(sel_getUid("setMainMarkAtCenter"),function(_24,_25){
with(_24){
if(m_mainMark){
m_mainMark.setPosition(m_map.getCenter());
m_mainMark.setAnimation(google.maps.Animation.DROP);
}else{
m_mainMark=new google.maps.Marker({position:m_map.getCenter(),draggable:false,map:m_map,animation:google.maps.Animation.DROP});
}
}
}),new objj_method(sel_getUid("clearMarkers"),function(_26,_27){
with(_26){
for(var i=0;i<m_markers.length;i++){
m_markers[i].setMap(null);
}
m_markers=new Array();
}
}),new objj_method(sel_getUid("addMarkerData:withIcon:"),function(_28,_29,_2a,_2b){
with(_28){
for(var i=0;i<_2a.length;i++){
var _2c=_2a[i];
var _2d=new google.maps.Marker({position:new google.maps.LatLng(_2c["latlng"][0],_2c["latlng"][1]),title:_2c["title"],draggable:false,icon:_2b,map:m_map});
_2c["marker"]=_2d;
m_markers.push(_2d);
_2d.content=_2c["info"];
var _2e=new google.maps.InfoWindow({content:_2c["info"]});
google.maps.event.addListener(_2d,"click",function(){
_2e.open(m_map,_2d);
});
}
}
}),new objj_method(sel_getUid("showInfoForMarker:"),function(_2f,_30,_31){
with(_2f){
CPLog.debug("marker is "+_31.getPosition()+" "+_31.content);
m_infoWindow=new google.maps.InfoWindow({content:_31.content});
m_infoWindow.open(m_map,_31);
}
}),new objj_method(sel_getUid("geoCode"),function(_32,_33){
with(_32){
if(!m_geocoder){
m_geocoder=new google.maps.Geocoder();
}
return m_geocoder;
}
}),new objj_method(sel_getUid("geoCode:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"geoCode");
if(objj_msgSend(_36,"stringByTrimmingWhitespace")==""){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_2,_34);
m_geocoder.geocode({"address":_36+", Chile","region":"cl","language":"es","bounds":m_map.getBounds()},function(_37,_38){
if(_38==google.maps.GeocoderStatus.OK){
CPLog.debug("resultados: "+JSON.stringify(_37));
m_map.setCenter(_37[0].geometry.address);
m_map.fitBounds(_37[0].geometry.viewport);
}else{
CPLog.warn("geolocation failed: "+_38);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_3,_34);
});
}
}),new objj_method(sel_getUid("geoLocate"),function(_39,_3a){
with(_39){
if(navigator.geolocation){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_4,_39);
navigator.geolocation.getCurrentPosition(function(_3b){
var _3c=new google.maps.LatLng(_3b.coords.latitude,_3b.coords.longitude);
m_map.setCenter(_3c);
m_map.setZoom(15);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_5,_39);
});
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_3d,_3e){
with(_3d){
return YES;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3f,_40,_41){
with(_3f){
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("GoogleMapsView").super_class},"setFrameSize:",_41);
if(m_DOMMapElement){
var _42=objj_msgSend(_3f,"bounds"),_43=m_DOMMapElement.style;
_43.width=CGRectGetWidth(_42)+"px";
_43.height=CGRectGetHeight(_42)+"px";
google.maps.event.trigger(m_map,"resize");
}
}
})]);
var _44=[];
var _d=function(_45){
_44.push(_45);
_d=function(_46){
_44.push(_46);
};
if(window.google&&google.maps){
_GoogleMapsViewCallback();
}else{
var _47=document.createElement("script");
_47.type="text/javascript";
_47.src="http://maps.google.com/maps/api/js?sensor=true&callback=_GoogleMapsViewCallback";
document.getElementsByTagName("head")[0].appendChild(_47);
}
};
_GoogleMapsViewCallback=function(){
_d=function(_48){
_48();
};
var _49=0,_4a=_44.length;
for(;_49<_4a;_49++){
_44[_49]();
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
var _4b="GoogleMapsViewMapRegionKey";
var _6=objj_getClass("GoogleMapsView");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"GoogleMapsView\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
_4c=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("GoogleMapsView").super_class},"initWithCoder:",_4e);
if(_4c){
objj_msgSend(_4c,"setMapRegion:",objj_msgSend(_4e,"decodeObjectForKey:",_4b));
objj_msgSend(_4c,"_buildDOM");
}
return _4c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4f,_50,_51){
with(_4f){
objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("GoogleMapsView").super_class},"encodeWithCoder:",_51);
objj_msgSend(_51,"encodeObject:forKey:",objj_msgSend(_4f,"mapRegion"),_4b);
}
})]);
p;14;RutTextField.jt;1713;@STATIC;1.0;I;20;AppKit/CPTextField.jt;1669;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=objj_allocateClassPair(CPSearchField,"RutTextField"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("rutValido")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("rutValido"),function(_3,_4){
with(_3){
return rutValido;
}
}),new objj_method(sel_getUid("rutValue"),function(_5,_6){
with(_5){
var T=objj_msgSend(_5,"stringValue");
while(T.indexOf(".")!=-1){
T=T.replace(".","");
}
while(T.indexOf("-")!=-1){
T=T.replace("-","");
}
if(T.length>1){
var d=T.charAt(T.length-1);
T=T.substring(0,T.length-1);
return T;
}
return nil;
}
}),new objj_method(sel_getUid("validaFormatea"),function(_7,_8){
with(_7){
var T=objj_msgSend(_7,"stringValue");
while(T.indexOf(".")!=-1){
T=T.replace(".","");
}
while(T.indexOf("-")!=-1){
T=T.replace("-","");
}
var _9=false;
if(T.length>1){
var d=T.charAt(T.length-1);
T=T.substring(0,T.length-1);
var M=0,S=1,X=T;
for(;X;X=Math.floor(X/10)){
S=(S+X%10*(9-M++%6))%11;
}
if(S){
_9=(d==(S-1));
}else{
_9=(d=="k"||d=="K");
}
var N="";
while(T.length>3){
N="."+T.substr(T.length-3)+N;
T=T.substring(0,T.length-3);
}
T=T+N+"-"+d;
}
objj_msgSend(_7,"setValue:forKey:",_9,"rutValido");
objj_msgSend(_7,"setStringValue:",T);
}
}),new objj_method(sel_getUid("cancelOperation:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_a,"setStringValue:","");
objj_msgSend(_a,"textDidChange:",null);
objj_msgSend(_a,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("textDidChange:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("RutTextField").super_class},"textDidChange:",_f);
objj_msgSend(_d,"validaFormatea");
}
})]);
e;
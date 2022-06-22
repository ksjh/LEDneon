// OpenSCAD LED utility modules
// to be included in own OpenSCAD scripts
//

module drill(debug=false) {
    if(!debug) {
        difference() {
            children(0);
            children([1:$children-1]);
        }
    } else {
        echo("ATTENTION: DEGUG enabled.");
        children(0);
        #children([1:$children-1]);
    }
}

module bolder(wdth=2, rond=false) {
    if(!rond) {
        offset(delta=wdth)
            children();
    } else {
        offset(r=wdth)
            children();
    }
}

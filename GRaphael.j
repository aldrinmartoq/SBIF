/*
 * GRaphael.j
 * SBIF
 *
 * Created by You on May 2, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import "raphael.js"
@import "g.raphael.js"
@import "g.line.js"

@implementation GRaphael: CPView {
    JSObject        r;
    JSObject        datasets;
    JSObject        yList;
    JSObject        xList;
}

- (id)initWithFrame:(CGRect)aFrame {
    self = [super initWithFrame:aFrame];

    if (self) {
        datasets = [];
        [self _buildDOM];
    }

    return self;
}

- (void)_buildDOM {
    var f = [self frame],
        w = f.size.width,
        h = f.size.height;
    r = Raphael(_DOMElement, w, h);
}

- (void)removeAllDatasets {
    datasets = [];
    yList = [];
    xList = [];
    [self drawRaphael];
}

- (void)addDataset:(JSObject)dataset {
    CPLog.debug('adding dataset: ' + dataset[0].length + ' ' + dataset[1].length);
    if (dataset[0].length < 1 || dataset[1].length < 1) {
        return;
    }
    datasets.push([dataset[0], dataset[1]]);
    yList = [];
    xList = [];
    for (var i=0,len=datasets.length; i<len; i++) {
        yList.push(datasets[i][0]);
        xList.push(datasets[i][1]);
    }
}

- (void)drawRaphael {
    try {
        CPLog.debug('drawing raphael!');
        var f = [self frame],
            w = f.size.width,
            h = f.size.height;
        r.setSize(w, h);
        r.clear();
        if (datasets.length < 1) {
            return;
        }
        CPLog.debug('drawing raphael OH YES! ' + yList);

        var lines = r.g.linechart(20, 20, w - 30, h - 30, yList, xList,
            {   nostroke: false,
                    axis: "1 1 1 1",
                  symbol: "o",
                  smooth: true});
            lines.hoverColumn(function () {
            this.tags = r.set();
            for (var i = 0, ii = this.y.length; i < ii; i++) {
                this.tags.push(r.g.tag(this.x, this.y[i], this.values[i], 180, 10).insertBefore(this).attr([{fill: "#bbb"}, {fill: this.symbols[i].attr("fill")}]));
            }
        }, function () {
            this.tags && this.tags.remove();
        });
        lines.symbols.attr({r: 3});
    } catch (err) {
        CPLog.debug('error: ' + err);
    }
}

- (void)layoutSubviews {
    [self drawRaphael];
}

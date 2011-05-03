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

- (void)addDataset:(CPString)name ValuesX:(CPArray)xVals ValuesY:(CPArray)yVals  {
    if (xVals.length < 1) {
        return;
    }
    datasets.push([xVals, yVals]);
    xList = [];
    yList = [];
    for (var i=0,len=datasets.length; i<len; i++) {
        xList.push(datasets[i][0]);
        yList.push(datasets[i][1]);
    }
}

- (void)drawRaphael {
    try {
        var f = [self frame],
            w = f.size.width,
            h = f.size.height;
        r.setSize(w, h);
        r.clear();
        if (datasets.length < 1) {
            return;
        }

        var lines = r.g.linechart(40, 20, w - 80, h - 40, xList, yList,
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

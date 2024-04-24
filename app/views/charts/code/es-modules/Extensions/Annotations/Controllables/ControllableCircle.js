/* *
 *
 *  !!!!!!! SOURCE GETS TRANSPILED BY TYPESCRIPT. EDIT TS FILE ONLY. !!!!!!!
 *
 * */
'use strict';
import Controllable from './Controllable.js';
import ControllablePath from './ControllablePath.js';
import U from '../../../Core/Utilities.js';
const { merge } = U;
/* *
 *
 *  Class
 *
 * */
/**
 * A controllable circle class.
 *
 * @requires modules/annotations
 *
 * @private
 * @class
 * @name Highcharts.AnnotationControllableCircle
 *
 * @param {Highcharts.Annotation} annotation an annotation instance
 * @param {Highcharts.AnnotationsShapeOptions} options a shape's options
 * @param {number} index of the circle
 */
class ControllableCircle extends Controllable {
    /* *
     *
     *  Constructors
     *
     * */
    constructor(annotation, options, index) {
        super(annotation, options, index, 'shape');
        /* *
         *
         *  Properties
         *
         * */
        this.type = 'circle';
        this.translate = super.translateShape;
    }
    /* *
     *
     *  Functions
     *
     * */
    /**
     * @private
     */
    redraw(animation) {
        if (this.graphic) {
            const position = this.anchor(this.points[0]).absolutePosition;
            if (position) {
                this.graphic[animation ? 'animate' : 'attr']({
                    x: position.x,
                    y: position.y,
                    r: this.options.r
                });
            }
            else {
                this.graphic.attr({
                    x: 0,
                    y: -9e9
                });
            }
            this.graphic.placed = !!position;
        }
        super.redraw.call(this, animation);
    }
    /**
     * @private
     */
    render(parent) {
        const attrs = this.attrsFromOptions(this.options);
        this.graphic = this.annotation.chart.renderer
            .circle(0, -9e9, 0)
            .attr(attrs)
            .add(parent);
        super.render();
    }
    /**
     * Set the radius.
     * @private
     * @param {number} r
     *        A radius to be set
     */
    setRadius(r) {
        this.options.r = r;
    }
}
/* *
 *
 *  Static Properties
 *
 * */
/**
 * A map object which allows to map options attributes to element
 * attributes.
 *
 * @name Highcharts.AnnotationControllableCircle.attrsMap
 * @type {Highcharts.Dictionary<string>}
 */
ControllableCircle.attrsMap = merge(ControllablePath.attrsMap, { r: 'r' });
/* *
 *
 *  Default Export
 *
 * */
export default ControllableCircle;

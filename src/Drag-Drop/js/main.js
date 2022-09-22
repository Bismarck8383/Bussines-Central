$(document).ready(function() {
  
    var zoomScale = parseFloat($('.container').css('zoom'));
  
    $('.drag__item').draggable({
      revert: function(event, ui) {
        $(this).data('uiDraggable').originalPosition = {
          top: 0,
          left: 0
        };
        return !event;
      },
      drag: function(event, ui) {
        var changeLeft = ui.position.left - ui.originalPosition.left;
        var newLeft = ui.originalPosition.left + changeLeft / zoomScale;
        var changeTop = ui.position.top - ui.originalPosition.top;
        var newTop = ui.originalPosition.top + changeTop / zoomScale;
  
        ui.position.left = newLeft;
        ui.position.top = newTop;
      }
    });
  
    $('.drop__item').droppable();
  
    var intersect = $.ui.intersect = (function() {
      function isOverAxis(x, reference, size) {
        return (x >= reference) && (x < (reference + size));
      }
      
  
      return function(draggable, droppable, toleranceMode, event) {
        if (!droppable.offset) {
          return false;
        }
  
        var x1 = draggable.offset.left + draggable.position.left - draggable.originalPosition.left + draggable.margins.left, //here is the fix for scaled container
          y1 = draggable.offset.top + draggable.position.top - draggable.originalPosition.top + draggable.margins.top, //here is the fix for scaled container
          x2 = x1 + draggable.helperProportions.width,
          y2 = y1 + draggable.helperProportions.height,
          l = droppable.offset.left,
          t = droppable.offset.top,
          r = l + droppable.proportions().width,
          b = t + droppable.proportions().height;
  
        switch (toleranceMode) {
          case 'fit':
            return (l <= x1 && x2 <= r && t <= y1 && y2 <= b);
          case 'intersect':
            return (l < x1 + (draggable.helperProportions.width / 2) && // Right Half
              x2 - (draggable.helperProportions.width / 2) < r && // Left Half
              t < y1 + (draggable.helperProportions.height / 2) && // Bottom Half
              y2 - (draggable.helperProportions.height / 2) < b); // Top Half
          case 'pointer':
            return isOverAxis(event.pageY, t, droppable.proportions().height) &&
              isOverAxis(event.pageX, l, droppable.proportions().width);
          case 'touch':
            return (
              (y1 >= t && y1 <= b) || // Top edge touching
              (y2 >= t && y2 <= b) || // Bottom edge touching
              (y1 < t && y2 > b) // Surrounded vertically
            ) && (
              (x1 >= l && x1 <= r) || // Left edge touching
              (x2 >= l && x2 <= r) || // Right edge touching
              (x1 < l && x2 > r) // Surrounded horizontally
            );
          default:
            return false;
        }
      };
    })();
  
    $.ui.ddmanager.drag = function(draggable, event) {
      // If you have a highly dynamic page, you might try this option. It renders positions
      // every time you move the mouse.
      if (draggable.options.refreshPositions) {
        $.ui.ddmanager.prepareOffsets(draggable, event);
      }
  
      // Run through all droppables and check their positions based on specific tolerance options
      $.each($.ui.ddmanager.droppables[draggable.options.scope] || [], function() {
  
        if (this.options.disabled || this.greedyChild || !this.visible) {
          return;
        }
  
        var parentInstance, scope, parent,
          intersects = intersect(draggable, this, this.options.tolerance, event),
          c = !intersects && this.isover ?
          'isout' :
          (intersects && !this.isover ? 'isover' : null);
        if (!c) {
          return;
        }
  
        if (this.options.greedy) {
  
          // find droppable parents with same scope
          scope = this.options.scope;
          parent = this.element.parents(':data(ui-droppable)').filter(function() {
            return $(this).droppable('instance').options.scope === scope;
          });
  
          if (parent.length) {
            parentInstance = $(parent[0]).droppable('instance');
            
            parentInstance.greedyChild = (c === 'isover');
          }
        }
  
        // We just moved into a greedy child
        if (parentInstance && c === 'isover') {
          parentInstance.isover = false;
          parentInstance.isout = true;
          parentInstance._out.call(parentInstance, event);
        }
  
        this[c] = true;
        this[c === 'isout' ? 'isover' : 'isout'] = false;
        this[c === 'isover' ? '_over' : '_out'].call(this, event);
  
        // We just moved out of a greedy child
        if (parentInstance && c === 'isout') {
          parentInstance.isout = false;
          parentInstance.isover = true;
          parentInstance._over.call(parentInstance, event);
        }
      });
  
    }
  
    $.ui.ddmanager.drop = function(draggable, event) {
      var dropped = false;
  
      // Create a copy of the droppables in case the list changes during the drop (#9116)
      $.each(($.ui.ddmanager.droppables[draggable.options.scope] || []).slice(), function() {
  
        if (!this.options) {
          return;
        }
        if (!this.options.disabled && this.visible &&
          intersect(draggable, this, this.options.tolerance, event)) {
          dropped = this._drop.call(this, event) || dropped;
        }
        let palet = document.querySelector(".drag__item");
        if(dropped){
                
            Object.entries(palet).forEach(([key, value]) => {
                console.log("Lllaves",key);
                console.log("Valores ",value);
                palet.style.backgroundColor = '#FF00FF';
              });
           
           
        
    }
  
        if (!this.options.disabled && this.visible && this.accept.call(this.element[0],
            (draggable.currentItem || draggable.element))) {
          this.isout = true;
          this.isover = false;
          this._deactivate.call(this, event);
        }
  
      });
      return dropped;
    }
  });
let palet = document.querySelector(".drag__item");
console.log(palet);

  
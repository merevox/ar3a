;(function ($, window) {
    'use strict';

    var msPointerEnabled = window.navigator.msPointerEnabled,
        $body = $('body');

    /**
     * Extending the Shopware Search Plugin.
     *
     * The override display the search as mobile on each viewport
     */
    $.overridePlugin('swSearch', {
        /**
         * Registers all necessary events for the plugin.
         *
         * @public
         * @method registerListeners
         */
        registerListeners: function () {
            var me =	this,
                opts = me.opts,
                $searchField = me.$searchField,
                $formElement = me.$searchField.closest('form');

            me._on($searchField, 'keyup', $.proxy(me.onKeyUp, me));
            me._on($searchField, 'keydown', $.proxy(me.onKeyDown, me));
            me._on(me.$toggleSearchBtn, 'click', $.proxy(me.onClickSearchEntry, me));
            me._on($formElement, 'submit', $.proxy(me.onSubmit, me));

            if (msPointerEnabled) {
                me.$results.on('click', opts.resultLinkSelector, function (event) {
                    window.location.href = $(event.currentTarget).attr('href');
                });
            }

            StateManager.registerListener({
                state: ['xs', 's', 'm', 'l', 'xl'],
                enter: function () {
                    if (opts.activeOnStart) {
                        me.openMobileSearch();
                    }
                },
                exit: function () {
                    me.closeMobileSearch();
                }
            });

            $.publish('plugin/swSearch/onRegisterEvents', [ me ]);
        },

        /**
         * Clears the result list and appends the given (AJAX) response to it.
         *
         * @public
         * @method showResult
         * @param {String} response
         */
        showResult: function (response) {
            var me =	this,
                opts = me.opts;

            me.$loader.fadeOut(opts.animationSpeed);
            me.$results.empty().html(response).addClass(opts.activeCls).show();

            $body.on(me.getEventName('click touchstart'), $.proxy(me.onClickBody, me));

            picturefill();

            $.publish('plugin/swSearch/onShowResult', [ me ]);
        },

        /**
         * onClickSearchTrigger event for displaying and hiding
         * the search field
         *
         * @public
         * @method onClickSearchEntry
         * @param event
         */
        onClickSearchEntry: function (event) {
            var me =	this,
                $el = me.$el,
                opts = me.opts;

            $.publish('plugin/swSearch/onClickSearchEntry', [ me, event ]);

            event.preventDefault();
            event.stopPropagation();

            $el.hasClass(opts.activeCls) ? me.closeMobileSearch() : me.openMobileSearch();
        }
    });
})(jQuery, window);
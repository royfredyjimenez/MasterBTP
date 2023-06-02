sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.logali.es.products2',
            componentId: 'ReviewsObjectPage',
            entitySet: 'Reviews'
        },
        CustomPageDefinitions
    );
});
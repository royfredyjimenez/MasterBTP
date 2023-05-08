sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/logali/es/product1/test/integration/FirstJourney',
		'com/logali/es/product1/test/integration/pages/ProductsList',
		'com/logali/es/product1/test/integration/pages/ProductsObjectPage',
		'com/logali/es/product1/test/integration/pages/ReviewsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage, ReviewsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/logali/es/product1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage,
					onTheReviewsObjectPage: ReviewsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
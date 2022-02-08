({
	init: function (cmp, event, helper) {
        cmp.set('v.mapMarkers', [
            {
                location: {
                    Street: 'Carrera 18a N° 137-80',
                    City: 'Bogotá',
                    State: 'DC'
                },

                title: 'The White House',
                description: 'Landmark, historic home & office of the United States president, with tours for visitors.'
            }
        ]);
        cmp.set('v.zoomLevel', 16);
    }
})

/* Formatting function for row details - modify as you need */
function format ( d ) {
	console.log("This is what d is" + JSON.stringify(d));

	var viewString =  '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';

	for (var key in d) {
		if (d.hasOwnProperty(key)) {
			if (key == "isActive" || key == "user_location" || key == "latitude" || key == "longitude" || key == "kidaluser"  || key == "image_thumb" || key == "submission_id") {
				continue;
			}
			else if(key == 'image'){
				if(d[key] !== null){
					viewString += '<tr>' + '<td> <b>' + key + '</b></td>' + '<td>'+ '<a href= ' + d[key] + ' target="_blank"><img src=' + d.image_thumb + ' height=\'100\' width=\'100\' \\></a>'  +'</td>' + '</tr>';
				}
			}
			else{
				viewString += '<tr>' + '<td> <b>' + key + '</b></td>' + '<td>'+d[key]+'</td>' + '</tr>';
			}

		}
	}

	viewString += '</table>';

	return viewString;

}

$(document).ready(function() {
	var table = $('#example').DataTable( {

		"data": gon.data,
		paging: false,
		"columns": [
			{
				"className":  'details-control',
				"orderable":      false,
				"data":           null,
				"defaultContent": ''
			},
			{ "data": "kidaluser" },
			{ "data": "date_created" },
			{ "data": "isActive" },
			{"data": "user_location"},
			{"data": "submission_id"}
		],
		"order": [[1, 'asc']],
		// buttons: [
		// 	{
		// 		extend: 'csv',
		// 		text: 'Copy all data',
		// 		exportOptions: {
		// 			modifier: {
		// 				search: 'none'
		// 			}
		// 		}
		// 	}
		// ]

	} );

	// Add event listener for opening and closing details
	$('#example tbody').on('click', 'td.details-control', function () {
		var tr = $(this).closest('tr');
		var row = table.row( tr );

		if ( row.child.isShown() ) {
			// This row is already open - close it
			row.child.hide();
			tr.removeClass('shown');
		}
		else {
			// Open this row
			//console.log("Row Hello: " + row.data());
			row.child( format(row.data()) ).show();
			tr.addClass('shown');
		}
	} );
} );

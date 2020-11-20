
$('#dataTable').DataTable({

	dom: 'Bfrtip',

	buttons: [
		'excel', 'pdf', 'print'
	],

	"language": {
		"url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Portuguese-Brasil.json"
	},
	"scrollY": false,
	"scrollX": false,
	"paging": false,
	"autoWidth": false,
	"fixedHeader": {
		"header": false,
		"footer": false
	},
	"columnDefs": [
		{ "width": "70px", "targets": 0 },
		{ "width": "250px", "targets": 1 },
		{ "width": "120px", "targets": 2 },
		{ "width": "250px", "targets": 3 },
		{ "width": "70px", "targets": 4 },
		{ "width": "70px", "targets": 5 },
		{ "width": "70px", "targets": 6 },
	]

});

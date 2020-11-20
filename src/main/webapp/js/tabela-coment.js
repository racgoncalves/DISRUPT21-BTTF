
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
		{ "width": "350px", "targets": 0 },
		{ "width": "100px", "targets": 1 },
		{ "width": "230px", "targets": 2 },
		{ "width": "60px", "targets": 3 },
	]

});

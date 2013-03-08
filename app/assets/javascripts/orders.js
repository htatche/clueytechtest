var data = '',
    source = {
      datatype: "json",
      datafields: [
        { name: 'id', type: 'integer' },
        { name: 'product', type: 'string' },
        { name: 'category', type: 'string' },
        { name: 'sales', type: 'integer' },
      ],
      localdata: data
    };

var dataAdapter = new $.jqx.dataAdapter(source, {
  downloadComplete: function (data, status, xhr) { },
  loadComplete: function (data) { },
  loadError: function (xhr, status, error) { }
});

var startGrid = function() {
  grid = $('#results').jqxGrid({
    width: '900px',
    source: dataAdapter,
    sortable: true,
    pageable: true,
    columns: [
      { datafield: 'id', hidden: true },
      { text: 'Product', datafield: 'product', width: 100 },
      { text: 'Category', datafield: 'category', width: 100 },
      { text: 'Sales (€)', datafield: 'sales', width: 100 },
    ]
    });

    search();
};

var search = function () {
  $.getJSON('/orders/lookup',
    params = $('form').serialize(),
    function(data) {
      update(data);
  })
  .error(function() {
  })
  .complete(function() {
  });
};

var update = function(data) {
  source.localdata = data;
  $('#results').jqxGrid('updatebounddata');
};

$(document).ready(function() {

  $('.filter form').submit(function() {
    startGrid();
    return false;
  });

});

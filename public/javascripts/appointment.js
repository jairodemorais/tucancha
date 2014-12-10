$( document ).ready(function() {
  var currentTime = new Date();
  var month = currentTime.getMonth();
  var day = currentTime.getDate();
  var year = currentTime.getFullYear();

  $("#datepicker").datepicker({
    minDate: new Date(year, month, day),
    dateFormat: 'dd/mm/yy',
    onSelect: function(dateText) {
      setFinalDate = dateText;
      $('input[name=date]').val(dateText);
    }
  });
    var substringMatcher = function(strs) {
      return function findMatches(q, cb) {
        var matches, substrRegex;

        // an array that will be populated with substring matches
        matches = [];

        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');

        // iterate through the pool of strings and for any string that
        // contains the substring `q`, add it to the `matches` array
        $.each(strs, function(i, str) {
          if (substrRegex.test(str)) {
            // the typeahead jQuery plugin expects suggestions to a
            // JavaScript object, refer to typeahead docs for more info
            matches.push({ value: str });
          }
        });

        cb(matches);
      };
    };

    var canchas = ['El Campito', 'El Estadio', 'Ibiza', 'Planeta Gol', 'Varela Juniors',
    ];

    $('#canchas .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'Canchas',
      displayKey: 'value',
      source: substringMatcher(canchas)
    });


  $(".dropdown-menu li a").click(function(){
    var id = $(this).parents(".dropdown").find(".btn")[0].id;
    $('input[name='+id+']').val($(this).text());
    $(this).parents(".dropdown").find(".btn").text($(this).text());
    $(this).parents(".dropdown").find(".btn").val($(this).text());
  });
});



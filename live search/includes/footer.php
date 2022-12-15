</div>

<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="" crossorigin=""></script>
<script src="rating-plugin/dist/jquery.star-rating-svg.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js
"></script>

<script>
    $(document).ready(function() {

      
        
        $(document).on('submit', function(e) {
            //alert('form submitted');
            e.preventDefault();
            var formdata = $("#comment_data").serialize()+'&submit=submit';

            $.ajax({
                type: 'post',
                url: 'insert-comments.php',
                data: formdata,

                success: function() {
                    //alert('success');
                  $("#comment").val(null);
                  $("#username").val(null);
                  $("#post_id").val(null);

                  $("#msg").html("Added Successfully").toggleClass("alert alert-success bg-success text-white mt-3");
                  fetch();
                }
            });
        });


        $("#delete-btn").on('click', function(e) {
            //alert('form submitted');
            e.preventDefault();
            var id = $(this).val();

            $.ajax({
                type: 'post',
                url: 'delete-comment.php',
                data: {
                    delete: 'delete',
                    id: id
                },

                success: function() {
                  //alert(id);
                

                  $("#delete-msg").html("Deleted Successfully").toggleClass("alert alert-success bg-success text-white mt-3");
                  fetch();
                }
            });
        });

        function fetch() {

            setInterval(function () {
                $("body").load("show.php?id=<?php 
                    if(isset($_GET['id'])) {
                        echo $_GET['id'];
                    } else {
                        echo 'nothing';
                    }

                    ?>")
            }, 4000);
        }   
        
        //rating sys

        $(".my-rating").starRating({
            starSize: 25,

            initialRating: "<?php 
            
            
                if(isset($rating->rating) AND isset($rating->user_id) AND $rating->user_id == $_SESSION['user_id'] ) {
                    echo $rating->rating;
                } else {
                    echo '0';
                }
            
            ?>",

            callback: function(currentRating, $el){
               $("#rating").val(currentRating);


               $(".my-rating").click(function(e) {
                    e.preventDefault();

                    var formdata = $("#form-data").serialize()+'&insert=insert';

                    $.ajax({
                        type: "POST",
                        url: 'insert-ratings.php',
                        data: formdata,

                        success: function() {
                            alert(formdata);
                        }
                    })
               })
            }
        });


        //live search

        $("#search_data").keyup(function() {

            var search = $(this).val();
            //alert(search);

            if(search !== '') {

                $(".row").css("display", "none");
                $("main").css("display", "none");
                $.ajax({
                    type: "POST",
                    url: "search.php",
                    data: {
                        search: search
                    },

                    success: function(data) {
                        $("#search-data").html(data);
                    }
                })
            } else {
                $("#search-data").css('display', 'none');
             
                $(".row").css("display", "block");
                $("main").css("display", "block");

            }

        })

    });
</script>
</body>
</html>
$('.addCart').click(function(e){
    e.preventDefault();
    var path = $(this).data('action');
    // var qty = $('#qty').value();
    $.ajax({
        url : path,
        type: 'GET',
        // data: {
        //     qty
        // },
        dataType : 'json',
        success: function(response){
            if (response.status == 'success'){
                // $('#subtotal').html(response.cartsum.total__sum)
                // $('#total').html(response.cartsum.total__sum)
                alert('added to cart')
            }
        }
    })
})
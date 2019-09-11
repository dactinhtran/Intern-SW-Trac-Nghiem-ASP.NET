var admin = {
    init: function () {
        admin.registerEvents();
    },
    registerEvents: function () {
        //change status
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this); //phai gan btn, k nhận this
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/UserAdmin/ChangeStatus",
                data: { id: id }, //ChangeStatus(long id) id tryen vao
                dataType: "json",
                type:"POST",
                success: function (res) {
                    if (res.status == true) {//status = res
                        btn.text('Kích hoạt');
                    }
                    else {
                        btn.text('Khóa');
                    }
                }
            });
        });

        //update name cho user admin
        $('#btnUpdate').off('click').on('click', function () {
            var listUser = $('.txtName');
            var userList = []; //tao mang de push tung doi tuong 
            $.each(listUser, function (i, item) {
                userList.push({
                    Name: $(item).val(),
                    ID: $(item).data('id')
                });
            });
            $.ajax({
                url: '/UserAdmin/Update',
                data: { userModel: JSON.stringify(userList) }, //->chuoi
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = '/Admin/UserAdmin/Index';
                    }
                }
            })
        });

        
        
    }
}
admin.init();


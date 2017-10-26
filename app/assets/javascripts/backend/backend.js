// console.log('kkkkk');
$(document).ready(function () {


    // Cập nhật trạng thái online/ofline trên status của categories
    $(document).on('click' ,'.update-category', function(){
        // url = window.location.href
        // console.log(url)
        if(confirm('Are you sure ?')){
            var id = $(this).attr('id');
            $.post( '/dashboard/categories/'+ id + '/update_status', function (data) {
                if (data.status == true)
                {
                    $("#"+data.id).text('Online').addClass('btn-success').removeClass('btn-danger');
                }else{
                    $("#"+data.id).text('Offline').addClass('btn-danger').removeClass('btn-success');
                }
            })
        }
    });

    // Cập nhật trạng thái online/ofline trên status của news
    $(document).on('click' ,'.update-news', function(){
        // url = window.location.href
        // console.log(url)
        if(confirm('Are you sure ?')){
            var id = $(this).attr('id');
            $.post( '/dashboard/news/'+ id + '/update_status', function (data) {
                // console.log(data.status)
                if (data.status == true)
                {
                    $("#"+data.id).text('Online').addClass('btn-success').removeClass('btn-danger');
                }else{
                    $("#"+data.id).text('Offline').addClass('btn-danger').removeClass('btn-success');
                }

            })
        }
    });

    // Cập nhật trạng thái online/ofline trên status của comment
    $(document).on('click' ,'.update-comment', function(){
        // url = window.location.href
        // console.log(url)
        if(confirm('Are you sure ?')){
            var id = $(this).attr('id');
            $.post( '/dashboard/comments/'+ id + '/update_status', function (data) {
                // console.log(data.status)
                if (data.status == true)
                {
                    $("#"+data.id).text('Approved').addClass('btn-success').removeClass('btn-danger');
                }else{
                    $("#"+data.id).text('Disapprove').addClass('btn-danger').removeClass('btn-success');
                }

            })
        }
    })
//     tinymce.init({
//         selector: "textarea",
//         plugins: [
//             "advlist autolink lists link image charmap print preview anchor",
//             "searchreplace visualblocks code fullscreen",
//             "insertdatetime media table contextmenu paste"
//         ],
//         toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
//         file_browser_callback: elFinderBrowser
//     });
//
//     function elFinderBrowser(field_name, url, type, win) {
//         tinymce.activeEditor.windowManager.open({
//             file: '/dashboard/elfinder_manager',// use an absolute path!
//             title: 'elFinder 2.0',
//             width: 900,
//             height: 450,
//             resizable: 'yes'
//         }, {
//             setUrl: function (url) {
//                 win.document.getElementById(field_name).value = url;
//             }
//         });
//         return false;
//     }
//
});

function ChangeToSlug()
{
    var title, slug;

    //Lấy text từ thẻ input title
    title = document.getElementById("name").value;

    //Đổi chữ hoa thành chữ thường
    slug = title.toLowerCase();

    //Đổi ký tự có dấu thành không dấu
    slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
    slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
    slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
    slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
    slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
    slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
    slug = slug.replace(/đ/gi, 'd');
    //Xóa các ký tự đặt biệt
    slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
    //Đổi khoảng trắng thành ký tự gạch ngang
    slug = slug.replace(/ /gi, "-");
    //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
    //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
    slug = slug.replace(/\-\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-/gi, '-');
    slug = slug.replace(/\-\-/gi, '-');
    //Xóa các ký tự gạch ngang ở đầu và cuối
    slug = '@' + slug + '@';
    slug = slug.replace(/\@\-|\-\@|\@/gi, '');
    //In slug ra textbox có id “slug”
    document.getElementById('slug').value = slug;
}





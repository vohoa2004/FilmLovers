$(document).ready(function() {
    "use strict"; // start of use strict

    /*==============================
    Menu
    ==============================*/
    $('.header__btn').on('click', function() {
        $(this).toggleClass('header__btn--active');
        $('.header').toggleClass('header--active');
        $('.sidebar').toggleClass('sidebar--active');
    });

    /*==============================
    Filter
    ==============================*/
    $('.filter__item-menu li').each(function() {
        $(this).attr('data-value', $(this).text().toLowerCase());
    });

    $('.filter__item-menu li').on('click', function() {
        var text = $(this).text();
        var item = $(this);
        var id = item.closest('.filter').attr('id');
        $('#' + id).find('.filter__item-btn input').val(text);
    });

    /*==============================
    Tabs
    ==============================*/
    $('.profile__mobile-tabs-menu li').each(function() {
        $(this).attr('data-value', $(this).text().toLowerCase());
    });

    $('.profile__mobile-tabs-menu li').on('click', function() {
        var text = $(this).text();
        var item = $(this);
        var id = item.closest('.profile__mobile-tabs').attr('id');
        $('#' + id).find('.profile__mobile-tabs-btn input').val(text);
    });

    /*==============================
    Modal
    ==============================*/
    $('.open-modal').magnificPopup({
        fixedContentPos: true,
        fixedBgPos: true,
        overflowY: 'auto',
        type: 'inline',
        preloader: false,
        focus: '#username',
        modal: false,
        removalDelay: 300,
        mainClass: 'my-mfp-zoom-in',
    });

    $('.modal__btn--dismiss').on('click', function(e) {
        e.preventDefault();
        $.magnificPopup.close();
    });

    /*==============================
    Select2
    ==============================*/
    $('#quality').select2({
        placeholder: "Choose quality",
        allowClear: true
    });

    $('#country').select2({
        placeholder: "Choose country / countries"
    });

    $('#language').select2({
        placeholder: "Choose language"
    });

    $('#genre').select2({
        placeholder: "Choose genre / genres"
    });

    $('#status').select2({
        placeholder: "Choose status"
    });

    // $('#gender').select2({
    //     placeholder: "Choose gender"
    // });

    $('#proCom_country').select2({
        placeholder: "Choose where company is based"
    });

    $('#subscription, #rights').select2();

    /*==============================
    Upload cover
    ==============================*/
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#form__img').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $('#form__img-upload').on('change', function() {
        readURL(this);
    });

    /*==============================
    Upload video
    ==============================*/
    $('.form__video-upload').on('change', function() {
        var videoLabel = $(this).attr('data-name');

        if ($(this).val() != '') {
            $(videoLabel).text($(this)[0].files[0].name);
        } else {
            $(videoLabel).text('Upload video');
        }
    });

    /*==============================
    Upload gallery
    ==============================*/
    $('.form__gallery-upload').on('change', function() {
        var length = $(this).get(0).files.length;
        var galleryLabel = $(this).attr('data-name');

        if (length > 1) {
            $(galleryLabel).text(length + " files selected");
        } else {
            $(galleryLabel).text($(this)[0].files[0].name);
        }
    });

    /*==============================
    Scrollbar
    ==============================*/
    var Scrollbar = window.Scrollbar;

    if ($('.sidebar__nav').length) {
        Scrollbar.init(document.querySelector('.sidebar__nav'), {
            damping: 0.1,
            renderByPixels: true,
            alwaysShowTracks: true,
            continuousScrolling: true
        });
    }

    if ($('.dashbox__table-wrap--1').length) {
        Scrollbar.init(document.querySelector('.dashbox__table-wrap--1'), {
            damping: 0.1,
            renderByPixels: true,
            alwaysShowTracks: true,
            continuousScrolling: true
        });
    }

    if ($('.dashbox__table-wrap--2').length) {
        Scrollbar.init(document.querySelector('.dashbox__table-wrap--2'), {
            damping: 0.1,
            renderByPixels: true,
            alwaysShowTracks: true,
            continuousScrolling: true
        });
    }

    if ($('.dashbox__table-wrap--3').length) {
        Scrollbar.init(document.querySelector('.dashbox__table-wrap--3'), {
            damping: 0.1,
            renderByPixels: true,
            alwaysShowTracks: true,
            continuousScrolling: true
        });
    }

    if ($('.dashbox__table-wrap--4').length) {
        Scrollbar.init(document.querySelector('.dashbox__table-wrap--4'), {
            damping: 0.1,
            renderByPixels: true,
            alwaysShowTracks: true,
            continuousScrolling: true
        });
    }

    if ($('.main__table-wrap').length) {
        Scrollbar.init(document.querySelector('.main__table-wrap'), {
            damping: 0.1,
            renderByPixels: true,
            alwaysShowTracks: true,
            continuousScrolling: true
        });
    }

    /*==============================
    Bg
    ==============================*/
    $('.section--bg').each(function() {
        if ($(this).attr("data-bg")) {
            $(this).css({
                'background': 'url(' + $(this).data('bg') + ')',
                'background-position': 'center center',
                'background-repeat': 'no-repeat',
                'background-size': 'cover'
            });
        }
    });

});


/*==============================
    Dynamic Form
==============================*/
const addBtn_director = document.querySelector(".director .addBtn");
const addBtn_writer = document.querySelector(".writer .addBtn");
const addBtn_cast = document.querySelector(".cast .addBtn");

//count is used for creating different gender id(s)
var count = 0;


function removeItem(itemDiv) {
    itemDiv.remove();
}

function addInput(event, parentDiv){
    const inputGroupDiv = document.querySelector("." + parentDiv.id + " .input_group");

    //create input profile image
    const profileImg_label = document.createElement("label");
    profileImg_label.setAttribute("for", "profile_img");
    profileImg_label.innerHTML = "Profile Image";

    const profileImg_input = document.createElement("input");
    profileImg_input.type = "file";
    profileImg_input.name = "crewProfileImg";
    profileImg_input.id = "profile_img";
    profileImg_input.accept=".png, .jpg, .jpeg";


    //create input first name
    const firstNameInput = document.createElement("input");
    firstNameInput.type = "text";
    firstNameInput.className = "form__input";
    firstNameInput.placeholder = "First name";
    firstNameInput.name = "first_name";

    //create input last name
    const lastNameInput = document.createElement("input");
    lastNameInput.type = "text";
    lastNameInput.className = "form__input";
    lastNameInput.placeholder = "Last name";
    lastNameInput.name = "last_name";

    //create input gender
    const genderSelect = document.createElement("select");
    genderSelect.id = "gender" + (count++);  
    genderSelect.name = "gender";
    let optionArr = ["", "Male", "Female"]; 
    for (let i = 0; i < optionArr.length; i++) {
        let option = document.createElement("option");
        option.value = optionArr[i];
        option.text = optionArr[i];
        genderSelect.appendChild(option);
    }

    //create input date of birth
    const dateOfBirth_label = document.createElement("label");
    dateOfBirth_label.setAttribute("for", "date_of_birth");
    dateOfBirth_label.innerHTML = "Date Of Birth";
    
    const dateOfBirth_input = document.createElement("input");
    dateOfBirth_input.type = "date";
    dateOfBirth_input.className = "form__input";
    dateOfBirth_input.name = "date_of_birth";
    dateOfBirth_input.id = "date_of_birth";

    //create bio box
    const bioBox = document.createElement("textarea");
    bioBox.id = "text";
    bioBox.name = "bio";
    bioBox.className = "form__textarea";
    bioBox.placeholder = "Bio";

    //create delete button
    const deleteBtn = document.createElement("a");
    deleteBtn.className = "deleteBtn";
    deleteBtn.innerHTML = "&times";

    //append child
    const itemDiv = document.createElement("div");
    itemDiv.className = "item";
    inputGroupDiv.appendChild(itemDiv);

    const itemContentDiv = document.createElement("div");
    itemContentDiv.className = "item_content";
    itemDiv.appendChild(itemContentDiv);

    const personalInfoDiv = document.createElement("div");
    personalInfoDiv.className = "personal_info";
    itemContentDiv.appendChild(personalInfoDiv);

    const firstNameDiv = document.createElement("div");
    firstNameDiv.className = "form__group first_name";
    personalInfoDiv.appendChild(firstNameDiv);
    firstNameDiv.appendChild(firstNameInput);

    const lastNameDiv = document.createElement("div");
    lastNameDiv.className = "form__group last_name";
    personalInfoDiv.appendChild(lastNameDiv);
    lastNameDiv.appendChild(lastNameInput);

    const genderDiv = document.createElement("div");
    genderDiv.className = "form__group gender";
    personalInfoDiv.appendChild(genderDiv);
    genderDiv.append(genderSelect);

    const dateOfBirthDiv = document.createElement("div");
    dateOfBirthDiv.className = "form__group date_of_birth";
    personalInfoDiv.appendChild(dateOfBirthDiv);
    dateOfBirthDiv.appendChild(dateOfBirth_label);
    dateOfBirthDiv.appendChild(dateOfBirth_input);

    const profileImg_inputDIV = document.createElement("div");
    profileImg_inputDIV.className="crewProfileImage_input form__input";
    profileImg_inputDIV.appendChild(profileImg_input);
    const profileImg_outermostDIV = document.createElement("div");
    profileImg_outermostDIV.className="form__group crew_profile_img";
    profileImg_outermostDIV.appendChild(profileImg_label);
    profileImg_outermostDIV.appendChild(profileImg_inputDIV);
    personalInfoDiv.appendChild(profileImg_outermostDIV);

    const bioDiv = document.createElement("div");
    bioDiv.className = "form__group bio";
    personalInfoDiv.appendChild(bioDiv);
    bioDiv.appendChild(bioBox);

    //delete button
    const itemDeleteDiv = document.createElement("div");
    itemDeleteDiv.className = "item_delete";
    itemDiv.appendChild(itemDeleteDiv);
    itemDeleteDiv.appendChild(deleteBtn);  
    deleteBtn.addEventListener("click", function() {
        removeItem(itemDiv);
    });

    $('#' + genderSelect.id).select2({
        placeholder: "Choose gender"
    });
    
}

addBtn_director.addEventListener("click", function(event){
    addInput(event, addBtn_director.parentElement);    
});

addBtn_writer.addEventListener("click", function(event){
    addInput(event, addBtn_writer.parentElement);    
});

addBtn_cast.addEventListener("click", function(event){
    addInput(event, addBtn_cast.parentElement);    
});


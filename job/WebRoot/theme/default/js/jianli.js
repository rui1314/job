/**
 * 
 */
$(function(){
	$("#basicInfo .c_edit").click(function(){
		 var a = $("#nameVal").val(),
	        b = $("#genderVal").val(),
	        c = $("#topDegreeVal").val(),
	        d = $("#workyearVal").val(),
	        e = $("#currentStateVal").val(),
	        f = $("#emailVal").val(),
	        g = $("#telVal").val();
	        $("#name").val(a),
	        $('#basicInfo .profile_radio li input[value="' + b + '"]').attr("checked", !0).parent("li").addClass("current").siblings("li").removeClass("current"),
	        $("#topDegree").val(c),
	        $("#select_topDegree").val(c).css("color", "#333"),
	        $("#workyear").val(d),
	        $("#select_workyear").val(d).css("color", "#333"),
	        "" != e && ($("#currentState").val(e), $("#select_currentState").val(e).css("color", "#333")),
	        $("#email").val(f),
	        $("#tel").val(g),
	        $("#portraitShow img").attr("src", $("#basicInfo .basicShow img").attr("src")),
	        $("#portraitNo").hide(),
	        $("#portraitShow").show(),
	        $(this).addClass("dn"),
	        $("#basicInfo .basicShow").addClass("dn"),
	        $("#basicInfo .basicEdit").removeClass("dn"),
//	        j($("#basicInfo"))
	});
	
});
function opera_gx_challenge_submit_traveller_challenge(_value) {
	var _challenge_id = "57cf518b-f02c-449a-b674-2bfdc6be1a44";
	
	if (gxc_get_query_param("challenge") == _challenge_id)
		gxc_challenge_submit_score(_value);
}

function opera_gx_challenge_submit_sniper_challenge(_value) {
	var _challenge_id = "4a49b238-8abc-48e8-bd79-99f1708a0149";
	
	if (gxc_get_query_param("challenge") == _challenge_id)
		gxc_challenge_submit_score(_value);
}

function opera_gx_challenge_submit_scorer_challenge(_value) {
	var _challenge_id = "cfb07222-cc2a-459d-bc63-095bb71b074f";
	
	if (gxc_get_query_param("challenge") == _challenge_id)
		gxc_challenge_submit_score(_value);
}
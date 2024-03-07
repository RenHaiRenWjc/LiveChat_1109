import 'package:com.jc.livechat/generated/json/base/json_field.dart';
import 'package:com.jc.livechat/generated/json/chat_account_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ChatAccountInfoEntity {
	@JSONField(name: "t_city")
	dynamic tCity;
	@JSONField(name: "t_id")
	int? tId;
	@JSONField(name: "t_idcard")
	int? tIdcard;
	@JSONField(name: "t_nickName")
	String? tNickname;
	@JSONField(name: "t_handImg")
	String? tHandimg;
	@JSONField(name: "t_role")
	int? tRole;
	@JSONField(name: "t_sex")
	int? tSex;
	@JSONField(name: "t_token")
	String? tToken;

	ChatAccountInfoEntity();

	factory ChatAccountInfoEntity.fromJson(Map<String, dynamic> json) => $ChatAccountInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $ChatAccountInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
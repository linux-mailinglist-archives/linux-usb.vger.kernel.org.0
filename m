Return-Path: <linux-usb+bounces-33857-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF6lBlFRpWkc8wUAu9opvQ
	(envelope-from <linux-usb+bounces-33857-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 09:58:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB131D519C
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 09:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B296B3032CC6
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 08:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12A638CFE9;
	Mon,  2 Mar 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="EWNOVwNG"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405CE1BCA1C;
	Mon,  2 Mar 2026 08:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441859; cv=fail; b=qL5TvHOygyBYR+SYsLbCfYu5vkg4U0PoeOoVq20ASi6ybcjHXA92WjKDzzdVIRWgw2wA7mbboc9yCz14ycrQpvh0IANn0TYMf/lk5jC5pLcFBIoR0Fnfceo8aRSbZbfxkY/EqDiGSTqMMPTG/D8DbQYlfM/efefcXQGyOt5YCBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441859; c=relaxed/simple;
	bh=XDb+eEsNp7VmypVdvk9H7SloK9PKiU3DF+OoOy1D1GA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KDm3MmgBSyDvMZi5bRbTFiDrt9Ka7RSpuPeIE47MVF5Z1UJh/VeaGE7/Xb8+E83o5/U9ljado9Ym0mHnx3BOAIFRJaVRM370nHJFrPG79LB9a9u5tleLjj6FKuoA4N1wg4drq3Nq/Uq9X5IN8Qbv4XEDgA8SdpTbdSh4xkzG5TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=EWNOVwNG; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGf8jEeRxw+qTJtLq0Jd+6/jtUv49WeRzkU0aLVkgR3y67U+uxpJ1cIfzvC14AsMox5ptoZrAhBNDcjES7clgH7cs2RB0j+gDnowPpLg/4K5j/J7FTOz6sevvaQYe51tgAMoC+zm15acBnu7Y6T2srSObNHMlv7NFVV4wcGGqg02bRmRnUMPlDFxnL4jm8W3BN99WWGPyIE5BJ5iZ2QvBoi2m0kiKrCIurRAx6bGo3lbenZZTQC+eahgY/Sxg963EJmfzqOgNx9Md7sOqZV4NJCdEt1qOT03qmvWJS+4uEQEeMAJYfjS4ryoerrbwOWdTZEFJ4ZGHcaY61o44EpF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDb+eEsNp7VmypVdvk9H7SloK9PKiU3DF+OoOy1D1GA=;
 b=ImKoeAU+gPRiYYrUBaXj8Ue7smHKNo1tp4lBTI08TqcuSJATN7tfoMgHx+u33q52mxXMVksR896fD/b3qhXEYzmBvi12gUqRg7IeBvwz8R9VqLhwF5g9yTVd9N+A4diWCCNj09CiNq6P1L3rhrsmhkLge/30T9CJ8ul5pWsfUvtat3jcPbz+LbGtn4U9FmaRh7wz6a0V2kcemm2WIHeCGUoaR9DD1aYrmWqj4zg1M1fFm0MeaV5qj4oX9hvGDhbLpZ1wZUd8rN353L3TwnWp2eKr5kXWGmQbSZSxTZmDBVur6QrDKBFLAEerRiS8IUQPUT9py9P9G0LsqxRzpmLSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDb+eEsNp7VmypVdvk9H7SloK9PKiU3DF+OoOy1D1GA=;
 b=EWNOVwNG63eJe16AZamwdOsqIb9j59lKAWqW6FBTYtNRASJqB4rY6MngotNTy3NElLiMylrudG4LlaUdGTiFgajTtsKKQLSheTkzucKOYU5gPbm3UsOiqTm1D/jafYQOczHaBQ6yEbn+P53l8C63CLgw5WOFcfnVZl9qTMIjjNA=
Received: from GV2PR06MB10809.eurprd06.prod.outlook.com
 (2603:10a6:150:2fa::21) by DBAPR06MB6679.eurprd06.prod.outlook.com
 (2603:10a6:10:178::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 08:57:33 +0000
Received: from GV2PR06MB10809.eurprd06.prod.outlook.com
 ([fe80::f29e:9a49:43b4:80fb]) by GV2PR06MB10809.eurprd06.prod.outlook.com
 ([fe80::f29e:9a49:43b4:80fb%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:57:33 +0000
From: LI Qingwu <qing-wu.li@leica-geosystems.com.cn>
To: Kuen-Han Tsai <khtsai@google.com>
CC: "hgajjar@de.adit-jv.com" <hgajjar@de.adit-jv.com>,
	"eugeniu.rosca@bosch.com" <eugeniu.rosca@bosch.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"guofeng.li@gm.com" <guofeng.li@gm.com>, "hardik.gajjar@bosch.com"
	<hardik.gajjar@bosch.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "maze@google.com" <maze@google.com>,
	"quic_kriskura@quicinc.com" <quic_kriskura@quicinc.com>,
	"quic_linyyuan@quicinc.com" <quic_linyyuan@quicinc.com>
Subject: RE: [PATCH] usb: gadget: f_ncm: Fix Kernel Panic due to access of
 invalid gadget ptr
Thread-Topic: [PATCH] usb: gadget: f_ncm: Fix Kernel Panic due to access of
 invalid gadget ptr
Thread-Index: AQHckNRR4N0ZpTKn1kabZCFzlnQx7bWbIbsg
Date: Mon, 2 Mar 2026 08:57:33 +0000
Message-ID:
 <GV2PR06MB108099AAD6B08041B19B10062D77EA@GV2PR06MB10809.eurprd06.prod.outlook.com>
References:
 <GV2PR06MB10809D32F05C864813CC36C10D791A@GV2PR06MB10809.eurprd06.prod.outlook.com>
 <CAKzKK0qdNaHSR8Kr7tvXbt8rK4J89iy_6ZDv8M3w_Uz+668c6w@mail.gmail.com>
In-Reply-To:
 <CAKzKK0qdNaHSR8Kr7tvXbt8rK4J89iy_6ZDv8M3w_Uz+668c6w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR06MB10809:EE_|DBAPR06MB6679:EE_
x-ms-office365-filtering-correlation-id: 453f0b4c-a13f-43af-24c3-08de7839be4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 jEfiCwgahEP08bfiaqom4+1HLhuh5ZqP57cJY4Get5Hw+m4p//SOEYN4IqVJX/FkRt8u9YVH+wq8gBFX7yYAehAirg7iuKvtuUBpJnLP0bDoUSFjCJMgzQ/FwzbzMH1bz6IKizjD3QkJaAksJW8kmSGq6AVJMozXL/zn45nh/v8zWYbkVz/wCExucUtoUg8h3CVtbNvBdR8wDGxQWECrRhHttjVdva9fnMyPAjZcmOIIx3WSWE1bUvb+AWvO/f8C/VdtTokTpiouq4KTJ4GDRkVoyKD4AdC4GKX/Zb5f55eeDZ/NpzhRVrJVCqmehw7giDoUe4ccdlvCqn0IcJisJnRd/J3ZmK9sacR9vneVScgly2RDLv4N+7XCeGLbC1DCKltazR51E0iJ34lI23mQHCIhdx2t/ruc5Ys1v3Qa1OeJ4EmLU/lFoyIw9TQf0f9K++Jik4TEJjOEauvmG63abphoFC9v5W/7qiIGsi9a27co+Pnwnw5duxh5qSDwRu4H+JzIqMZNxrR68WDZONzJ/0YkM9Skk0Yh4ruVfBjTNRrQatAaqtw3O0aJVWaUdf+ZW53Exze4PgEE7/AYV+ePUtUzsC60vG/DMNksof+3F33OCYsxbA4ew6fqFy0Y9hEkwwaGBtp/CebzYMYu0Kem39RKhs+7+JWexUPAKpXHAhPAL2y/AMdE7vjDZyNXQQ8UY4PwI6m6gFFGE4f8Y9u/ZRx1KB5J47RNZU+u2BY8pNyiWLL+4vln0P5Pzb384ktIdUEV5Ftm+oYSK4I9IE5F3b9zF2H+lxVwvKAdq3XQC8Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR06MB10809.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWRkVXNIc0FHSmRaVWhqUVoyRjdoKzNKUnBZSWxIWmJVdzlsM3lCUzJmc0pm?=
 =?utf-8?B?MEZieWdQTGFmK0s2RU9ieEYvbnZWM2pwWkZPTVJrdDdteXFuZnh3VDdvbnFM?=
 =?utf-8?B?N3NCYXBlL3VPa0NMVXpBaU5YYlpBRStPVk9FVjZtR1lFNzFTdk5RcmxTd3RV?=
 =?utf-8?B?djhBNEZrVlZhZW8wQklpbTd2Tm8zOG5mQUZ1MEhVK0VleUJscWsxV1NpSUNy?=
 =?utf-8?B?NkpTK2ZyQk5Gc0xqdGU2bjlUQ3c1N25WN3FPbTVOOHo2UGRNd2JoWDBZRmdE?=
 =?utf-8?B?bHlRWEFqOHpCQk1IVjJUYU5JUHYvM0lkTTN1RmdYeThTcUFKWEdseGVTbjJO?=
 =?utf-8?B?ZlNFazRlM2Vha2dqYWtlQ295MW9qSXpIRUh3elJFTmZRbnRpV0RmQjhpT214?=
 =?utf-8?B?U2FiemJJUGJaNy9MNnFrTGRpVFl0VU9sUHloQVIxd0FsZGJnaWZQVllWUVBR?=
 =?utf-8?B?NGxpMmpjMy9XOFVKZlBvN21iZDVUN3VqRFNQcjA0WXJVTitKQk1vZ0FXMCti?=
 =?utf-8?B?ODdLc3oyMDNUdnY2bzJPVTBOWWs3ODc1dGpvZ2hXUVFKTGtnanpOZGU2Vkpj?=
 =?utf-8?B?cWlxTjQybHpaclRJOUg0dkdTejVORUJ5REx0R3VONHVONm5YVC9tWThLUGxU?=
 =?utf-8?B?N09PemdKS2Z2TmhTaHVjdUlQeGJOaUZoajhkUG5STFhRWWxtcVBYSTdzVGhU?=
 =?utf-8?B?RFp6SWJ5cTc4Q3JETzV0Qk13TTRNd29GVHJxYk1wQ3JVaWU1cVMvTGtXdzZu?=
 =?utf-8?B?OFBRMFhneVZQcW15aU1GTis2VVFRS0ZLSXV4dng0aEhudjBmUEZuNEJsQlc2?=
 =?utf-8?B?aEcvQ3JRSndTRmUrMWQzcDF3LytORkdzMTJtWnF5RXhnY2toUklWeC9PQTF2?=
 =?utf-8?B?VE50bEdrdm5lcUJnWUF5WjFCV1hEQnd6VlI3TVIvU1hXcmoxTDFlcVNaOHpV?=
 =?utf-8?B?cEdVV09wbE1pOHV2UUM0MW1lTkdlVWNjU051S2FXYjIwOGhEMlhUallLRHJW?=
 =?utf-8?B?WHNPQlNSTHdyK0tFRUNnS2NMSmVwQlZaUkpMRTFKTEc0Qk9LaWJuYi9SNi9n?=
 =?utf-8?B?enllUnlzM015Vk1rVXhmMUdxZkZaVEQyZlkzcmRWOVQ0N1NOeEJOc1UyeERv?=
 =?utf-8?B?MzRRT3ZDbXdlaUJ1K1RMbmJZNW1ueTcvZFpjL29GVkVqVEM3R29qdGNXR0F5?=
 =?utf-8?B?dTVxcEZ2MFFtNGNYN2MyRmF2cVhYZVZ6L3Y4YVozcXREQW1ZWlduNU1ldisy?=
 =?utf-8?B?OVAxVFNWYjJpa2svZVEvZE5lSWlucnJFWUZ0NWhqVlE3QVM5VDViRE5UYUMx?=
 =?utf-8?B?QmlKcHhmTHlCNUVybTBOTzBpUzhmSVJoMlFKcDdudnltSnlhdE1uVU9YZVdV?=
 =?utf-8?B?NFQwMi9Ua2c1Z2VqSk9nSUx3eWt1U1o4RmxLM3Y2MEtyQmdUVmJlZEU4OCtP?=
 =?utf-8?B?emZQdDV5azJiNENQVHRJY2t1dlluYmdkUEI1K21wM0tzb2I1Y1ZOTmlhZEhK?=
 =?utf-8?B?RUoyT3h2TTlpZVdiTEFxRlBObjQvTmdDRXdBcitFd080VFBaNGFmK0xkRUVP?=
 =?utf-8?B?Y0ZiOGZMM2FrQ3lPRFJrWTdqVCtYY09PWWVKUm9LQS9ZQW1EZG5JcDl3Q3VV?=
 =?utf-8?B?VzVvVFlaVllYcjFrWFg3bmJ2S1YrWHBGVFhPZlIwUzFMRmh4NzJueXdPR05V?=
 =?utf-8?B?eTZVb2RGN3dDMUtHYVhWbjRBeDNFZ1FVN2I2WldoU3NTM1o2c3B3SStPVjJC?=
 =?utf-8?B?QllvblBzaURaaDVOWE92NDNXeEc4QlFNS3hwUm1aY1c0VnQrSHY0Rm9LZ0tP?=
 =?utf-8?B?S3JJVUlDOEMwVWU4Z1NyZkh4Q0s4bEQyQjRLVjlqZnE3Z252clZLNWRUakxT?=
 =?utf-8?B?UGV1QjYva0FyaGNnMlF6RDY5V3d3dFAzVjhlQkZPbjh4QXZzV3ppV0oyTXdT?=
 =?utf-8?B?S1FlbmV5U1MxS0RUaFpCb2w0eEVqVEsrWmY4MU9ndTJqNTZQV0JEeGl5VFBz?=
 =?utf-8?B?ejBsWHppSVI2NDk3YmtBRWh4bjhPRlZQMi9UaE54Q014QWtsYzVyVkIvNU5s?=
 =?utf-8?B?T3VON2FTd3FINDhGVkVVOEhaZnZkT296NUhRaG9zMVpoaEo4cWt0a0p5R1Ey?=
 =?utf-8?B?L2EyTUc5by80Vkg3UjZTREZhYUM4NVZ5VlZxcEI0WkYzSHhiVlBQL0phaGFZ?=
 =?utf-8?B?b3d2ejVENWlxYnUxZWhFMEhQYXJqNnVxYzB6dkRsUC8va0lNTDYxQVNUeXQ0?=
 =?utf-8?B?ZGxySCtwTlFqeGRoamtFT09pT2xmQUZrNlo0aWxRY2dLanMwMEJ3amJYYVVo?=
 =?utf-8?B?NEVwSTZodDQ2YmFZbjhEVkRDU0dWeGdIeXhiSHJxTEdSZ3B2N1E2RnhKWHNT?=
 =?utf-8?Q?KYQXDoEeL/w6uJm8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR06MB10809.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453f0b4c-a13f-43af-24c3-08de7839be4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 08:57:33.3622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpL/yt6i4FbTXsAlP4Vv8W0dC4z1KmYYKv0ChCxg9oylvr1e8uv65YOhpMfpE30kZAe7ug/iSKT0DSgLShYu/NO5aq2FwdPNToGm8vL63pTnNzlhI+zgdovzdeeYXbFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6679
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[leica-geosystems.com.cn,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[leica-geosystems.com.cn:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33857-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[leica-geosystems.com.cn:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qing-wu.li@leica-geosystems.com.cn,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bosch.com:email]
X-Rspamd-Queue-Id: 6EB131D519C
X-Rspamd-Action: no action

wqANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3Vlbi1IYW4gVHNhaSA8
a2h0c2FpQGdvb2dsZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDI5LCAyMDI2IDEy
OjA0IFBNDQo+IFRvOiBMSSBRaW5nd3UgPHFpbmctd3UubGlAbGVpY2EtZ2Vvc3lzdGVtcy5jb20u
Y24+DQo+IENjOiBoZ2FqamFyQGRlLmFkaXQtanYuY29tOyBldWdlbml1LnJvc2NhQGJvc2NoLmNv
bTsNCj4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGd1b2ZlbmcubGlAZ20uY29tOyBoYXJk
aWsuZ2FqamFyQGJvc2NoLmNvbTsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbWF6ZUBnb29nbGUuY29tOw0KPiBxdWljX2tyaXNrdXJh
QHF1aWNpbmMuY29tOyBxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHVzYjogZ2FkZ2V0OiBmX25jbTogRml4IEtlcm5lbCBQYW5pYyBkdWUgdG8gYWNjZXNz
IG9mIGludmFsaWQNCj4gZ2FkZ2V0IHB0cg0KPiANCj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1h
aWwgZnJvbSBraHRzYWlAZ29vZ2xlLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50DQo+
IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0K
PiBUaGlzIGVtYWlsIGlzIG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2Uu
IFBsZWFzZSBiZSBjYXJlZnVsIHdoaWxlDQo+IGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFj
aG1lbnRzLCBvciByZXBseWluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+IE9uIFdlZCwgSmFu
IDI4LCAyMDI2IGF0IDY6NDnigK9QTSBMSSBRaW5nd3UNCj4gPHFpbmctd3UubGlAbGVpY2EtZ2Vv
c3lzdGVtcy5jb20uY24+IHdyb3RlOg0KPiA+DQo+ID4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBh
dCAwMTowNDoxOFBNICswMTAwLCBIYXJkaWsgR2FqamFyIHdyb3RlOg0KPiA+ID4gPiBPbiBGcmks
IE1hciAwOCwgMjAyNCBhdCAwNTo0NzozN1BNICswNTMwLCBLcmlzaG5hIEt1cmFwYXRpIFBTU05W
IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiAzLzgvMjAyNCA1OjI1
IFBNLCBIYXJkaWsgR2FqamFyIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gVGh1LCBNYXIgMDcsIDIw
MjQgYXQgMTE6MTI6MDdQTSArMDUzMCwgS3Jpc2huYSBLdXJhcGF0aSBQU1NOVg0KPiB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFsuLi5dDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIGJlbGlldmUgdXNpbmcgZ2V0aGVyX2NsZWFudXAgYWx0
b2dldGhlciBtYXkgbm90IGJlIGFuIG9wdGltYWwNCj4gc29sdXRpb24uDQo+ID4gPiA+ID4gPiBU
aGUgY3JlYXRpb24gYW5kIGRlbGV0aW9uIG9mIG5ldHdvcmsgaW50ZXJmYWNlcyBzaG91bGQgYWxp
Z24gd2l0aCB0aGUNCj4gYmVoYXZpb3Igb2YgZWFjaCBzcGVjaWZpYyBuZXR3b3JrIGRyaXZlci4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBGb3IgaW5zdGFuY2UsIGluIHRoZSBjYXNlIG9mIE5D
TSwgdGhlIHVzYjAgaW50ZXJmYWNlIGlzDQo+ID4gPiA+ID4gPiBjcmVhdGVkIHVwb24gdGhlIGNy
ZWF0aW9uIG9mIGEgZGlyZWN0b3J5IGluDQo+ID4gPiA+ID4gPiBjb25maWcvdXNiX2dhZGdldC9n
WC9mdW5jdGlvbnMvbmNtLnVzYjAsIGFuZCBpdCBpcyByZW1vdmVkDQo+ID4gPiA+ID4gPiB3aGVu
IHRoZSBjb3JyZXNwb25kaW5nIGRpcmVjdG9yeSBpcyBkZWxldGVkLiBUaGlzIGZvbGxvd3MgYSBz
dGFuZGFyZA0KPiBmbG93IG9ic2VydmVkIGluIG1hbnkgbmV0d29yayBkcml2ZXJzLCB3aGVyZSBp
bnRlcmZhY2VzIGFyZSBjcmVhdGVkIGR1cmluZw0KPiBkcml2ZXIgbG9hZGluZy9wcm9iaW5nIGFu
ZCBkZWxldGVkIGR1cmluZyByZW1vdmFsLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IEhpIEhhcmRpaywNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICBZZWFoLiBJIG9ic2VydmVkIHRo
aXMgYmVoYXZpb3IuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFR5cGljYWxseSwgZGVsZXRpbmcg
dGhlIGdhZGdldCBvbiBldmVyeSBkaXNjb25uZWN0aW9uIGlzIG5vdA0KPiA+ID4gPiA+ID4gY29u
c2lkZXJlZCBhIGdvb2QgcHJhY3RpY2UsIGFzIGl0IGNhbiBuZWdhdGl2ZWx5IGltcGFjdCB0aGUg
dXNlcg0KPiBleHBlcmllbmNlIHdoZW4gYWNjZXNzaW5nIHRoZSBnYWRnZXQuDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gR290IGl0LiBJIHdhcyBzdXNwZWN0aW5nIGlzc3VlcyBt
aWdodCBjb21lIHVwIGR1cmluZyBmYXN0DQo+ID4gPiA+ID4gUGx1Zy1Jbi8gUGx1Zy1PdXQgY2Fz
ZXMgYXMgc2V0dGluZyBhbmQgY2xlYW51cCBvZiBuZXR3b3JrIGludGVyZmFjZQ0KPiBtaWdodCB0
YWtlIHNvbWUgdGltZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSW4gb3VyIHNwZWNpZmljIHNj
ZW5hcmlvLCByZXRhaW5pbmcgdGhlIHVzYjAgbmV0d29yayBpbnRlcmZhY2UNCj4gPiA+ID4gPiA+
IGhhcyBwcm92ZW4gdG8gZW5oYW5jZSBwZXJmb3JtYW5jZSBhbmQgc3RhYmlsaXplIGNvbm5lY3Rp
b25zLg0KPiA+ID4gPiA+ID4gUHJldmlvdXMgYXR0ZW1wdHMgdG8gcmVtb3ZlIGl0IHJlc3VsdGVk
IGluIGFuIG9ic2VydmVkIGluY3JlYXNlIGluIHRpbWUNCj4gb2YgMzAwbXMsIHBhcnRpY3VsYXJs
eSBhdCB0aGUgc3RhcnQgb2YgQXBwbGUgQ2FyUGxheSBzZXNzaW9ucy4NCj4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MgZm9yIHRoaXMgaW5mby4gTWFrZXMgc2Vuc2UgdG8g
a2VlcCBpdCBpbiBmcmVlX2luc3Qgb25seS4NCj4gPiA+ID4gPiBCdXQgbXkgaW5pdGlhbCBkb3Vi
dCBvbmx5IHN0ZW1tZWQgZnJvbSB0aGUgZmFjdCB0aGF0IGFjdGlvbnMNCj4gPiA+ID4gPiB0YWtl
biBkdXJpbmcgYmluZCBtdXN0IGJlIHJldmVyc2VkIGR1cmluZyB1bmJpbmQuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IEZ1cnRoZXJtb3JlLCBpdCdzIGltcG9ydGFudCB0byBoaWdobGlnaHQgdGhh
dCBpbiBRdWFsY29tbQ0KPiA+ID4gPiA+ID4gcHJvZHVjdHMgYW5kIG1zbSBrZXJuZWxzLCB0aGUg
aW5jbHVzaW9uIG9mIGdldGhlcl9jbGVhbnVwIGluDQo+ID4gPiA+ID4gPiB0aGUgdW5iaW5kIHBy
b2Nlc3Mgd2FzIGV2ZW50dWFsbHkgcmV2ZXJ0ZWQuIFdoaWxlIHRoZSBzcGVjaWZpYw0KPiA+ID4g
PiA+ID4gcmVhc29uIGZvciByZXZlcnRpbmcgdGhlIHBhdGNoIGlzIHVua25vd24sIGl0IHN1Z2dl
c3RzIHRoYXQNCj4gPiA+ID4gPiA+IHRoZSBhZGRpdGlvbiBtYXkgbm90IGhhdmUgeWllbGRlZCB0
aGUgaW50ZW5kZWQgb3IgcmVxdWlyZWQNCj4gPiA+ID4gPiA+IHJlc3VsdHMNCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBGb2xsb3dpbmcgaXMgdGhlIHJldmVydCBwYXRjaCBkZXRhaWxzIGluIG1z
bS01LjQga2VybmVsLCBpZiB5b3Ugd2FudA0KPiBjaGVjayBpdC4NCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiBSZXZlcnQgInVzYjogZ2FkZ2V0OiBmX25jbTogYWxsb2NhdGUvZnJlZSBuZXQgZGV2
aWNlIHVwb24gZHJpdmVyDQo+IGJpbmQvdW5iaW5kIg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgMDA2ZDhhZGY1NTVhOGM2ZDM0MTEzZjU2NGFkZTMxMmQ2OGFi
ZDNiMy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBNb3ZlIGJhY2sgdGhlIGFsbG9jYXRpb24g
b2YgbmV0ZGV2aWNlIHRvIGFsbG9jX2luc3QoKSwNCj4gPiA+ID4gPiA+IG9uZS10aW1lIHJlZ2lz
dHJhdGlvbiB0byBiaW5kKCksIGRlcmVnaXN0cmF0aW9uIGFuZCBmcmVlIHRvDQo+ID4gPiA+ID4g
PiBybV9pbnN0KCkuIFRoZSBVSSB1cGRhdGUgaXNzdWUgd2lsbCBiZSB0YWtlbiB1cCB3aXRoIHBy
b3Blcg0KPiBzdGFrZWhvbGRlcnMuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQ2hhbmdlLUlk
OiBJNTY0NDhiMDhmNjc5NmE0M2VjNWIwZGZlMGRkMmQ0MmNkYzBlZWMxNA0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFncmVlLiBUaGlzIHdhcyBtZXJnZWQgZmlyc3QgaW4gNC4x
OSBkb3duc3RyZWFtIChtb3N0IHByb2JhYmx5DQo+ID4gPiA+ID4gZm9yIGNhciBwbGF5IHVzZSBj
YXNlIG9ubHkpIGFuZCB0aGVuIHJldmVydGVkIGluIDUuNC4gQnV0DQo+ID4gPiA+ID4gcHJlc2Vu
dCA0LjE5IGNvZGUgaW4gUUMgc3RpbGwga2VlcHMgaXQgaW4gdW5iaW5kIHBhdGguIFRoZSBvbmx5
DQo+ID4gPiA+ID4gcmVhc29uIEkgc3VzcGVjdCBpdCB3YXMgcmV2ZXJ0ZWQgd2FzIHRvIGdldCBi
YWNrIG9uIHRvIHNhbWUgcGFnZQ0KPiA+ID4gPiA+IHdpdGggdXBzdHJlYW0gZHJpdmVyIChhdGxl
YXN0IHN0YXJ0aW5nIGZyb20gNS4xMCwgdGhpcyB3YXMgdGhlDQo+ID4gPiA+ID4gcmVhc29uaW5n
IHRvIHJlbW92ZSBnZXRoZXJfY2xlYW51cCBpbiB1bmJpbmQgcGF0aCBhbmQgcHV0IGl0IGJhY2sg
aW4NCj4gZnJlZV9pbnN0KS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4g
PiBLcmlzaG5hLA0KPiA+ID4gPg0KPiA+ID4gPiBUaGFua3MgS3JpbnNobmEgZm9yIHlvdXIgY29t
bWVudA0KPiA+ID4gPiBDb21lIHRvIHRoZSBmaXJzdCBjb21tZW50IGZyb20gR3JlZy4NCj4gPiA+
ID4NCj4gPiA+ID4gPiBXaGF0IGNvbW1pdCBpZCBkb2VzIHRoaXMgZml4Pw0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gdGhhbmtzLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZ3JlZyBrLWgNCj4gPiA+ID4N
Cj4gPiA+ID4gPkhpIEdyZWcsDQo+ID4gPiA+DQo+ID4gPiA+ID5UaGUgbmV0d29yayBkZXZpY2Ug
cGFyZW50IGlzIG5vdCBiZWluZyBwcm9wZXJseSBjbGVhbmVkIHVwIGR1cmluZw0KPiA+ID4gPiA+
dW5iaW5kIHNpbmNlIHRoZSBcIGluaXRpYWwgY29tbWl0IG9mIHRoZSBkcml2ZXIuIEluIHRoYXQg
Y2FzZSwNCj4gPiA+ID4gPnNob3VsZCBJIG1lbnRpb24gdGhlIEZpcnN0IGNvbW1pdCBJRCBvZiBc
IHRoZSBkcml2ZXIgYXMgYnJva2VuDQo+ID4gPiA+ID5jb21taXQgb3Igd291bGQgeW91IGFkdmlj
ZSB0byBzYXksIEZvciBleGFtcGxlICJDbGVhbiB1cCBuZXRkZXYgXA0KPiBwYXJlbnQgaW4gdW5i
aW5kIi4NCj4gPiA+ID4NCj4gPiA+ID4gPlRoYW5rcywNCj4gPiA+ID4gPkhhcmRpaw0KPiA+ID4g
Pg0KPiA+ID4gPiBAR3JlZywNCj4gPiA+ID4NCj4gPiA+ID4gQ2FuIHlvdSBwbGVhc2UgcHJvdmlk
ZSBndWlkYW5jZSBvbiBob3cgdG8gcHJvY2VlZD8gU2hvdWxkIEkgdXBkYXRlIHRoZQ0KPiBjb21t
aXQgbWVzc2FnZSB0byBleGNsdWRlIHRoZSB0ZXJtICdGaXgnIGluIHRoZSB0aXRsZT8NCj4gPiA+
ID4NCj4gPiA+ID4gVGhhbmtzLA0KPiA+ID4gPiBIYXJkaWsNCj4gPiA+DQo+ID4gPiBIaSBHcmVn
LA0KPiA+ID4NCj4gPiA+IFNob3VsZCB3ZSBtb3ZlIGZvcndhcmQgaWYgdGhlcmUgYXJlIG5vIGZ1
cnRoZXIgY29tbWVudHM/DQo+ID4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gSGFyZGlrDQo+ID4N
Cj4gPg0KPiA+IEhpIEhhcmRpayBhbmQgYWxsLA0KPiA+DQo+ID4gR2VudGxlIHBpbmcgb24gdGhp
cyBwYXRjaC4gSSB3YW50ZWQgdG8gZm9sbG93IHVwIG9uIHRoZSBzdGF0dXMgYW5kIHNlZQ0KPiA+
IGlmIHRoZXJlIGhhdmUgYmVlbiBhbnkgdXBkYXRlcyBvciBhbHRlcm5hdGl2ZSBmaXhlcyBhcHBs
aWVkLg0KPiA+DQo+ID4gSSBoYXZlIHJlY2VudGx5IHRlc3RlZCB0aGlzIHBhdGNoIG9uIE5YUCBp
TVg4TVAgcGxhdGZvcm1zIGFuZCBjYW4NCj4gPiBjb25maXJtIGl0IHN1Y2Nlc3NmdWxseSByZXNv
bHZlcyB0aGUgdXNlLWFmdGVyLWZyZWUgcGFuaWMgaXNzdWUuDQo+ID4NCj4gPiBCZXN0IFJlZ2Fy
ZHMNCj4gPiBMaSBRaW5nd3UNCj4gDQo+IEhpIFFpbmd3dSwNCj4gDQo+IEkgcmVjZW50bHkgc3Vi
bWl0dGVkIGEgcGF0Y2hzZXQgdG8gYWRkcmVzcyB0aGUgbGlmZXRpbWUgbWlzbWF0Y2ggYmV0d2Vl
biB0aGUNCj4gbmV0d29yayBkZXZpY2UgYW5kIGl0cyBwYXJlbnQgZ2FkZ2V0IGRldmljZSBmb3Ig
dGhlIE5DTSBkcml2ZXIgWzFdLg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSB2ZXJpZnkgaWYgdGhp
cyBzZXJpZXMgcmVzb2x2ZXMgdGhlIHByb2JsZW0gZm9yIHlvdT8NCj4gDQo+IFsxXQ0KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEyMzAtbmNtLXJlZmFjdG9yLXYxLTAtNzkzZTM0
N2JjN2E3QGdvb2dsZS5jb20NCj4gUmVnYXJkcywNCj4gS3Vlbi1IYW4NCg0KSGkgS3Vlbi1IYW4s
DQoNCkkgdGVzdGVkIHRoaXMgc2VyaWVzIG9uIGkuTVg4TVAgYW5kIGNvbmZpcm1lZCBpdCByZXNv
bHZlcyB0aGUgdXNlLWFmdGVyLWZyZWUgcGFuaWMuDQpUaGFua3MgYSBsb3QhDQoNCkJlc3QgUmVn
YXJkcw0KUWluZ3d1DQoNCg0K


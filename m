Return-Path: <linux-usb+bounces-4494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A481B714
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 14:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B052D1F22BA3
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5694D73480;
	Thu, 21 Dec 2023 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="JGKWMONE"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC746745EC;
	Thu, 21 Dec 2023 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEPec6CbRE87/y62DtZSLkV6tbn9BxqhSEUCp6Jreh6YwNMOjI3DUI+qKhVsFVbf/79D1+4P58CJTaIfUbUScmp/GHpYog+oMxrLi+6oa6uIbWAoXQbUbihWCzB0a8LIip5mf61X6vPboXkl0p4ivD89jnh0+ozsO0m5UBYvb5XQ/iO2+KtjXhn9dUrxB4BGXdw3Nvwvoux5QC6Am0hm2kPaPrF4ja+QtkNiIKMNbVSFfTPjUoFl06nL2lchDP186HXRpyhZkDWfgvn+uAV7DzQWusIpwI9tCxDzNJSlIz6h6FhSgOHX6VI8bU3lqD4yE1ef4SeBstXPVREppPIttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kD8cCTjY5fA/8rxh73msCd5ygQnVwnVms8uaBfWWD84=;
 b=HKQ/ivAc/cFvG1tVIACB/+ynInxygbyZZGGvgn1AzXK1jJCik/6K2j28GYCV5aqoWzsyprHZp/CWm0arf0tQAtzm8fevCbDw0FgyHsXnemOJMEncrNHQRfDXYcQfkzCUH8cSdpwtOgrh9JjEVuu+ktiF+t3tsnUqdiDihAZdartZQJ8w9pg/L3csAN2oVpX16500vOS4fo4q5og34/2kcTcyLVHkQz1C+jkvSZEdJXyNxkjGGkmVBQTrIxgmWyzxjrR/9L9w/noh8P2+5/w064a4l+hGsxBJtW84uqrFUQA/geOgw1FaMmv6Wzz0F/O+Dl7jEPvVWa/7OjwPlwlFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD8cCTjY5fA/8rxh73msCd5ygQnVwnVms8uaBfWWD84=;
 b=JGKWMONEkiRCB6iir32ZKiyzDxFrNJHl/eGS6FKXNo5j5mQjIjd8d///dvaOiniHE/hAxEsstRuajZr8vx5wx6BtxbEEUYxLlgXcxhW1r/dUuER5TJejMq4IrwuRMG8NkrXxEl8rPaivKceNoupihmbURz3vcnYKBXYYyYVbx7M=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Thu, 21 Dec
 2023 13:13:00 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 13:13:00 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 3/5] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Topic: [EXT] Re: [PATCH v2 3/5] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Index: AQHaMY8UOQiWyFDAzkW6GCXANeLhorCwPDMAgAEvKKCAAFyugIAB8h5g
Date: Thu, 21 Dec 2023 13:13:00 +0000
Message-ID:
 <DB7PR04MB5146920CF37DBF212199C1958C95A@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
 <20231218085456.3962720-3-xu.yang_2@nxp.com>
 <eb93c554-ee35-49a0-adfb-0d3030f9a77b@linaro.org>
 <DB7PR04MB5146154E6C62BCFCDA7879F38C96A@DB7PR04MB5146.eurprd04.prod.outlook.com>
 <e3ca4b8e-7e5b-4e0d-963d-e020729cab6c@linaro.org>
In-Reply-To: <e3ca4b8e-7e5b-4e0d-963d-e020729cab6c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|DU2PR04MB8822:EE_
x-ms-office365-filtering-correlation-id: c2d1bd03-8df8-4a54-ccac-08dc02268eb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KODwBtsbGBPpHfRXirzHfKbZjQQTzOdIrcOION7JrnZ+41l2jAkuxBBVjmWF5CmDladhLnlv8FT4qOAdHkZoez6KzhSlUU8rzq9IJiUmwySFgY3DQDo/c+pCpP08ngco0lDlpgX8Y686wEy5J9mAxhm5eq9zpLy7sDRLegqBkMi9h8KPEskI/N8flFndLTd7a+nRIOwsBhb2YrApw1I8OgJzobmyIz36zCq3IIF/f3dJRu2UVRzs6wSzvMYt/Y7LffJ1uvnyJ36o72JJ77oM6vc40UEIRy+qbnmnaTyiT5AjBRhGeP72vgdhRInd2FETbRnvScxpl6xYE8F4TTxy/J3sEwlROxnlirVnd42LF0ABnEW9bKDTB7SSuLboc2GpZg9PZkccGHL/9BrRhrHaqNu1KGVnJqz1iA1pekCVeq3NpN6hkO84Pzrpzo2CQ9l26nykUVvrXvfr2TQbFGHO4RgRdxpwlTgioGCVzp/BhLypMng2S1KPOpV45m3jLnXdta8AgkUSvMj/XIpeav7fnvQzJrUGMUSMNVmtnnyOeROlsI4xv0Z0oCeoNsnGICrkfTgPXWd8RloGngArc4JP/O3u864J/XBqo+fAwovvEFPvQykLH6QLiwK2XqrMIGhO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6506007)(7696005)(9686003)(53546011)(83380400001)(33656002)(8936002)(26005)(7416002)(4326008)(38070700009)(66476007)(52536014)(8676002)(66556008)(86362001)(41300700001)(5660300002)(64756008)(4744005)(76116006)(316002)(66946007)(2906002)(110136005)(66446008)(54906003)(478600001)(55016003)(122000001)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0NIRHRYZnpFSG5jSzJFQjdnd3FQNmxiangvSzBFUlhhU3l1NzVmQmorU21H?=
 =?utf-8?B?RTBEdnpZRmZSN0dEQ1dKZGhWSnkxdUZFdHZsanJGV3BwdzMrZk9GMkRFNzlk?=
 =?utf-8?B?MWVWQVpEcHg4OWtPSlg2WXR5VGcrMFplL2F5Q0xoVExoQitBaDQvRzRkOFg0?=
 =?utf-8?B?RUpsRnhMMnZDWFBSdkZwV0Yra0NGT1RoTHpkU3ZGVnY3U0ljMFlKakFNYlR1?=
 =?utf-8?B?NlJPS3FBV05oMnRoL05YYWlWRFNIOG9abnNsb2hiRWpXeTVJSGpGYk8zbEd0?=
 =?utf-8?B?MFJidUdvYnFjRjk1SnhZd25aOWl4N3NIcHNTRnIzU3VzWXREaW1Pc1l4WkZx?=
 =?utf-8?B?NWFZeU5uSFNBbVZCYm9jL3FJQmxCNzE4OFZSTHB3aHRmZ20rQi96bDl0QlpD?=
 =?utf-8?B?UEFPR2JuM3NKbFhKY09tcng0aFZFeDdubzBUZzFoTWJxSEFNS0hLdi9OQjNu?=
 =?utf-8?B?ekNRcEJJNFBIVkMyY2xqckVDbVhOTWp3eDR3TjJUVnUxdVdEeUpFdzc0SXBo?=
 =?utf-8?B?TTlYbUQwbWs2dDdrMlNjUmR6Z041WTZwZU10ZlA5eTg0TWpLTXhaM3R4dlFS?=
 =?utf-8?B?bStNNkNEc3FrTERVRXZwcXNCUEFFMFFYTDZkVDZpM3I1WS9zUTZEc1BSTlVO?=
 =?utf-8?B?aCtOY0xUak44UEdqQ2NucUhmYVY1YmNtY0ZQOElXckpCeDRreVF5anRwRkw5?=
 =?utf-8?B?MlB6MmYxV2dkaUxLRS9jL1Y0TlR1TlRDcGJSN2ZSU2xKVXo3OURTVUxKY20w?=
 =?utf-8?B?Rkk2SjI4SDNNc2QwT3kyRFFqVklTcnZZYk5wM3BPd1JuMkVOWlJQYUVHSi9P?=
 =?utf-8?B?TDE3Z0MzbFgvOFJlN1B2WGt4d3E1czIvbWdDVWQxNkJFZHZjbEMzL3pkUzdI?=
 =?utf-8?B?dG1sbVNpbjFFdU5oRzF0RkNzRjJnZEk4VWZ4bzB6MmU0Nnl4aUdVTGFFWHNL?=
 =?utf-8?B?ck5vbWJQY1l2S1V5bXp6VlJ2VTJjYWgwRUY3Tmx4U1c4L3Q1N1NlakZvS2hl?=
 =?utf-8?B?OWJSVnhmOXJLdlR6Q0Ird3ppZHltWUM4dGZQVTQyek9iODNxNG4zU2d3YTJF?=
 =?utf-8?B?cG1ZMXlrdkFja091R3dQOVZncEtMd2xsZkZoNVhNMjd2SUUrUVA0enB3cVFo?=
 =?utf-8?B?aUJTaEVLR29TY2xHV1NtZUZLT0VPcFk1VWZoUlgzejVmdmlBVytjMXVaNDM5?=
 =?utf-8?B?M2ZWRy9kaTBZaXJJdGRRWk1RUUFVbGVyQVd6MjdMazQyNmh6STQzdkc2eUpX?=
 =?utf-8?B?b3U2Nk1CZWNNeEZheFhRVk54cE9GZjQxd3VvbkhsWHdxTmtYaTEvd2hzbU5q?=
 =?utf-8?B?UVFtTm9tVURWa1p6c1pQaHN3d1F0ZnlWSkQzRXNmd2hyWm1FTE5zcTdhYkV3?=
 =?utf-8?B?ZTBvcVNvSEEwZmwydTVTc21OV1liRGhYVTAwSE1Rd1hDZGRsRElVZEZuL3VG?=
 =?utf-8?B?MFk4UW9UdzhNcUhZSGZZcjBLTm1UblM4ZFJaaWVFYTkvcGsxM21XWkx5WDYv?=
 =?utf-8?B?S01udHdrY3JLZUVDNmtDMXJpQ0NBOUdCekV2aGNpTEZHc1VlMTh3YmRJRm1j?=
 =?utf-8?B?dFlGZmtSclVKYi9yaGNYTUNHejg1M0drZUZrclRUT1YrM3Nmb2d5VFMrV0Fs?=
 =?utf-8?B?enBXc0tMQUNuQXJFUW1pY01YUkxESUJoZFZnYVNoWVVoWjlvQTA1TVBVVDVr?=
 =?utf-8?B?S1A2aWhNdUJsR1d6SGJpVkFDbXZ6OGF6aERZWmRiUURabENVMFhabHU2L2N1?=
 =?utf-8?B?RjViT1R1SGlCZjBEQ3FTZHZmaTFReW5ZYThjNkFzajUvMDROdkIxNW9Ldk1v?=
 =?utf-8?B?KytWcFdSOTdsU0YzMi9CbFpKN0wycVhuSDFhYTRwalFhL3Z4RWJxQXhGVWNJ?=
 =?utf-8?B?Y1VmMllsMmg5UzVvUXlpdW1ib0hqWUg2dkplTXRFN1NDWk4wM2Nnd0VzY3NE?=
 =?utf-8?B?dS9lZXBJNTY2WStrTGVJQW1MSFBoSVZYMUJEZThUVnRkRFZyRjFERW5MU3p5?=
 =?utf-8?B?OXZXdnRNYjM4MVJIVzBER0dlN1IvQVFwWUEyc3lPOGxpVTdKaVhaMzB4THpw?=
 =?utf-8?B?TlZRY1llc0ZyMkZ4MmMrYW5CTWhUNWJyeXNDNTFEUFZWVUwxb3FlWW16R0hw?=
 =?utf-8?Q?Ho3w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d1bd03-8df8-4a54-ccac-08dc02268eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 13:13:00.6011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MrFeUsCHexPf43tGC4aJTB6MQqaDJQwrbwhjf7YYsV6Rvn0/hHuVtCf9rfYeJQ+LJjWNWTsM5rGB+Z1JlFShYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAyMC8xMi8yMDIzIDAzOjIzLCBYdSBZYW5nIHdyb3Rl
Og0KPiA+Pj4gKyAgLSBpZjoNCj4gPj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICAg
ICAgY29tcGF0aWJsZToNCj4gPj4+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4+PiArICAgICAg
ICAgICAgY29uc3Q6IGZzbCxpbXg5My11c2INCj4gPj4+ICsgICAgdGhlbjoNCj4gPj4+ICsgICAg
ICBwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4+PiArICAgICAg
ICAgIGl0ZW1zOg0KPiA+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHVzYl9jdHJsX3Jvb3RfY2xr
DQo+ID4+PiArICAgICAgICAgICAgLSBjb25zdDogdXNiX3dha2V1cF9jbGsNCj4gPj4NCj4gPj4g
V2hhdCBhYm91dCBhbGwgdGhlIHJlc2V0PyByZWcsIGludGVycnVwdHM/IE1heWJlIGl0IGlzIHRp
bWUgdG8gc3BsaXQgdGhlDQo+ID4+IHNjaGVtYSBpbnRvIGNvbW1vbiBwYXJ0IGFuZCBkZXZpY2Ut
c3BlY2lmaWMuDQo+ID4NCj4gPiBXaHkgSSBuZWVkIHRvIGNvbnNpZGVyIHJlc2V0LCByZWcgYW5k
IGludGVycnVwdHM/IFNob3VsZCBJIGFkZCByZXN0cmljdGlvbnMgb24NCj4gPiB0aGVzZSB0b28/
IEkgbWF5IG5vdCByZWFsbHkgdW5kZXJzdGFuZCB5b3VyIG1lYW5pbmcuDQo+IA0KPiBJIGxvb2tl
ZCBhdCB0aGUgYmluZGluZyBhbmQgaXQgc2VlbXMgdGhhdCB5b3UgYWxsb3cgZGlmZmVyZW50IG51
bWJlciBvZg0KPiBpdGVtcyBmb3IgdGhlbS4gV2h5IGFyZW4ndCB0aGVzZSBjb25zdHJhaW5lZCBm
b3IgeW91ciBkZXZpY2U/DQoNCldlbGwsIHVuZGVyc3Rvb2Qgbm93LiBJIHNob3VsZCBhZGQgbnVt
YmVyIG9mIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMNCmZvciBteSBjYXNlLiBIb3dldmVyLCByZXNl
dCwgcmVnIGFuZCBpbnRlcnJ1cHRzIHByb3BlcnR5IGlzIG5vdCBzcGVjaWFsDQpmb3IgaW14OTMu
DQoNClRoYW5rcywNClh1IFlhbmcNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0K


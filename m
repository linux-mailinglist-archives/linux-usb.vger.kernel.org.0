Return-Path: <linux-usb+bounces-5099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1EE82EA58
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 08:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28AF1F23FEB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 07:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBDC111A2;
	Tue, 16 Jan 2024 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gROqyCu8"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2043.outbound.protection.outlook.com [40.107.6.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C811700;
	Tue, 16 Jan 2024 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0kVqLCl7MN4/yaCD5HJbR2N/WqWfH7v79z6CFfu5ZScaTHh1PC5/jEFYGNa60LEthMDYKQIq7ftEsah8MkiwGklkXf4v33rA86Zkmv0fYUrfK+xoHzBoI1QGfVhUVVEDtoQBCd1PKBlU5z5TRBvR4cBOeuCgiO3ctbQi1yd2H5QNPzTDX3XyYL7bFvtaGzdB8N4eEWDf8N4uDLgUII9i3a2RkVnM+RqAWuOACw8NeVkANiY8/U09CbbsbXh2QYhnO8GEAE5K4N7Y7Xo0IPgOQx3S7yB4UWTUu/21xsfqj2qN4cJcLcSHPFuyj+s8C/7gUgXArxuC45kzt+543sQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BYmYPyVbtkhrLQ/kpjj1y5GqDoQ2skoczP9E1AR1J8=;
 b=Guv9CDNgr/xu26XZurXMJ9ZUEjR0InZbkCsBwOd7xnOb2xxInsv5npqXScJpgcd/BQn5CQ2UK5r2vxBNj1l/anCuZymW4FyXiyauJAr8cUNWob1jTbqlVrUlCWiBNQUUB+D+ldK4Kd4b3dX7FOK7brZ/yHSUD0PW2JWgWbaE31Z4bUVxxkVLznZUjpFU2i5SGuKPzSslVWnsdXAvKjwEnj3rlT0tFNS4aqgyTH6BuQ9pmsPdbvFyIBk6rfXT0WwWRoI+qRSfnnQcH4GTj8ayc3AqONac7dNcOwCD8CV5J+69d7mWCkJDX9pAezZhB0vJGqWsNMPORp9bpKiA+gi76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BYmYPyVbtkhrLQ/kpjj1y5GqDoQ2skoczP9E1AR1J8=;
 b=gROqyCu8U4yQcCVwKi4MpOyjnznWOIqod+once04FFPlTgTFJqdNipyzK1x/Ix7JYgli9ylmlSXKjF5deHjKOKieGcJP8XkI/zKeN3rNEXHLchSLWMKBEzsB2W2kAnbOD0wEzasDtynSAaI75UupBRB0yH1yXKSGCdew/JrOK5Q=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7593.eurprd04.prod.outlook.com (2603:10a6:10:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Tue, 16 Jan
 2024 07:49:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.029; Tue, 16 Jan 2024
 07:49:57 +0000
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
Subject: RE: [EXT] Re: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Topic: [EXT] Re: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Index: AQHaRUgjzNmZ+WDWXkmfSRtDZkmevLDaubUAgAFTw5A=
Date: Tue, 16 Jan 2024 07:49:57 +0000
Message-ID:
 <DU2PR04MB8822D31A8AD7BEE1F50AC78A8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
 <20240112111747.1250915-4-xu.yang_2@nxp.com>
 <3ade5e2c-e3dc-4cf4-9c12-2487e30a2253@linaro.org>
In-Reply-To: <3ade5e2c-e3dc-4cf4-9c12-2487e30a2253@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|DBBPR04MB7593:EE_
x-ms-office365-filtering-correlation-id: d6569e4c-17a6-48f2-675b-08dc1667bc35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SQVL2hImKt8cC5yWaiL6HcMPTvsaekNDzOHNuvsyNAy6o8nKDvLKiPQeDaiOBq4lr4GH8Nlz7MXFJNdBxf1Itf5x0vhwo6kilrVBwnT5mi72fCk+HNZFqkU6vHVqs5Srn/hkh/JZFMcfn9GVRHJwPkRqfYGCuSjRxe/NDZuq/M+nJZMhbjr8Wk4bK9mzUE7aYhEAs7yCriVVev9hbfBy7qLx+ULUHm5766VZH2LxS2Fj1uOxm0RyaQm21AAxHk/LvLGYAcRAOJAwuKbMNbsM9tYktmjGB6q02mNipRIsMhEM2kyd3j+ttHnBcpfc/nvR2r6YULNE3f+/PkBfmEHQp15bnFOv+larS07x1dm8cjMRRcCgG4mi4ByT2wy75Q9jqXXY0dVWVNIebGDEeg8ESz5zeQE9bj1mg/Z3CbRO7ZnS7ITwtMKmA+Ii4tnr8c7jik7aiALX8T3zAWCwOLeJPr1JXIygASV5WH+e7YvvtD7pMuTid4d+9HnkvSKNgui0TGj3dGXIr966bYgQ10WJSXPwlW4luk65Qtbl4LCZqga29W59U2xz1/senMeI7ILKXSzj9cBUnCmIU90qXAue/EtdaYgt+qWTnfUvgIBnQSThJJ+0iBidfspAny4zhs4/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(71200400001)(122000001)(38100700002)(316002)(76116006)(110136005)(52536014)(66446008)(66476007)(66556008)(54906003)(64756008)(66946007)(5660300002)(8676002)(8936002)(7696005)(9686003)(7416002)(6506007)(4326008)(2906002)(53546011)(478600001)(86362001)(33656002)(41300700001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2RWSGFiMWFNT2FGRWc1bElGV3FXbnFXZ2ZiREZ3ZW1mQ0NHdy84MFVYL0Jz?=
 =?utf-8?B?c1NiM2RSQVhRQW1KaWtYbnlZK3JjWUkyOHIyMzY1ZTRITEpBT0o3WlFCYTN2?=
 =?utf-8?B?cklTQjhoKzZibjVJQTlWdHNtbWk5elNnNlNiZE1xR2FLL0JIeWQ0amVRcXAz?=
 =?utf-8?B?aXI3ODVhSlI0azczQWpsejN2OUdka2gxSDJKUGhkZW02eEg4TFBCYzlQcjlq?=
 =?utf-8?B?ZS83UVk0ZlRaRHZheGx2SkxPRDZRM1hCN01DUUpGM3QrRjZ2eWpRaXZlYk5w?=
 =?utf-8?B?N3FiY1pJUmY0bnpYV2xaaWhqRDg3cjJvbzlSTVM0alB4Y1JOME9LV3djNkly?=
 =?utf-8?B?R1FwcGlPUXdtamJ0cG90eWtQUllubm84V1VCZTZkQkI1c0t4YlhUUS9Da1d1?=
 =?utf-8?B?ejl6cTVmS3ZncXFvRndpTjVyYzhESWxPQld6OW5GR3R6RmU5RjIvYW1aK3l3?=
 =?utf-8?B?b2lLdXJiWVVGVXlCbFdMVUhqNFpxS1FGblI3dkVJaDBoZUMzc1VNMnRibDk2?=
 =?utf-8?B?Qm4xdEhzYjVibzBXNTgyQTVvZXF4bmpFTkRtRnpBVjQxMzh0V3ZEaWoxbGMr?=
 =?utf-8?B?VjZHV29uNVZvbWN6emFibmkyUG5zMk82b3BHWmhUcmh6L2NFdVVTdTJUclF4?=
 =?utf-8?B?NHgwU0F0SVc1cENNWm1ybEJ5Y1liUVR4QTh3UDZTMlcxODgzZVZCT1pQTWt1?=
 =?utf-8?B?WDdPOGJFaTlpcng3ME9qM0NvZGdGK3VwK1lzM2tUQVRLTk9jZTZDRmJOQXNz?=
 =?utf-8?B?QzE3WU9yRm5HQWwyM3M0akRIc3lrMERacURkbWY3TGpJQ2dIS1RUSERqT2pX?=
 =?utf-8?B?ZU5WMnJkQWlkald4VUlTaTY1VzdNVlpGa3ZqbHo4UmRKUFl5MjcvdW8relA4?=
 =?utf-8?B?ODQydlZoalhGSkxHQ0RDbTRiZk5iNHc0YVZJcHMyYnBFb2pGQ1U1Rk5FS1gx?=
 =?utf-8?B?SFV5SlJXaWZYT0NBRDlsUUVaOE5QdE0vK0g4VStncTJKM3Fld0dIMS9PaTlU?=
 =?utf-8?B?M3BUZEdsNzZ0czdDVnNWNEE2TWpDTHVBNjltSlJNSWNiOGdYWWhDSGNmTEtO?=
 =?utf-8?B?WXRqQzFSb0sxVC8wKys3N1J2V1R3TXNMVlFJU0daczF5dU5GTG5lYzdIYXFk?=
 =?utf-8?B?Mm5LNEdRVWFvUlBEN01qTTYyQUpheEpkRzA1TzRWSW5DRENiUEw3M1hpY04x?=
 =?utf-8?B?R2VkdWYwWmlaamJKNkFmb2lIWitsWHpwRmtGNWppUm5EbVphUXZrVVN0Skh6?=
 =?utf-8?B?d1FPQk8vZDJic3Z6VTljTW9RdnIvRVJDNjBLRUFnNEhLanFtUnFMSWxTODJy?=
 =?utf-8?B?TW11b2tHSUtZZmZsaHpZbEk1WGtBQU9WK2RxcnE4TGYxbSsxcUlyNlVtaUg0?=
 =?utf-8?B?Zy9PY3pBbW81Qm1INExiQ1FoVHVVd1JXWStDbm14MVNHN2VIRW1tS2kvN3lQ?=
 =?utf-8?B?VG1rcjloNDlpWVEvWnU3Qk8ybHhNZjk3enFnSXBiVEZPWmtqMlZ3OHQ3aUN3?=
 =?utf-8?B?QzAzYjNaZmJIckIzcXpUMHFnbldBR0VYcXcvQ0tVTW01TUxLaWtOdUVEa05C?=
 =?utf-8?B?cHFqc0FvYXpMOW84c1ZoUzllVThkVXk1WVN0RllYaHNtNWJoWEMzMVhZSWpJ?=
 =?utf-8?B?ZUZ1aEZmSWRMOVZlMldHSWd5WlFjZUROUFpBRzBGYmx1UkRnMFVETDhDQ0My?=
 =?utf-8?B?bWNSWVFmNkxoUUZIS0tmRHJvOFJyL2xXRTdSc2dZTlAybWxmSTJQQmpEZTkz?=
 =?utf-8?B?RElLSkY2dStBb0pXdUtvM2pHYjQxZnZpSldwVytRcWMrTjM0alhMVDQwcXp1?=
 =?utf-8?B?c0tTZE45WlhON0NtbVdDcVQ4bkh1ZXJIWTJlZTlVeFdqdWFiVnRRSXFOSC9a?=
 =?utf-8?B?aVQyYXoxbXd6UVFDSksvd01lQ2g5dUZ6THFmOUgyQjBSbHFlMWF0QUVxanZl?=
 =?utf-8?B?WkRjNkU2YXVDMnR0ZlBOc0o4ZTMyVG1aOXBCOXVZcVRJcllIMGlURXN4N2xq?=
 =?utf-8?B?V1ArWG9SS0c0di9HNFIxMndjciszVm45aHpvaTlwNnhLS25LckJFRWdveENZ?=
 =?utf-8?B?THZYUmxEY2hHMFQ0eFJlOGQrTVplQTJrRHV3dz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6569e4c-17a6-48f2-675b-08dc1667bc35
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 07:49:57.4201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7CLz5etqDUaEdIZcOY66D3GkEOJPTqZg+PQNAB0oS/lyPjp5Qo8pMUEB82NqTwuh3tJjhIdhznYW9cX6dPe0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7593

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxMi8wMS8yMDI0IDEyOjE3LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IFRoZSBpLk1YOTMgbmVlZHMgYSB3YWt1cCBjbG9jayB0byB3b3JrIHByb3Blcmx5LiBU
aGlzIHdpbGwgYWRkIGNvbXBhdGlibGUNCj4gPiBhbmQgcmVzdHJpY3Rpb24gZm9yIGkuTVg5MyBw
bGF0Zm9ybS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAu
Y29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSBubyBjaGFuZ2Vz
DQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAgLSBhZGQgY2xvY2tzIHJlc3RyaWN0aW9uDQo+ID4g
LS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbCAg
ICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9jaS0NCj4gaGRyYy11c2IyLnlhbWwNCj4gPiBpbmRleCBiN2U2NjRmNzM5NWIu
LjZlNzUwOTliNjM5NCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+IEBAIC01Nyw2ICs1
Nyw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAg
ICAgICAgLSBmc2wsaW14OG1tLXVzYg0KPiA+ICAgICAgICAgICAgICAgIC0gZnNsLGlteDhtbi11
c2INCj4gPiArICAgICAgICAgICAgICAtIGZzbCxpbXg5My11c2INCj4gPiAgICAgICAgICAgIC0g
Y29uc3Q6IGZzbCxpbXg3ZC11c2INCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXgyNy11
c2INCj4gPiAgICAgICAgLSBpdGVtczoNCj4gPiBAQCAtNDEyLDYgKzQxMywyMSBAQCBhbGxPZjoN
Cj4gPiAgICAgICAgICBzYW1zdW5nLHBpY29waHktcHJlLWVtcC1jdXJyLWNvbnRyb2w6IGZhbHNl
DQo+ID4gICAgICAgICAgc2Ftc3VuZyxwaWNvcGh5LWRjLXZvbC1sZXZlbC1hZGp1c3Q6IGZhbHNl
DQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAg
IGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAg
Y29uc3Q6IGZzbCxpbXg5My11c2INCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBpdGVtczoNCj4g
PiArICAgICAgICAgICAgLSBjb25zdDogdXNiX2N0cmxfcm9vdF9jbGsNCj4gPiArICAgICAgICAg
ICAgLSBjb25zdDogdXNiX3dha2V1cF9jbGsNCj4gPiArICAgICAgICBjbG9ja3M6DQo+ID4gKyAg
ICAgICAgICBtaW5JdGVtczogMg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gDQo+IE5v
dGhpbmcgaW1wcm92ZWQgcmVnYXJkaW5nIG15IGNvbW1lbnRzLiBXaHkgZG8geW91IGFsbG93DQo+
IGFueS91bnNwZWNpZmljL3VuY29uc3RyYWluIGludGVycnVwdHMgYW5kIHJlZz8NCj4gDQo+IFlv
dSBzYWlkOg0KPiAiSG93ZXZlciwgcmVzZXQsIHJlZyBhbmQgaW50ZXJydXB0cyBwcm9wZXJ0eSBp
cyBub3Qgc3BlY2lhbCBmb3IgaW14OTMuIg0KPiBidXQgd2hhdCBkb2VzIGl0IGV2ZW4gbWVhbj8g
SG93IHRoZXkgY2FuIGJlIHNwZWNpYWwgb3Igbm90IHNwZWNpYWw/DQo+IA0KPiBNeSBjb21tZW50
cyBmcm9tIHByZXZpb3VzIHZlcnNpb24gYXBwbHkuIElmIHlvdSBkbyBub3Qgd2FudCB0byB3b3Jr
IG9uDQo+IGV4aXN0aW5nIHRlY2huaWNhbCBkZWJ0LCBCVFcgYWRkZWQgYnkgYW5vdGhlciBOWFAg
ZW1wbG95ZWUsIHRoZW4gSSB3aWxsDQo+IE5BSyBhbnkgbmV3IHN1Ym1pc3Npb25zLg0KDQpZb3Ug
d2FudCBtZSB0byBhZGp1c3QgYmVsb3cgcHJvcGVydGllcyB0byBiZSBtb3JlIGNvbW1vbiBwcm9w
ZXJ0aWVzDQphbmQgYWRkIGRldmljZSBzcGVjaWZpYyBsaW1pdGF0aW9ucywgcmlnaHQ/DQoNCi0t
LQ0KICByZWc6DQogICAgbWluSXRlbXM6IDENCiAgICBtYXhJdGVtczogMg0KDQogIGludGVycnVw
dHM6DQogICAgbWluSXRlbXM6IDENCiAgICBtYXhJdGVtczogMg0KDQogIGNsb2NrczoNCiAgICBt
aW5JdGVtczogMQ0KICAgIG1heEl0ZW1zOiAzDQoNCiAgY2xvY2stbmFtZXM6DQogICAgbWluSXRl
bXM6IDENCiAgICBtYXhJdGVtczogMw0KLS0tDQoNCkZvciBtb3N0IG9mIHRoZSBkZXZpY2VzLCBw
cm9wZXJ0eSByZWcsIGludGVycnVwdHMsIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMNCmhhcyAxIGl0
ZW0uIFNvIHRoZXNlIHByb3BlcnRpZXMgY2FuIHNldCBtYXhJdGVtcyB0byAxLiBGb3Igc3BlY2lh
bCBkZXZpY2VzLA0KSSBzaG91bGQgbGlzdCB0aGVtIHN0YW5kYWxvbmUsIGlzIHRoaXMgeW91ciBl
eHBlY3RhdGlvbj8NCg0KVGhhbmtzLA0KWHUgWWFuZw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KDQo=


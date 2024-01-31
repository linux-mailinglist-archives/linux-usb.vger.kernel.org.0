Return-Path: <linux-usb+bounces-5685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A08438E3
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 09:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22B41F28DD8
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E0A58ACB;
	Wed, 31 Jan 2024 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dh1HG+Qf"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECAC5B1FD;
	Wed, 31 Jan 2024 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689504; cv=fail; b=AJBCDPViPxXpL6dWRrzutXFp/6yXTlPE6Ol4fOnVmGk10vrzH81w1bOdRhQ/fKG0qrTlysjJN4+qGKvdsYreMBwnKgWjCRTgyjDV/q9q3RlTDoKGF4TscB4ojzZB4D9+rogHx7INPNm5gmPR6ArFSyasKpnuqsaMh9WDXVvPf5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689504; c=relaxed/simple;
	bh=nPbcZCHVdt/ifyvgd2l+9PEBMpP3LMRM6L7BvuE+cik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o74IGFwkyNgCyJv4f5tkwnYC2am3drBKLgdMTY87nsD1biFww6caTBoiaSRkt/k2eCQSIgplTnAFQl5uNBRI118HABCPKwAxLlNfXzpiozaQ5jF0HAaeonayD34DQqUBqz+pl4oeFJ0VjneXlaadvgih1c2sT0XF46+nmPCgXlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dh1HG+Qf; arc=fail smtp.client-ip=40.107.247.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gr17AeQSUyklh2FqpqB68Vq2pV/H8LozLcXawZlINAlKtA/UliSaHwNopi/WmdIxrtbXvgAh564RG5bs+fKjroLbGwNbCNETE5wAhMikLIVRDT7/MSOR8lerqOvjSWrHtiEKiS3hADJrkdoZDhaT3PsZWQO1D4+siQyBJlAh6H7rOqT33ga2soQqufiCU+rjQiBNRfsOHh3U8r4ahPs2kk+jrXTIxR3PTicoOHn4IedgGz9amG0yb6q+L4xEXJP1M8fCDQrv961kGbEHvvCb5zueXDVav540/2zC1k0v5Xqthg/r9bVW4q+tdjP3vGOQKVtNXow7/2EX3M0acxwM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPbcZCHVdt/ifyvgd2l+9PEBMpP3LMRM6L7BvuE+cik=;
 b=GuT9AAfsBO019XapTLwLtxGI70A/MphHfi2zOVCOXS52S76SdteuUlnSk3HmmgfOA5zVdnexucQo+Uaa9Esgr35eMTG91afzxxAp52oVgIuNMmu08XGgvXXghecJ93WkmUgKNjcisN9J1dCxIPiJBLo54k0Eaum+uj8UrQ/j0v/ZmApjxE6TMF8Q67tN5TA1Jv0fJEwlF+beAETFGiNq3BAFVkVgM+ZDmJOFosU0Q659jvK9FluHOHY5LBuyrvW4z7KJJ2c5pCUv4Jv0quDpXUISKl4lMediRfCLnQnH6e4I5amkEaeCpY1sdLFa3en+FRk2C4OOCwo8WI450O7oiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPbcZCHVdt/ifyvgd2l+9PEBMpP3LMRM6L7BvuE+cik=;
 b=Dh1HG+Qfby2geeL8nW6e3jqhUyq6mi5qWCD8PRCdSRyqHxutMcZR0+m2gS1mNxhA1NoYlxBp2FcIOVq39299Gn1Fe6MryZ3uptyoGdanjkXI4rPa23+gCTaJXc8mLKFcwPE4OvI3VxG25ALWKW2u1DOYkw15wX49M0sCn7qi4ZA=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7974.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 08:24:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 08:24:58 +0000
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
Subject: RE: [EXT] Re: [PATCH v4 4/7] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Thread-Topic: [EXT] Re: [PATCH v4 4/7] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Thread-Index: AQHaSqcB79p1gYhHLUyTMBj8CefoV7DxADiAgAKZllA=
Date: Wed, 31 Jan 2024 08:24:58 +0000
Message-ID:
 <DU2PR04MB88228BAE9D747424B065E5B98C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
 <20240119071936.3481439-4-xu.yang_2@nxp.com>
 <0a3f5446-7179-4855-b627-72acedebd883@linaro.org>
In-Reply-To: <0a3f5446-7179-4855-b627-72acedebd883@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS8PR04MB7974:EE_
x-ms-office365-filtering-correlation-id: bf6286a1-11f9-4bce-f6db-08dc22361c8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 x8DqMqBkboKsDCbPmq18OPrORbRTffFTDWDihqe0tbHr+TO25EtDFxKBgjnZC4vJcUozqJs9z5QZJrN7UVx9qF3R+w1EGyXK83073jUxJfbck/UKB5NtSzXDYF4pEAbIGlwNM5rtzSv+8K8hEARkgtn/RdShx0TqI0CS8FeSqL8ifPvuTHM2RZQVlVscVYcJ8sIlzdwCpmPRqsyi3TnPCsgk+DzL6Vo6JvbeZ45C05QKib6xOsIPzBAz/gOsEKz1lr6r95ItUYdZhG7AIaPWzcKPWX+H4L5WHkH4gyob8hLBsR8eyfubPeLS3A2FwdZ4DxMQaA+Qq3Px8Aq9JgULOzLHwYFzhL5VUH9wXu4O6RpORyP7dgGcToaUlx4eWrQUYFUKuVyYb0KZkFxDhgbLPGNqO1U9T86C6HYuMd6geq/ufUg+dWjer55u3TYCyUQli4EmTXCqbKzqtik71j+1/Zb3fx9eko/EaBf7Q5sPfg5xin9BFzuVJ/n9qQGD2eIwh5QX9swHJEunFKdjV977o4YzutSlbNmF6QYhBy7P3dXauzw3SNcwGde4egjOsxFmSlBLYex11WRKL9en/zh05ZLKi7FCj5jUdFFNb86uhT7TPQWbxtGhmvyW+Q0Tr1Wf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(66946007)(52536014)(4326008)(8676002)(110136005)(2906002)(7416002)(5660300002)(33656002)(8936002)(86362001)(76116006)(66446008)(64756008)(54906003)(316002)(38070700009)(66476007)(38100700002)(122000001)(66556008)(53546011)(6506007)(7696005)(9686003)(478600001)(71200400001)(83380400001)(26005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXdNY05aR0lJMU10aWhYeXBiaXFkRVRvQ0w4dzdKdDY4MlhmckQwNlgvVmNi?=
 =?utf-8?B?SkJCVlJ0LzFvdzI4VVY4V2R4dkplYzNHMkdkSk9lZDRKNEltMjlIK1p5RG1u?=
 =?utf-8?B?dEF2YzNqU05CeEdHRGhDQTMyYXgwbEMxcXc0a2VTRUtqdmd1cDJYc1hSUUZR?=
 =?utf-8?B?OXVJSUwvaDJRN2NSZHFvemdxdi9VRmxJaHFnMDB6OVBYVHVEd1ZiSllFWTJJ?=
 =?utf-8?B?OFpvNU5NOFNGZ3krOERjL3FLeC80M3AwMnphcjZDMitwdDlPci9QbjRPU21C?=
 =?utf-8?B?aWVBcDdITTh0TXFGN24wSU5maWZIcFc3T1Z0TGp3YVo0WndudW1yZzhVVG1i?=
 =?utf-8?B?bXQ3UjljaDhtT3JKMHFnM3hNdm41dCtNK2xzT084bS83U3JTSjBieG0vY3Jw?=
 =?utf-8?B?SFdEUi80VGdHWkxmZjA4UFBVZDJseEZEbElTRWhNcEJyWWNzUDJqbTVTc0dM?=
 =?utf-8?B?aUFaNllTbWJJaDJUa09zSWYvOHc4MUdLT1lsdjJRMmxuU293MGRLMjJpSFdh?=
 =?utf-8?B?cXkxTEQ0S1JhL2x3cDRSQmk3Q0pZYk5ZM000TWNNMEl0NnYxUURBbWdNT1VJ?=
 =?utf-8?B?V2tlRmtXbTRxeVczS3B3OW9OQUFmYUxEaVBJejhYK2xTNXBrZFdha29ZZkxS?=
 =?utf-8?B?cHA1VEp0UmdGL3hhTnVLY0NzQmJNRTdJaU9KYnpvMkNlNEhNZlhEMFg0Y3Jx?=
 =?utf-8?B?d2ZEUUE1c3RSOHJVMlY3WjVFc0Q3bmU2Q2JoQzY2VWltU1d0SStmNXROTjNI?=
 =?utf-8?B?by9JZHlVVmE2MENBbnZZNzBYNmNxSFJzUHFXMnB6cGg2dVFBaHZNRjZNN3Ji?=
 =?utf-8?B?NUVBMjRhdjFyZWtvV0dEOEl4QS92QXdnSXBDQWdxWlc2eXNUbTRKcEp6T3lm?=
 =?utf-8?B?dTg3TFp1dzVSTWRtZkF2NE5jQ1FlOW9YSUNOZW43NE05U2lrZHJNdkZUdjNk?=
 =?utf-8?B?RHN4d1Q0ZzZHZENKZlNKQk5hc1V2aDE1dnphMUdEK2YxbW1JRWFPKzkxSWw5?=
 =?utf-8?B?Q3NabDhBT00xcVF3RE5NODFwZDRJbkpxdmJMRmRuNEhBRVM1emYrQ3d2VjN6?=
 =?utf-8?B?RUY2eFQxSk9jZENKNWd1eEJld1VGUDhKUXBGRk9mcUhoTzdLZEZzS2VHY3Nk?=
 =?utf-8?B?OGJPZWNvOEZSM0RzQi91Z285OXErd3RKUEJUejNucUJXRWR3SlFVL2V6b2hh?=
 =?utf-8?B?QnJQZUN4TXQ5U2NhUFRJMEtLOSsyYkIxV0MvQkRpMUF6ODVuNmlYNXdsV2Na?=
 =?utf-8?B?ZncwdVYxM3JsOGZ1NmtBYUdCOG1VRTBrTTJESzlTaTZYMWsySlQ0Q3NQT3Rh?=
 =?utf-8?B?d0l5ZnhDOCt5ZzNYQUtXVUVyS01iZE1rdVJOZ3RMNHIyWU93UmhJbjd5OFpn?=
 =?utf-8?B?UWZyR09odDFKa21QL2dmMW40enVZaTZWRGlhQ2x4eEMzeGJ6bHRaRFljYXZx?=
 =?utf-8?B?amxua2tjTFZReU9nOXVPVTMzWWtSL3RWMk1rWUE0Unp6N3lvTlU5MHB2WHZa?=
 =?utf-8?B?aHJqaXF0ektuMzFpTTNHUCsxVm9ZN3RzSVgvdEhCbmxpQmVVTEtCT3NjeUZk?=
 =?utf-8?B?SWN4aXZwVU5mdmxnUWFCUmpEaHoxR0N3S3FrblJMQXYrNnk5R0dDRVZTTGp4?=
 =?utf-8?B?dGh1ZzI5dFROUklVVDNiNTJjdldVMmE3SUlvTFdVNFAydERLTVZWME9sUXcr?=
 =?utf-8?B?ZGNXbFJmQ2RKYmNrRFVVd1pmTUtWZjBldEJ1K3l0b3psc2NaQ3ZrYi83MlNV?=
 =?utf-8?B?Nm5ZOWo5eDdEWndYMWdpc0U2eTdZdWI3M20rbCtKRTRab1hWeHBIQTlMZGJw?=
 =?utf-8?B?T1NXZEFFUXFNVFdVempDK21iQ2lYVnlodjBWY1dPNmtOYmZCTVpUSzNVY25w?=
 =?utf-8?B?Vk1KaWJPVldDQ2JOa2piTVlqTktHZHpZVmp1Tm9Ib1NVa3dOZkxWdU9CRDJX?=
 =?utf-8?B?MHlXcHJGZDVjVGt6aXp6SGFYSTUvSEkxRHppMzFXZGU5WUtvdjlMUzUzWEhM?=
 =?utf-8?B?VzRqSnpQako5MjIvc0Fmbkw0WTdOdUlzZmdOQ2tZamIyTEhIUXM2WVplNm5V?=
 =?utf-8?B?eVdxVGFPdGtLWmhVNHJ6YkRLMmlYdXIyTGk1OUhoRjRRL0l2cnRIdThPenln?=
 =?utf-8?Q?29g4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6286a1-11f9-4bce-f6db-08dc22361c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 08:24:58.2347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7od7gYLSg//GKWFXAnFDC1Hbco4CljqCqC3SvZ/tdjtyT/q6/xwoYM19HphfWXIZxSDvjta3luo9xPQ+EbZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7974

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxOS8wMS8yMDI0IDA4OjE5LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IENoYW5nZSByZWcsIGludGVycnVwdHMsIGNsb2NrIGFuZCBjbG9jay1uYW1lcyBhcyBj
b21tb24gcHJvcGVydGllcyBhbmQgYWRkDQo+ID4gcmVzdHJpY3Rpb25zIG9uIHRoZW0gZm9yIGRp
ZmZlcmVudCBjb21wYXRpYmxlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1
LnlhbmdfMkBueHAuY29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2NDoNCj4gPiAg
LSBuZXcgcGF0Y2ggc2luY2UgdjMncyBkaXNjdXNzaW9uDQo+ID4gIC0gc3BsaXQgdGhlIHJlZywg
aW50ZXJydXB0cywgY2xvY2sgYW5kIGNsb2NrLW5hbWVzIHByb3BlcnRpZXMgaW50bw0KPiA+ICAg
IGNvbW1vbiBwYXJ0IGFuZCBkZXZpY2Utc3BlY2lmaWMNCj4gPiAtLS0NCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sIHwgMTE4ICsrKysrKysrKysrKysr
Ky0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2NpLQ0KPiBoZHJjLXVzYjIueWFtbA0KPiA+IGluZGV4IGI3ZTY2NGY3Mzk1Yi4u
NzhlMzBjYTBhOGNhIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi55YW1sDQo+ID4gQEAgLTczLDIyICs3
MywxMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgICAgIC0gbnV2b3RvbixucGNtODQ1
LXVkYw0KPiA+ICAgICAgICAgICAgLSBjb25zdDogbnV2b3RvbixucGNtNzUwLXVkYw0KPiA+DQo+
ID4gLSAgcmVnOg0KPiA+IC0gICAgbWluSXRlbXM6IDENCj4gPiAtICAgIG1heEl0ZW1zOiAyDQo+
ID4gLQ0KPiA+IC0gIGludGVycnVwdHM6DQo+ID4gLSAgICBtaW5JdGVtczogMQ0KPiA+IC0gICAg
bWF4SXRlbXM6IDINCj4gPiAtDQo+ID4gLSAgY2xvY2tzOg0KPiA+IC0gICAgbWluSXRlbXM6IDEN
Cj4gPiAtICAgIG1heEl0ZW1zOiAzDQo+ID4gLQ0KPiA+IC0gIGNsb2NrLW5hbWVzOg0KPiA+IC0g
ICAgbWluSXRlbXM6IDENCj4gPiAtICAgIG1heEl0ZW1zOiAzDQo+IA0KPiBXaHkgYWxsIHRoZXNl
IGFyZSBnb25lPyBUaGV5IGFyZSBzdXBwb3NlZCB0byBiZSBoZXJlLiBZb3VyIGlmOnRoZW46IG9u
bHkNCj4gY3VzdG9taXplcyB0aGVtLg0KDQpJIGhhdmUgYWxzbyBjb25jZXJucyBvZiB3aGV0aGVy
IHRvIG1ha2UgdGhpcyBwYXJ0IGNvbW1vbi4NCkkgd2lsbCByZXZlcnQgdGhpcyBsYXRlci4NCg0K
PiANCj4gPiAtDQo+ID4gKyAgcmVnOiB0cnVlDQo+ID4gKyAgaW50ZXJydXB0czogdHJ1ZQ0KPiA+
ICsgIGNsb2NrczogdHJ1ZQ0KPiA+ICsgIGNsb2NrLW5hbWVzOiB0cnVlDQo+IA0KPiBOby4gVGhl
c2UgYXJlIG5vdCBib29sZWFucyBvbiBvdGhlciB2YXJpYW50cy4NCg0KT2theS4NCg0KPiANCj4g
PiAgICBkcl9tb2RlOiB0cnVlDQo+ID4NCj4gPiAgICBwb3dlci1kb21haW5zOg0KPiA+IEBAIC00
MTIsNiArNDAwLDEwNCBAQCBhbGxPZjoNCj4gPiAgICAgICAgICBzYW1zdW5nLHBpY29waHktcHJl
LWVtcC1jdXJyLWNvbnRyb2w6IGZhbHNlDQo+ID4gICAgICAgICAgc2Ftc3VuZyxwaWNvcGh5LWRj
LXZvbC1sZXZlbC1hZGp1c3Q6IGZhbHNlDQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBvbmVP
ZjoNCj4gPiArICAgICAgICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgICAgICAgIC0gY29u
c3Q6IGZzbCxpbXgyNy11c2INCj4gDQo+IE5vLCB0aGUgc3ludGF4IHlvdSBuZWVkIGlzIGNvbnRh
aW5zOi4NCj4gDQo+IExvb2sgYXQgZXhpc3RpbmcgY29kZSAtIHRoZXJlIGlzIG5vIHNpbmdsZSBi
aW5kaW5nIHdpdGggb25lT2Y6IGluIGlmOiBibG9jay4NCg0KSSB3b25kZXIgd2h5ICdtYWtlIGR0
X2JpbmRpbmdfY2hlY2snIGRvZXMgbm90IHJlcG9ydCB0aGlzIGlzc3VlIGlmIHRoZSBzeW50YXgN
CmlzIG5vdCBjb3JyZWN0Pw0KDQpTbyBJIG5lZWQgdG8gYWRkIGNvbnRhaW5zIGFzIGJlbG93LCBy
aWdodD8NCg0KICAtIGlmOg0KICAgICAgcHJvcGVydGllczoNCiAgICAgICAgY29tcGF0aWJsZToN
CiAgICAgICAgICBjb250YWluczoNCiAgICAgICAgICAgIG9uZU9mOg0KICAgICAgICAgICAgICAt
IGl0ZW1zOg0KICAgICAgICAgICAgICAgICAgLSBjb25zdDogZnNsLGlteDI3LXVzYg0KICAgICAg
ICAgICAgICAtIGl0ZW1zOg0KICAgICAgICAgICAgICAgICAgLSBlbnVtOg0KICAgICAgICAgICAg
ICAgICAgICAgIC0gZnNsLGlteDI1LXVzYg0KICAgICAgICAgICAgICAgICAgICAgIC0gZnNsLGlt
eDM1LXVzYg0KICAgICAgICAgICAgICAgICAgLSBjb25zdDogZnNsLGlteDI3LXVzYg0KDQpUaGUg
cHVycG9zZSBvZiB0aGlzIGNvZGUgaXMgdG8gbWF0Y2g6DQoNCiAgLSBjb21wYXRpYmxlID0gImZz
bCxpbXgyNy11c2IiOw0KICAtIGNvbXBhdGlibGUgPSAiZnNsLGlteDI1LXVzYiIsICJmc2wsaW14
MjctdXNiIjsNCiAgLSBjb21wYXRpYmxlID0gImZzbCxpbXgzNS11c2IiLCAiZnNsLGlteDI3LXVz
YiI7DQoNCmJ1dCBzaG91bGQgbm90IG1hdGNoOg0KDQogIC0gY29tcGF0aWJsZSA9ICJmc2wsaW14
N2QtdXNiIiwgImZzbCxpbXgyNy11c2IiOw0KDQpJcyB0aGlzIGZlYXNpYmxlPw0KDQpUaGFua3Ms
DQpYdSBZYW5nDQo=


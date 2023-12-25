Return-Path: <linux-usb+bounces-4566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521581DD8E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Dec 2023 03:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7EC21F21AAF
	for <lists+linux-usb@lfdr.de>; Mon, 25 Dec 2023 02:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FBB804;
	Mon, 25 Dec 2023 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="St6AcAVI"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBD7E8
	for <linux-usb@vger.kernel.org>; Mon, 25 Dec 2023 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbHX+1MZjJKhuQAEfK2kM6vyUlY4Akq1mQ2Xyw1DXKVtxBadMzvA+6T1yKlc52Y5OCrZirlAo9cpl2EiBjn1EgpKiiV6El9ChbxbtpJiEdM41cSbC5RkrMJ6Mep7dMJTCUzvTZc1SmgAjit/4PNfWN358ybJStUZlVCSJXa0T+y5eC51ShGU2x2aTrNiaTxPVFI5Mr0qT8MZOB622BvV36I9UHa4Cj1i3OlxAujrl2HOgsDUWGaXz0ymAkiE/e1kocnUzE9A3NPy4cy2Pt5+LorE71/yBBapnw6lE2IKVV1f2DTAJenIo63/quscIgDobE9W4sQnwlvyau12KSLr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcWj/e9etAeb17Sy/lt8A0bOEt3a9RdRevVgjp4vl3M=;
 b=bqdCZCCvhBd8aS9hvA43lZQSxPJ89HNSEUDzlngXGNDewpXjnBjwC3toffYsJXd7JxlXM4pholZZfFWdxZAIckwPv9v6PPvr3PfIigFAJHC6gKhESl+o3Wwlr5xwb/OO2xoSNtD6b1ccca2qvL0Dv2rkKzHQl4I6cn7SpoM6kgI+B7FXrfCxmgJRsJsf+f1lyqrcaEvcOKhiap9svzOaMtESB1oln8op8HyznC9RS9V6VV9XFSA8XxWJpAyz2iMtbEnq0NzM4DEbf+v+AOI9zOSLel++4fJH6Nm1TRdH4QXCjEdtN+9HE78M0Cn5KPn0FmlFTvAJbeSxGzY5vOK6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcWj/e9etAeb17Sy/lt8A0bOEt3a9RdRevVgjp4vl3M=;
 b=St6AcAVIkfuTXRjPQMoSeCdrQG0h0bcSn1LcSWWosNA1EpaDIkOrVY/jSPoGZTIKKYyucLIKeTuuLdi46tez+LYMP/EEdGiOuRJqVAIzYx9Kw8AOarzsV6gkzEzf6tdKRiqn1LjDU4LyPi1fE4ec7ElUCLGd9mUX+/kbrorjETs=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Mon, 25 Dec
 2023 02:20:08 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7113.026; Mon, 25 Dec 2023
 02:20:08 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, "peter.chen@kernel.org"
	<peter.chen@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup
 clock and keep it always on
Thread-Topic: [EXT] Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup
 clock and keep it always on
Thread-Index: AQHaMXidaochZRVhaU62l10hAgCT17C1QTWAgAQNWgA=
Date: Mon, 25 Dec 2023 02:20:07 +0000
Message-ID:
 <DB7PR04MB5146D07949E18C623F76A3438C99A@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
 <568fce67-a9e2-4aa8-a165-f12efcf494b8@gmx.net>
In-Reply-To: <568fce67-a9e2-4aa8-a165-f12efcf494b8@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|PAXPR04MB8767:EE_
x-ms-office365-filtering-correlation-id: b4592910-a215-43b3-99cf-08dc04f00395
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sNQ3zTRXKwxOemno1O6ARptSmefyDtAPrtuqttMxCeGseIKhntPrQW9eLjj5ljcVRZi8qRTHGhZJ6iCdh+8wqLawUTBTKOt5rSQCXdUFxTCLBDoUNU0E2vaImKHwfDPP5SNoHTDIECeG/eAX56LHpfAwHqW6JuxyM6+AmZVf/kRcHaqV5A5v6RjUD5Ps+s1nn5ilsoUAmIe9VLxfAmptttb3EBNA72eo9wVOTDUx2j91mipYdKX6d0ZFRnSpwiCRavMbRUDBo9P+YkyIvPch7iv8crBHf6gOxCRaptV7yZhrF+IYJgFJ5pBEHFyNdQXGCEsqL3aUtGZ3BBgrzigxL1xQQimHr4sN5reeFMfZSCse1TIUVtFahnpWnrlmNfz2mloYfz/RcEVAqnWj3SB1t4j//5JT0UCCCXg7rLbWeSxTiBLyxyIwahdROcDdayWlbV1mRxyB2ZYrqCBkMCGOToAued0wB8BwJ1vYxCFCqFpurSH2GZlSdGj64JFbHpTd67nSajGTAgsDD24i49pkVc4opGfzoeKTkKg4cjsmOMpRTJ4ajkgpxRswcDGN9F602iLQ6KdQYQ+9uExJCVduj6cn3zPtB0lVg/fAc+iJXS0LW6vR0VxVAPGK5JBf9lBX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(76116006)(110136005)(52536014)(66946007)(4326008)(55016003)(71200400001)(478600001)(38100700002)(122000001)(7696005)(26005)(8936002)(86362001)(8676002)(316002)(54906003)(66556008)(66476007)(66446008)(64756008)(6506007)(9686003)(83380400001)(2906002)(33656002)(5660300002)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emRTN0drUkJMdU9uWDMvSUh6cWpBaEIyVWFhOFlrejZKTVM5c2NmNDRxbmlR?=
 =?utf-8?B?UGNleXNCYUVnOTM0RGNHSTZZZUcwejVDZnlGeFgwTHFmeG1SaXRJbHJTQkdl?=
 =?utf-8?B?Uk9Qelp1eGVBM21UVmM5QWRyODZHanUzVU5PUkROcm5EODVrWWdSQUVMZVpI?=
 =?utf-8?B?UXVkUXpiS2VkMWpFSkt0bXNXMFhRbUhKZ0Z5akQ5MjBVZEtrSU5BMTh1eEt6?=
 =?utf-8?B?Y1pJTkJyQmVTWVhyeEVQR2k2RC9mVDJSUlE5SzBPKzFYaHRrd2V4RmRBMWh5?=
 =?utf-8?B?YVQrZ1ZWbi9ZTEptbGlUZWNBV2VYSU5xS3NldUoxdFVQMHA3NWpwZE9iM2Nz?=
 =?utf-8?B?QzVCT1BtaGdIY0plTDY3TXBsUzEydjBrdE1tSDU0UVgwa3EyYWVVSGY0ME1G?=
 =?utf-8?B?cjdUVjNPZHZLMUQ0T1VvY1NLNkk0RG1WMU5GK2d6Wk9PNS8zNWRmaHlEQnZH?=
 =?utf-8?B?V3IvTTV0WEk2K3dxNmNobGV3ZU5NOWc1dXZHTm1pMEJHdTdEeUFqRTZ1QkJY?=
 =?utf-8?B?L0MvSE1IdmR2djRSVWw1SitsL2NmemJWQTUxa1RiWjNkelVEZVhFck1PTU0r?=
 =?utf-8?B?UGd5UFZkR0VhM2NIZkwxcHB0YXZyRWlYR0tmbkgyUkh4SU1taUMxV2t1UjBY?=
 =?utf-8?B?a3FSU1I4SkxmOXRRck0ybS9QVmY0TFVnUDZhTFAyTEdZejZPT3R3WDNIMGcv?=
 =?utf-8?B?Q2JZSnhSVkduQ1hRNTdaZFV1OXJEYklSMnZiTFc1SzFHTGN6Y2x2RjZVK0hB?=
 =?utf-8?B?Y1Qyb0pvaElLd2l0elhGUVJKWWdBaXFkaDF0VlU0U1kxZ3RMQmh4S1U5QWhV?=
 =?utf-8?B?TlhVY0RDbGhhdkNSRzBSS0lOcjFvV0FHREFQNjE0Zk1Ldkk2TE5hNGtyZTl4?=
 =?utf-8?B?QndZSGVZNEI3Ny9iakFleUZoK0JMYk5KbWhHcWRETUJucUtGYXVtSjdzSDFj?=
 =?utf-8?B?YnViR1NYbWxlcTBZeWV6M2hOU2NKQ29Va1VESGI0ajJQLzIxZ1lFcTRnZklQ?=
 =?utf-8?B?ci9IN1Iyem5IclF6SkV5eHpwN0dpUWNYZmJaLzVtdEM2d1phQWovU0pHODMv?=
 =?utf-8?B?VUlnRndDT1FHaHFBaTUxUmp1WkRDb2xSQUkzcGFHYjlxRUE3TTlMMjJET3Rm?=
 =?utf-8?B?c1VpMUp0WFd3ajFLekpMbFdqaG1PeDYyajEyQ1hSckFzK3EySE1VNkFaQXNT?=
 =?utf-8?B?UHBIbFJaYlhyWStETnhmbVJETllpY3JlUkV1MkU2TXp3VDJCWndySEx2Qjcr?=
 =?utf-8?B?RXJHTTNGOFBGTHFGenlpaldoOUR4eTdUb1VXNDJndCsvdHhPckMwUjk2R0xq?=
 =?utf-8?B?bXhqc0J6RTZRamhGaDF6VWpwK0F6NG5nWDZEV3pHM0JPcGlmWHVES3hvSGN4?=
 =?utf-8?B?ekZQeXQrWjhQVmU0Uk5Pak1ya3BFemJHZmUwZHVQUUprNTZhQVF6eGtDMmRX?=
 =?utf-8?B?bjNFVnVTQnBuM09jNFIxLzE1UllubGlYaW96MFNCM1lFRnFrTlF1NlFjWWNz?=
 =?utf-8?B?ZGIvbjE2bThCQXFvdE9XUWthQ0VLc3E3ckMyTlRMbzcvRG90MXFyTzBWS2l4?=
 =?utf-8?B?Mm9jcy9rVVZBd2gyeUxiY0Q0Tkk0d0hGNWpseWpnTmVxVWUzdkNVNkswSk5l?=
 =?utf-8?B?Zmx5bFdpVWJpN3Z0MkJoQ1dzcGlhbkNOUTNWZ1NIZlVKSi9tK3lOU2w2ejho?=
 =?utf-8?B?T2FFdmNqaDQwV1dpaW81V252NDdSc3hNZ1crakJUOVRnMXVOT25LWlBiZTRF?=
 =?utf-8?B?cnVOTG80TEpCV1NQeVRwbG8rZDFybUYyWDVFSkNHblNnbHBVVnljQWdnNXV2?=
 =?utf-8?B?TlNHVHZmVkRwUGsvM3p6VFd2dytURE5xbUI5K1VrcUJwa3R3SkY4aWdhZFdt?=
 =?utf-8?B?UHg4Y1laT0FFalBGRVpFTFc3N0FJK3FORnZHdXFyTU10ekRQaDVyMHRMMTlK?=
 =?utf-8?B?WFBNUXZkc3VsN0luYlFTdHVVbVBkd0ZRajY3RlFnMG1CcG01T1VUUG1iVWRP?=
 =?utf-8?B?UDFWL3Rud0tXTWF1aVdOMVFRb2NHRGFlSUllWlA4WVp0Rm5vQ05LTnNpMVQy?=
 =?utf-8?B?RVc4SHJ4WnRjUDNkczlKSlhKQTF4YmRsa3JnWDR1VnQ4TmtoZHFLa1hMN01P?=
 =?utf-8?Q?5alw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4592910-a215-43b3-99cf-08dc04f00395
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2023 02:20:07.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLKedQKECmYkN/BUe/8KMATL8szYl/YGSGigwIoygtVbSJYgiWwFOd2nT9uliDMMeIs//ahaYgKgffenyCki/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

SGkgU3RlZmFuLA0KDQo+IA0KPiBIaSBYdSwNCj4gDQo+IEFtIDE4LjEyLjIzIHVtIDA3OjE0IHNj
aHJpZWIgWHUgWWFuZzoNCj4gPiBTb21lIHBsYXRmb3JtIHVzaW5nIENoaXBJZGVhIElQICBtYXkg
a2VlcCAzMktIeiB3YWtldXAgY2xvY2sgYWx3YXlzDQo+ID4gb24gd2l0aG91dCB1c2IgZHJpdmVy
IGludGVydmVudGlvbi4gQW5kIHNvbWUgbWF5IG5lZWQgZHJpdmVyIHRvIGhhbmRsZQ0KPiA+IHRo
aXMgY2xvY2suIEZvciBub3cgb25seSBpLk1YOTMgbmVlZHMgdGhpcyB3YWtldXAgY2xvY2suIFRo
aXMgcGF0Y2ggd2lsbA0KPiA+IGdldCB3YWtldXAgY2xvY2sgYW5kIGtlZXAgaXQgYWx3YXlzIG9u
IHRvIG1ha2UgY29udHJvbGxlciB3b3JrIHByb3Blcmx5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiBDaGFuZ2Vz
IGluIHYyOg0KPiA+ICAgLSBtb2RpZnkgY29tbWl0IG1zZyB0byBtYWtlIGl0IGNsZWFyDQo+ID4g
LS0tDQo+ID4gICBkcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jIHwgMjIgKysrKysr
KysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRl
YS9jaV9oZHJjX2lteC5jIGIvZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19pbXguYw0KPiA+
IGluZGV4IGUyOGJiMmYyNjEyZC4uNDMzMGJlODI0MGZmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9jaGlw
aWRlYS9jaV9oZHJjX2lteC5jDQo+ID4gQEAgLTk2LDYgKzk2LDcgQEAgc3RydWN0IGNpX2hkcmNf
aW14X2RhdGEgew0KPiA+ICAgICAgIHN0cnVjdCB1c2JfcGh5ICpwaHk7DQo+ID4gICAgICAgc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqY2lfcGRldjsNCj4gPiAgICAgICBzdHJ1Y3QgY2xrICpjbGs7
DQo+ID4gKyAgICAgc3RydWN0IGNsayAqY2xrX3dha2V1cDsNCj4gPiAgICAgICBzdHJ1Y3QgaW14
X3VzYm1pc2NfZGF0YSAqdXNibWlzY19kYXRhOw0KPiA+ICAgICAgIGJvb2wgc3VwcG9ydHNfcnVu
dGltZV9wbTsNCj4gPiAgICAgICBib29sIG92ZXJyaWRlX3BoeV9jb250cm9sOw0KPiA+IEBAIC0x
OTksNyArMjAwLDcgQEAgc3RhdGljIGludCBpbXhfZ2V0X2Nsa3Moc3RydWN0IGRldmljZSAqZGV2
KQ0KPiA+DQo+ID4gICAgICAgZGF0YS0+Y2xrX2lwZyA9IGRldm1fY2xrX2dldChkZXYsICJpcGci
KTsNCj4gPiAgICAgICBpZiAoSVNfRVJSKGRhdGEtPmNsa19pcGcpKSB7DQo+ID4gLSAgICAgICAg
ICAgICAvKiBJZiB0aGUgcGxhdGZvcm0gb25seSBuZWVkcyBvbmUgY2xvY2tzICovDQo+ID4gKyAg
ICAgICAgICAgICAvKiBJZiB0aGUgcGxhdGZvcm0gb25seSBuZWVkcyBvbmUgcHJpbWFyeSBjbG9j
ayAqLw0KPiA+ICAgICAgICAgICAgICAgZGF0YS0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVM
TCk7DQo+ID4gICAgICAgICAgICAgICBpZiAoSVNfRVJSKGRhdGEtPmNsaykpIHsNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihkYXRhLT5jbGspOw0KPiA+IEBAIC0yMDgs
NiArMjA5LDE4IEBAIHN0YXRpYyBpbnQgaW14X2dldF9jbGtzKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQVFJfRVJSKGRhdGEtPmNsayksIFBU
Ul9FUlIoZGF0YS0+Y2xrX2lwZykpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgLyogR2V0IHdha2V1
cCBjbG9jay4gTm90IGFsbCBvZiB0aGUgcGxhdGZvcm1zIG5lZWQgdG8NCj4gPiArICAgICAgICAg
ICAgICAqIGhhbmRsZSB0aGlzIGNsb2NrLiBTbyBtYWtlIGl0IG9wdGlvbmFsLg0KPiA+ICsgICAg
ICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgICBkYXRhLT5jbGtfd2FrZXVwID0gZGV2bV9j
bGtfZ2V0X29wdGlvbmFsKGRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgInVzYl93YWtldXBfY2xrIik7DQo+ID4gKyAgICAgICAg
ICAgICBpZiAoSVNfRVJSKGRhdGEtPmNsa193YWtldXApKSB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHJldCA9IFBUUl9FUlIoZGF0YS0+Y2xrX3dha2V1cCk7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJGYWlsZWQgdG8gZ2V0IHdha2V1cCBjbGssIGVycj0lbGRcbiIsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUFRSX0VSUihkYXRhLT5jbGtfd2FrZXVwKSk7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IHRoaXMgY291bGQgYmUgc2ltcGxpZmllZCB0
bzoNCj4gDQo+IHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihkYXRhLT5jbGtfd2Fr
ZXVwKSwgIkZhaWxlZCB0byBnZXQNCj4gd2FrZXVwIGNsa1xuIik7DQo+IA0KPiBBRkFJSyB0aGUg
ZXJyb3IgY29kZSBpcyBhbHNvIHByaW50ZWQgb3V0LiBBbm90aGVyIGJlbmVmaXQgaXMgdGhhdCB0
aGlzDQo+IGhhbmRsZXMgZGVmZXJyZWQgcHJvYmUgb2YgdGhlIGNsb2NrIGFuZCBhdm9pZCBzcGFt
bWluZy4NCg0KT2theSwgSSB3aWxsIHRyeSB0aGlzLg0KDQpUaGFua3MsDQpYdSBZYW5nDQoNCj4g
PiArICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAg
ICAgfQ0KPiA+DQo+ID4gQEAgLTQyMyw2ICs0MzYsMTAgQEAgc3RhdGljIGludCBjaV9oZHJjX2lt
eF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIGlmIChyZXQp
DQo+ID4gICAgICAgICAgICAgICBnb3RvIGRpc2FibGVfaHNpY19yZWd1bGF0b3I7DQo+ID4NCj4g
PiArICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZGF0YS0+Y2xrX3dha2V1cCk7DQo+ID4g
KyAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX3dha2V1cF9jbGs7DQo+
ID4gKw0KPiA+ICAgICAgIGRhdGEtPnBoeSA9IGRldm1fdXNiX2dldF9waHlfYnlfcGhhbmRsZShk
ZXYsICJmc2wsdXNicGh5IiwgMCk7DQo+ID4gICAgICAgaWYgKElTX0VSUihkYXRhLT5waHkpKSB7
DQo+ID4gICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRhdGEtPnBoeSk7DQo+ID4gQEAgLTUw
NCw2ICs1MjEsOCBAQCBzdGF0aWMgaW50IGNpX2hkcmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ID4gICBkaXNhYmxlX2RldmljZToNCj4gPiAgICAgICBjaV9oZHJj
X3JlbW92ZV9kZXZpY2UoZGF0YS0+Y2lfcGRldik7DQo+ID4gICBlcnJfY2xrOg0KPiA+ICsgICAg
IGNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtfd2FrZXVwKTsNCj4gPiArZXJyX3dha2V1
cF9jbGs6DQo+ID4gICAgICAgaW14X2Rpc2FibGVfdW5wcmVwYXJlX2Nsa3MoZGV2KTsNCj4gPiAg
IGRpc2FibGVfaHNpY19yZWd1bGF0b3I6DQo+ID4gICAgICAgaWYgKGRhdGEtPmhzaWNfcGFkX3Jl
Z3VsYXRvcikNCj4gPiBAQCAtNTMwLDYgKzU0OSw3IEBAIHN0YXRpYyB2b2lkIGNpX2hkcmNfaW14
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAg
dXNiX3BoeV9zaHV0ZG93bihkYXRhLT5waHkpOw0KPiA+ICAgICAgIGlmIChkYXRhLT5jaV9wZGV2
KSB7DQo+ID4gICAgICAgICAgICAgICBpbXhfZGlzYWJsZV91bnByZXBhcmVfY2xrcygmcGRldi0+
ZGV2KTsNCj4gPiArICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtf
d2FrZXVwKTsNCj4gPiAgICAgICAgICAgICAgIGlmIChkYXRhLT5wbGF0X2RhdGEtPmZsYWdzICYg
Q0lfSERSQ19QTVFPUykNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY3B1X2xhdGVuY3lfcW9z
X3JlbW92ZV9yZXF1ZXN0KCZkYXRhLT5wbV9xb3NfcmVxKTsNCj4gPiAgICAgICAgICAgICAgIGlm
IChkYXRhLT5oc2ljX3BhZF9yZWd1bGF0b3IpDQoNCg==


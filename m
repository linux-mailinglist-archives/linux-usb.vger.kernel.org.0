Return-Path: <linux-usb+bounces-5149-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9CA82FFEE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 06:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402E01C245AF
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 05:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BDD79D2;
	Wed, 17 Jan 2024 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fK8TlFyF"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2040.outbound.protection.outlook.com [40.107.247.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE144EBE;
	Wed, 17 Jan 2024 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705470401; cv=fail; b=Ls+BJn+DfzSCbyMj0UsDP5girewQBMYD7J34FEjD6xb4nYD+KaxJMKYoYkzxkIWbn3eAbROiDSrhD6dm+j8T4tVZLXtkWTu4AsyX08UMkEjxQUnjo5ALKer3OIjVc70zJn8aWE14XmfbCmom1sRCmJH0aipCHPqgytj8RXnu6zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705470401; c=relaxed/simple;
	bh=iEa7pGMoUl8Ce4Ktgq39Is59/yhl6urwpkMzcMyUS/M=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=NU/I3/uxZMU3Japwkdomg4YpGcPmZ0pRAI0YCglMXjyw0SHfK6YogV12A/Mus2z/mVvCwHAzct5DJTdSSME76VPaesAl1BCDCcyyIFJE5br//u+VPhWj6bhSPvoPNnAvSFdnhxs5jdnjdVGQQKeDetZ8A0p2V3jhMxcDsz2NOMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=fK8TlFyF; arc=fail smtp.client-ip=40.107.247.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4fsttMuqrbWXBF9GXLrbbpwewX0hgwsnXzEx0Y6yJlBcO+0SmkgqruVhO7TJlNULWmHSOANgoHb+ETUs8a4+XiqA2jtoV3KgCDT0eD9uVkwYhYVWvwNl5YLMDtFhv95kGyu+J95lcuEbfolOtcfHjOFrMl76YknsTxSfk6y3E4tIwDu50dtot6t5T7vOWZm8PFn4hc4cKySaQTztjdJRTcCaBqWhS+tJ1LfTfI5wQZbHqN5YWMeMQ2Y9cTLo+2UcDa/z2L1kveuCUBBU8uL8OqRL5+JvEEBg3NQrcZ/JTf+1d65LVqNae5wxroDqVIxWo0SDwgAHx+8INvpvDgmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEa7pGMoUl8Ce4Ktgq39Is59/yhl6urwpkMzcMyUS/M=;
 b=nNDP1OWz3RVbCzJyzjqgeTpH8tojC5LshPhiuQLWG3E9/HG25EbmalyvJmQp5gpxXATruIuf51BrSz8mdbHeVeBfF5LntKO46nChRU7KUSNXkU2aIkwpLozNvAhWRgTS5/dYOVr32kjytunljdfMuI6e9QaL/1G6tK2NCYYwVZAHoiFXcuRIdJkKanVuE5J0N71WMgJHSLrP6ruKL417poZH0RC10kC8itsgZSKvBtozDg3LCU2p7QavN4MXjVixLvlheIQwqub7tTf/CLT2nFtVNE2cfX025GTXYqt+eXOjqT6p8+mmwk31lJ0584eT9VYzQ5LHzKeaCla/OZCOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEa7pGMoUl8Ce4Ktgq39Is59/yhl6urwpkMzcMyUS/M=;
 b=fK8TlFyF3MTsW4zZuWqnerDokbGbQcidJ0wCzupRM/X7rt3P96pUPcupV32V99uCjSfz8h5xnnPdRvqw89sAkdyi+5JpEeKa8NFX/UGkNAsTfjLI10zAQMANLCbv6gfOxkUnZUe0pJjFXjaGhnXW9qeo/44Xm15z+GM7GAqW9Vo=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 05:46:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.029; Wed, 17 Jan 2024
 05:46:34 +0000
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
Thread-Index: AQHaRUgjzNmZ+WDWXkmfSRtDZkmevLDaubUAgAFTw5CAAAnPgIABbAMg
Date: Wed, 17 Jan 2024 05:46:34 +0000
Message-ID:
 <DU2PR04MB8822F446564AC47C72B24A4C8C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
 <20240112111747.1250915-4-xu.yang_2@nxp.com>
 <3ade5e2c-e3dc-4cf4-9c12-2487e30a2253@linaro.org>
 <DU2PR04MB8822D31A8AD7BEE1F50AC78A8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <95e2b70e-c6fb-4c10-b341-efd1f9cbf6e6@linaro.org>
In-Reply-To: <95e2b70e-c6fb-4c10-b341-efd1f9cbf6e6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PAXPR04MB8749:EE_
x-ms-office365-filtering-correlation-id: a0308af1-a03d-4c81-993e-08dc171faa37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +/n4bPh8nk9Jb1eRLOaGO0YBQiR+WuFDisR8k5MV8q24Q1ItY6QBy+wtECT54SnZOIvEQyQpFSkWN6BWAszU3rgjclJpwQKe+zq7iObVh2pJdoghq7/WsjkIPJTwicMGsFJHx52gAbAIj9Wk15Cwdt8xsdI7jfjBlNJWYWtxVOf2uO9A6wSUIJegwfLPOIbTQ+Rqg+GnPImtLfZPjzFOgrISeYhBfEhbzknJU0uTNXS5uo2uvX7WxkZdYKmj/oUe4ttP+TKQg6zyPAnXAp3XkrSmb0AuTiV/fuU7UjAcB7yRYYYjxshQADQpQ08SOnpXwOIQbF8lwndZb3/xjFuIm9HUqHdB0SoYFGIWyQv83M8kek8p1+A7oJHzhDmVy7FJs7R/mrFbqm0SJxtdSghjHYtXljTarD3GN/HiEqRHf8YXR0mDxKcrOe7bGjt6dIHaY6nkdlbHcDZLWYPDGqo76Wh1FstYOjynz9CXe1cM6nVH7ueKus79JDkZn3h/ZFblAGQ2fMfl8goNDRuFLM6P1x4bGZYDEB4mGD33ACEGfNk6pHfZWzT6KYPA5KoLe2lQRj7PYlsJ0va0duCTrZDS46gtnb1mVVCcPnatYs3oZTv8Sv4AkQaG6VPPS8fRLM4R
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(4326008)(8676002)(8936002)(52536014)(7416002)(2906002)(5660300002)(71200400001)(7696005)(53546011)(6506007)(9686003)(316002)(54906003)(76116006)(66556008)(66446008)(66946007)(64756008)(66476007)(478600001)(41300700001)(86362001)(110136005)(122000001)(38100700002)(38070700009)(33656002)(26005)(55016003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmliblRJRURrRGI2cTdZVEpuUnZoTkRTOG1KZGRsZmY2YStIaGtqaThuK2NL?=
 =?utf-8?B?WDc0d0JNdWpuUEkySEs2Um5Lck9hQ3lQYm1wUVYyY3d3a1dwNk9vUmtLUlNM?=
 =?utf-8?B?b3hIdGFzMFcwbWJOOFdFQnJsTVNkSytXMmIxWHViVXN6cExnbTI0cGIyMFE3?=
 =?utf-8?B?ZDhGKzN5OUdQZG5YT2RFczhvTUpNWlB4ZUdXNlh5azJyVWRickNWSjFOQU96?=
 =?utf-8?B?SGFaNk9VeHdoSytRaGdHQVRmdUpjaTZXdVZVRnV6NFkxdk03a0tIVzc5MXdR?=
 =?utf-8?B?Qnl0N1VhUFRwZ09qRXMyTzdsbDU1Ky83T3J4eDFKYldCbU54M0Y5VDlzR1Bh?=
 =?utf-8?B?UzNjODdtb1hqdXMwQTRQai94aGFUYzVwSGZoR3lxakhBSDhvUjByWVdXbXNl?=
 =?utf-8?B?Y2U3UTk5aGJXVm9nNVhMVlZIN3kyejRlUkxBVUpjSDRtdms0ZEkwejhjVkNr?=
 =?utf-8?B?YkFhQXlqOEpTYTBqSU9jcnpEUXBRQlhPUnJuUk5neWdSRGhUWVZiSXlQUDB2?=
 =?utf-8?B?U3FEMW9sRmhqaml0LzYrTmg0VFM1djRiNElabzJMdHdRQVdzY3FpSDJvVUQv?=
 =?utf-8?B?RmtYK2VCbzhWTUNUNHNHbWY5T01UZk1kYlV5VFM1TFFNODZTMHB6RkZ4WmxC?=
 =?utf-8?B?WmVxUHYvbnpQZ0FIVThLQURING45Q0hNcGdLRkM0MVRsUCs1UXloTHNDcm5u?=
 =?utf-8?B?LzRDRXpFanFUdFpUcDRFZ1NYR1RxWUhCN3JSQzI4bDNteUpqWEFkc1pSZjls?=
 =?utf-8?B?cWhSVFFySlpydWtHWXhTNFRwV2huNGZNNFZmOHppRHUwZHJJK0syTTVpbXVz?=
 =?utf-8?B?c2hRbXhKOFFvUDBhQ2VuZnNrdUFrZnZIR0NhRFp0MG40MDA5clJJbjFVT0tT?=
 =?utf-8?B?cUNtZ2xZTnJkMjRSUWNBaFRka0E2WWkzTUNrU0hBeFpJTjZUajMrOXk5MlM2?=
 =?utf-8?B?VnVINzBzWHZEQWtqK0JuZWFrS2NTYWsvNkw0c1llUkdON1BIQVRuZjNlYzJn?=
 =?utf-8?B?Z29mNXA3RzlJSE9pRUlHZ2hSTHhwcGZxZGpmZHdvNVhyWnJPRCtRMWo5dURH?=
 =?utf-8?B?dWF6RXcza3piU3dUZk9nbUlLSGNBNkRFaXFPc29rTys0OUIvS0czanp5eE53?=
 =?utf-8?B?WVJldWVGRUJXa3ptUXZvRDRyelVTdk1UQWFya010N0hOSXFCTGpwZ2RsWUFq?=
 =?utf-8?B?cWZHbW50cks0Ym1UK2xtVFlkMmR2Wk1zZmVHUWt0L3NSNmRIUDE4ZGJUemVE?=
 =?utf-8?B?dE9EUWdNWDRBSDlWVlVyQnFCbFdZb2xiVjNPRWhOMWNFY3FsenJKV1pRRjFL?=
 =?utf-8?B?MHltRTZVZEExSXZoeVU4R3pUTTFLd0pvS1NSelVuR0pHVGVvbzBHV2ZobEFq?=
 =?utf-8?B?MXNuSVh5alpicWdtUzUyK01KK2Q4RFMweGM3RnkvQWt5NXBjYXlDeTVLQ2pY?=
 =?utf-8?B?dWpWbmVWOVd1eVl6WlRiSjliNy9mOTJMK0NSNlVvRXBaSC9iUjJNbkxmeVZD?=
 =?utf-8?B?SkZVQ2hwb0Q3OGJLWnVWQ3kvQnNpQ3dRSVdwNnF3WTRiVDh5bzF3QTUrNVp3?=
 =?utf-8?B?cHQrVnZYVWNBczhtSUpLMVdJZCs4RkdRS1ZnSFhEY3ltQll4K0w3OUcyNjZM?=
 =?utf-8?B?eTc2Zm50c3JBYlpDejllR2JRR1lkUElZdUdha1ArMkxLL1pYK3F0WGVlSExB?=
 =?utf-8?B?STc1Z2g1UEwrWEFpTGROWFRWaHdibEpHRmxGQjByR0JiYkIwb1gvMkliR0du?=
 =?utf-8?B?OGlQYjVDbXR4M1YyZVVQM2psSFBkZWdFSVllNFNwU0FwU2ozaWNTaVJEUERD?=
 =?utf-8?B?U2FmTnNsY0llR0pJUWFpSEpwZEtSVGRSaWZJMzlQQkVEdU81R3YwUVNENkpi?=
 =?utf-8?B?ZkRXbVZlSUgvZW8yY0NidXZDNVdJczF5YzhqM2pzL2dNUTc5UzhHWDluWm12?=
 =?utf-8?B?UndoVkJzNHd4bDlZbFNCZjlGaENBSU9GSlRnQ2NldHVJYkRzZUVNUFpqZGdJ?=
 =?utf-8?B?Tk5MZ1htcWlLQzlQZmVWbVVzb2JNaFdmbG9DaHc5ekpCTmtreFFLQWQxOW1m?=
 =?utf-8?B?Ky9JU2Jaa0IrbjhKd1lIWU9ZeFM3NE52K24vbWh0WHVia1ovbjhqaCsrMXdu?=
 =?utf-8?Q?KwsU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a0308af1-a03d-4c81-993e-08dc171faa37
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 05:46:34.6813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIUXfnPuX6jrNH1YsAHDKM62ulVR6J7OczS4VkdCAEd4FQpxj+FTUpILa0EpALZ2+4YOpIviS4KE0oXLS3gzSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8749

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxNi8wMS8yMDI0IDA4OjQ5LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IEhpIEtyenlzenRvZiwNCj4gPg0KPiA+Pg0KPiA+PiBPbiAxMi8wMS8yMDI0IDEyOjE3
LCBYdSBZYW5nIHdyb3RlOg0KPiA+Pj4gVGhlIGkuTVg5MyBuZWVkcyBhIHdha3VwIGNsb2NrIHRv
IHdvcmsgcHJvcGVybHkuIFRoaXMgd2lsbCBhZGQgY29tcGF0aWJsZQ0KPiA+Pj4gYW5kIHJlc3Ry
aWN0aW9uIGZvciBpLk1YOTMgcGxhdGZvcm0uDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTog
WHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+Pg0KPiA+Pj4gLS0tDQo+ID4+PiBDaGFu
Z2VzIGluIHYyOg0KPiA+Pj4gIC0gbm8gY2hhbmdlcw0KPiA+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4g
Pj4+ICAtIGFkZCBjbG9ja3MgcmVzdHJpY3Rpb24NCj4gPj4+IC0tLQ0KPiA+Pj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbCAgICB8IDE2ICsrKysrKysrKysr
KysrKysNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4g
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2Np
LWhkcmMtdXNiMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9j
aS0NCj4gPj4gaGRyYy11c2IyLnlhbWwNCj4gPj4+IGluZGV4IGI3ZTY2NGY3Mzk1Yi4uNmU3NTA5
OWI2Mzk0IDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+Pj4gQEAgLTU3LDYgKzU3
LDcgQEAgcHJvcGVydGllczoNCj4gPj4+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+Pj4gICAgICAg
ICAgICAgICAgLSBmc2wsaW14OG1tLXVzYg0KPiA+Pj4gICAgICAgICAgICAgICAgLSBmc2wsaW14
OG1uLXVzYg0KPiA+Pj4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OTMtdXNiDQo+ID4+PiAgICAg
ICAgICAgIC0gY29uc3Q6IGZzbCxpbXg3ZC11c2INCj4gPj4+ICAgICAgICAgICAgLSBjb25zdDog
ZnNsLGlteDI3LXVzYg0KPiA+Pj4gICAgICAgIC0gaXRlbXM6DQo+ID4+PiBAQCAtNDEyLDYgKzQx
MywyMSBAQCBhbGxPZjoNCj4gPj4+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1wcmUtZW1wLWN1
cnItY29udHJvbDogZmFsc2UNCj4gPj4+ICAgICAgICAgIHNhbXN1bmcscGljb3BoeS1kYy12b2wt
bGV2ZWwtYWRqdXN0OiBmYWxzZQ0KPiA+Pj4NCj4gPj4+ICsgIC0gaWY6DQo+ID4+PiArICAgICAg
cHJvcGVydGllczoNCj4gPj4+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgICAgICAg
IGNvbnRhaW5zOg0KPiA+Pj4gKyAgICAgICAgICAgIGNvbnN0OiBmc2wsaW14OTMtdXNiDQo+ID4+
PiArICAgIHRoZW46DQo+ID4+PiArICAgICAgcHJvcGVydGllczoNCj4gPj4+ICsgICAgICAgIGNs
b2NrLW5hbWVzOg0KPiA+Pj4gKyAgICAgICAgICBpdGVtczoNCj4gPj4+ICsgICAgICAgICAgICAt
IGNvbnN0OiB1c2JfY3RybF9yb290X2Nsaw0KPiA+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHVz
Yl93YWtldXBfY2xrDQo+ID4+PiArICAgICAgICBjbG9ja3M6DQo+ID4+PiArICAgICAgICAgIG1p
bkl0ZW1zOiAyDQo+ID4+PiArICAgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4+DQo+ID4+IE5vdGhp
bmcgaW1wcm92ZWQgcmVnYXJkaW5nIG15IGNvbW1lbnRzLiBXaHkgZG8geW91IGFsbG93DQo+ID4+
IGFueS91bnNwZWNpZmljL3VuY29uc3RyYWluIGludGVycnVwdHMgYW5kIHJlZz8NCj4gPj4NCj4g
Pj4gWW91IHNhaWQ6DQo+ID4+ICJIb3dldmVyLCByZXNldCwgcmVnIGFuZCBpbnRlcnJ1cHRzIHBy
b3BlcnR5IGlzIG5vdCBzcGVjaWFsIGZvciBpbXg5My4iDQo+ID4+IGJ1dCB3aGF0IGRvZXMgaXQg
ZXZlbiBtZWFuPyBIb3cgdGhleSBjYW4gYmUgc3BlY2lhbCBvciBub3Qgc3BlY2lhbD8NCj4gPj4N
Cj4gPj4gTXkgY29tbWVudHMgZnJvbSBwcmV2aW91cyB2ZXJzaW9uIGFwcGx5LiBJZiB5b3UgZG8g
bm90IHdhbnQgdG8gd29yayBvbg0KPiA+PiBleGlzdGluZyB0ZWNobmljYWwgZGVidCwgQlRXIGFk
ZGVkIGJ5IGFub3RoZXIgTlhQIGVtcGxveWVlLCB0aGVuIEkgd2lsbA0KPiA+PiBOQUsgYW55IG5l
dyBzdWJtaXNzaW9ucy4NCj4gPg0KPiA+IFlvdSB3YW50IG1lIHRvIGFkanVzdCBiZWxvdyBwcm9w
ZXJ0aWVzIHRvIGJlIG1vcmUgY29tbW9uIHByb3BlcnRpZXMNCj4gPiBhbmQgYWRkIGRldmljZSBz
cGVjaWZpYyBsaW1pdGF0aW9ucywgcmlnaHQ/DQo+IA0KPiBZZXMNCj4gDQo+ID4NCj4gPiAtLS0N
Cj4gPiAgIHJlZzoNCj4gPiAgICAgbWluSXRlbXM6IDENCj4gPiAgICAgbWF4SXRlbXM6IDINCj4g
Pg0KPiA+ICAgaW50ZXJydXB0czoNCj4gPiAgICAgbWluSXRlbXM6IDENCj4gPiAgICAgbWF4SXRl
bXM6IDINCj4gPg0KPiA+ICAgY2xvY2tzOg0KPiA+ICAgICBtaW5JdGVtczogMQ0KPiA+ICAgICBt
YXhJdGVtczogMw0KPiA+DQo+ID4gICBjbG9jay1uYW1lczoNCj4gPiAgICAgbWluSXRlbXM6IDEN
Cj4gPiAgICAgbWF4SXRlbXM6IDMNCj4gPiAtLS0NCj4gPg0KPiA+IEZvciBtb3N0IG9mIHRoZSBk
ZXZpY2VzLCBwcm9wZXJ0eSByZWcsIGludGVycnVwdHMsIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMN
Cj4gPiBoYXMgMSBpdGVtLiBTbyB0aGVzZSBwcm9wZXJ0aWVzIGNhbiBzZXQgbWF4SXRlbXMgdG8g
MS4gRm9yIHNwZWNpYWwgZGV2aWNlcywNCj4gPiBJIHNob3VsZCBsaXN0IHRoZW0gc3RhbmRhbG9u
ZSwgaXMgdGhpcyB5b3VyIGV4cGVjdGF0aW9uPw0KPiANCj4gSnVzdCBsaWtlIHlvdSBjb25zdHJh
aW4gY2xvY2tzIGZvciBuZXcgdmFyaWFudCwgeW91ciB2YXJpYW50IHNob3VsZCBoYXZlDQo+IGNv
bnN0cmFpbmVkIHJlZywgaW50ZXJydXB0cyBhbmQgd2hhdGV2ZXIgZWxzZSBpcyB0aGVyZSB2YXJp
YWJsZS4gSSBkb24ndA0KPiByZXF1aXJlIGZpeGluZyBhbGwgdGhlIGRldmljZXMgaW4gdGhpcyBi
aW5kaW5nLCBidXQgYXQgbGVhc3QgeW91ciBuZXcNCj4gb25lIGFuZCBwcmVmZXJhYmx5IG90aGVy
IE5YUCBhcyB3ZWxsLg0KPiANCg0KSSdtIHRyaW5nIHRvIHNldCB0aGUgbWF4SXRlbXMgb2YgcHJv
cGVydHkgcmVnLCBpbnRlcnJ1cHRzLCBjbG9ja3MgYW5kIA0KY2xvY2stbmFtZXMgdG8gMSwgdGhl
biBjb25zdHJhaW4gdGhlIG1pbkl0ZW1zIGFuZCBtYXhJdGVtcyB0byAzIGZvcg0Kb25lIHNvYyBs
YXRlciBsaWtlIGJlbG93LCBpbiBzdWNoIHdheSBJIG5lZWRuJ3QgdG8gY29uc3RyYWluIHJlZyBh
bmQNCmludGVycnVwdHMgZm9yIG1vc3Qgb2YgdGhlIHNvY3MuDQpCdXQgZHQtdmFsaWRhdGUgZmFp
bGVkIGF0IHRoZSBmaXJzdCBwbGFjZSB3aGVuIHZhbGlkYXRlIGNsb2NrcyBwcm9wZXJ0eS4NCg0K
SXMgdGhlcmUgYSB3YXkgdG8gYWNoaWV2ZSB0aGlzPw0KDQotLS0NCiAgcmVnOg0KICAgIG1heEl0
ZW1zOiAxDQoNCiAgaW50ZXJydXB0czoNCiAgICBtYXhJdGVtczogMQ0KDQogIGNsb2NrczoNCiAg
ICBtYXhJdGVtczogMQ0KDQogIGNsb2NrLW5hbWVzOg0KICAgIG1heEl0ZW1zOiAxDQoNCmFsbE9m
Og0KICAtIGlmOg0KICAgICAgcHJvcGVydGllczoNCiAgICAgICAgY29tcGF0aWJsZToNCiAgICAg
ICAgICBvbmVPZjoNCiAgICAgICAgICAgIC0gaXRlbXM6DQogICAgICAgICAgICAgICAgLSBjb25z
dDogZnNsLGlteDI3LXVzYg0KICAgIHRoZW46DQogICAgICBwcm9wZXJ0aWVzOg0KICAgICAgICBj
bG9ja3M6DQogICAgICAgICAgbWluSXRlbXM6IDMNCiAgICAgICAgICBtYXhJdGVtczogMw0KICAg
ICAgICBjbG9jay1uYW1lczoNCiAgICAgICAgICBtaW5JdGVtczogMw0KICAgICAgICAgIG1heEl0
ZW1zOiAzDQotLS0NCg0KVGhhbmtzLA0KWHUgWWFuZw0K


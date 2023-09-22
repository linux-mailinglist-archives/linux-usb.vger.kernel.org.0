Return-Path: <linux-usb+bounces-499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D38927AA945
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 08:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 81327282EAD
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 06:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3D415AF5;
	Fri, 22 Sep 2023 06:47:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832AFEAC8
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 06:47:48 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2051.outbound.protection.outlook.com [40.107.8.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9CB18F
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 23:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1taq/0TYKliERMJarjM/SR09Fu2fur8yNDAwkQSdz6vtG6m3IsqAnyMG0ypZZHZIIOIZMlX7/O2gpya5ykgcaT86EHcPaKAkFxCz+Upk7Am4UFaEOoFudX2nZLtvJbTWeMrp4nk0suai75c7obz8YOFoX7PqFB7kWgOM0pgmO14dQgcotctmeye/BNDm0QDRwd8UOyYChdiLQ6+V6DQrMQPF0GfFgry67RGKeBW5jfmcqPbyI9zX+NoGHkA4kf6lAAya2cqXZugW5Wu21/U3+ZSjfWzk5bzYm7rfeZl8XcII/z7U6i1gW1uPTS2Vq38dR58LqHgaHC4Dxzi34c2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8pvctbaA+Gtq7AEo/KKarTNz2DebRnL0dCNP3jd6Fs=;
 b=MoDv8hk2XQHElHZqz0DT0sKIkBafY/TL4sWOp28pg9vXJzzP9xc77K5wLRVvHx++/yeAFj+3Fmi/sBhq5nxx/sbaO51Y1/H0SvH3yVayk/vNd9Eys4oWrkp/J9WhDK3YtaRfUktNNgFr1UEQ53JcWtxScGBPmWOU4/favUTqZaVlbSPcwAf39K/lrMiZ9ALs6YHPJbBj1hqmwA8vn0P6nqJnjruCe9ftH3SoPabJkXxrVnQcdw5Lgsq2Bl+unsC7cV9xeqE9dI6ztftx8dwDaMCRmUM85LnF2uQ9TkYjqufYE+PAfraQbwZes90OFQ48Zexp03Hy2p6exUUhFYQGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8pvctbaA+Gtq7AEo/KKarTNz2DebRnL0dCNP3jd6Fs=;
 b=Xtj1Jf2CGMVNyhnagLw4q3nkU+yQmm8/vaKhMkWWH2hSWf4NYhIK/GxDyzjmO9mmIWeIey+BjwjN50wHwG3zyMTz5q9Kic8UxUQnQAQpeKKXV+urhMbOPE8kC1gW+WvTWhuiGyLANFNO/xNfXeBnMKhZJqd4m84khppuKrRwMeQ=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 06:47:44 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 06:47:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jun Li
	<jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Thread-Topic: [EXT] Re: [PATCH v2 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Thread-Index: AQHZ5wQEQKOPdAYPiEO1ndtBPMFygrAgZ0WAgABHfgCABYvLcA==
Date: Fri, 22 Sep 2023 06:47:43 +0000
Message-ID:
 <DB7PR04MB4505B1D473B05CCE21F4AB588CFFA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230914121158.2955900-1-xu.yang_2@nxp.com>
 <ZQgl8byyZNqe5Af1@kuha.fi.intel.com>
 <22c69730-43b5-9c48-da21-03f0441eecbb@roeck-us.net>
In-Reply-To: <22c69730-43b5-9c48-da21-03f0441eecbb@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PAXPR04MB9519:EE_
x-ms-office365-filtering-correlation-id: de82bbfa-8ab3-4cf9-b9b3-08dbbb37d274
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 X+aq/g2xoRdJZObDh3BimlG+35g0O4+e8LZpL/c7xLIc6Q9mpcHpILDpxVzuLtAGYYfNR1G8qFfZQrIaJYZciuPzjw+G8XzZ/ETlo4tvY+tNuILkGMjRX2On/PxifDjZJN4mcV8cFV1sIRtzsvo/V+naAtWH3g4AXFPZLpqF1VMv+Z1EsRYsr4uXjF4QZDlN3BfRZNkZyd8BUaOdwdb5H9p9caYLdWDS3TxiV8JRJbWOwLMvQ0CdoMfx+oCQQ//xBfbOLlEkk2UAq4QB/djBjyUfPnILk0PS0rpYWdV7i9moSPSam7d0CHhsN4v2Jpz7mz1VAZTt9Hx0NmSHF9h3GGw5+Y2DJ90E4jZU4yIJAVZXZXhlPBt8LNQ9qERBDkgcOeLfbbLKw3I8/guRa33QBnD46Nw/yXUJ/5zFlMEUzMtvx2j8dUuCteNaGqy42ccI9Uo3Ppq2YDUBpjBYSkfSHQhyFRZChNNvixICdSNx/mXnyIq5Xl4gE5161GWe/lcXWPJFp8s7c/O6Hmgkzu/3qErYynxmpRNf7YxsfRoVLYBGDELJLU/Ix2LetGAQzCoFnSrshgQsDM+MJ2un0/UwrkMzAfaM5uv78oM6wZLFAoIWgBVUyik7PPqyfSkf3Wa5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199024)(1800799009)(186009)(83380400001)(7696005)(38070700005)(53546011)(6506007)(122000001)(55016003)(86362001)(9686003)(33656002)(38100700002)(4326008)(8676002)(2906002)(66476007)(316002)(478600001)(5660300002)(26005)(71200400001)(41300700001)(8936002)(110136005)(52536014)(76116006)(64756008)(66446008)(66556008)(54906003)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dStyczNtdk9hczZ0WEF0dk8vTjlVNHBWVlpmcjFJeEFobTN3UTV5SURMM05o?=
 =?utf-8?B?dU9nTE55eGhBU2hmRkdFV3NlVjdSWXk2SUQ2UlNuVldGa3hHbEdIRlVOa0Mv?=
 =?utf-8?B?MWhlaGtyTVRobjE4MTV4Y1FMdXhXY2dacEVCb3FQb2szb0QvbHN3TWJ1cDNq?=
 =?utf-8?B?V3ZaUTR0S2VoODhQTVZaYzhJcGlZRVRTNDRjTy8rODZyV0NVdWttZDkzU0l2?=
 =?utf-8?B?dDhkQ25vcnJNZEx2SUFtTjljYTBKaG5aRW9vdk1VQjBQTVQxN0JQK21VYTRr?=
 =?utf-8?B?L2ZUWWhDd0w3VFNhdFFIdExnbm9rei94cDAzeC9ycXVDK2NYNkZIenNlckc5?=
 =?utf-8?B?UGZ0ZUNueDFPKzZjc2VSNTlyVktZdmIxTExETUVaL2Nudm05aFpRY0U1N0pC?=
 =?utf-8?B?MzYxM3B2TGY2ZVc1SW1HQUlhOHBxVjd4K2JONVNBaEFyaFVEM3pJZ3pmbEYx?=
 =?utf-8?B?Q1V6NnhrT0lnT1hWZUdZSkhmRmFnMVk2RlZjMVRnbnRzYk9ubDA0YlJ0K1N3?=
 =?utf-8?B?N0V3ZG8zSnc4WTBaT1BHOTNXeVpEaTUrenpmUjhVZEFoSGxHR2pJaWtVNHpV?=
 =?utf-8?B?MUNuS3JjcXZyeFJIaFlPNGlkY3Z0QzZ3VWlrbGMzZlJ5QndhYXNyQkN3Tmov?=
 =?utf-8?B?V1RqVi9PemI2QkFpUk9VU2lPM1VNaFEwRUZ6UUNDcDZISzVGMllQbTJXbXJO?=
 =?utf-8?B?aDNUbk03YWpHNVM4YUJOU2NCUUR2cVZRU3dkVHJSQ25rUlVzQ08ybUxBdXFk?=
 =?utf-8?B?NFBoc09zVjFlTDRBTzFuSTI3UDJTVmtIZGNYUDBQa2dtSDk1cGlCWTZDMndZ?=
 =?utf-8?B?a2VFdWZKRzhMTStLRkNkanc5a05ZUWRqWXdzMk1JbThSUkZGY0NUTUJoN1NO?=
 =?utf-8?B?NmZrUUdKbi9zVmpvN3I4UG0yZzgxSml1SVJ2WWM2RHA1aDQxSkRSTHM4SU5s?=
 =?utf-8?B?VmNJcFM0Uk9KTExYSlg2WldnWEQ1MDJvUzN0dno5V0RCNXF1UWRQZlFHZ0Jz?=
 =?utf-8?B?aFZUWXRQdjB6S0NJU2RudXA3ZzBGa1FkNlhkU1hOY1F3Zk1aeVdlVGJWWkR3?=
 =?utf-8?B?Mkx6cWM2eXpRL05qb3U0aTVNK08yUzVtK1lyNG50VDZ1S0xNNXo5TXkyZUxY?=
 =?utf-8?B?VmR2Rm5yTEtCTlNpYTFQTkZucklMVFM1OFI0czBDMlhRSkZWUmpGeXEzT0ZP?=
 =?utf-8?B?WmowZzZPL1A0ZWU1VE1vN2tsWlR6dGxGR2lHVVMwYzNmcWswclZaV1ZaVFl3?=
 =?utf-8?B?ZUZGbzc0aXVTK1ZRZVJ5bUo0cUNkazlNTnVLbXZyY1FnMkE4WlpKMCtPRE4r?=
 =?utf-8?B?engwanpnbFVtbnZsVWl2bFE2dnA4bmZ6cUk1SE0wSk8ranFLaGhUOWFZdDl5?=
 =?utf-8?B?YXNaNXF3NjJLZzNGRndSK1VJOXBXOVdUWEtNN2tJV043Y01OeDVnelMzSHZO?=
 =?utf-8?B?Y2FiK1BvdUcwdmtabjczTWJ1b1NqTU9hbkRJYnVwUXFFVTNUWnJEdUZ2ZDhQ?=
 =?utf-8?B?OG0vZjVOcXNXeDkrYmdycjlFZ3orTkwwalR4Ulh3VE4wd0VNZEFqYmlPREtG?=
 =?utf-8?B?N1ZQdGdGQUMvcTBpNmtCelpSMUdaSEJhUjBDM3QxRC9Xc01HSUVzbjhlenQw?=
 =?utf-8?B?ZHNHTHFLNHZxM0thbGl5SmlaRWNBKzRILytSbytYaHlPN3p2bHp5eWxVZS90?=
 =?utf-8?B?NXV6TE1pYVpuQVNjMnpSV1NMbWIxLy90MTlMSW5rZlJYTllHS3ZPT1AvOUJI?=
 =?utf-8?B?Yk4wMm9YM2VjalZjT2dUOVZoWEdBcFloMjlzSEFOUmtYd3ZXRHljSkxJNGh0?=
 =?utf-8?B?U0c1bXFGU3lOY0JCTlFweDdxdFVGSWFIU2xVbEk1aTZmcWVKZGVKVnNVZ0Vi?=
 =?utf-8?B?cWREZ2ZiMEI5NWZYWFE5VHBGMElzUlpTUUorZFdWMWJ0RmRMU0ZnSUN4bHdz?=
 =?utf-8?B?WGJOdW1HaEtSeVA5MlJxc3lCN1dBdUJzQnhMUHJDeHVzelZaVjFNS09DOHZE?=
 =?utf-8?B?K3I1bVVnelhUQzB6ZXVUZmNjUTN1UE04bEFjM0RQOTZvVnU1bnhaZk9MSEV6?=
 =?utf-8?B?anlwckY0d1lORG9LVTJPSjJCTHhyUllZQ2tTWDl1WEFiR1NsOU9rRldIeUtJ?=
 =?utf-8?Q?VMkM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de82bbfa-8ab3-4cf9-b9b3-08dbbb37d274
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 06:47:43.1414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BNuqieK2iB2wt7dl1VfYfr9OZySBPzk3fCznufbT9OHsuEfpAMA6lKfUDEXM6rnkaW+Smqvadww15lQjaao2xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

SGkgSGVpa2tpICYgR3VlbnRlciwNCg0KPiBPbiA5LzE4LzIzIDAzOjI2LCBIZWlra2kgS3JvZ2Vy
dXMgd3JvdGU6DQo+ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDg6MTE6NTdQTSArMDgwMCwg
WHUgWWFuZyB3cm90ZToNCj4gPj4gVGhlIHJldHVybiB2YWx1ZSBmcm9tIHRjcGNpL3JlZ21hcF9y
ZWFkL3dyaXRlKCkgbXVzdCBiZSBjaGVja2VkIHRvIGdldA0KPiA+PiByaWQgb2YgdGhlIGJhZCBp
bmZsdWVuY2Ugb2Ygb3RoZXIgbW9kdWxlcy4gVGhpcyB3aWxsIGFkZCBjaGVjayBjb2RlIGZvcg0K
PiA+PiBhbGwgb2YgdGhlIHJlc3QgcmVhZC93cml0ZSgpIGNhbGxiYWNrcyBhbmQgd2lsbCBzaG93
IGVycm9yIHdoZW4gZmFpbGVkDQo+ID4+IHRvIGdldCBBTEVSVCByZWdpc3Rlci4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+DQo+ID4+
IC0tLQ0KPiA+PiBDaGFuZ2VzIGluIHYyOg0KPiA+PiAgIC0gcmVtb3ZlIHByaW50aW5nIGNvZGUN
Cj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jIHwgMzQgKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90
Y3BjaS5jDQo+ID4+IGluZGV4IDBlZTNlNmUyOWJiMS4uOGNjYzJkMWE4ZmZjIDEwMDY0NA0KPiA+
PiAtLS0gYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMNCj4gPj4gKysrIGIvZHJpdmVy
cy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jDQo+ID4+IEBAIC02NTcsMjEgKzY1NywyOCBAQCBpcnFy
ZXR1cm5fdCB0Y3BjaV9pcnEoc3RydWN0IHRjcGNpICp0Y3BjaSkNCj4gPj4gICAgICBpbnQgcmV0
Ow0KPiA+PiAgICAgIHVuc2lnbmVkIGludCByYXc7DQo+ID4+DQo+ID4+IC0gICAgdGNwY2lfcmVh
ZDE2KHRjcGNpLCBUQ1BDX0FMRVJULCAmc3RhdHVzKTsNCj4gPj4gKyAgICByZXQgPSB0Y3BjaV9y
ZWFkMTYodGNwY2ksIFRDUENfQUxFUlQsICZzdGF0dXMpOw0KPiA+PiArICAgIGlmIChyZXQgPCAw
KQ0KPiA+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPj4NCj4gPj4gICAgICAvKg0KPiA+
PiAgICAgICAqIENsZWFyIGFsZXJ0IHN0YXR1cyBmb3IgZXZlcnl0aGluZyBleGNlcHQgUlhfU1RB
VFVTLCB3aGljaCBzaG91bGRuJ3QNCj4gPj4gICAgICAgKiBiZSBjbGVhcmVkIHVudGlsIHdlIGhh
dmUgc3VjY2Vzc2Z1bGx5IHJldHJpZXZlZCBtZXNzYWdlLg0KPiA+PiAgICAgICAqLw0KPiA+PiAt
ICAgIGlmIChzdGF0dXMgJiB+VENQQ19BTEVSVF9SWF9TVEFUVVMpDQo+ID4+IC0gICAgICAgICAg
ICB0Y3BjaV93cml0ZTE2KHRjcGNpLCBUQ1BDX0FMRVJULA0KPiA+PiArICAgIGlmIChzdGF0dXMg
JiB+VENQQ19BTEVSVF9SWF9TVEFUVVMpIHsNCj4gPj4gKyAgICAgICAgICAgIHJldCA9IHRjcGNp
X3dyaXRlMTYodGNwY2ksIFRDUENfQUxFUlQsDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyAmIH5UQ1BDX0FMRVJUX1JYX1NUQVRVUyk7DQo+ID4+ICsgICAgICAgICAgICBp
ZiAocmV0IDwgMCkNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPj4g
KyAgICB9DQo+ID4+DQo+ID4+ICAgICAgaWYgKHN0YXR1cyAmIFRDUENfQUxFUlRfQ0NfU1RBVFVT
KQ0KPiA+PiAgICAgICAgICAgICAgdGNwbV9jY19jaGFuZ2UodGNwY2ktPnBvcnQpOw0KPiA+Pg0K
PiA+PiAgICAgIGlmIChzdGF0dXMgJiBUQ1BDX0FMRVJUX1BPV0VSX1NUQVRVUykgew0KPiA+PiAt
ICAgICAgICAgICAgcmVnbWFwX3JlYWQodGNwY2ktPnJlZ21hcCwgVENQQ19QT1dFUl9TVEFUVVNf
TUFTSywgJnJhdyk7DQo+ID4+ICsgICAgICAgICAgICByZXQgPSByZWdtYXBfcmVhZCh0Y3BjaS0+
cmVnbWFwLCBUQ1BDX1BPV0VSX1NUQVRVU19NQVNLLCAmcmF3KTsNCj4gPj4gKyAgICAgICAgICAg
IGlmIChyZXQgPCAwKQ0KPiA+PiArICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+
PiAgICAgICAgICAgICAgLyoNCj4gPj4gICAgICAgICAgICAgICAqIElmIHBvd2VyIHN0YXR1cyBt
YXNrIGhhcyBiZWVuIHJlc2V0LCB0aGVuIHRoZSBUQ1BDDQo+ID4+ICAgICAgICAgICAgICAgKiBo
YXMgcmVzZXQuDQo+ID4+IEBAIC02ODcsNyArNjk0LDkgQEAgaXJxcmV0dXJuX3QgdGNwY2lfaXJx
KHN0cnVjdCB0Y3BjaSAqdGNwY2kpDQo+ID4+ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY250
LCBwYXlsb2FkX2NudDsNCj4gPj4gICAgICAgICAgICAgIHUxNiBoZWFkZXI7DQo+ID4+DQo+ID4+
IC0gICAgICAgICAgICByZWdtYXBfcmVhZCh0Y3BjaS0+cmVnbWFwLCBUQ1BDX1JYX0JZVEVfQ05U
LCAmY250KTsNCj4gPj4gKyAgICAgICAgICAgIHJldCA9IHJlZ21hcF9yZWFkKHRjcGNpLT5yZWdt
YXAsIFRDUENfUlhfQllURV9DTlQsICZjbnQpOw0KPiA+PiArICAgICAgICAgICAgaWYgKHJldCA8
IDApDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4NCj4gPiBJIHRo
aW5rIHlvdSBzdGlsbCBuZWVkIHRvIGNsZWFyIFRDUENfQUxFUlRfUlhfU1RBVFVTIGluIHRoaXMg
Y2FzZS4NCj4gPiBHdWVudGVyLCBjYW4geW91IGNoZWNrIHRoaXM/DQo+ID4NCj4gDQo+IElmIHJl
YWRpbmcgZnJvbSBvciB3cml0aW5nIHRvIHRoZSBzdGF0dXMgcmVnaXN0ZXIgZmFpbGVkLCB3ZSBh
cmUgcHJldHR5DQo+IG11Y2ggbWVzc2VkIHVwIGFueXdheSwgc28gSSBkb24ndCB0aGluayBpdCBy
ZWFsbHkgbWF0dGVycy4NCj4gDQo+IEkgdGhpbmsgdGhlIG1vcmUgc2V2ZXJlIHByb2JsZW0gaXMg
dGhhdCB0aGlzIGlzIGFuIGludGVycnVwdCBoYW5kbGVyLA0KPiB3aGljaCBlaXRoZXIgaGFuZGxl
cyB0aGUgaW50ZXJydXB0IG9yIGl0IGRvZXNuJ3QuIEl0IGRvZXMgbm90IGhhdmUgdGhlDQoNClll
cywgSSBhZ3JlZS4NCg0KPiBvcHRpb24gb2YgcmV0dXJuaW5nIGFuIGVycm9yIChuZWdhdGl2ZSBl
cnJvciBjb2RlKS4NCg0KTm9ybWFsbHkgc3BlYWtpbmcsIGl0IG1lYW5zIHRoZSBkZXZpY2UgaGFz
IHN1Y2Nlc3NmdWxseSBoYW5kbGVkIHRoZQ0KaW50ZXJydXB0IGV2ZW50IGlmIGFuIGludGVycnVw
dCBoYW5kbGVyIHJldHVybiBJUlFfSEFORExFRCwgYW5kIHRoZQ0KaW50ZXJydXB0IGV2ZW50IGRv
ZXNuJ3QgYmVsb25nIHRvIHRoaXMgZGV2aWNlIG9yIG5vdCBiZSBoYW5kbGVkIGlmIHRoZQ0KaW50
ZXJydXB0IGhhbmRsZXIgcmV0dXJuIElSUV9OT05FLiBIb3dldmVyLCB0aGUgaXJxIGNvcmUgd2ls
bCByZWdhcmQNCmFuIG5lZ2F0aXZlIGVycm9yIGNvZGUgYXMgSVJRX05PTkUgYXMgZmFyIGFzIEkg
a25vdy4gQW5kIHdoZW4gSVJRX05PTkUNCm9yIGEgYW4gbmVnYXRpdmUgZXJyb3IgY29kZSBpcyBy
ZXR1cm5lZCwgaXJxIGNvcmUgd2lsbCBqdWRnZSBpZiB0aGUgaXJxDQppcyBiYWQgb3IgaWYgdGhl
cmUgaXMgbmVlZCB0byBkaXNhYmxlIHRoaXMgaXJxLiBUaGVyZWZvcmUsIHRoZSBpcnEgaGFuZGxl
cg0KcmV0dXJucyBhbiBuZWdhdGl2ZSBlcnJvciBjb2RlIHNob3VsZCBiZSBvayBpZiBpdCdzIHRo
cmVhZGVkLg0KSSBqdXN0IGRvIHRoZSBzYW1lIHRoaW5nIGFzIG1heF90Y3BjaV9pcnEoKSBpbiB0
Y3BjaV9tYXhpbV9jb3JlLmMuDQoNCj4gDQo+IFRoZSBzdWJtaXR0ZXIgd2lsbCBoYXZlIHRvIGRl
Y2lkZSB3aGF0IHRvIGRvIGluIHRoZSBlcnJvciBjYXNlOiBXYXMNCj4gdGhlIGludGVycnVwdCBo
YW5kbGVkIG9yIG5vdCA/IEkgaGF2ZSBubyByZWFsIGFuc3dlciB0byB0aGF0IHF1ZXN0aW9uOyBh
bGwNCj4gYW5zd2VycyBzZWVtIHdyb25nIHRvIG1lLiBJIHdvdWxkIHRlbmQgdG8gcmV0dXJuaW5n
IHRoYXQgdGhlIGludGVycnVwdA0KPiB3YXMgbm90IGhhbmRsZWQuIE1vc3QgbGlrZWx5IHRoYXQg
d291bGQgY2F1c2UgdGhlIGhhbmRsZXIgdG8gYmUgY2FsbGVkDQo+IGFnYWluIGJlY2F1c2UgdGhl
IGludGVycnVwdCBjb25kaXRpb24gaXMgbm90IGNsZWFyZWQuIElmIHRoaXMgaGFwcGVucw0KPiBy
ZXBlYXRlZGx5LCB0aGUgaW50ZXJydXB0IG1pZ2h0IGVuZCB1cCBiZWluZyBkaXNhYmxlZCwgd2hp
Y2ggd291bGQgcHJvYmFibHkNCj4gYmUgdGhlIGJlc3QgcG9zc2libGUgb3V0Y29tZS4NCg0KV2hl
biBlcnJvciBvY2N1cnMsIEkganVzdCBrbm93IHRoZSB0Y3BjaSBpcnEgaGFuZGxlciBzaG91bGQg
bm90IGNvbnRpbnVlDQp0byBoYW5kbGUgZXZlbnRzIHNpbmNlIHJlYWQvd3JpdGUoKSBpcyBub3Qg
c3VjY2Vzc2Z1bC4gT3RoZXJ3aXNlLCB3ZSB3aWxsDQpzZWUgdW5leHBlY3RlZCBiZWhhdmlvcnMu
IElmIHRoZSBlcnJvciBkb2Vzbid0IGRpc2FwcGVhciBpbiB0aW1lLCB0aGVuIGlycQ0KY29yZSB3
aWxsIGRpc2FibGUgdGhlIGlycSBhcyB1c3VhbC4gSWYgdGhlIGh3IG9yIGkyYyBhZGFwdGVyIGRy
aXZlciBoYXMNCmJlZW4gcmVjb3ZlcmVkIGZyb20gYSBzaG9ydCBmYXVsdCBzdGF0ZSwgdGhlbiB0
aGUgdGNwY2kgZHJpdmVyIHdpbGwgd29yayBhcw0KdXN1YWwgdG9vLg0KDQpUaGFua3MsDQpYdSBZ
YW5nDQoNCj4gDQo+IEd1ZW50ZXINCg0K


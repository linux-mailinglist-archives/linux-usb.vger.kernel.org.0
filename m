Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4721E4588C3
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 06:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhKVFR6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 00:17:58 -0500
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:53315
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229527AbhKVFR5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 00:17:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7944lsZxUQI/dtam5dJVmqW+nDqTtYUZgirdEAYzo2RP4W9+WSlwQGh4Einrm1ymMl0J1DbxuEBp7g6x7oobY9IMKYC11eFqelefQmf27gGeyO50LdY632Pm7Bh2Geychqnq+Id0+SL/ZD9QSX61eix8SG5xom/1zUG0Bf4l/ZCbcTT2D1pdLdC2/XX7wFeoIKe+saxlSVRbbIG7sjmVeLn8tqs46imDAW45qn2fvKqR2HUkrKRjwilf3j/8OG7DSt36mQohWTKmyVc3CqV8511i+gIqKcU7n1Ch8MXOpmOfxdc6qWpmKbTLaiqfoB+OxF1TllLVxvMkTB0Og+3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MR+QlP3Zd4lwYMLJVE1v11htlPPV5GI/qkuDzpq6Jc=;
 b=fgCddGGUDlSokZQnsDmxUU7lBUR6cbyMnbNdAjU6cnrGv8XiLip7DnMheEqFFx0jA/uHcBOGMDUBl6UrkYVjl4OGpgyIMuFXu5opeN5T1TuIPq9HEA4njzhIHvLBn2qE46cdoj89huBOhjT+eoCnjvIHhxo9jWcpYKYAq2O6YQZQ+bSFqsOhmUKKQmqyPTObEQ9PUagHjVO71eQ4i+/Y3r58d6jUCWPCXdC4Ed2D4cTXzGcBRnUe5TecgIbxm+h7cc5p2xf92lPk0r2WAzjz0BS/1Laf+WhWZ5Jr/cqozRL+Y+AxVX2DGuj5I8wj+n5q0YsYq2fvvLNd3hyRjnz8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MR+QlP3Zd4lwYMLJVE1v11htlPPV5GI/qkuDzpq6Jc=;
 b=NxesuGYH2feuMGC5Y3/1GcagpXxOh4Rm835TYJP8Nr+GveqlzbxvVHEGKSqDRJEijAQz3aexM/BGo1msjuiKmw8/Vjh3FBHt21nweS13RJ3OS1EmMaNMwopU5vuyEj4ZqqqX26W78P7jkMC7q2nFwqrXUp7lgjstytLDJzVgxMY=
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB6PR04MB3112.eurprd04.prod.outlook.com (2603:10a6:6:10::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 05:14:50 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef%4]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 05:14:50 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but leave a
 pending timer
Thread-Topic: [PATCH] usb: typec: tcpm: fix tcpm unregister port but leave a
 pending timer
Thread-Index: AdffV1W/xh5UdW94QCCj0AFolauPwA==
Date:   Mon, 22 Nov 2021 05:14:49 +0000
Message-ID: <DB8PR04MB6843626773FB7975E5947C738C9F9@DB8PR04MB6843.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bfa60c0-1638-4dbe-0410-08d9ad770242
x-ms-traffictypediagnostic: DB6PR04MB3112:
x-microsoft-antispam-prvs: <DB6PR04MB3112C4926053C605937EE6A28C9F9@DB6PR04MB3112.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 88ww7ugy7DYoFVidUsHnOI1Hd4t6k31q2zdiQl8gkoofQlbuKgtd94hY8SnPbIms2IZyyYwY6liKjO2DeTW1G83X9dsr62uttRaZ1UGxxkx/fhVYM0DsdMwEBFuh+FEZCEuv8u4m5Y9Ke9L//+k7XAy53/HhZ+t4dW9LN7Y7TW//qwR9tVX4A/JqSGFjdbTFAlfX6W4vCne1sryoO07mLQfE067my5ySaQmdZ7QNzM00LF04kuUTE2oEyX7fdq2xElifmpOCZMxaCFvbf538F/SiyqGnqlRGnVLD3mxMeB+KQCg8uXUoR0zfKFHomKA/q/rWZGxN5YzLpOIudSoIdVZrY0R8k1cF+AcRBjmHuQf+QbvbYRZ+dQsgMtJ+YemyXNBXCIc12iK+1zjsslulRk1TdPJmdrwfj+3S4bI9g/ck7QpKxvaR7YXTobWQAyrOA4ZcETRR7ldZLaIZAnMPkM7OqSgJ4oX159btetrhyXN8cmJBqoS89UV8VLNTwCMMzXughV3i1GiilYCaF2djEOHuMeI4xxAOtjHB0O1NffbgnmFG909lW+qZKvMU2y0rtlSuOCzldn9fe/BjhBqV7onDRkUmaFR0jNeAmm/SglFUzANfTfEx91OTZFzBFAjiTrFIBLG2SaDSyb3cFPryL0pB7Cw1i3TevfwTjN4+LUI1hBLjbQWcm3ZEaNMKAwKyemDsGlfnWfkumVlhUXXjiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(26005)(6506007)(186003)(53546011)(66476007)(4326008)(66946007)(52536014)(7696005)(2906002)(8676002)(55016002)(8936002)(38070700005)(66446008)(64756008)(66556008)(33656002)(5660300002)(110136005)(54906003)(316002)(122000001)(86362001)(76116006)(508600001)(9686003)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFdndXE5TURoRkRsV0Y1aUozZVdLN3VheUswRXhOR2NaNHg1Mktxb1ducmRv?=
 =?utf-8?B?Y3d4MUxzc0I4dVpvZlNGOGhNeTBOaVJVMTMyWkh1Zm45aklteFJUdDBKNGUv?=
 =?utf-8?B?RkJiMjBWNW9nRUlFZGEyWC9LTm13bjBEbXRiV0ZuMUdSVWI0Z3V6RUVUcmFQ?=
 =?utf-8?B?VmQva1krUkZjYUdpWUl6d3NJaHBSOThZUURQQmFnN3pwZ0pLNWdlMjNjK3B3?=
 =?utf-8?B?dFcyYWhDTi9LSU90WHFCM1J3MUpmN0p2ZGZraGl4NkdidlJVYm9TT2pKcGh6?=
 =?utf-8?B?RlRMUHV1QTZSTGcrMjc4L0hGMk55TGVjQ2QvdXM5YXAwazNvRnAzRytEVGM3?=
 =?utf-8?B?V29haFJwWW1zVyt5UzgvMTBPMDVobFhKNkc2aCthR2R3L1dpeTBpbXA4SFdD?=
 =?utf-8?B?Z3NicUgraDU3T2UvWGFXQitwWHpiakJXYUM2b3ZDSGhCLzdqRnAzZ2d5NGc2?=
 =?utf-8?B?bUVubFd2U0g1T1FhUkRJYzR4ZS93aG9WT0JhQXpvSXhQMFQvdHhiSTBKWXVx?=
 =?utf-8?B?aU5IYVhMR01aSW40TklVaXFZRGphMjhOa2hOcTkvTFY3bmxzMEN4T3l4K3ll?=
 =?utf-8?B?d0Z0TytQTGd0WEptMkxITHFiQWFJbnR0aDVqQVBrQUMzSjRUeld5d2ZwWVJ3?=
 =?utf-8?B?YlRTdXlvU1dNYUQ3Mko5YzRBVEgxb2N2WkhZWS9LU0NvZG9xaVJYTkVoRWRB?=
 =?utf-8?B?TWNrbTBISUVNL1dIL3dHdlpqbHhYeWtLc25YQ0w5SHNzVllJNk02TjA2MUVs?=
 =?utf-8?B?bFR5Rko2dWE2WXFNK0djTWlMUGpJaTFrUnRKRmFNMm0wRFZsR3lyZlZMK3U2?=
 =?utf-8?B?RkNxTnliWVFGVllBaGVabnFObC9HSXVKSThqSE5FWlJXaW1GdWZqS2hSTEgx?=
 =?utf-8?B?U2FwUVlhelg2RmdrSmh0anVCaWc2dzZXQnIvQnBvSnN2K1ZaOTdhN1puUjFC?=
 =?utf-8?B?aG0wR1RKKzlDKy92RVVUWFJRSVhRZnE1UHpUZHltK2dwV0xUaDVVcXdXNFFQ?=
 =?utf-8?B?dHhCbERiWkRhUDMwc0tBTGxKL00xK1A0Rkc5OHoweE92emZhMGVrRVpxRzZo?=
 =?utf-8?B?M29tdTBOeEJBQ2JKdW5EY05QejBYblJYcDhta3dGTGNLTjhIUDVyWmx0SVhj?=
 =?utf-8?B?UUZ4eUdpUVp3WGtlYlFqUnNaT2pjQXRvcUJ0WHhPYThZV2lzM21BK1hvZENS?=
 =?utf-8?B?bGZDOXJkSWlVKzF4cDE0bmU2Y3o3aFZSTmhsTkFvZ3hVdzRMWVlWUGtnTnpZ?=
 =?utf-8?B?Q2w5T2RuVGFHN3l3aEE2WS9CRVpaTHFyMVNVeERlbklpWFd6Vzd1YlRNWlVj?=
 =?utf-8?B?QWhvd3djcHJiWGZLR1VjSHhad281VDRQdUs2TGJ2L3NHUlduazg0NGZHNG1r?=
 =?utf-8?B?ZGg5d24zT2lNa1dXZ1I4QURaOUkwenA3SnphMkNra3A4bzI0SEFaNUQ4eEdz?=
 =?utf-8?B?ZVRCTFBQRUJ1a0pNNnVyVHZJaVhRU085Nm9XVzFwYytoN0Z2aHB0b2h1dURS?=
 =?utf-8?B?TlpjSXBHaE51T0ZhNk1FMnZWUXErTFcyQklXTUVETDlpZ2JycjVYWldFV2la?=
 =?utf-8?B?b3ZtN0ZZVUtISkRNL3ZkdTkxRnRRelp4OEZudjlVdVNZTWtZZ0U1MVlteURj?=
 =?utf-8?B?aDdWNWdEMTNWaENWTnZRNVdsbjEwZEJzR0pRT0d6UGJuaWI5UGdzSmJNWEFw?=
 =?utf-8?B?enY5YWlqL1F1UmtSdDFlalJ1YlpGYVRweGpMOXhlYUJScVlRMUU4MDBmcmJ6?=
 =?utf-8?B?dXhHaEY5R0VrNEFRaHBRdnpldDYyOGRXU3p1aW1UUXgzWG10RSt6TG1IbXlh?=
 =?utf-8?B?emJFeTJrZ1lIcjZBZHFuNklEanlQOUFBWTNyTnd6bThHaGt4OXRQQVZqaktX?=
 =?utf-8?B?UnQ3OVlOWEVOWStiNHlTTUFpUHBubjdoTEtOektiVnVsYXR0MEhaNUJESjhw?=
 =?utf-8?B?V3k4OVlRc280YkxDSjhPL0lZcHVPMFB4bkh2OEdMcDF5TkJlRnZYdjZYbEVq?=
 =?utf-8?B?VHJsOGowZXlxWkMxelZvRFdObHA3ZDhWVXZqendBOXpBeUJraU92clJ0eUJq?=
 =?utf-8?B?RVIwdnM0MWNTT0kzbFVvSHNTQnR6aVpuMHFQU3czck4xQ3JjSnZNQ00rcWtG?=
 =?utf-8?B?R2xOTUZxYnJHZFFaTTc2cUFTYTRzczEwd2pkei9DSnowcnQwRDJMWnNXdFJO?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfa60c0-1638-4dbe-0410-08d9ad770242
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 05:14:49.8676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kBtubP4Sb6YPJNQ/iqZgzKmjN20UPmj6obfu5PMTi5n3OPgTArWH/EQG88Ks3ebVKvsaJfdlO+uHz3tcVoaWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3112
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gDQo+IE9uIDExLzE4LzIxIDU6
MTggQU0sIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IE9uIFRodSwg
Tm92IDE4LCAyMDIxIGF0IDA1OjIzOjUyUE0gKzA4MDAsIFh1IFlhbmcgd3JvdGU6DQo+ID4+IEBA
IC02NDI4LDYgKzY0MzIsOSBAQCB2b2lkIHRjcG1fdW5yZWdpc3Rlcl9wb3J0KHN0cnVjdCB0Y3Bt
X3BvcnQNCj4gKnBvcnQpDQo+ID4+ICAgew0KPiA+PiAgICAgIGludCBpOw0KPiA+DQo+ID4gWW91
IG5lZWQgdG8gdGFrZSB0aGUgcG9ydCBsb2NrIGhlcmUsIG5vPw0KPiA+DQo+ID4gICAgICAgICAg
bXV0ZXhfbG9jaygmcG9ydC0+bG9jayk7DQo+ID4NCj4gPj4gKyAgICBrdGhyZWFkX2Rlc3Ryb3lf
d29ya2VyKHBvcnQtPndxKTsNCj4gPj4gKyAgICBwb3J0LT53cSA9IE5VTEw7DQo+ID4NCj4gPiAg
ICAgICAgICBtdXRleF91bmxvY2soJnBvcnQtPmxvY2spOw0KPiA+DQo+IA0KPiBJIGRvbid0IHRo
aW5rIHRoZSB0aW1lciBjb2RlIHJ1bnMgdW5kZXIgdGhlIGxvY2ssIHNvIHRoYXQgd29uJ3QgaGVs
cC4NCj4gQnV0LCB5ZXMsIHRoZSBjb2RlIGlzIGluaGVyZW50bHkgcmFjeS4gQXQgdGhlIHZlcnkg
bGVhc3QsIHBvcnQtPndxDQo+IHdvdWxkIGhhdmUgdG8gYmUgc2V0IHRvIE5VTEwgZmlyc3QsIGJ1
dCBldmVuIHRoYXQgd291bGQgaGF2ZSB0byBiZQ0KPiBzeW5jaHJvbml6ZWQuIEkgd29uZGVyIGhv
dyBvdGhlciBkcml2ZXJzIGhhbmRsZSB0aGF0IHNpdHVhdGlvbi4NCj4gDQo+IEd1ZW50ZXINCj4g
DQoNCkFjdHVhbGx5LCB0aGUgcmFjZSBpcyB1bmxpa2VseSB0byBoYXBwZW4gaWYgdGhlIGhydGlt
ZXIncyBleHBpcmUgdGltZSBpcyBhDQpsaXR0bGUgYmlnZ2VyLiBCdXQgaXQncyBiZXR0ZXIgdG8g
YXZvaWQgdGhpcyBzaXR1YXRpb24gZnJvbSBoYXBwZW5pbmcuIFNvIGl0DQptYXkgYmUgbmVjZXNz
YXJ5IHRvIHVzZSBhIGZsYWcgdG8gaW5kaWNhdGUgdG8gdGhlIGhydGltZXIgdGhlIHBvcnQgaXMg
Z29pbmcNCnRvIGJlIHVucmVnaXN0ZXJlZCBhbmQgaXQncyBubyBuZWVkIHRvIHF1ZXVlIHdvcmsg
YW55bW9yZS4NCg0KVGhlIHBhdGNoIG1heWJlIGxpa2UgZm9sbG93aW5nOg0KDQpzdHJ1Y3QgdGNw
bV9wb3J0ICAqdGNwbV9yZWdpc3Rlcl9wb3J0KC4uLikNCnsNCgkuLi4NCglwb3J0LT5yZWdpc3Rl
cmVkID0gdHJ1ZTsNCglyZXR1cm47DQp9DQoNCnN0YXRpYyBlbnVtIGhydGltZXJfcmVzdGFydCAg
c3RhdGVfbWFjaGluZV90aW1lcl9oYW5kbGVyKHRpbWVyKQ0Kew0KCWlmIChwb3J0LT5yZWdpc3Rl
cmVkKQ0KCQlrdGhyZWFkX3F1ZXVlX3dvcmsocG9ydC0+d3EsIHdvcmspOw0KCXJldHVybiBIUlRJ
TUVSX05PUkVTVEFSVDsNCn0NCg0Kdm9pZCB0Y3BtX3VucmVnaXN0ZXJfcG9ydChwb3J0KQ0Kew0K
CXBvcnQtPnJlZ2lzdGVyZWQgPSBmYWxzZTsNCglrdGhyZWFkX2Rlc3Ryb3lfd29ya2VyKHBvcnQt
PndxKTsNCg0KCWhydGltZXJfY2FuY2VsKCZ0aW1lcik7DQoJLi4uDQp9DQoNCldoYXQgYWJvdXQg
dGhpcyBpZGVhPyBPciBJIHdpbGwgc3VibWl0IGl0IGFzIHBhdGNoIFYyLg0KDQpYdSBZYW5nDQo=

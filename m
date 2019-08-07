Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30768457B
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 09:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfHGHP0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 03:15:26 -0400
Received: from mail-eopbgr150057.outbound.protection.outlook.com ([40.107.15.57]:28901
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727179AbfHGHPZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 03:15:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGMG1vH3CCEjFvBOylN4r/3ncev5xqRW1WJlW9L+dLLCULnCxByM2JF+LuBuve3Znhm52vWsRGgstJnHQzBIm8MB0BqGCd3Ak7IQ2YSJsvFdKg0y5VEcOL4RNX7JP43mGdECUcOACiEfPAQGFLo2AYIHtvm8aVzI+SAQchmQKiygXZ5mGmwWKloi/eeSzKIGlpCFZbdvLwl5kwep6KQqiO+yvEHdCOYxyiJ8EcEzkpto+Wt8enHsFH5vP4fHXQLjziH781DU1q+ivdbzrYf3AERqYccAnzRfUer8MvHSAAADpcSpcwi9EVmikxCJ3UPgIsVfZTGufDn8CWmvRTKP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3wbTadqHRKGFRJMipbuDTUKKXAUXSFIJCJmWOrwQM4=;
 b=BSrDR8DfTTJ4s1nwO602M2BueBqHbN2fUdk6WCe62k6FZ0kl31opERHs7gqohfaQKOw8ygg5t+bYtnkv6DiBWNTzTtiu8ehNxH0jGSaQP3ivaahod0Nt3Vs1W3CRKBQDp+m04Vs5v4qMi/KfaNp8o1v3tIYm+QglWg1gDk9mibNvktFFeMA6GLBIEVz1ndW5dImgMo/NVUMUkOhz2HB2GWp73KuB+ZsnqU6ZBswaXBF1qvoZIkXCItFz0gMJHIcl9UeDK7OTqoizfRxvDpFn9rkjHii1fo2K26pmFTAyCc0C+YjLT33sFg6Zoyk/HGB0yE6a3RArItHlOfgE2tv9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3wbTadqHRKGFRJMipbuDTUKKXAUXSFIJCJmWOrwQM4=;
 b=TYlkrjCJGB7/TRs/c//U+AXv1o/9NVYDcmCkNnuN2GD4PUziowdxej5ZDW0xuUf66PzmckVa1GSpPuVNmy61xbIg0bMewT7qSn6SkAEGJ4ou6ekq1HMVLit36w24auBjJMVj6py6Dakbf9LxCN+XJzTcO1qyjJYb3/GEJqBBjz4=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.233.225) by
 VE1PR04MB6480.eurprd04.prod.outlook.com (20.179.233.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 7 Aug 2019 07:15:20 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::6025:6518:3420:7317]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::6025:6518:3420:7317%7]) with mapi id 15.20.2115.005; Wed, 7 Aug 2019
 07:15:20 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>, Peter Chen <hzpeterchen@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 2/5] usb: chipidea: add role switch class support
Thread-Topic: [PATCH 2/5] usb: chipidea: add role switch class support
Thread-Index: AQHVMXEBpzW67j5jnEyJURF9gaNQo6bnyc4AgAQsJ/CAAB8lAIAAGnMQgAACBICAAAQTsIABvxEAgAACXrCAATkeAIAAS5Fw
Date:   Wed, 7 Aug 2019 07:15:20 +0000
Message-ID: <VE1PR04MB6528F61D886C8375D506594189D40@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20190703071953.38082-1-jun.li@nxp.com>
 <20190703071953.38082-2-jun.li@nxp.com>
 <CAL411-oHEbC6Lkr-X=GBKbHhRfuoQsfMVnUKtUjC1c8wrf-k+Q@mail.gmail.com>
 <VE1PR04MB6528DEA1B84E9B85A8594E5089DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <CAL411-o8pO=HQwRrgibpRsrfCBD0bqWaCM5imxtCVKTCdwa=ew@mail.gmail.com>
 <VE1PR04MB652883E67829A33509B02E0E89DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <VI1PR04MB53278DE4140B5B9FA7BDB2D08BDA0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <VE1PR04MB65283BA3C45143002905E6FD89DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <VI1PR04MB532730BFF128E0A4F9868A9F8BD50@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <VE1PR04MB652857AAEA39148AF5C5D6BF89D50@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <VI1PR04MB532767330394C22161200D0B8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB532767330394C22161200D0B8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6d4569e-0e16-457c-c7fd-08d71b07020d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6480;
x-ms-traffictypediagnostic: VE1PR04MB6480:
x-microsoft-antispam-prvs: <VE1PR04MB6480311529887A329A68795B89D40@VE1PR04MB6480.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(189003)(199004)(13464003)(68736007)(81156014)(81166006)(8676002)(8936002)(99286004)(110136005)(3846002)(14454004)(71190400001)(71200400001)(54906003)(7696005)(52536014)(256004)(316002)(5660300002)(2906002)(6116002)(74316002)(305945005)(14444005)(102836004)(53546011)(6506007)(33656002)(76116006)(66946007)(66446008)(66476007)(66556008)(76176011)(64756008)(4326008)(478600001)(86362001)(476003)(486006)(11346002)(55016002)(26005)(44832011)(186003)(7736002)(53936002)(9686003)(6246003)(25786009)(66066001)(229853002)(446003)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6480;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8CIqi+5OXHyONGJLCMqRYSPB+gtacahWZL/AG271lbyB4uRACKELN7f+wNl2fE0VoOUSzZuVdJfwl4U9jgi0JDbWKbTpphPL8881qSlQYdDIZh8KAjQZutu5EyGrmokTtT3SkPSRVU1pLU6yzOUSWxjs7s8+2OhFDf0eVnwJc5aNnhyPHADtuA7tqY8l9BB7rai8JLNSuefv62vEswqjFC4xsAGM+iu4aNXqO9UfewPAGd/tiVVIzXQAjZrzTEzHyuCo/scRbBS03+1Qbp+aVwRh7b2BC+irWzfoSpQ127OPc1jtLv+BH5yzo2Yk9U4uAyceoj56H6jBmr08yXs3HDgkr7y/LHUJdGwZRmsQWA+8jASeOyxrXeZzI0RC1/Fr4HEj2oJCTBmRmRtY1vepR5Q0beWy9P+a+bxlRbwzj70=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d4569e-0e16-457c-c7fd-08d71b07020d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 07:15:20.7424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jun.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgQ2hlbg0KPiBT
ZW50OiAyMDE55bm0OOaciDfml6UgMTA6NDENCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+
OyBQZXRlciBDaGVuIDxoenBldGVyY2hlbkBnbWFpbC5jb20+DQo+IENjOiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgZGwtbGludXgtaW14DQo+IDxsaW51
eC1pbXhAbnhwLmNvbT47IFVTQiBsaXN0IDxsaW51eC11c2JAdmdlci5rZXJuZWwub3JnPg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIIDIvNV0gdXNiOiBjaGlwaWRlYTogYWRkIHJvbGUgc3dpdGNoIGNs
YXNzIHN1cHBvcnQNCj4gDQo+IA0KPiANCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gWW91IG1heSB1c2UgY29ubmVjdCBiaXQgYXQgcG9ydHNjIHNpbmNlIFZCVVMgbWF5IG5vdCBj
b25uZWN0IHRvIFNvQy4NCj4gPiA+ID4NCj4gPiA+ID4gQnkgdGhpcyB3YXksIGRpc2Nvbm5lY3Qg
Y2FuIGJlIGRlY2lkZWQgYnV0IGNvbm5lY3QgaXMgYSBwcm9ibGVtIGluDQo+ID4gPiA+IGN1cnJl
bnQgZHJpdmVyLCBhcyBjb250cm9sbGVyIHdhcyBzdG9wcGVkIGluIGxvdyBwb3dlciBtb2RlIHNv
DQo+ID4gPiA+IGNhbid0IGRldGVjdCBjb25uZWN0aW9uIGZyb20gaG9zdCwgdW5sZXNzIHdlIGFs
c28gdXBkYXRlIHRoaXMgYmVoYXZpb3IgdG9vLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEZvciBj
b25uZWN0aW9uLCBpZiBjdXJyZW50IHJvbGUgaXMgVVNCX1JPTEVfTk9ORSwgeW91IG1heSBzdGFy
dCBkZXZpY2UgbW9kZS4NCj4gPg0KPiA+IFRoaXMgaXMgYXNzdW1pbmcgc2V0IHJvbGUgb25seSBj
YW4gYmUgY2FsbGVkIG9uZSB0aW1lIGJldHdlZW4NCj4gPiBkaXNjb25uZWN0IGFuZCBjb25uZWN0
IHRvIGhvc3QsIHRoaXMgbWF5IG5vdCBhbHdheXMgdHJ1ZSwgYnV0IHRoaXMgY2FuDQo+ID4gYmUg
cmVzb2x2ZWQsIEkgdGhpbmsgd2UgbmVlZCBoYW5kbGUgdGhlIGNhc2UgZGV2aWNlIG1vZGUgaXMg
c3RhcnRlZA0KPiA+IGJ1dCBjb25uZWN0aW9uIGRvZXMgbm90IGhhcHBlbiwgc28gdGhlIGdhZGdl
dCBuZWVkIGJlIHN0b3BwZWQgYW5kDQo+ID4gZW50ZXIgbG93IHBvd2VyIG1vZGUgYWdhaW4sIGlm
IHRoaXMgYXBwcm9hY2ggaXMgT0sgdG8geW91LCBJIHdpbGwgZ28gaW4gdGhpcyBkaXJlY3Rpb24g
Zm9yIG15DQo+IHYyLg0KPiA+DQo+IA0KPiBBZnRlciB0aGlua2luZyBtb3JlLCBJIHRoaW5rIFR5
cGUtQyB0Y3BtIGNvZGUgc2hvdWxkIHNldCB1c2Jfcm9sZSBjb3JyZWN0bHksIGl0IGtub3dzDQo+
IHBoeXNpY2FsIGNvbm5lY3Rpb24gc3RhdHVzIHdlbGwsICBhbmQgdGhlcmUgYXJlIGFscmVhZHkg
VVNCX1JPTEVfTk9ORSByZWZlcmVuY2VzIGF0DQo+IHRjcG0gbm93LiBEZXBlbmRpbmcgb24gVVNC
IGRldmljZSBkcml2ZXIgd29ya2Fyb3VuZCB0byBrbm93IFVTQl9ST0xFX05PTkUgaXMNCj4gbm90
IGEgZ29vZCBzb2x1dGlvbi4gTG9vayBhdCBhbm90aGVyIFVTQiByb2xlIGRyaXZlciwgaW50ZWwt
eGhjaS11c2Itcm9sZS1zd2l0Y2guYywgaXQgY291bGQNCj4gYWxzbyBnZXQgVVNCX1JPTEVfTk9O
RSBzdGF0ZS4NCg0KU29ycnksIEkgcmUtY2hlY2tlZCB0aGUgbGF0ZXN0IHRjcG0gY29kZSBmb3Vu
ZCB0aGVyZSBpcyBhbHJlYWR5DQpVU0JfUk9MRV9OT05FIHNldHRpbmcgZm9yIG5vdCBkaXNjb25u
ZWN0LCBzbyB3ZSBhcmUgZmluZSB0bw0KaGFuZGxlIGl0IGluIHVzYiBjb250cm9sbGVyIGRyaXZl
ciwgd2lsbCBwb3N0IHYyIGZvciB0aGlzIHNvb24uDQoNCkxpIEp1bg0KPiANCj4gUGV0ZXINCg==

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 745E684296
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 04:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfHGClC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 22:41:02 -0400
Received: from mail-eopbgr20079.outbound.protection.outlook.com ([40.107.2.79]:24622
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726485AbfHGClA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 22:41:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCIJxRkSyQTUi4ZOms8jJz+xRWbwO9UpfVLjHewiUa4GbkdSNhTx+hoGac6CTT0jyQNxxqI2NNtyzPXa32omjqWkPe2CPV2VrV6EUqLdntZOb99WXSEf2WcapCGc4tCbog2Oo45uvDiY8yfU2H73nzKL4aoznHVWFVWkLLbuWqix5vjNCTyaBAG1aOgwG3CYfADyXfF0Cxz59FNuzMVBM5eXDTY1so14R/CsAH+cjGloSfdCRxJhnFDsFU9kYFUeGyadaFll8VakXYVesz1WNm2+kYqEKIh8a/PeWHbzGHMuNGRSAtEfJj5nNwgLRW5F+s/nCo9huMRUYMM555KDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYwHllxPsyjdgcQIAwTpBPrtyfQHEmXccPMhk49S9bI=;
 b=H0M5OiQWZcXAX9odhyaml9Lw812lIaJo19h542MfJ+ZhGyO7bvTec0WUNxLyXVuDxra74xtSeb9Grm1hETEWTV/xodfKIJckdm3afrqn3VKY0KIg3LcB2PbumyNK6IwsqRg0dusEExhxdVMcknbX5qlrkjnhyoBp9Pk0OvrxHi3CO9v+AKFfx9B50pPv/D0QP82mOgRlS2unnR/n/QBRWOcVeitt+rKuu+ntpia7GQ402Tgv8X1lOzGdpulVJCrOBGyeOMBZeK7x6xllRvY9n1mSvP49PbOKdiOIDBwl5xiY+z5FoUUE7lENyEng9Fg2q5yE3P7ifc9ZfzPkdUuuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYwHllxPsyjdgcQIAwTpBPrtyfQHEmXccPMhk49S9bI=;
 b=VJosH93luBhxztj27NeUkUuReZGwliL9FmUj3LvAGps432NvJVpsZ/Znaa8UajXJNLzUb8Qe7GcCs6P8kYfCDVaxUjwzAhuenkmkEpEHgCJPlm4baTXoPSpTGPbynCkTd+6Gr92W1qvscSOlBp1JBuSlZkEudsw41X7LJ9X11rk=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3968.eurprd04.prod.outlook.com (10.171.182.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Wed, 7 Aug 2019 02:40:56 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::81ec:c8ec:54d9:5dc5%2]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:40:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>, Peter Chen <hzpeterchen@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 2/5] usb: chipidea: add role switch class support
Thread-Topic: [PATCH 2/5] usb: chipidea: add role switch class support
Thread-Index: AQHVMXD63ofLbyO1A0Gt2RRar4sPYqbnyc8AgARBCACAAApDAIAAGsaAgAABd8CAADmKAIABiW1AgAAaB4CAAR3kcA==
Date:   Wed, 7 Aug 2019 02:40:56 +0000
Message-ID: <VI1PR04MB532767330394C22161200D0B8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
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
In-Reply-To: <VE1PR04MB652857AAEA39148AF5C5D6BF89D50@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28fd37c7-8f72-4a74-4b03-08d71ae0ac71
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3968;
x-ms-traffictypediagnostic: VI1PR04MB3968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB3968C842B22B682581ABF5B98BD40@VI1PR04MB3968.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(199004)(189003)(5660300002)(74316002)(81166006)(478600001)(81156014)(25786009)(26005)(256004)(102836004)(186003)(33656002)(14444005)(71200400001)(71190400001)(7696005)(86362001)(6506007)(8936002)(14454004)(99286004)(8676002)(4326008)(7736002)(305945005)(76176011)(52536014)(44832011)(486006)(11346002)(68736007)(446003)(54906003)(6436002)(66066001)(66946007)(66446008)(53936002)(229853002)(2906002)(6116002)(66556008)(64756008)(55016002)(6246003)(316002)(110136005)(3846002)(9686003)(76116006)(476003)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3968;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iyHwFTjuH01ma3bDpkW/E9+ru5gy6cwQ5iXm6cpcxwfG+dBnZ08YKVPMtq17INCR/2a1Jyqti+8yjVX5o7DpCPPqvB7O2eq2XZdMajwdCsv4CSGc7zyoBwAKUNW2g+aJpc1Y+S2tHb7Cs3bpB0zUpBSuW8y7RMIkD1eJb2XAcoQF2P9AeoYvmcC6IFO6wO4owrC5/EJidP69zaf81uYzcvII3ixKL2OmdTGoKclvSj13by2ZD7RJiy2ao7CMUbgvXCrkiYAVEAS7hvjlDmFJuSb5sx3cLsOHuuGwZveRw3JE/hM7T/QbDrhEhKaoHGCMfttwdOseCr+1Ohp55IdZ2OYjKu8RzStrMjkMyQDaZGVUaB4/Sw0cExkm0rPqfRISo4DGSShSb9dZIywbx1eya1kZDroijXcDy36IhzpsuRg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fd37c7-8f72-4a74-4b03-08d71ae0ac71
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:40:56.2597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3968
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQogDQo+ID4NCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiBZb3UgbWF5IHVzZSBjb25uZWN0IGJpdCBh
dCBwb3J0c2Mgc2luY2UgVkJVUyBtYXkgbm90IGNvbm5lY3QgdG8gU29DLg0KPiA+ID4NCj4gPiA+
IEJ5IHRoaXMgd2F5LCBkaXNjb25uZWN0IGNhbiBiZSBkZWNpZGVkIGJ1dCBjb25uZWN0IGlzIGEg
cHJvYmxlbSBpbg0KPiA+ID4gY3VycmVudCBkcml2ZXIsIGFzIGNvbnRyb2xsZXIgd2FzIHN0b3Bw
ZWQgaW4gbG93IHBvd2VyIG1vZGUgc28gY2FuJ3QNCj4gPiA+IGRldGVjdCBjb25uZWN0aW9uIGZy
b20gaG9zdCwgdW5sZXNzIHdlIGFsc28gdXBkYXRlIHRoaXMgYmVoYXZpb3IgdG9vLg0KPiA+ID4N
Cj4gPg0KPiA+IEZvciBjb25uZWN0aW9uLCBpZiBjdXJyZW50IHJvbGUgaXMgVVNCX1JPTEVfTk9O
RSwgeW91IG1heSBzdGFydCBkZXZpY2UgbW9kZS4NCj4gDQo+IFRoaXMgaXMgYXNzdW1pbmcgc2V0
IHJvbGUgb25seSBjYW4gYmUgY2FsbGVkIG9uZSB0aW1lIGJldHdlZW4gZGlzY29ubmVjdCBhbmQN
Cj4gY29ubmVjdCB0byBob3N0LCB0aGlzIG1heSBub3QgYWx3YXlzIHRydWUsIGJ1dCB0aGlzIGNh
biBiZSByZXNvbHZlZCwgSSB0aGluayB3ZSBuZWVkDQo+IGhhbmRsZSB0aGUgY2FzZSBkZXZpY2Ug
bW9kZSBpcyBzdGFydGVkIGJ1dCBjb25uZWN0aW9uIGRvZXMgbm90IGhhcHBlbiwgc28gdGhlDQo+
IGdhZGdldCBuZWVkIGJlIHN0b3BwZWQgYW5kIGVudGVyIGxvdyBwb3dlciBtb2RlIGFnYWluLCBp
ZiB0aGlzIGFwcHJvYWNoIGlzIE9LIHRvDQo+IHlvdSwgSSB3aWxsIGdvIGluIHRoaXMgZGlyZWN0
aW9uIGZvciBteSB2Mi4NCj4gDQogDQpBZnRlciB0aGlua2luZyBtb3JlLCBJIHRoaW5rIFR5cGUt
QyB0Y3BtIGNvZGUgc2hvdWxkIHNldCB1c2Jfcm9sZSBjb3JyZWN0bHksIGl0DQprbm93cyBwaHlz
aWNhbCBjb25uZWN0aW9uIHN0YXR1cyB3ZWxsLCAgYW5kIHRoZXJlIGFyZSBhbHJlYWR5IFVTQl9S
T0xFX05PTkUNCnJlZmVyZW5jZXMgYXQgdGNwbSBub3cuIERlcGVuZGluZyBvbiBVU0IgZGV2aWNl
IGRyaXZlciB3b3JrYXJvdW5kIHRvIGtub3cgVVNCX1JPTEVfTk9ORQ0KaXMgbm90IGEgZ29vZCBz
b2x1dGlvbi4gTG9vayBhdCBhbm90aGVyIFVTQiByb2xlIGRyaXZlciwgaW50ZWwteGhjaS11c2It
cm9sZS1zd2l0Y2guYywNCml0IGNvdWxkIGFsc28gZ2V0IFVTQl9ST0xFX05PTkUgc3RhdGUuDQoN
ClBldGVyDQo=

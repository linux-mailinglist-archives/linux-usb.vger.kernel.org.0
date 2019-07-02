Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0445C70A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 04:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfGBCTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 22:19:04 -0400
Received: from mail-eopbgr10063.outbound.protection.outlook.com ([40.107.1.63]:62430
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726434AbfGBCTE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 22:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUcp4hKOByEWSwYB/B/ESJ1Q/mTU4oVh2KAQzeuwoa0=;
 b=AHDHJF75O2xFqTk9D1k8uRHFKoxFOqtgh4VH/VRXIEBY9rE5WkZlInpIy74Iy33M7mBjdBW5I6KmSVdtutilzRAuT1+YSoXT/G0JjIXvNSmbt1wXd5Ny52Upv2EXrDckTP8vAAJ9AIGrX3WxI9f337Y1CWrEF3W8JT9jlK2lvrs=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5519.eurprd04.prod.outlook.com (20.178.122.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 02:18:59 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 02:18:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PAABPEL0AAkgO9A
Date:   Tue, 2 Jul 2019 02:18:59 +0000
Message-ID: <VI1PR04MB532799F3F92BCBD8616B51868BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
 <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com>
 <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
 <AM0PR02MB38419422D499F45C8475A000C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <AM0PR02MB38415FA372C7A8B8B7BAFF22C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <VI1PR04MB5327BA15817CA04C5ACC4A8C8BF90@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <AM0PR02MB3841CFA0BC4FC084D8517E00C5F90@AM0PR02MB3841.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB3841CFA0BC4FC084D8517E00C5F90@AM0PR02MB3841.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8200b376-6afb-4413-8f18-08d6fe93a479
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5519;
x-ms-traffictypediagnostic: VI1PR04MB5519:
x-microsoft-antispam-prvs: <VI1PR04MB5519496781CF3372F3E3DCDF8BF80@VI1PR04MB5519.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(199004)(189003)(54906003)(316002)(55016002)(86362001)(5660300002)(71200400001)(71190400001)(256004)(44832011)(14444005)(5024004)(6116002)(6916009)(68736007)(229853002)(305945005)(3846002)(7736002)(99286004)(66946007)(11346002)(66476007)(73956011)(52536014)(76116006)(66446008)(64756008)(33656002)(81166006)(8936002)(66556008)(478600001)(81156014)(8676002)(486006)(2906002)(74316002)(186003)(102836004)(446003)(6506007)(76176011)(66066001)(53936002)(476003)(7696005)(6246003)(6436002)(14454004)(26005)(4326008)(9686003)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5519;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /iX2rLZr3g1nUlwxbmvGDpppuGZEvUTJEYJNz7MG0/Mo08BncOEITIcrR/3G4FO2BFwuKWhgLPwpTbTX2F6tT6P8/dnG3n6jYp6C8wzl070+eyOrvIp1MJM2XjZJhkfclWM49HhMT5EXVykrY1C2E+JKgthWnp4XLzsG454eq0H9pi1We8sKxtT48rBjLi0xiwMtiFTTspF+hif9y4pZbV8MJJLmAtnImjEMk5UVND9qaPmVTP4kOvr0rriaM0Eeln0EEAkKd5boi3L8O+tbn6qdtMHni0JRqZ+p+myNYjtNWLhL39Xj7qOUMTgbU5Z81oBAwYHrJAZmfOwhqGid1qLhLaNKL44nP89gmG888n1IAk2yrrigjJAQig5zXps6gFWjp6FzDe59PCak7NF/pppKg/Kny21GsyiNKq6wn+k=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8200b376-6afb-4413-8f18-08d6fe93a479
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 02:18:59.1392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5519
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiBQZXRlciBDaGVuIHdyaXRlczoNCj4gPiBUaGF0J3MgdmVyeSBzdHJhbmdlLCB0aGF0IG1l
YW5zIHRoZSBTb0MgZG9lc24ndCBrbm93IFZCVVMgZmFpbHMgZG93biBhZnRlcg0KPiBkZXRhY2hp
bmcgZnJvbSB0aGUgaG9zdC4NCj4gPiBZb3UgY291bGQgbWVhc3VyZSB0aGUgVkJVUyB2YWx1ZSBh
dCB0aGUgYm9hcmQsIHRoZW4gcmVhZCB0aGUgVkJVUyB2YWx1ZSBhdA0KPiByZWdpc3RlciB0byBj
b25maXJtIGl0Lg0KPiANCj4gSSBoYXZlIHB1dCBhIHNjb3BlIG9uIFZCVVMuIFdpdGgga2VybmVs
IDQuOSBhZnRlciBkZXRhY2hpbmcsIGl0IGRpc2NoYXJnZXMgYWxsIHRoZQ0KPiB3YXkgZG93biB0
byBhYm91dCA1MDAgbVYsIHdpdGggNC4xOSB0aGlzIGRpc2NoYXJnaW5nIHN0b3BzIGFmdGVyIGFi
b3V0IDQgc2Vjb25kcw0KPiBhdCBhYm91dCAyLjRWIGFuZCByZW1haW5zIHRoZXJlLg0KPiANCg0K
SSBzdXNwZWN0IGl0IGlzIG5vdCByZWxhdGVkIHRvIFVTQiwgd291bGQgeW91IHBsZWFzZSBkaXNh
YmxlIFVTQiBub2RlIGF0IERUUyB0bw0KbWVhc3VyZSBhZ2Fpbj8NCg0KPiA+IEkganVzdCB0cmll
ZCBteSBib2FyZCAoaW14NnN4LXNkYiksIGl0IHdvcmtlZCBPSyBhdCBhdCB2NS4yLXJjNS4gSWYN
Cj4gPiB5b3UgaGF2ZSBtZW10b29sICh0aGUgdG9vbCB0byByZWFkIHBoeXNpY2FsIG1lbW9yeSks
IHlvdSBjb3VsZCByZWFkDQo+ID4gcmVnaXN0ZXIgT1RHU0MgYXQgdGhhdCB0aW1lIHVzaW5nIGJl
bG93IGNvbW1hbmQ6DQo+IA0KPiBJdCdzIGFscmVhZHkgcGFydCBvZiAvc3lzL2tlcm5lbC9kZWJ1
Zy9jaV9oZHJjLjAvcmVnaXN0ZXJzLCBidXQgcmVhZGluZyBmcm9tIGl0cw0KPiBtZW1vcnkgYWRk
cmVzcyB3b3JrcyBlcXVhbGx5IHdlbGwuDQo+ID4gMHgwMjE4NDFBNDogIDA5MjQyRjIwDQo+IFl1
cCwgSSBoYXZlIDAyMTg0MWE0OiAwOTI0MGYyMCwgd2hpY2ggb25seSBkaWZmZXJzIGJ5IFRPR18x
TVMuDQo+IA0KPiA+ICMgY2FibGUgZGV0YWNoDQo+ID4gMHgwMjE4NDFBNDogIDA5MzQxMTIwDQo+
IDAyMTg0MWE0OiAwOTM0MGQyMA0KPiBXaXRoIEJTViByZWZsZWN0aW5nIHRoZSBzdG9wcGVkIGRp
c2NoYXJnZS4NCj4gDQo+ID4gWW91IGNvdWxkIHBvbGwgdGhlIC9zeXMvY2xhc3MvdWRjL2NpX2hk
cmMuMC9zdGF0ZSB0byBrbm93IHRoZSBjb25uZWN0aW9uLg0KPiA+DQo+ID4gcm9vdEBpbXg2cXBk
bHNvbG94On4jIFsgIDIzMC4wNzQ4NTBdIGNvbmZpZ2ZzLWdhZGdldCBnYWRnZXQ6DQo+ID4gaGln
aC1zcGVlZCBjb25maWcgIzE6IGMNCj4gPg0KPiA+IHJvb3RAaW14NnFwZGxzb2xveDp+IyBjYXQg
L3N5cy9jbGFzcy91ZGMvY2lfaGRyYy4wL3N0YXRlICA8PT09IGNhYmxlDQo+ID4gYXR0YWNoZWQg
Y29uZmlndXJlZCByb290QGlteDZxcGRsc29sb3g6fiMgY2F0DQo+ID4gL3N5cy9jbGFzcy91ZGMv
Y2lfaGRyYy4wL3N0YXRlICA8PT09IGNhYmxlIGRldGFjaGVkIG5vdCBhdHRhY2hlZA0KPiANCj4g
R29vZCB0byBrbm93LiBUaGUgbGF0dGVyIHR1cm5zIG91dCBhcyAic3VzcGVuZGVkIiwgdGhvdWdo
Lg0KPiANCg0KWWVzLCB0aGUgYnVzIGlzICJzdXNwZW5kZWQiIGR1ZSB0byB0aGVyZSBpcyBubyBT
b0Ygd2l0aGluIDNtcywgYnV0IHRoZSBkaXNjb25uZWN0aW9uIGlzDQpub3QgZGV0ZWN0ZWQgZHVl
IHRvIFZCVVMgaXMgc3RpbGwgaGlnaGVyIHRoYW4gQlNWLg0KDQpQZXRlcg0K

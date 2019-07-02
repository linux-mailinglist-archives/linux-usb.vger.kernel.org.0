Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4AF5CFD8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 14:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfGBM4o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 08:56:44 -0400
Received: from mail-eopbgr20096.outbound.protection.outlook.com ([40.107.2.96]:4263
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726362AbfGBM4o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 08:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix3+oUpwndFcfWl2hZAZ4zrGjOakEyV2DaJUjZ3bOKk=;
 b=IJIf7HCBMiakylTPxy9MbjbDWpRFXdgsiVm/bGdkIF58fUJiAlO5dUV7hPxm7aUwTbtELN1IwdynpDZo6nivbAMd6TJ4dnHP4BCsYwVagz2sgAKNOE44ulYW4X2ZJKPnWbyAfYYOUYFelrho5wc4fwUiU4mTPfny6gd9OC9KFnQ=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB3699.eurprd02.prod.outlook.com (52.134.87.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 12:56:40 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 12:56:40 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PAABPEL0AAkgO9AAAj0V4AAA/2TMAACNVdg
Date:   Tue, 2 Jul 2019 12:56:40 +0000
Message-ID: <AM0PR02MB3841A430DEB6ECEC0CBEE9B6C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
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
 <VI1PR04MB532799F3F92BCBD8616B51868BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <AM0PR02MB38416C39915E57C8855BBDA7C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <VI1PR04MB5327E9F0660A36A52A3E258E8BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5327E9F0660A36A52A3E258E8BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:d913:201d:8092:cfec]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d37edff0-f4c8-48a7-0e1b-08d6feecb9f7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB3699;
x-ms-traffictypediagnostic: AM0PR02MB3699:
x-microsoft-antispam-prvs: <AM0PR02MB369939D104D884CABB6FC7A3C5F80@AM0PR02MB3699.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(346002)(396003)(39830400003)(189003)(199004)(71190400001)(99286004)(71200400001)(25786009)(186003)(6862004)(4326008)(102836004)(6506007)(7696005)(76176011)(46003)(6116002)(54906003)(316002)(476003)(6436002)(11346002)(44832011)(8676002)(14444005)(486006)(446003)(52536014)(55016002)(6246003)(53936002)(9686003)(5660300002)(73956011)(305945005)(256004)(5024004)(76116006)(66556008)(66476007)(66946007)(7736002)(8936002)(81166006)(81156014)(66446008)(64756008)(33656002)(229853002)(2906002)(86362001)(508600001)(68736007)(74316002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB3699;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yusAHhh2SA/GywNYgkRYdrCWDzk349bTdYmyDweGiXQuTmAJ1HKNeN7FDABuHCv8zw6O+IZD/0yrFXo00iBJ+edG+mEK6WQ/eiIv58UGoyd0hU+p5602xklJ7sMsDu0e2gT2lTfQrKYNGVcSmHVeRtVGn12SzEGwQ4xi35+bw1GyGIzMtwnLo69fxJ6kvhx2dCpCnhG6RD4dVOrd6m0/+k6HTyB3pWvsgnynEFO2NehDX5jwwFM/sNUq2ZXFF/Wm/tnpfKhYpvblLshxn+2Z26grK9aFotL49TVp/JKjUS3vUWC4cpTfhiS+Okm9F1BmDUVRknRlvDRrXso0Ep1rnREbS4545GWY36/plWR8SbUNbeTxIeWlQnmOW2KBwAoa3PZknKtdybp5Q/+OhxMQT6p4uZ8nWFKwzGaJfETW1wg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37edff0-f4c8-48a7-0e1b-08d6feecb9f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 12:56:40.2988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3699
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQoNCj4+ID4gSSBzdXNwZWN0IGl0IGlzIG5vdCByZWxhdGVkIHRvIFVTQiwgd291
bGQgeW91IHBsZWFzZSBkaXNhYmxlIFVTQiANCj4+ID4gbm9kZSBhdCBEVFMgdG8NCj4+IG1lYXN1
cmUgYWdhaW4/DQo+PiANCj4+IFdpdGggVVNCIGRpc2FibGVkICgmdXNib3RnMSBhbmQgJnVzYm90
ZzIpLCBWQlVTIGlzIGF2YWlsYWJsZSB3aGVuIEkgDQo+PiBjb25uZWN0IHRvIHRoZSBob3N0IGFu
ZCBwcm9wZXJseSBkaXNjaGFyZ2VkIHdoZW4gSSBkaXNjb25uZWN0Lg0KPj4gSSBhbHNvIHRyaWVk
IHRoZSBPVEcncyBob3N0IG1vZGUgeWVzdGVyZGF5LiBXaGVuIEkgYXR0YWNoIGEgTWljcm8tQiAN
Cj4+IHBsdWcgdG8gQS0gcmVjZXB0YWJsZSBhZGFwdGVyIChhbmQgbm8gYWN0dWFsIGdhZGdldCks
IHRoZSANCj4+IEdQSU8tY29udHJvbGxlZCByZWd1bGF0b3IgaXMgdHVybmVkIG9uIGFuZCBkcml2
ZXMgVkJVUy4gV2hlbiBJIGRldGFjaCANCj4+IGl0IGFuZCB0aGUgYm9hcmQgc3dpdGNoZXMgYmFj
ayB0byBnYWRnZXQsIHRoZSByZWd1bGF0b3IgaXMgdHVybmVkIG9mZiBhbmQgVkJVUyBpcyBwcm9w
ZXJseSBkcmFpbmVkLg0KPj4gDQo+DQo+IFdvdWxkIHlvdSBwbGVhc2UgdHJ5IGRpc2FibGluZyBj
aGFyZ2VyIGRldGVjdGlvbiB0byBzZWUgaWYgaXQgYW55dGhpbmcgY2hhbmdlcz8NCg0KTm8gY2hh
bmdlcy4gSSBoYWQgYWxyZWFkeSByZXZlcnRlZCBmYzViOTIwYzNiOWJiZTliZjA1YWViMWM0OTc2
NDM2MDhlY2I2NTZiIGZvciB0ZXN0aW5nLg0KDQo+IERvIHlvdSBoYXZlIGFueSBjb21wb25lbnRz
IGF0IFZCVVM/DQoNClRoZXJlIHdlcmUgRVNEIHByb3RlY3Rpb24gZGlvZGVzIHRoYXQgY29ubmVj
dGVkIEQrL0QtIHdpdGggVkJVUy4gIFdlIHJlbW92ZWQgdGhvc2UgZnJvbSB0aGUgUENCIGFuZCB0
aGUgcHJvYmxlbSBpcyBnb25lIG1lYW5pbmcgVkJVUyBkaXNjaGFyZ2VzIGFzIGV4cGVjdGVkLCB0
aGUgY29udHJvbGxlciBydW50aW1lLXN1c3BlbmRzIGFuZCB1bHRpbWF0ZWx5IHN5c3RlbWQtbmV0
d29ya2QgcmVwb3J0cyBhIGxvc3QgY2Fycmllci4NClRob3NlIGRpb2RlcyBoYXZlbid0IGJlZW4g
YSBwcm9ibGVtIHdpdGggNC45LCB0aG91Z2guIERpZCBzb21ldGhpbmcgY2hhbmdlIGhlcmU/IEkg
c3VwZXJmaWNpYWxseSBsb29rZWQgYXQgU1JQLCBITlAgYW5kIEFEUCwgYnV0IG5vdGhpbmcgY2F1
Z2h0IG15IGV5ZS4uLg0KDQpDaGVlcnMsDQpLYWkNCg0K

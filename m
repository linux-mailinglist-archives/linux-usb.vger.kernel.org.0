Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E147A5CC08
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 10:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfGBI3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 04:29:45 -0400
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:33041
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726369AbfGBI3p (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 04:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaYv8iF2/vj0XYQBhWLzYfbB3Ow2PRvzziL7uVxrS3c=;
 b=hbsrZeQewPonxT9ELEPy3TbwN2pjVcDja4R/tSkALj0UfLXvPDqePq0VA77gOpi6RSYWZkftcYKkojobJmmFfP2BRQPSAq2jLrEdyHV67yOrUJEAhrntqn1WONn6YH3ORL+QYcos2nTNsvDsADdaTdJKWMvLYV0K+NyCrq6MHkg=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5263.eurprd04.prod.outlook.com (20.177.51.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 08:29:42 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 08:29:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PAABPEL0AAkgO9AAAj0V4AAA/2TMA==
Date:   Tue, 2 Jul 2019 08:29:42 +0000
Message-ID: <VI1PR04MB5327E9F0660A36A52A3E258E8BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
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
In-Reply-To: <AM0PR02MB38416C39915E57C8855BBDA7C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ef9a114-379e-4092-8490-08d6fec76e87
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5263;
x-ms-traffictypediagnostic: VI1PR04MB5263:
x-microsoft-antispam-prvs: <VI1PR04MB52637BEFCF22607E2317F1A78BF80@VI1PR04MB5263.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(199004)(189003)(55016002)(53936002)(99286004)(6436002)(7696005)(71200400001)(14454004)(446003)(86362001)(316002)(186003)(54906003)(11346002)(476003)(6506007)(486006)(6246003)(76176011)(102836004)(9686003)(26005)(256004)(4326008)(25786009)(6916009)(44832011)(14444005)(71190400001)(73956011)(6116002)(76116006)(229853002)(3846002)(5024004)(66476007)(81166006)(66556008)(68736007)(8676002)(74316002)(66446008)(64756008)(7736002)(52536014)(478600001)(66946007)(305945005)(8936002)(33656002)(2906002)(81156014)(5660300002)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5263;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xRbsHG2dIhpQCpeXeY/2bakV+6lkb7U+1mS3d0cojqernq3djxtGRiSEL6xt82A4wtxrwRsH2A4BKpy6OcJEsLx6gkhTVBCiSWrQIJ7ZGUe068IoHDP9rOezMQ7yJ3sowdOJyjKUdpL2hqXwV+zvTXPPkBimZKBu/qMNIa1CDFYbEUhyIxGwg9Fhasgx29/SJd4y2ihgXax6SjGpZJWT9rnOozgkzhQb8Iw8uU/feNTbAFhR8GBAJFQiun9yryIW58PQ3G8uXQXw2LY/GIpIkXledpiqhdWCSQ2FJwI2Bcbrxx34ZkXz09z6FyukEa3jhjsCKoD152wtmDxXsJqQQ7mqyUPZ4tke3QSJXIPBXop1zQCRw8mzA0h3xNpn0oEbHuXbrXKxS695EHdre62Ecj7Hpcwz1XkC2NAb3T7OvWY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef9a114-379e-4092-8490-08d6fec76e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:29:42.4576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5263
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+DQo+ID4gSSBzdXNwZWN0IGl0IGlzIG5vdCByZWxhdGVkIHRvIFVTQiwgd291bGQgeW91
IHBsZWFzZSBkaXNhYmxlIFVTQiBub2RlIGF0IERUUyB0bw0KPiBtZWFzdXJlIGFnYWluPw0KPiAN
Cj4gV2l0aCBVU0IgZGlzYWJsZWQgKCZ1c2JvdGcxIGFuZCAmdXNib3RnMiksIFZCVVMgaXMgYXZh
aWxhYmxlIHdoZW4gSSBjb25uZWN0IHRvDQo+IHRoZSBob3N0IGFuZCBwcm9wZXJseSBkaXNjaGFy
Z2VkIHdoZW4gSSBkaXNjb25uZWN0Lg0KPiBJIGFsc28gdHJpZWQgdGhlIE9URydzIGhvc3QgbW9k
ZSB5ZXN0ZXJkYXkuIFdoZW4gSSBhdHRhY2ggYSBNaWNyby1CIHBsdWcgdG8gQS0NCj4gcmVjZXB0
YWJsZSBhZGFwdGVyIChhbmQgbm8gYWN0dWFsIGdhZGdldCksIHRoZSBHUElPLWNvbnRyb2xsZWQg
cmVndWxhdG9yIGlzIHR1cm5lZA0KPiBvbiBhbmQgZHJpdmVzIFZCVVMuIFdoZW4gSSBkZXRhY2gg
aXQgYW5kIHRoZSBib2FyZCBzd2l0Y2hlcyBiYWNrIHRvIGdhZGdldCwgdGhlDQo+IHJlZ3VsYXRv
ciBpcyB0dXJuZWQgb2ZmIGFuZCBWQlVTIGlzIHByb3Blcmx5IGRyYWluZWQuDQo+IA0KDQpXb3Vs
ZCB5b3UgcGxlYXNlIHRyeSBkaXNhYmxpbmcgY2hhcmdlciBkZXRlY3Rpb24gdG8gc2VlIGlmIGl0
IGFueXRoaW5nIGNoYW5nZXM/DQpEbyB5b3UgaGF2ZSBhbnkgY29tcG9uZW50cyBhdCBWQlVTPw0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2hpcGlkZWEvdWRjLmMgYi9kcml2ZXJzL3VzYi9j
aGlwaWRlYS91ZGMuYw0KaW5kZXggNmE1ZWU4ZTZkYTEwLi43MGYwN2E4MWRhYTQgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KKysrIGIvZHJpdmVycy91c2IvY2hpcGlk
ZWEvdWRjLmMNCkBAIC0xNTI0LDkgKzE1MjQsMTEgQEAgc3RhdGljIGludCBjaV91ZGNfdmJ1c19z
ZXNzaW9uKHN0cnVjdCB1c2JfZ2FkZ2V0ICpfZ2FkZ2V0LCBpbnQgaXNfYWN0aXZlKQ0KICAgICAg
ICAgICAgICAgIGdhZGdldF9yZWFkeSA9IDE7DQogICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmNpLT5sb2NrLCBmbGFncyk7DQogDQorICAgICAgIC8qDQogICAgICAgIGlmIChjaS0+dXNi
X3BoeSkNCiAgICAgICAgICAgICAgICB1c2JfcGh5X3NldF9jaGFyZ2VyX3N0YXRlKGNpLT51c2Jf
cGh5LCBpc19hY3RpdmUgPw0KICAgICAgICAgICAgICAgICAgICAgICAgVVNCX0NIQVJHRVJfUFJF
U0VOVCA6IFVTQl9DSEFSR0VSX0FCU0VOVCk7DQorICAgICAgICAgICAgICAgICAgICAgICAqLw0K
IA0KICAgICAgICBpZiAoZ2FkZ2V0X3JlYWR5KSB7DQogICAgICAgICAgICAgICAgaWYgKGlzX2Fj
dGl2ZSkgew0KDQpQZXRlcg0K

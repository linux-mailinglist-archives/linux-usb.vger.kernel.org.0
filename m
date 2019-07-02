Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4240B5C982
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 08:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfGBGsX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 02:48:23 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com ([40.107.6.122]:41654
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725812AbfGBGsW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 02:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcOOnh7gKeGCiucywSQEZpkBz018ak+95M+7lq5ykmo=;
 b=Y6TllmpfYKkeKWOaH2fdmF3k+xMr2/5MpI+agfSL6kmCW3fkI44ZsMUcx48CjTsZ0YKjfTmkkSxqCxSSQPKuihnAPoE9mlTESKhouhSLdbcWRXmJOw8/Wpk900YA+tle0XEfbw2mdvyuBKlMUKTfkTD6ligJa5YL5XgE3eKgGHU=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB4163.eurprd02.prod.outlook.com (20.177.110.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 06:48:16 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 06:48:16 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PAABPEL0AAkgO9AAAj0V4A=
Date:   Tue, 2 Jul 2019 06:48:16 +0000
Message-ID: <AM0PR02MB38416C39915E57C8855BBDA7C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
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
In-Reply-To: <VI1PR04MB532799F3F92BCBD8616B51868BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:d913:201d:8092:cfec]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0b4de1b-371b-4e6e-43fd-08d6feb942ee
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB4163;
x-ms-traffictypediagnostic: AM0PR02MB4163:
x-microsoft-antispam-prvs: <AM0PR02MB41636E0C90D036ECC6DA7BA4C5F80@AM0PR02MB4163.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(39830400003)(366004)(376002)(396003)(189003)(199004)(66946007)(73956011)(66446008)(64756008)(66556008)(66476007)(71190400001)(71200400001)(52536014)(76116006)(14454004)(508600001)(7736002)(74316002)(4326008)(305945005)(86362001)(81166006)(6862004)(68736007)(8676002)(2906002)(5660300002)(81156014)(25786009)(46003)(5024004)(102836004)(8936002)(6246003)(53936002)(229853002)(99286004)(33656002)(486006)(54906003)(55016002)(6436002)(256004)(14444005)(44832011)(6506007)(11346002)(7696005)(6116002)(476003)(316002)(446003)(186003)(76176011)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB4163;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0IKRHb/0NQYS/B/U8SLTn8BilifNT02VIBVpBjM22XpAqjEa67QhEN3LZ5BPLnueE94CV8KB51BYzuHvv+utk4amzA6xG1yo3Z0sYi3k4si3aL7qEzdZQr8y+mfUbD90TshQ20nuGF9EUXOI+SY1fRE7sZPjE1CNThT0GS57vSpN9nn2Dpp8SoRWVQf6zR0i3qL3W3bc6RSuNnTjCFmFh1RpIP7rZqW5ALLVFc0FPn4vITBA/mQsaRtRzyuACn9lRrz4zwH/+JGBJHy16WqOLZChX6tvBVeE1jPpxWDMbqYC6cN1+XmcLlC6XDhsCGzzjEzFpfevLKxBoQ3qHNjuoGSagE9nMeQrJ8Cm29gb2rDFEa7YAfNb/lV/feE8ztXgMUyxRWRfAL+Q0FMWbG2cg4HOBmh5tmD2KJKY0eZNNB8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b4de1b-371b-4e6e-43fd-08d6feb942ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 06:48:16.4020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4163
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClBldGVyIENoZW4gd3JpdGVzOiANCj4+IFBldGVyIENoZW4gd3JpdGVzOg0KPj4+IFRo
YXQncyB2ZXJ5IHN0cmFuZ2UsIHRoYXQgbWVhbnMgdGhlIFNvQyBkb2Vzbid0IGtub3cgVkJVUyBm
YWlscyBkb3duIA0KPj4+IGFmdGVyIGRldGFjaGluZyBmcm9tIHRoZSBob3N0Lg0KPj4+IFlvdSBj
b3VsZCBtZWFzdXJlIHRoZSBWQlVTIHZhbHVlIGF0IHRoZSBib2FyZCwgdGhlbiByZWFkIHRoZSBW
QlVTIA0KPj4+IHZhbHVlIGF0IHJlZ2lzdGVyIHRvIGNvbmZpcm0gaXQuDQo+PiANCj4+IEkgaGF2
ZSBwdXQgYSBzY29wZSBvbiBWQlVTLiBXaXRoIGtlcm5lbCA0LjkgYWZ0ZXIgZGV0YWNoaW5nLCBp
dCANCj4+IGRpc2NoYXJnZXMgYWxsIHRoZSB3YXkgZG93biB0byBhYm91dCA1MDAgbVYsIHdpdGgg
NC4xOSB0aGlzIA0KPj4gZGlzY2hhcmdpbmcgc3RvcHMgYWZ0ZXIgYWJvdXQgNCBzZWNvbmRzIGF0
IGFib3V0IDIuNFYgYW5kIHJlbWFpbnMgdGhlcmUuDQo+PiANCj4NCj4gSSBzdXNwZWN0IGl0IGlz
IG5vdCByZWxhdGVkIHRvIFVTQiwgd291bGQgeW91IHBsZWFzZSBkaXNhYmxlIFVTQiBub2RlIGF0
IERUUyB0byBtZWFzdXJlIGFnYWluPw0KDQpXaXRoIFVTQiBkaXNhYmxlZCAoJnVzYm90ZzEgYW5k
ICZ1c2JvdGcyKSwgVkJVUyBpcyBhdmFpbGFibGUgd2hlbiBJIGNvbm5lY3QgdG8gdGhlIGhvc3Qg
YW5kIHByb3Blcmx5IGRpc2NoYXJnZWQgd2hlbiBJIGRpc2Nvbm5lY3QuDQpJIGFsc28gdHJpZWQg
dGhlIE9URydzIGhvc3QgbW9kZSB5ZXN0ZXJkYXkuIFdoZW4gSSBhdHRhY2ggYSBNaWNyby1CIHBs
dWcgdG8gQS1yZWNlcHRhYmxlIGFkYXB0ZXIgKGFuZCBubyBhY3R1YWwgZ2FkZ2V0KSwgdGhlIEdQ
SU8tY29udHJvbGxlZCByZWd1bGF0b3IgaXMgdHVybmVkIG9uIGFuZCBkcml2ZXMgVkJVUy4gV2hl
biBJIGRldGFjaCBpdCBhbmQgdGhlIGJvYXJkIHN3aXRjaGVzIGJhY2sgdG8gZ2FkZ2V0LCB0aGUg
cmVndWxhdG9yIGlzIHR1cm5lZCBvZmYgYW5kIFZCVVMgaXMgcHJvcGVybHkgZHJhaW5lZC4NCg0K
Q2hlZXJzLA0KS2FpDQo=

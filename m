Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65BA759CEC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 15:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfF1N2l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 09:28:41 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com ([40.107.8.91]:35566
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726558AbfF1N2l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 09:28:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=AKy+iMW1KdB7t5KtYQWP1+7TgSeCaKDoqiBvXK+ctCJZ3xytBI9v7+KR8rDT2TzPrpn8KfqzKCrqHiF+XQdZifBqvZ5aHaWGi+BN7UQxuOloS4hzftKfJbRj+ldPXt93wtxVymToUgxVE3kxgL5yrgaUsR/ABqRPvry4hEK+5f0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SJdjQ0mfiIOGniIyHSZrdwxeYuGecd7/diQOPJyUVo=;
 b=H7xvcMHywOie5mqDGVlkjsLGow5bS2hWMWicFgAUdYvm1/XSvrEXxws6yvyLU3QeSwmhrLf+dz/P8iM4REf3uVT1I7tozgG9tXUsEY8aOBiywT1DFHb4npw+d6adnrQrmUTLYDFBSH27EtBAYtqk+e3pYGviI12BRmsIyqhny/E=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SJdjQ0mfiIOGniIyHSZrdwxeYuGecd7/diQOPJyUVo=;
 b=f6GxZhRsX281V/o640RCltme/pEEhp6S+1iuE8Bvr3QbYFfWractUuQtlKxfTTXooPO79fUemOfaJxKksSYY9eo7XKw1qxGi/muvrKELsgH57Npfl6Fe2X2YSluFEHNwHqehUHK64qJAncebyaZyZF++5p+Gyry4cKRKNR4N29o=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB3826.eurprd02.prod.outlook.com (52.134.80.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 13:28:34 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2008.014; Fri, 28 Jun 2019
 13:28:34 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Peter Chen <hzpeterchen@gmail.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7w
Date:   Fri, 28 Jun 2019 13:28:34 +0000
Message-ID: <AM0PR02MB38415FA372C7A8B8B7BAFF22C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
 <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com>
 <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
 <AM0PR02MB38419422D499F45C8475A000C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB38419422D499F45C8475A000C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:3da8:e296:2c6e:2570]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6d743e5-0994-4a47-b6a8-08d6fbcc851d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB3826;
x-ms-traffictypediagnostic: AM0PR02MB3826:
x-microsoft-antispam-prvs: <AM0PR02MB3826CEB18E9CEE6849B34B45C5FC0@AM0PR02MB3826.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(136003)(366004)(376002)(346002)(189003)(199004)(52536014)(6436002)(6862004)(5660300002)(14444005)(305945005)(7736002)(5024004)(1411001)(256004)(33656002)(4326008)(8936002)(14454004)(6116002)(55016002)(71200400001)(71190400001)(74316002)(53936002)(229853002)(81156014)(9686003)(81166006)(2940100002)(25786009)(8676002)(7696005)(86362001)(76176011)(6246003)(64756008)(508600001)(46003)(102836004)(11346002)(73956011)(66446008)(486006)(66946007)(68736007)(476003)(66556008)(66476007)(54906003)(76116006)(44832011)(316002)(446003)(6506007)(2906002)(99286004)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB3826;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PvNZISYw2nChTDql4+ZDTcfMMN1diatINxR1/o3727K1sVA0anB5Oz/IPzTqDvmJ8PIV2wUXB87Wm9E9iX1kFjugsZCNDfwHKe1Z8MVVMjidbkb1jxOAZUmtUgVKGw5s/FX0/LU0wWOm4BIbEuS4WUlxRh6zr/37v7yVw6Y+fxbq1aA+eof6wTwBXCDpdwI/i52HHoCjX/Fyc1cIyaOsizfM7jSjyCloGiaxCNH/9mK7HZWZEc/ZDJeu2TcP33x/94jh5tKYMA8mXxuBAgRwKgVPOAsbiTCbZRZZCbHZ2LOSvyL2AS2ASMkMfaj0hyclNLuOzWfIRVi1jS8oWOm+gnP8Posid28FGV28/OsZY2YwkAjkQr3x0CLpW8HZ7fQ3ZNsEv6JFuX/B19GZ3BMddCW2tTzynoVjnmk+bFr1tzE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d743e5-0994-4a47-b6a8-08d6fbcc851d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 13:28:34.3901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3826
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkkgd3JpdGU6DQo+IFBldGVyIENoZW4gd3JpdGVzOg0KPj4+IEZlbGlwZSBCYWxiaSB3
cml0ZXM6DQo+Pj4gPiBLYWkgUnVobmF1IDxrYWkucnVobmF1QHRhcmdldC1zZy5jb20+IHdyaXRl
czoNCj4+PiA+Pj4gV2hpY2ggcGVyaXBoZXJhbCBjb250cm9sbGVyIGlzIHRoaXMgYm9hcmQgdXNp
bmc/IElzIGl0IGNoaXBpZGVhPyBkd2MyPw0KPj4+ID4+PiBkd2MzPyBIaWdoIFNwZWVkIG9yIFN1
cGVyIFNwZWVkPw0KPj4+ID4+DQo+Pj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBkZXZpY2UgdHJlZSBp
dCdzICdmc2wsaW14NnN4LXVzYicgZHJpdmVuIGJ5DQo+Pj4gPj4gY2hpcGlkZWEvY2lfaGRyY19p
bXguYyBXaGVuIGNvbm5lY3RpbmcgdG8gV2luZG93cywgdGhlIGRtZXNnIHNob3dzOg0KPj4+ID4+
ICBjb25maWdmcy1nYWRnZXQgZ2FkZ2V0OiBoaWdoLXNwZWVkIGNvbmZpZyAjMjogYw0KPj4+ID4N
Cj4+PiA+IE9rYXksIGFkZGluZyBQZXRlciAoY2hpcGlkZWEgbWFpbnRhaW5lcikgdG8gdGhlIGxv
b3AgaGVyZS4gVGhlcmUgYXJlDQo+Pj4gPiBhIGZldyBjaGFuZ2VzIG9uIFVEQyBzaWRlIG9mIGNo
aXBpZGVhIGJldHdlZW4gNC45IGFuZCA1LjE6DQo+Pj4gPg0KPj4+ID4gUGV0ZXIsIGhhdmUgeW91
IHNlZW4gdGhlIHByb2JsZW0gZGVzY3JpYmVkIGJlZm9yZT8NCj4+Pg0KPj4+IEZpbmRpbmdzIHRv
ZGF5Og0KPj4+DQo+Pj4gVGhlICJMb3N0IGNhcnJpZXIiIG1lc3NhZ2UgY29tZXMgd2hlbiB0aGUg
NC45IGtlcm5lbCBlbnRlcnMgcnVudGltZSBzdXNwZW5kIChjaV9jb250cm9sbGVyX3N1c3BlbmQp
Lg0KPj4+DQo+Pj4gV2l0aCBrZXJuZWwgNC4xOSwgdGhhdCBmdW5jdGlvbiBpcyBjYWxsZWQgb25j
ZSBkdXJpbmcgYm9vdCB3aXRoIGEgbWF0Y2hpbmcgY2lfY29udHJvbGxlcl9yZXN1bWUgd2hlbiBJ
IGFjdGl2YXRlIHRoZSBjb25maWdmcyBjb25maWd1cmF0aW9uLiBBZnRlciB0aGF0LCB0aGUgY2hp
cCBkb2VzIG5vdCBlbnRlciBydW50aW1lIHN1c3BlbmQgd2hlbiBJIHB1bGwgdGhlIFVTQiBjYWJs
ZSwgYnV0IGRvZXMgd2l0aCA0LjkuDQo+Pj4NCj4+IERvIHlvdSBtZWFuIGF0IHY0LjksIHRoZSBj
aV9jb250cm9sbGVyX3N1c3BlbmQgaXMgY2FsbGVkIGV2ZW4geW91IHBsdWcgaW4gdGhlIGNhYmxl
IHRvIGhvc3Q/IEJ1dCB0aGlzIGRvZXMgbm90IGhhcHBlbiBmb3IgbmV3ZXIga2VybmVsLg0KPg0K
PiBObzogV2l0aCA0LjksIEkgZGlzY29ubmVjdCB0aGUgVVNCIGNhYmxlIGFuZCBhIGZldyBzZWNv
bmRzIGxhdGVyIGNpX2NvbnRyb2xsZXJfc3VzcGVuZCBpcyBjYWxsZWQuIFdpdGggNC4xOSBvciA1
LjEsIHRoaXMgZG9lc24ndCBoYXBwZW4gYW55bW9yZSAoYXQgbGVhc3QgaW4gYSB0aW1lbHkgbWFu
bmVyKS4gV2hlbiBJIGNhbWUgYmFjayB0aGlzIG1vcm5pbmcsIEkgbm90aWNlZCB0aGF0IHRoZSBr
ZXJuZWwgbG9nIGRpZCBpbiBmYWN0IGNvbnRhaW4gbXkgcHJpbnRrIGluIGNpX2NvbnRyb2xsZXJf
c3VzcGVuZC4gSG93ZXZlciwgdGhpcyB3YXMgZ2VuZXJhdGVkIG1vcmUgdGhhbiAxNCBob3VycyBh
ZnRlciBJIGRpc2Nvbm5lY3RlZCB0aGUgVVNCIGNhYmxlLiBJIGRpc2Nvbm5lY3RlZCB0aGUgVVNC
IGNvbm5lY3Rpb24geWVzdGVyZGF5IGJldHdlZW4gMTU6NDY6NTYgVVRDIGFuZCAxNTo1MToyMSBV
VEMgKG5vIHN5c2xvZyBlbnRyaWVzIGFyZSBpbi1iZXR3ZWVuIHRob3NlIHR3byB0aW1lc3RhbXBz
KSBhbmQgdGhlIHByaW50ayBpbiBjaV9jb250cm9sbGVyX3N1c3BlbmQgd2FzIGdlbmVyYXRlZCBh
dCAwNjozMjoxOSBVVEMgdGhlIHRvZGF5Lg0KPg0KPiBJIGhhdmUgcmVib290ZWQgd2l0aCA0Ljk6
DQo+IFsgICAgMC42NTg1OTRdIGNpX2hkcmMgY2lfaGRyYy4wOiBlbnRlcmluZyBzdXNwZW5kDQo+
ICMgQ29uZmlnRlMgc2V0dXAgaW4gdXNlcnNwYWNlDQo+ICBbICAgIDkuOTI1MzYxXSBjaV9oZHJj
IGNpX2hkcmMuMDogbGVhdmluZyBzdXNwZW5kDQo+IFsgICAxMi4wODE1NzFdIGNpX2hkcmMgY2lf
aGRyYy4wOiBlbnRlcmluZyBzdXNwZW5kDQo+ICMgQXR0YWNoIGEgY2FibGUNCj4gWyAgIDM3Ljg2
OTMzM10gY2lfaGRyYyBjaV9oZHJjLjA6IGxlYXZpbmcgc3VzcGVuZA0KPiAjIERldGFjaCBhIGNh
YmxlDQo+IFsgICA0OS4xOTY2MTBdIGNpX2hkcmMgY2lfaGRyYy4wOiBlbnRlcmluZyBzdXNwZW5k
DQoNCldpdGggNC45LCB0aGVyZSBhcmUgdHdvIGNpX2lycSBpbnRlcnJ1cHRzIHdpdGggT1RHU0Nf
QlNWSVMgc2V0IChiX3Nlc3NfdmFsaWRfZXZlbnQpLCBvbmUgd2hlbiBhdHRhY2hpbmcgdGhlIGNh
YmxlLCBvbmUgd2hlbiBkZXRhY2hpbmcgdGhlIGNhYmxlLiANCg0KPiBBbmQgd2l0aCA0LjE5Og0K
PiBbICAgIDAuMTc2Mjk3XSBjaV9oZHJjIGNpX2hkcmMuMDogZW50ZXJpbmcgc3VzcGVuZA0KPiAj
IENvbmZpZ0ZTIHNldHVwIGluIHVzZXJzcGFjZQ0KPiBbICAgIDkuMDM0NDkzXSBjaV9oZHJjIGNp
X2hkcmMuMDogbGVhdmluZyBzdXNwZW5kDQo+IFsgICAxMS4xMjg0NjldIGNpX2hkcmMgY2lfaGRy
Yy4wOiBlbnRlcmluZyBzdXNwZW5kDQo+ICMgQXR0YWNoIGEgY2FibGUNCj4gWyAgMTc4LjcxMjIw
Nl0gY2lfaGRyYyBjaV9oZHJjLjA6IGxlYXZpbmcgc3VzcGVuZA0KPiAjIERldGFjaCB0aGUgY2Fi
bGUgYW5kIG5vdGhpbmcgaGFwcGVucw0KDQpXaXRoIDQuMTksIHRoZXJlJ3Mgb25seSBvbmUgY2lf
aXJxIGludGVycnVwdCB3aXRoIE9UR1NDX0JTVklTIHNldCAoYl9zZXNzX3ZhbGlkX2V2ZW50KTog
VGhlIG9uZSB3aGVuIGF0dGFjaGluZyB0aGUgY2FibGUuIFRoZXJlIGlzIG5vIElSUSB3aGVuIGRl
dGFjaGluZyB0aGUgY2FibGUuDQoNCj4+IEJlc2lkZXMsIHdoYXQncyB5b3VyIGV4cGVjdGF0aW9u
IGZvciBybmRpcyBiZWhhdmlvcnMgZm9yIGJvdGggd2luZG93cyBhbmQgbWFjDQo+DQo+IEdvaW5n
IGJhY2sgdG8gdGhlIG9yaWdpbmFsIG1haWw6IEluIG15IGFwcGxpY2F0aW9uLCBJIHdhbnQgdG8g
ZGV0ZWN0IG9uIG15IGdhZGdldCB3aGVuIHRoZSBVU0IgY2FibGUgaXMgcHVsbGVkIGZyb20gb3Ig
Y29ubmVjdGVkIHRvIHRoZSBob3N0LiBXaXRoIEtlcm5lbCA0LjkgSSBhbSB1c2luZyB0aGUgY2Fy
cmllciBzdGF0ZSBjaGFuZ2Ugb2YgdGhlIFJORElTIG9yIEVDTSBuZXR3b3JrIGludGVyZmFjZSB0
aHJvdWdoIHN5c3RlbWQtbmV0d29ya2QuIFdpdGggNC4xOSBhbmQgNS4xICh0aGUgdHdvIHZlcnNp
b25zIEkgaGFkIHRlc3RlZCksIEkgZ2V0IHRoZSAiR2FpbmVkIGNhcnJpZXIiIG1lc3NhZ2Ugd2hl
biBJIGNvbm5lY3QgZm9yIHRoZSBmaXJzdCB0aW1lLCBidXQgYWZ0ZXIgZGlzY29ubmVjdGluZywg
dGhlICJMb3N0IGNhcnJpZXIiIG1lc3NhZ2UgZG9lc24ndCBhcHBlYXIgYXMgd2l0aCA0LjkuIElu
IHRoZSBvbmUgdGVzdCB3aGVyZSBpdCBhcHBlYXJlZCwgaXQgdG9vayBvdmVyIDE0IGhvdXJzLi4u
DQoNCkNoZWVycywNCkthaQ0K

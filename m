Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D415961F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 10:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfF1IaJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 04:30:09 -0400
Received: from mail-eopbgr140114.outbound.protection.outlook.com ([40.107.14.114]:20851
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726056AbfF1IaJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 04:30:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=u0aCPZU3aCkBsFtP/cBbKsCfqmEmVo/8jm8BwYe+KYSAO70pJTasSx6Y4mbe6uyQ9hq1c8GcUMGcdAGGot1Uis5/KCu7nGoFeW+zZpwlDrnlIJOPldKme9jyKdDPQ5zq7fYXkrkPYi4j28nJgwFN5QwLTo6Nq4CBR5aVgsNAMRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jV8/1aTP5qpO01IOd+afkr9FKqM583w99v752bW3n8=;
 b=k4kFAo4UbFbl62yIuQvBIeLdJYAREcmM+ClRhve4Qo8Q6Kp1fGe46AHxf7FQEVI/NQ4vpZl3HnDYKga7mnGJin+li612/HQz5YFIrKLmcBMFoWzMjuBFp/7VNGMk2qNbWZVF3cz9hGnxzccHA4j2nfCFBAl9yrnrLIfnXXJrHzM=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jV8/1aTP5qpO01IOd+afkr9FKqM583w99v752bW3n8=;
 b=WGRVRW9eDP9OJQWKsWvUIynbQuhbHEtyluA0mfe6/SpAmPZGbwEp6CI9CZH4JUVGf0aPJOOG1Q0XD9wgowU1UemHEJzzFJeoMM7ajG86b9BImu4QF+lLjyHvlci6mPup9mK+RRxBx5gfhY1IyyLIPi9SChaggh5lLkYO2rS54ck=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB5617.eurprd02.prod.outlook.com (10.255.31.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 08:30:04 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2008.014; Fri, 28 Jun 2019
 08:30:04 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Peter Chen <hzpeterchen@gmail.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoA==
Date:   Fri, 28 Jun 2019 08:30:03 +0000
Message-ID: <AM0PR02MB38419422D499F45C8475A000C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
 <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com>
 <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
In-Reply-To: <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:3da8:e296:2c6e:2570]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b121612-e323-4bad-804d-08d6fba2d1a8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB5617;
x-ms-traffictypediagnostic: AM0PR02MB5617:
x-microsoft-antispam-prvs: <AM0PR02MB5617D8AC6B431898A1A3A3AFC5FC0@AM0PR02MB5617.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(396003)(346002)(39830400003)(189003)(199004)(76176011)(7696005)(99286004)(5024004)(102836004)(14444005)(256004)(508600001)(6506007)(186003)(6436002)(33656002)(476003)(5660300002)(71190400001)(71200400001)(8936002)(11346002)(74316002)(446003)(68736007)(229853002)(486006)(66446008)(73956011)(66946007)(66556008)(64756008)(76116006)(1411001)(46003)(316002)(6862004)(6116002)(52536014)(53936002)(86362001)(25786009)(66476007)(81156014)(2906002)(55016002)(14454004)(54906003)(9686003)(6246003)(4326008)(81166006)(44832011)(305945005)(8676002)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB5617;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wnRHM066hWtOiVXmVTw/WQ0RRJKX50sf32Jgq4L8fVwJzqrnu3g10VArwC8ShnVvCGSkp+1yT7uOVB/jtKKv/YXSNINa/DYwlOYIhnuOjKSe8GtOP31CkKOrR83v4HklaA98jKVEcu2DntZGq5Mdvx0plnW6HS7zpxBPzYfAwLrlDgngjO4Wjd7Nc7uCtCTj7jvlGLaKJM6Tk1nIEcPF9cqpQHCM5XfjQGnmuSV8fvZORsaBV4vdBF6sb5/AwITlGyAtVuUGcyFkbv1pwLrPIIIC3RwpdSTEq756DB5WcKyGL4u7drXCSnPNgm/AjH4178dSbfyy5lWqoozMYixqs1Y3YXOPNwnZr6sRFDLrC6YjmeEsyRyTkKdH9JCvzbKM9uLEYW23+u6i/ToUar8mOfu8gPzCxjcfst/Z4oL5obY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b121612-e323-4bad-804d-08d6fba2d1a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 08:30:03.9309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5617
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQoNClBldGVyIENoZW4gd3JpdGVzOg0KPj4gRmVsaXBlIEJhbGJpIHdyaXRlczoN
Cj4+ID4gS2FpIFJ1aG5hdSA8a2FpLnJ1aG5hdUB0YXJnZXQtc2cuY29tPiB3cml0ZXM6DQo+PiA+
Pj4gV2hpY2ggcGVyaXBoZXJhbCBjb250cm9sbGVyIGlzIHRoaXMgYm9hcmQgdXNpbmc/IElzIGl0
IGNoaXBpZGVhPyBkd2MyPw0KPj4gPj4+IGR3YzM/IEhpZ2ggU3BlZWQgb3IgU3VwZXIgU3BlZWQ/
DQo+PiA+Pg0KPj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBkZXZpY2UgdHJlZSBpdCdzICdmc2wsaW14
NnN4LXVzYicgZHJpdmVuIGJ5IA0KPj4gPj4gY2hpcGlkZWEvY2lfaGRyY19pbXguYyBXaGVuIGNv
bm5lY3RpbmcgdG8gV2luZG93cywgdGhlIGRtZXNnIHNob3dzOg0KPj4gPj4gIGNvbmZpZ2ZzLWdh
ZGdldCBnYWRnZXQ6IGhpZ2gtc3BlZWQgY29uZmlnICMyOiBjDQo+PiA+DQo+PiA+IE9rYXksIGFk
ZGluZyBQZXRlciAoY2hpcGlkZWEgbWFpbnRhaW5lcikgdG8gdGhlIGxvb3AgaGVyZS4gVGhlcmUg
YXJlIA0KPj4gPiBhIGZldyBjaGFuZ2VzIG9uIFVEQyBzaWRlIG9mIGNoaXBpZGVhIGJldHdlZW4g
NC45IGFuZCA1LjE6DQo+PiA+DQo+PiA+IFBldGVyLCBoYXZlIHlvdSBzZWVuIHRoZSBwcm9ibGVt
IGRlc2NyaWJlZCBiZWZvcmU/DQo+Pg0KPj4gRmluZGluZ3MgdG9kYXk6DQo+Pg0KPj4gVGhlICJM
b3N0IGNhcnJpZXIiIG1lc3NhZ2UgY29tZXMgd2hlbiB0aGUgNC45IGtlcm5lbCBlbnRlcnMgcnVu
dGltZSBzdXNwZW5kIChjaV9jb250cm9sbGVyX3N1c3BlbmQpLg0KPj4NCj4+IFdpdGgga2VybmVs
IDQuMTksIHRoYXQgZnVuY3Rpb24gaXMgY2FsbGVkIG9uY2UgZHVyaW5nIGJvb3Qgd2l0aCBhIG1h
dGNoaW5nIGNpX2NvbnRyb2xsZXJfcmVzdW1lIHdoZW4gSSBhY3RpdmF0ZSB0aGUgY29uZmlnZnMg
Y29uZmlndXJhdGlvbi4gQWZ0ZXIgdGhhdCwgdGhlIGNoaXAgZG9lcyBub3QgZW50ZXIgcnVudGlt
ZSBzdXNwZW5kIHdoZW4gSSBwdWxsIHRoZSBVU0IgY2FibGUsIGJ1dCBkb2VzIHdpdGggNC45Lg0K
Pj4NCj4gRG8geW91IG1lYW4gYXQgdjQuOSwgdGhlIGNpX2NvbnRyb2xsZXJfc3VzcGVuZCBpcyBj
YWxsZWQgZXZlbiB5b3UgcGx1ZyBpbiB0aGUgY2FibGUgdG8gaG9zdD8gQnV0IHRoaXMgZG9lcyBu
b3QgaGFwcGVuIGZvciBuZXdlciBrZXJuZWwuDQoNCk5vOiBXaXRoIDQuOSwgSSBkaXNjb25uZWN0
IHRoZSBVU0IgY2FibGUgYW5kIGEgZmV3IHNlY29uZHMgbGF0ZXIgY2lfY29udHJvbGxlcl9zdXNw
ZW5kIGlzIGNhbGxlZC4gV2l0aCA0LjE5IG9yIDUuMSwgdGhpcyBkb2Vzbid0IGhhcHBlbiBhbnlt
b3JlIChhdCBsZWFzdCBpbiBhIHRpbWVseSBtYW5uZXIpLiBXaGVuIEkgY2FtZSBiYWNrIHRoaXMg
bW9ybmluZywgSSBub3RpY2VkIHRoYXQgdGhlIGtlcm5lbCBsb2cgZGlkIGluIGZhY3QgY29udGFp
biBteSBwcmludGsgaW4gY2lfY29udHJvbGxlcl9zdXNwZW5kLiBIb3dldmVyLCB0aGlzIHdhcyBn
ZW5lcmF0ZWQgbW9yZSB0aGFuIDE0IGhvdXJzIGFmdGVyIEkgZGlzY29ubmVjdGVkIHRoZSBVU0Ig
Y2FibGUuIEkgZGlzY29ubmVjdGVkIHRoZSBVU0IgY29ubmVjdGlvbiB5ZXN0ZXJkYXkgYmV0d2Vl
biAxNTo0Njo1NiBVVEMgYW5kIDE1OjUxOjIxIFVUQyAobm8gc3lzbG9nIGVudHJpZXMgYXJlIGlu
LWJldHdlZW4gdGhvc2UgdHdvIHRpbWVzdGFtcHMpIGFuZCB0aGUgcHJpbnRrIGluIGNpX2NvbnRy
b2xsZXJfc3VzcGVuZCB3YXMgZ2VuZXJhdGVkIGF0IDA2OjMyOjE5IFVUQyB0aGUgdG9kYXkuDQoN
CkkgaGF2ZSByZWJvb3RlZCB3aXRoIDQuOToNClsgICAgMC42NTg1OTRdIGNpX2hkcmMgY2lfaGRy
Yy4wOiBlbnRlcmluZyBzdXNwZW5kDQojIENvbmZpZ0ZTIHNldHVwIGluIHVzZXJzcGFjZQ0KIFsg
ICAgOS45MjUzNjFdIGNpX2hkcmMgY2lfaGRyYy4wOiBsZWF2aW5nIHN1c3BlbmQNClsgICAxMi4w
ODE1NzFdIGNpX2hkcmMgY2lfaGRyYy4wOiBlbnRlcmluZyBzdXNwZW5kDQojIEF0dGFjaCBhIGNh
YmxlDQpbICAgMzcuODY5MzMzXSBjaV9oZHJjIGNpX2hkcmMuMDogbGVhdmluZyBzdXNwZW5kDQoj
IERldGFjaCBhIGNhYmxlDQpbICAgNDkuMTk2NjEwXSBjaV9oZHJjIGNpX2hkcmMuMDogZW50ZXJp
bmcgc3VzcGVuZA0KDQpBbmQgd2l0aCA0LjE5Og0KWyAgICAwLjE3NjI5N10gY2lfaGRyYyBjaV9o
ZHJjLjA6IGVudGVyaW5nIHN1c3BlbmQNCiMgQ29uZmlnRlMgc2V0dXAgaW4gdXNlcnNwYWNlDQpb
ICAgIDkuMDM0NDkzXSBjaV9oZHJjIGNpX2hkcmMuMDogbGVhdmluZyBzdXNwZW5kDQpbICAgMTEu
MTI4NDY5XSBjaV9oZHJjIGNpX2hkcmMuMDogZW50ZXJpbmcgc3VzcGVuZA0KIyBBdHRhY2ggYSBj
YWJsZQ0KWyAgMTc4LjcxMjIwNl0gY2lfaGRyYyBjaV9oZHJjLjA6IGxlYXZpbmcgc3VzcGVuZA0K
IyBEZXRhY2ggdGhlIGNhYmxlIGFuZCBub3RoaW5nIGhhcHBlbnMNCiANCj4gQmVzaWRlcywgd2hh
dCdzIHlvdXIgZXhwZWN0YXRpb24gZm9yIHJuZGlzIGJlaGF2aW9ycyBmb3IgYm90aCB3aW5kb3dz
IGFuZCBtYWMNCg0KR29pbmcgYmFjayB0byB0aGUgb3JpZ2luYWwgbWFpbDogSW4gbXkgYXBwbGlj
YXRpb24sIEkgd2FudCB0byBkZXRlY3Qgb24gbXkgZ2FkZ2V0IHdoZW4gdGhlIFVTQiBjYWJsZSBp
cyBwdWxsZWQgZnJvbSBvciBjb25uZWN0ZWQgdG8gdGhlIGhvc3QuIFdpdGggS2VybmVsIDQuOSBJ
IGFtIHVzaW5nIHRoZSBjYXJyaWVyIHN0YXRlIGNoYW5nZSBvZiB0aGUgUk5ESVMgb3IgRUNNIG5l
dHdvcmsgaW50ZXJmYWNlIHRocm91Z2ggc3lzdGVtZC1uZXR3b3JrZC4gV2l0aCA0LjE5IGFuZCA1
LjEgKHRoZSB0d28gdmVyc2lvbnMgSSBoYWQgdGVzdGVkKSwgSSBnZXQgdGhlICJHYWluZWQgY2Fy
cmllciIgbWVzc2FnZSB3aGVuIEkgY29ubmVjdCBmb3IgdGhlIGZpcnN0IHRpbWUsIGJ1dCBhZnRl
ciBkaXNjb25uZWN0aW5nLCB0aGUgIkxvc3QgY2FycmllciIgbWVzc2FnZSBkb2Vzbid0IGFwcGVh
ciBhcyB3aXRoIDQuOS4gSW4gdGhlIG9uZSB0ZXN0IHdoZXJlIGl0IGFwcGVhcmVkLCBpdCB0b29r
IG92ZXIgMTQgaG91cnMuLi4NCg0KQ2hlZXJzLA0KS2FpDQoNCg==

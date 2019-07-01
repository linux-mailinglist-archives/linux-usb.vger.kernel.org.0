Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56EF95B542
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 08:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfGAGpD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 02:45:03 -0400
Received: from mail-eopbgr150078.outbound.protection.outlook.com ([40.107.15.78]:36677
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727093AbfGAGpD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 02:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXL8xaUZY7MAiSjhEzwl5RabjQCQpIQPsHupcxPvLS4=;
 b=NZfMRkrTotyr+AOWDVr9oxuXN898Uwg+z97/ij+S2nYph6w5tvw/9MGCUaXCv2ZCjBFtwmYRv2T0r+QhzyGzfhchayENvJgGMVRU/nkNAfZ5bqczAW29zStj7UCFV+8RIYGx1RHxKjRKfBfluIaH7x6DVMlJnfCqP06TIa/m5y0=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5341.eurprd04.prod.outlook.com (52.134.123.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 06:44:59 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 06:44:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PA=
Date:   Mon, 1 Jul 2019 06:44:59 +0000
Message-ID: <VI1PR04MB5327BA15817CA04C5ACC4A8C8BF90@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
 <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com>
 <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
 <AM0PR02MB38419422D499F45C8475A000C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <AM0PR02MB38415FA372C7A8B8B7BAFF22C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB38415FA372C7A8B8B7BAFF22C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 189a963c-7cdb-4f77-b6cc-08d6fdefa317
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5341;
x-ms-traffictypediagnostic: VI1PR04MB5341:
x-microsoft-antispam-prvs: <VI1PR04MB53414EAC1003799E7A5350498BF90@VI1PR04MB5341.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(189003)(199004)(476003)(486006)(68736007)(44832011)(86362001)(5024004)(14444005)(186003)(76176011)(25786009)(256004)(102836004)(26005)(6506007)(7696005)(6246003)(11346002)(6916009)(3846002)(81166006)(81156014)(8936002)(8676002)(74316002)(305945005)(446003)(7736002)(2906002)(6116002)(4326008)(33656002)(5660300002)(52536014)(229853002)(66476007)(66556008)(66946007)(64756008)(76116006)(55016002)(6436002)(53936002)(66066001)(73956011)(54906003)(99286004)(66446008)(71200400001)(71190400001)(316002)(9686003)(478600001)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5341;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6bDex5d3t24YmimZ8t/lPGWthMpyyOfuI3Ja0BQ7qiBmqOP1DXmZSSgdNHjWwbrDqiS6lQ/OK0yGRH1LBsjuWkE0wcoy5Vs1zxpZcsz0EXnnHIRT9MAB0JRjCatc6N+qwzUjteYAwG0b7EkDmZ6jDNYAkUCXcRZIp4T2/AVE+a1296v/q2h90VnMW+/Tr17qst171fB8kp0+4yEyTZDrI4bUZPcoYzR09POh3uEA3InIO8fgdzMYScd5nec8awJ4fRgqRmsMSCL2FJgmKysTiOBl8XJiqiY6ItjaFpuJ3ABHqYJUqBfnp6DaLCz3zo/k6sqwuWrUjt9PyMXmf7k8hiuir2jP/sySw+9gfTDiM/HEBPEsSSb3NlD4u0OHeRRwm5fqEBTqg/Od4yXZogeJQRTefbDHNESIJohHfcbRiL4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189a963c-7cdb-4f77-b6cc-08d6fdefa317
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 06:44:59.3755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5341
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+IEkgaGF2ZSByZWJvb3RlZCB3aXRoIDQuOToNCj4gPiBbICAgIDAuNjU4NTk0XSBjaV9o
ZHJjIGNpX2hkcmMuMDogZW50ZXJpbmcgc3VzcGVuZA0KPiA+ICMgQ29uZmlnRlMgc2V0dXAgaW4g
dXNlcnNwYWNlDQo+ID4gIFsgICAgOS45MjUzNjFdIGNpX2hkcmMgY2lfaGRyYy4wOiBsZWF2aW5n
IHN1c3BlbmQNCj4gPiBbICAgMTIuMDgxNTcxXSBjaV9oZHJjIGNpX2hkcmMuMDogZW50ZXJpbmcg
c3VzcGVuZA0KPiA+ICMgQXR0YWNoIGEgY2FibGUNCj4gPiBbICAgMzcuODY5MzMzXSBjaV9oZHJj
IGNpX2hkcmMuMDogbGVhdmluZyBzdXNwZW5kDQo+ID4gIyBEZXRhY2ggYSBjYWJsZQ0KPiA+IFsg
ICA0OS4xOTY2MTBdIGNpX2hkcmMgY2lfaGRyYy4wOiBlbnRlcmluZyBzdXNwZW5kDQo+IA0KPiBX
aXRoIDQuOSwgdGhlcmUgYXJlIHR3byBjaV9pcnEgaW50ZXJydXB0cyB3aXRoIE9UR1NDX0JTVklT
IHNldA0KPiAoYl9zZXNzX3ZhbGlkX2V2ZW50KSwgb25lIHdoZW4gYXR0YWNoaW5nIHRoZSBjYWJs
ZSwgb25lIHdoZW4gZGV0YWNoaW5nIHRoZSBjYWJsZS4NCj4gDQo+ID4gQW5kIHdpdGggNC4xOToN
Cj4gPiBbICAgIDAuMTc2Mjk3XSBjaV9oZHJjIGNpX2hkcmMuMDogZW50ZXJpbmcgc3VzcGVuZA0K
PiA+ICMgQ29uZmlnRlMgc2V0dXAgaW4gdXNlcnNwYWNlDQo+ID4gWyAgICA5LjAzNDQ5M10gY2lf
aGRyYyBjaV9oZHJjLjA6IGxlYXZpbmcgc3VzcGVuZA0KPiA+IFsgICAxMS4xMjg0NjldIGNpX2hk
cmMgY2lfaGRyYy4wOiBlbnRlcmluZyBzdXNwZW5kDQo+ID4gIyBBdHRhY2ggYSBjYWJsZQ0KPiA+
IFsgIDE3OC43MTIyMDZdIGNpX2hkcmMgY2lfaGRyYy4wOiBsZWF2aW5nIHN1c3BlbmQgIyBEZXRh
Y2ggdGhlIGNhYmxlDQo+ID4gYW5kIG5vdGhpbmcgaGFwcGVucw0KPiANCj4gV2l0aCA0LjE5LCB0
aGVyZSdzIG9ubHkgb25lIGNpX2lycSBpbnRlcnJ1cHQgd2l0aCBPVEdTQ19CU1ZJUyBzZXQNCj4g
KGJfc2Vzc192YWxpZF9ldmVudCk6IFRoZSBvbmUgd2hlbiBhdHRhY2hpbmcgdGhlIGNhYmxlLiBU
aGVyZSBpcyBubyBJUlEgd2hlbg0KPiBkZXRhY2hpbmcgdGhlIGNhYmxlLg0KPiANCg0KVGhhdCdz
IHZlcnkgc3RyYW5nZSwgdGhhdCBtZWFucyB0aGUgU29DIGRvZXNuJ3Qga25vdyBWQlVTIGZhaWxz
IGRvd24gYWZ0ZXIgZGV0YWNoaW5nIGZyb20gdGhlIGhvc3QuDQpZb3UgY291bGQgbWVhc3VyZSB0
aGUgVkJVUyB2YWx1ZSBhdCB0aGUgYm9hcmQsIHRoZW4gcmVhZCB0aGUgVkJVUyB2YWx1ZSBhdCBy
ZWdpc3RlciB0byBjb25maXJtIGl0Lg0KIEkganVzdCB0cmllZCBteSBib2FyZCAoaW14NnN4LXNk
YiksIGl0IHdvcmtlZCBPSyBhdCBhdCB2NS4yLXJjNS4gSWYgeW91IGhhdmUNCm1lbXRvb2wgKHRo
ZSB0b29sIHRvIHJlYWQgcGh5c2ljYWwgbWVtb3J5KSwgeW91IGNvdWxkIHJlYWQgcmVnaXN0ZXIg
T1RHU0MNCmF0IHRoYXQgdGltZSB1c2luZyBiZWxvdyBjb21tYW5kOg0KDQpUaGUgdmFsdWUgc2hv
dWxkIGxpa2UgYmVsb3csIGJpdCA5IC0gYml0IDExIHN0YW5kcyBmb3IgVkJVUyB2YWx1ZS4NCiMg
Y2FibGUgYXR0YWNoDQpyb290QGlteDZxcGRsc29sb3g6fiMgL3VuaXRfdGVzdHMvbWVtdG9vbCAw
eDIxODQxYTQgMQ0KRQ0KUmVhZGluZyAweDEgY291bnQgc3RhcnRpbmcgYXQgYWRkcmVzcyAweDAy
MTg0MUE0DQoNCjB4MDIxODQxQTQ6ICAwOTI0MkYyMA0KDQojIGNhYmxlIGRldGFjaA0Kcm9vdEBp
bXg2cXBkbHNvbG94On4jIC91bml0X3Rlc3RzL21lbXRvb2wgMHgyMTg0MWE0IDENCkUNClJlYWRp
bmcgMHgxIGNvdW50IHN0YXJ0aW5nIGF0IGFkZHJlc3MgMHgwMjE4NDFBNA0KDQoweDAyMTg0MUE0
OiAgMDkzNDExMjANCg0KSWYgeW91IHJlYWQgdGhlIHJlZ2lzdGVyIGFmdGVyIGRldGFjaGluZyB0
aGUgY2FibGUsIHBsZWFzZSBkaXNhYmxlIHJ1bnRpbWUgcG0gdXNpbmcgYmVsb3cgY29tbWFuZHM6
DQoNCmZvciBpIGluICQoZmluZCAvc3lzIC1uYW1lIGNvbnRyb2wgfCBncmVwIHVzYik7ZG8gZWNo
byBvbiA+ICRpO2VjaG8gImVjaG8gb24gPiAkaSI7ZG9uZTsNCg0KPiA+PiBCZXNpZGVzLCB3aGF0
J3MgeW91ciBleHBlY3RhdGlvbiBmb3Igcm5kaXMgYmVoYXZpb3JzIGZvciBib3RoIHdpbmRvd3MN
Cj4gPj4gYW5kIG1hYw0KPiA+DQo+ID4gR29pbmcgYmFjayB0byB0aGUgb3JpZ2luYWwgbWFpbDog
SW4gbXkgYXBwbGljYXRpb24sIEkgd2FudCB0byBkZXRlY3Qgb24gbXkgZ2FkZ2V0DQo+IHdoZW4g
dGhlIFVTQiBjYWJsZSBpcyBwdWxsZWQgZnJvbSBvciBjb25uZWN0ZWQgdG8gdGhlIGhvc3QuIFdp
dGggS2VybmVsIDQuOSBJIGFtDQo+IHVzaW5nIHRoZSBjYXJyaWVyIHN0YXRlIGNoYW5nZSBvZiB0
aGUgUk5ESVMgb3IgRUNNIG5ldHdvcmsgaW50ZXJmYWNlIHRocm91Z2gNCj4gc3lzdGVtZC1uZXR3
b3JrZC4gV2l0aCA0LjE5IGFuZCA1LjEgKHRoZSB0d28gdmVyc2lvbnMgSSBoYWQgdGVzdGVkKSwg
SSBnZXQgdGhlDQo+ICJHYWluZWQgY2FycmllciIgbWVzc2FnZSB3aGVuIEkgY29ubmVjdCBmb3Ig
dGhlIGZpcnN0IHRpbWUsIGJ1dCBhZnRlciBkaXNjb25uZWN0aW5nLA0KPiB0aGUgIkxvc3QgY2Fy
cmllciIgbWVzc2FnZSBkb2Vzbid0IGFwcGVhciBhcyB3aXRoIDQuOS4gSW4gdGhlIG9uZSB0ZXN0
IHdoZXJlIGl0DQo+IGFwcGVhcmVkLCBpdCB0b29rIG92ZXIgMTQgaG91cnMuLi4NCj4gDQogDQpZ
b3UgY291bGQgcG9sbCB0aGUgL3N5cy9jbGFzcy91ZGMvY2lfaGRyYy4wL3N0YXRlIHRvIGtub3cg
dGhlIGNvbm5lY3Rpb24uDQoNCnJvb3RAaW14NnFwZGxzb2xveDp+IyBbICAyMzAuMDc0ODUwXSBj
b25maWdmcy1nYWRnZXQgZ2FkZ2V0OiBoaWdoLXNwZWVkIGNvbmZpZyAjMTogYw0KDQpyb290QGlt
eDZxcGRsc29sb3g6fiMgY2F0IC9zeXMvY2xhc3MvdWRjL2NpX2hkcmMuMC9zdGF0ZSAgPD09PSBj
YWJsZSBhdHRhY2hlZA0KY29uZmlndXJlZA0Kcm9vdEBpbXg2cXBkbHNvbG94On4jIGNhdCAvc3lz
L2NsYXNzL3VkYy9jaV9oZHJjLjAvc3RhdGUgIDw9PT0gY2FibGUgZGV0YWNoZWQNCm5vdCBhdHRh
Y2hlZA0KDQpQZXRlcg0K

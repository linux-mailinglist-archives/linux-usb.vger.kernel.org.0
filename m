Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F047B9A612
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 05:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388378AbfHWDdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 23:33:45 -0400
Received: from mail-eopbgr40084.outbound.protection.outlook.com ([40.107.4.84]:20739
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732929AbfHWDdo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 23:33:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlp9iORZgwiq3Hx0MWmO4JPzwkdcp6CQkRJIngPTk14ZbPBMrR+cFnkUlAMPYLOu1u9DzHmdoFGv0iJW/wvDKjY4NekVQSmF0AD5T5Nej2ThyURVg8EeNqI7iKrTEC5L3LBsu9Vr3JBs7e1pOUaoCdH6nI8LQSfVQpxW/bTq7UyvesRm9xzxOsXT/9dwNcGFvp4hwQxWZhBWu6hvGkJA2Hpb3AzAEmYXePL+J4XDiqUiVJtcq91OkPodyhd2MBe2E8dFJNKkR1IGOt9IvS9btc4hD37SO5a4f2iE1/iAQ6/3oBk6E9wvEFjscgGTxSYC4qgo7c+Th/hDeGoPImhL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6iruWsrLSCBBj4nEQ9+kEAnuhF57p06wA/IJmR+fmQ=;
 b=e9l5gS8VAlNHrt/O+ceKcksSZJIeQCsWExwsu2A3hRMF9TkcyI5N78tzpitRbhCK/CX5/ZjESgPgHGD/OzHtV80OaewPOuiUVNoJfiuiO4nRRrVC7Ddkx/Ln8eTuI14pr1ef/91EM609B/ux4p7tbcigrqWAimbc7oC5F9ctzEXkWhZFAipk45YN+RopNMvVm1MMN6yd61av6ZPu27RIpASdgo+wM8Pi6V05sSLefwEgCgW75erNeWGv5+Qk5tUuaPzm2HXYCVL6IYGhnXmYkEqjCaLXJVoZiVIXZ53/yXZYbEo0vUGCZTXXRf2Mk4ErwpKucxM/x8tz28v5ItvcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6iruWsrLSCBBj4nEQ9+kEAnuhF57p06wA/IJmR+fmQ=;
 b=HD+BJMlcxnpbUSyQwRyxaMrEue7U8ZG6B5TrgL280GhPuMMtU2tVzzsbgYgqDwZUkwrKlierdMX87WDb+zHXLYmLNySEnvChwP5UG9s5uJJx+Kbsk9TH8VABfN6mwZT/8FYaDags2ZM1JFsaeajo16bE9sDfY7YOkLy2ajsekBM=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6031.eurprd04.prod.outlook.com (20.179.24.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Fri, 23 Aug 2019 03:33:38 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 03:33:38 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Ran Wang <ran.wang_1@nxp.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Topic: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Index: AQHVV88qu74WcWDk3UKcEVqZOYC8KacHBDgAgADoJACAAAz3QIAAHWaA
Date:   Fri, 23 Aug 2019 03:33:37 +0000
Message-ID: <20190823033055.ilv5tufoxyei53kf@b29397-desktop>
References: <20190821031602.1030-1-peter.chen@nxp.com>
 <ce4fc3ec-2290-2902-1cf9-95add5b428b9@linux.intel.com>
 <20190823005918.mlcvlbzdai74t6xf@b29397-desktop>
 <DB8PR04MB6826525334C938A6838A896EF1A40@DB8PR04MB6826.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB6826525334C938A6838A896EF1A40@DB8PR04MB6826.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c41a672e-d8c2-43d8-c750-08d7277aaf97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB6031;
x-ms-traffictypediagnostic: VI1PR04MB6031:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB60316D19343C68E3268DA8BA8BA40@VI1PR04MB6031.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(43544003)(6862004)(8936002)(53546011)(66066001)(7736002)(6506007)(6436002)(33716001)(3846002)(8676002)(305945005)(5660300002)(478600001)(6512007)(6486002)(9686003)(186003)(81156014)(81166006)(99286004)(14454004)(53936002)(11346002)(25786009)(26005)(486006)(476003)(446003)(76176011)(6636002)(6246003)(91956017)(71200400001)(71190400001)(6116002)(86362001)(66946007)(66446008)(44832011)(102836004)(66476007)(54906003)(66556008)(76116006)(229853002)(14444005)(256004)(1076003)(4326008)(316002)(64756008)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6031;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vf9WIJT7+cYNYmGLX2vdZUzgh8KsTviT1EmtwDQwqBlyIeVHVzgpcMm2KL5YdQrjNBBCe0FYAAPiyg+oxDBcEI7/dCAK+CseYsWAXYWOOfd9cFqKqQDS63qAttNF4c4mfbivosg2ovkNksbmiUKdzHEEzt+v1oAje7Jsu4liaq6xMIzz/DBkvFRd4DYk3KrmeWtXSLkc2Qek0Mc5baf/unh3MMdrec8E1/Cl0DolaiFEj8aMawuNfYZq/dpHG7lKN39lnzNxJfpZ8Qr4MFFkfK1yZQv/gZ52qqK/yqUXxBfq5B6qs4b/aBiI1pEov8D46FTQIjdCy2XUT9tekUuZm7kBgB2zxg40bkoGKWucT187+myZ2V0rMumZn7weloRKLhEApI3Ox3AGykUYyqxt3mDa03UpGtR9kmy0I3d2Uwo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F44DA6AEA417BE469279B62159952810@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41a672e-d8c2-43d8-c750-08d7277aaf97
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 03:33:38.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e45NPjFlx805sW/+ukwWKQwdlLtPoonyBAFMxWA7Ef1fCvng+jd2saHSxTI8eGDSuf7msHloY4iXXI0VwKiNww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6031
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTktMDgtMjMgMDE6NTk6MjQsIFJhbiBXYW5nIHdyb3RlOg0KPiBISSBQZXRlciwgTWF0aGlh
cywNCj4gDQo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXZpZXcuDQo+IA0KPiBPbiBGcmlkYXksIEF1
Z3VzdCAyMywgMjAxOSAwOTowMiwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPiANCj4gPiBPbiAxOS0w
OC0yMiAxNDowODoyNiwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+IE9uIDIxLjguMjAxOSA2
LjE4LCBQZXRlciBDaGVuIHdyb3RlOg0KPiA+ID4gPiBBY2NvcmRpbmcgdG8geEhDSSAxLjEgQ0g0
LjE5LjQgUG9ydCBQb3dlcjoNCj4gPiA+ID4gCVdoaWxlIENoaXAgSGFyZHdhcmUgUmVzZXQgb3Ig
SENSU1QgaXMgYXNzZXJ0ZWQsDQo+ID4gPiA+ICAgICAgICAgCXRoZSB2YWx1ZSBvZiBQUCBpcyB1
bmRlZmluZWQuIElmIHRoZSB4SEMgc3VwcG9ydHMNCj4gPiA+ID4gICAgICAgICAJcG93ZXIgc3dp
dGNoZXMgKFBQQyA9IOKAmDHigJkpIHRoZW4gVkJ1cyBtYXkgYmUgZGVhc3NlcnRlZA0KPiA+ID4g
PiAgICAgICAgIAlkdXJpbmcgdGhpcyB0aW1lLiBQUCAoYW5kIFZCdXMpIHNoYWxsIGJlIGVuYWJs
ZWQgaW1tZWRpYXRlbHkNCj4gPiA+ID4gICAgICAgICAJdXBvbiBleGl0aW5nIHRoZSByZXNldCBj
b25kaXRpb24uDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBWQnVzIGdsaXRjaCBtYXkgY2F1c2Ugc29t
ZSBVU0IgZGV2aWNlcyB3b3JrIGFibm9ybWFsLCB3ZSBvYnNlcnZlDQo+ID4gPiA+IGl0IGF0IE5Y
UCBMUzEwMTJBRldSWS9MUzEwNDNBUkRCL0xYMjE2MEFRRFMvTFMxMDg4QVJEQiBwbGF0Zm9ybXMu
DQo+ID4gVG8NCj4gPiA+ID4gYXZvaWQgdGhpcyBWYnVzIGdsaXRjaCwgd2UgY291bGQgc2V0IFBQ
IGFzIDAgYmVmb3JlIEhDUlNULCBhbmQgdGhlDQo+ID4gPiA+IFBQIHdpbGwgYmFjayB0byAxIGFm
dGVyIEhDUlNUIGFjY29yZGluZyB0byBzcGVjLg0KPiA+ID4NCj4gPiA+IElzIHRoaXMgZ2xpdGNo
IGNhdXNpbmcgaXNzdWVzIGFscmVhZHkgYXQgdGhlIGZpcnN0IHhIQyByZXNldCB3aGVuIHdlDQo+
ID4gPiBhcmUgbG9hZGluZyB0aGUgeGhjaSBkcml2ZXIsICBvciBvbmx5IGxhdGVyIHJlc2V0cywg
bGlrZSB4SEMgcmVzZXQgYXQgcmVzdW1lPw0KPiA+IA0KPiA+IFRoZSBmaXJzdCB0aW1lLCBSYW4g
d291bGQgeW91IHBsZWFzZSBjb25maXJtPw0KPiANCj4gTXkgdW5kZXJzdGFuZCBpcyB0aGlzIHdp
bGwgaGFwcGVuZWQgd2hlbmV2ZXIgUFAgaXMgc2V0IHRvIDAsIHN1Y2ggYXMgeEhDSSByZXNldC4N
Cj4gU28gSSB0aGluayBpdCBtaWdodCBhbHNvIGJlIG9ic2VydmVkIGR1cmluZyByZXN1bWUgaWYg
eEhDIGRvIHJlc2V0Lg0KDQpZZXMsIFZidXMgZ2xpdGNoIHNob3VsZCBleGlzdHMgd2hlbmV2ZXIg
d2UgZG8gY29udHJvbGxlciByZXNldCwgSSB0aG91Z2h0DQp5b3Ugb25seSBtZWV0IHRoaXMgaXNz
dWUgZHVyaW5nIGJvb3RzIHVwLg0KDQo+IA0KPiBIb3dldmVyLCBhY2NvcmRpbmcgdG8gbXkgcHJl
dmlvdXMgdGVzdGluZywgaXQgbWlnaHQgYmUgdG9vIGxhdGUgdG8NCj4gZG8gdGhpcyBwb3J0IHBv
d2VyIG9mZiBpbiB4aGNpX3Jlc2V0KCksIGFjdHVhbGx5IHRoZSBWQlVTIHdpbGwgYXNzZXJ0IG9u
Y2UgRFdDMyBkcml2ZXINCj4gc2V0IElQIHRvIGhvc3QgbW9kZSAoYmVmb3JlIGRvaW5nIHhIQyBy
ZXNldCkuIFNvIHRoZSBnbGl0Y2ggc3RpbGwgY2FuIGJlIG9ic2VydmVkIG9uIHRoZSBzY29wZTsN
Cj4gSSBoYXZlIG1vcmUgaXNzdWUgZGVzY3JpcHRpb24gaW4gYW5vdGhlciBwYXRjaCBkaXNjdXNz
aW9uIGFib3V0IHRoaXMsIHBsZWFzZSBzZWUNCj4gDQo+IGxvcmUua2VybmVsLm9yZy9wYXRjaHdv
cmsvcGF0Y2gvMTAzMjQyNS8NCj4gUXVvdGVkIGZyb20gaXQ6DQo+IEFjdHVhbGx5IEkgaGF2ZSBk
b25lIGV4cGVyaW1lbnQgbGlrZSB3aGF0IHlvdSBzdWdnZXN0ZWQgKGluIHhoY2ktcGxhdC5jKSwg
YnV0IHRoZSB0aW1pbmcNCj4gc2VlbXMgdG9vIGxhdGUtLW1ha2luZyBWQlVTIHdhdmVmb3JtIGxv
b2sgbGlrZSBhIHNxdWFyZSB3YXZlIGFzIGJlbG93Og0KPiANCj4gICAgICAgICAgICAgICBIZXJl
IERXQzMgZW5hYmxlIGhvc3QgbW9kZSwgVkJVUyBvbg0KPiAgICAgICAgICAgICAgIHwNCj4gKzVW
ICAgICAgICAgIC8tLS0tLS0tLS1cIDQwbXMgIC8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0u
Li4uDQo+IDBWICBfX19fX19fXy8gICA5MG1zICAgXF9fX19fXy8NCj4gICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgICAgfCAgICAgICAgICAgDQo+ICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAgIEhlcmUgZG8geGhjaSByZXNldCwgVkJVUyBiYWNrIHRvICs1ViBhZ2Fpbg0KPiAgICAgICAg
ICAgICAgICAgICAgICAgIEhlcmUgc2V0IGFsbCBQT1JUU0NbUFBdIHRvIDAgaW4geGhjaV9nZW5f
c2V0dXAoKQ0KPiANCj4gU28gSSBhbSBhZnJhaWQgdGhlIHNvbHV0aW9uIG1pZ2h0IGhhdmUgdG8g
YmUgYWRkZWQgaW4gRFdDMyBjb3JlIGRyaXZlciB3aGVyZSBqdXN0IGFmdGVyIGhvc3QgbW9kZSBl
bmFibGluZyBjb2RlIGlmIHdhbnQgZml4IHRoaXMgOigNCj4gDQoNClBlciBzcGVjIDQuMTkuNCBQ
b3J0IFBvd2VyOg0KDQpXaGV0aGVyIGFuIHhIQyBpbXBsZW1lbnRhdGlvbiBzdXBwb3J0cyBwb3J0
IHBvd2VyIHN3aXRjaGVzIG9yIG5vdCwNCml0IHNoYWxsIGF1dG9tYXRpY2FsbHkgZW5hYmxlIFZC
dXMgb24gYWxsIFJvb3QgSHViIHBvcnRzIGFmdGVyIGENCkNoaXAgSGFyZHdhcmUgUmVzZXQgb3Ig
SENSU1QuDQoNClJhbidzIG9ic2VydmF0aW9uIGNvbmZpcm1lZCBpdCwgUFAgaXMgYXNzZXJ0ZWQg
b25jZSB4SENJIGlzIGVuYWJsZWQuDQpGcm9tIHRoZSBjb2RlLCB0aGUgSENSU1Qgd2lsbCBiZSBh
dCBib290cyB1cCBhbmQgc3lzdGVtIHJlc3VtZS4NClNvLCBpdCBzZWVtcyB3ZSBjYW4ndCBrZWVw
IFBQIGFsd2F5cyBhc3NlcnRlZC4gRm9yIHhIQ0ksIHRvIGF2b2lkDQpWYnVzIGdsaXRjaCB0b3Rh
bGx5LCB3ZSBtYXkgaGF2ZSB0byBjb250cm9sIFZidXMgd2l0aG91dCBQUA0KKGVnLCBjb25maWd1
cmUgUFAgcGluIGFzIEdQSU8pLg0KDQpQZXRlcg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBSYW4gDQo+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBSZXBvcnRlZC1ieTogUmFuIFdhbmcgPHJhbi53YW5nXzFA
bnhwLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBu
eHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyB8
IDE1ICsrKysrKysrKysrKysrLQ0KPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGluZGV4DQo+ID4g
PiA+IDZiMzRhNTczYzNkOS4uZjVhN2I1ZDYzMDMxIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2kuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ku
Yw0KPiA+ID4gPiBAQCAtMTY3LDcgKzE2Nyw4IEBAIGludCB4aGNpX3Jlc2V0KHN0cnVjdCB4aGNp
X2hjZCAqeGhjaSkNCj4gPiA+ID4gICB7DQo+ID4gPiA+ICAgCXUzMiBjb21tYW5kOw0KPiA+ID4g
PiAgIAl1MzIgc3RhdGU7DQo+ID4gPiA+IC0JaW50IHJldDsNCj4gPiA+ID4gKwlpbnQgcmV0LCBp
Ow0KPiA+ID4gPiArCXUzMiBwb3J0c2M7DQo+ID4gPiA+ICAgCXN0YXRlID0gcmVhZGwoJnhoY2kt
Pm9wX3JlZ3MtPnN0YXR1cyk7IEBAIC0xODEsNiArMTgyLDE4IEBAIGludA0KPiA+ID4gPiB4aGNp
X3Jlc2V0KHN0cnVjdCB4aGNpX2hjZCAqeGhjaSkNCj4gPiA+ID4gICAJCXJldHVybiAwOw0KPiA+
ID4gPiAgIAl9DQo+ID4gPiA+ICsJLyoNCj4gPiA+ID4gKwkgKiBLZWVwIFBPUlRTQy5QUCBhcyAw
IGJlZm9yZSBIQ1JTVCB0byBlbGltaW5hdGUNCj4gPiA+ID4gKwkgKiBWYnVzIGdsaXRjaCwgc2Vl
IENIIDQuMTkuNC4NCj4gPiA+ID4gKwkgKi8NCj4gPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgSENT
X01BWF9QT1JUUyh4aGNpLT5oY3NfcGFyYW1zMSk7IGkrKykgew0KPiA+ID4gPiArCQlfX2xlMzIg
X19pb21lbSAqcG9ydF9hZGRyID0gJnhoY2ktPm9wX3JlZ3MtDQo+ID4gPnBvcnRfc3RhdHVzX2Jh
c2UgKw0KPiA+ID4gPiArCQkJCU5VTV9QT1JUX1JFR1MgKiBpOw0KPiA+ID4gPiArCQlwb3J0c2Mg
PSByZWFkbChwb3J0X2FkZHIpOw0KPiA+ID4gPiArCQlwb3J0c2MgJj0gflBPUlRfUE9XRVI7DQo+
ID4gPiA+ICsJCXdyaXRlbChwb3J0c2MsIHBvcnRfYWRkcik7DQo+ID4gPg0KPiA+ID4gTm90IGFs
bCBiaXRzIHJlYWQgZnJvbSBQT1JUU0Mgc2hvdWxkIGJlIHdyaXR0ZW4gYmFjaywgeW91IG1pZ2h0
IG5lZWQNCj4gPiA+IHBvcnRzYyA9IHhoY2lfcG9ydF9zdGF0ZV90b19uZXV0cmFsKHBvcnRzYykg
aGVyZS4NCj4gPiANCj4gPiBXaWxsIGNoYW5nZS4NCj4gPiANCj4gPiA+DQo+ID4gPiBOb3JtYWxs
eSBJJ2QgcmVjb21tZW5kIHVzaW5nIHRoZSB4aGNpX3NldF9wb3J0X3Bvd2VyKCkgaGVscGVyIGlu
c3RlYWQsDQo+ID4gPiBidXQgaWYgdGhpcyBpcyBpcyBuZWVkZWQgYXQgZHJpdmVyIGxvYWQgdGlt
ZSB0aGVuIHBvcnQgYXJyYXlzIG1heSBub3QgYmUgc2V0IHVwDQo+ID4geWV0Lg0KPiA+ID4geGhj
aV9zZXRfcG9ydF9wb3dlcigpIHdvdWxkIHRha2UgY2FyZSBvZiBwb3NzaWJsZSBBQ1BJIG1ldGhv
ZCBjYWxscywgYW5kIGFkZA0KPiA+IHNvbWUgZGVidWdnaW5nLg0KPiA+ID4NCj4gPiANCj4gPiBJ
dCBpcyBuZWVkZWQgYXQgbG9hZCB0aW1lLCBzbyBJIGRpZCBub3QgdXNlIHBvcnQgYXJyYXkuDQo+
ID4gDQo+ID4gPiBOb3Qgc3VyZSBpZiB0aGlzIHdpbGwgaW1wYWN0IHNvbWUgb3RoZXIgcGxhdGZv
cm1zLCBtYXliZSBpdCB3b3VsZCBiZQ0KPiA+ID4gYmV0dGVyIHRvIG1vdmUgdGhpcyB0byBhIHNl
cGFyYXRlIGZ1bmN0aW9uLCBhbmQgY2FsbCBpdCBiZWZvcmUgeGhjaV9yZXNldCgpIGlmIGENCj4g
PiBxdWlyayBpcyBzZXQuDQo+ID4gPg0KPiA+IA0KPiA+IEl0IGZvbGxvd3Mgc3BlYywgbm90IGF0
IHF1aXJrLiBXZSB0YWxrZWQgd2l0aCBTeW5vcHNpcyBlbmdpbmVlcg0KPiA+IChjYXNlOiA4MDAx
MjM1NDc5KSwgdGhleSBjb25maXJtZWQgdGhpcyBiZWhhdmlvdXIgZm9sbG93cyBzcGVjLg0KPiA+
IEJlc2lkZXMsIEkgdHJpZWQgYXQgYm90aCBkd2MzIGFuZCBjYWRlbmNlMyB4SENJIHBsYXRmb3Jt
cywgdGhlIFBPUlRfUE9XRVINCj4gPiB3aWxsIGJlIHNldCBhZ2FpbiBhZnRlciBjb250cm9sbGVy
IHNldC4NCj4gPiANCj4gPiBXaGF0J3MgcG90ZW50aWFsIGlzc3VlIHlvdSBjb25zaWRlcj8NCj4g
PiANCj4gPiBUaGFua3MsDQo+ID4gUGV0ZXI=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B1C1BEEC6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 05:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgD3D6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 23:58:07 -0400
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:42405
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgD3D6E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 23:58:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cddAa9qbpgndAULwz6vNRSkW4vvST8cV1Ob1/wVUjZNZ8qiDBnO3as/GThVK6Q/TDCWEmTj9UHam/GacDbTsc2vZ1bMDPBoPRoti0cZXqyGlRSXqIY0b16PZxW40pzd2MSGcxrf+AoWTN9gm2SQ+g2otVPnuFZuVwf8xTQlBOpUxl6Mgkm62WZ9rsxRd/iPUJb0HSPWSQ5ssm2GWn5dV65x1SQMR2VwURSaj7AmvQnT47zAP513eUcVicevzQYYtRdFgFGi9GqjA4C/51jhhTyfRjS3rk1nHsH6PiSRk54mYuuF8mMM7kNOJZamm6bnb4aAenjmOenzwTVnBBXzevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vys34O6IpxN3Dzuc+9TaAMzWIqcDsda77yIy9We7Co=;
 b=VyK6ZYqIzvnlejdVZ59xm/G4wtRDK4iBcFJpdN5iMVqhOhnzlDGSY0j7DM+pj9lvtTIgKclCeKinej0hh7A4G5MjlkIBVdPICsaTNkmgi/Wb/VJIT09iBLnSsRhBfnTtqz3cdGCSzkehrb9WpwcOzV+bNGxOxmZNyIlxLBmvOb1tfcuahJhGeMoTvBH4kR1DeQW6jeFOa0PBBIZVOSwGf5NsxTb64k9oZ6K3xcIDg2m9ah7DF4mSCvRRcxm590LP6Iw+cB2+pv59mgxgjzr+k7rhVq6MK7j8K3ijx/guHszQKD2s4RwrCf/8sgJH/DXJcNsoBSUKtIa+/WZC0i8Mmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vys34O6IpxN3Dzuc+9TaAMzWIqcDsda77yIy9We7Co=;
 b=PKKTAkWQnN7S8c4ZqaWwXznz+J8U4eoX8/ELkJ4nHYbJGPkpBjCxaZyj7N9rgHEiYvri8qa1FISWDpmHWh5vdC0wTh8uhcoloT21PO+nBfa5wzajI4ZiyouDx9FwHc5GQiskAaaOgHQZtmLuOnw9i1sMyhMODXZ0M6kXoVqCEJU=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 03:58:00 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 03:58:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: RE: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Topic: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Index: AQHWHOMWqMCgbiXkIk6n6QhvkyzwnaiPbzCAgAFsgQCAACy2sA==
Date:   Thu, 30 Apr 2020 03:57:59 +0000
Message-ID: <AM7PR04MB71572516EE7BEEF30FA209448BAA0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
 <456f864b86a72ab9490ce095d5ba3f59b39d6a09.1588025916.git.thinhn@synopsys.com>
 <20200429031549.GB20222@b29397-desktop>
 <6c13582a-476e-a217-32ca-482dd78793b6@synopsys.com>
In-Reply-To: <6c13582a-476e-a217-32ca-482dd78793b6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.171.74.255]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81b75fad-9b9a-4aed-8a58-08d7ecbaaca0
x-ms-traffictypediagnostic: AM7PR04MB6823:
x-microsoft-antispam-prvs: <AM7PR04MB6823DCC32E3F1A52E8FF0BF88BAA0@AM7PR04MB6823.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0389EDA07F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 40QQXHVkmr1UoGXEoJhxYlcBaltlw0Pqc9UfD/k7o6Kx3vt6KzBkDv1Qp7YCdFptnyiDXLHfHMMOVKJgReCctmoGh/rJ7TqywMEggWXyYFaLlIhuN8bgUCvgHfj2IzqN9npdy4s1JGghaT9ANNjN1jADE05EJOxIUI5nmxfONUGgVaauFdl25PBpXmquKEDPAJHkimuT71M0ts3lT5nezxKVhl8vmNKqXyOYiklqmBo3MN2kuE7d8umejBcXJeCIvwMbf/tIzHKAuQ2aLVwsybZp8cPiS/YimURbiFtyQOhtwh9Vfn+WY+LFCb2tuuLb85NVvn/4gabP/saEK/qjiOsBU008zmqzm1/kNo0qjxjoVUPKfIDf03N2GwNLlCqJHSA2LAJAm1WbGX0v1EZO/vRCyzB4A8zb9V7gC8RJmSz4CIYmS5jNE5zZoLtzzYrK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(186003)(71200400001)(44832011)(53546011)(66556008)(66446008)(6916009)(64756008)(66476007)(54906003)(5660300002)(478600001)(9686003)(316002)(66946007)(7696005)(26005)(55016002)(86362001)(52536014)(2906002)(76116006)(8676002)(33656002)(4326008)(6506007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: q7O0NfCYWn58ZloaDVIaTozzplGNvflKZT6tKYtd/UmYGA8R5rwfAbTFk8CeMPakaeHAp+h/1GJUkEfEeY86m9/ioKBUzSSryhUtCq+ggo9obybIp3WYaqSkqTC0CQHTHwHVFf17GxR9AWorl7H4WDrOg735U+M4j3OthU6+3lugKHRXoM2vfkPRP2LrpKO+mS/NPBqHXvMozXbG9bCRDdRwR+/YVkwWzk4/abjdmF8EGpdaoNd2k3VMg4kF//C31fnSZ3Qo/XqQLB/HbwXyZZZuU5eAJDw8WRNIgr/E7xLw4SALVuFHZL/GpM9GwUm2+6N5xnmz3vbNZX0fF0MqVKqyOZlXyCGv5EHObNR03lnVaW+cpnZVyAtfvLanu41ECiIwWGRcQ35VUA2XO50t46qoN090dxp2qyIuM8pFkMQLV3fPv1ZW94vcgcjIP8UeCwlTvY/uXmBoOBIYMg0FNgAe3wZRcDspCio6gx/82rEKPVZRHV6KKqpTC7knNw5tDDJfXvsMoJ1kzPxIrcHmPyLOxCgQwL6e3q762nVU1ithdr1Jw30VeliDo7qb7hpntGVrL565hk1M6M1icIiflrhEZuu0HygIRymPcHkV9N3Y3H9FmRj3o7J7rWBiJebTMqpqhdfy8su4gLa/zkWKUjqo/1Z5GdU3Ox5AkvcMeD4p7lpixUBGwjZ/AJYh+dWI6n3hyXC+K0MWQDIIB1iIKjK1IA5s/4IvjTT0IuIdjQCMrK99g74xZOHBfIoN4Ib80z8GgIMaxUcuycWi/0bZnOvQdCATce1YSr0/yCnevxY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b75fad-9b9a-4aed-8a58-08d7ecbaaca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 03:57:59.9553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z42RRfF/2I9ajUedRAijYTZ2AAV1fDkl6kmvU36p2rBc30qqgvU1a/JRQaBU5aYWK20M/7LpYLqAUrp2l0I7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+IE9uIDIwLTA0LTI3IDE1OjI3OjQxLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4+IEEg
dHJhbnNmZXIgaXMgY29tcG9zZWQgb2Ygb25lIG9yIG1vcmUgdXNiX3JlcXVlc3RzLiBDdXJyZW50
bHksIG9ubHkNCj4gPj4gdGhlIGZ1bmN0aW9uIGRyaXZlciBrbm93cyB0aGlzIGJhc2VkIG9uIGl0
cyBpbXBsZW1lbnRhdGlvbiBhbmQgaXRzDQo+ID4+IGNsYXNzIHByb3RvY29sLiBIb3dldmVyLCBz
b21lIHVzYiBjb250cm9sbGVycyBuZWVkIHRvIGtub3cgdGhpcyB0bw0KPiA+PiB1cGRhdGUgaXRz
IHJlc291cmNlcy4gRm9yIGV4YW1wbGUsIHRoZSBEV0MzIGNvbnRyb2xsZXIgbmVlZHMgdGhpcw0K
PiA+PiBpbmZvIHRvIHVwZGF0ZSBpdHMgaW50ZXJuYWwgcmVzb3VyY2VzIGFuZCBpbml0aWF0ZSBk
aWZmZXJlbnQgc3RyZWFtcy4NCj4gPj4NCj4gPj4gSW50cm9kdWNlIGEgbmV3IGZpZWxkIGlzX2xh
c3QgdG8gdXNiX3JlcXVlc3QgdG8gaW5mb3JtIHRoZSBjb250cm9sbGVyDQo+ID4+IGRyaXZlciB3
aGV0aGVyIHRoZSByZXF1ZXN0IGlzIHRoZSBsYXN0IG9mIGl0cyB0cmFuc2Zlci4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPiA+
PiAtLS0NCj4gPj4gICBpbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaCB8IDIgKysNCj4gPj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaCBiL2luY2x1ZGUvbGludXgvdXNiL2dhZGdldC5oDQo+
ID4+IGluZGV4IGU5NTljMDlhOTdjOS4uNzQyYzUyZjdlNDcwIDEwMDY0NA0KPiA+PiAtLS0gYS9p
bmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPiA+PiArKysgYi9pbmNsdWRlL2xpbnV4L3VzYi9n
YWRnZXQuaA0KPiA+PiBAQCAtNTAsNiArNTAsNyBAQCBzdHJ1Y3QgdXNiX2VwOw0KPiA+PiAgICAq
IEBzaG9ydF9ub3Rfb2s6IFdoZW4gcmVhZGluZyBkYXRhLCBtYWtlcyBzaG9ydCBwYWNrZXRzIGJl
DQo+ID4+ICAgICogICAgIHRyZWF0ZWQgYXMgZXJyb3JzIChxdWV1ZSBzdG9wcyBhZHZhbmNpbmcg
dGlsbCBjbGVhbnVwKS4NCj4gPj4gICAgKiBAZG1hX21hcHBlZDogSW5kaWNhdGVzIGlmIHJlcXVl
c3QgaGFzIGJlZW4gbWFwcGVkIHRvIERNQQ0KPiA+PiAoaW50ZXJuYWwpDQo+ID4+ICsgKiBAaXNf
bGFzdDogSW5kaWNhdGVzIGlmIHRoaXMgcmVxdWVzdCBpcyB0aGUgbGFzdCBvZiBhIHRyYW5zZmVy
Lg0KPiA+IFdvdWxkIHlvdSBwbGVhc2UgZGVzY3JpYmUgdGhlIHVzZSBjYXNlIGZvciBpdCwgYW5k
IHdoYXQncyAndHJhbnNmZXInDQo+ID4gYW5kICdyZXF1ZXN0JyBpbiB5b3VyIHVzZSBjYXNlPw0K
PiA+DQo+IA0KPiBUaGUgdHJhbnNmZXIgc2l6ZSBpcyBkZWZpbmVkIGJ5IGEgY2xhc3MgcHJvdG9j
b2wuIFRoZSBmdW5jdGlvbiBkcml2ZXIgd2lsbCBkZXRlcm1pbmUNCj4gaG93IG1hbnkgdXNiX3Jl
cXVlc3RzIGFyZSBuZWVkZWQgdG8gZnVsZmlsbCB0aGF0IHRyYW5zZmVyLg0KPiANCg0KVGhhbmtz
IGZvciB5b3VyIGluZm9ybWF0aW9uLg0KDQpJZiAndHJhbnNmZXIgc2l6ZScgaGVyZSBpcyBzb2Z0
d2FyZSBjb25jZXB0LCB3aHkgY29udHJvbGxlciBuZWVkcyB0byBrbm93PyBUaGUgZ2VuZXJhbA0K
Y29udHJvbGxlciBpbnRlcm5hbCBsb2dpYyBkb2Vzbid0IGNhcmUgY2xhc3MgcHJvdG9jb2wsIGl0
IG9ubHkgY2FyZXMgVFJCIGNoYWluIHNvZnR3YXJlIHByZXBhcmVzLg0KDQo+IEZvciBleGFtcGxl
LCBpbiBNU0MsIGEgUkVBRC9XUklURSBjb21tYW5kIGNhbiByZXF1ZXN0IGZvciBhIHRyYW5zZmVy
IHNpemUgdXANCj4gdG8gKDUxMiAqIDJeMzEtMSkgYnl0ZXMuIEl0J2QgYmUgdG9vIGxhcmdlIGZv
ciBhIHNpbmdsZSB1c2JfcmVxdWVzdCwgd2hpY2ggaXMgd2h5IHRoZQ0KPiBtYXNzX3N0b3JhZ2Ug
ZnVuY3Rpb24gZHJpdmVyIGxpbWl0cyBlYWNoIHJlcXVlc3QgdG8gMTZLQiBtYXggYnkgZGVmYXVs
dC4gQSBNU0MNCj4gY29tbWFuZCBpdHNlbGYgaXMgYSB0cmFuc2Zlciwgc2FtZSB3aXRoIGl0cyBz
dGF0dXMuDQo+IA0KPiBUaGlzIGlzIGEgc2ltaWxhciBjYXNlIGZvciBVQVNQLiBIb3dldmVyLCB0
aGUgZl90Y20gYW5kIHRoZSB0YXJnZXQgZHJpdmVycyBjdXJyZW50DQo+IGltcGxlbWVudGF0aW9u
IG9ubHkgdXNlIGEgc2luZ2xlIHJlcXVlc3QgcGVyIHRyYW5zZmVyLg0KPiAoVGhpcyBuZWVkcyB0
byBiZSBmaXhlZCwgYWxvbmcgd2l0aCBzb21lIG90aGVyIGlzc3VlcyBpbiBmX3RjbSkuDQo+IA0K
PiBUaGUgdXNlIGNhc2UgaGVyZSBpcyB0aGF0IERXQzN4IGNvbnRyb2xsZXIgbmVlZHMgdG8gdXBk
YXRlIGl0cyByZXNvdXJjZXMNCj4gd2hlbmV2ZXIgYSB0cmFuc2ZlciBpcyBjb21wbGV0ZWQuIFRo
aXMgaXMgYSByZXF1aXJlbWVudCBmb3Igc3RyZWFtcyB3aGVuIGl0IG5lZWRzDQo+IHRvIGZyZWUg
dXAgc29tZSByZXNvdXJjZXMgZm9yIGRpZmZlcmVudCBzdHJlYW0gdHJhbnNmZXJzLiBUaGUgZnVu
Y3Rpb24gZHJpdmVyIG11c3QNCj4gcGFzcyB0aGlzIGluZm9ybWF0aW9uIHRvIHRoZSBjb250cm9s
bGVyIGRyaXZlciBmb3Igc3RyZWFtcyB0byB3b3JrIHByb3Blcmx5Lg0KPiANCg0KRG9lcyB0aGUg
Y29udHJvbGxlciBjYXNlIGFib3V0IHN0cmVhbSBpbmZvcm1hdGlvbiBvciB0aGUgdHJhbnNmZXIg
aW5mb3JtYXRpb24/DQoNCj4gUG90ZW50aWFsbHksIGFub3RoZXIgdXNlIGNhc2UgZm9yIHRoaXMg
aXMgdG8gdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIG9uDQo+IHVzYl9kZXF1ZXVlX3JlcXVlc3Qo
KS4gQnkgcHJvdmlkaW5nIHRoZSBjb25jZXB0IG9mIGEgdHJhbnNmZXIsIHdlIGNhbiBzYXkgdGhh
dA0KPiBkZXF1ZXVpbmcgYW4gaW4tZmxpZ2h0IHJlcXVlc3Qgd2lsbCBjYW5jZWwgdGhlIHRyYW5z
ZmVyLCBhbmQgYW55IGluY29tcGxldGUgcmVxdWVzdA0KPiB3aXRoaW4gdGhlIHRyYW5zZmVyIG11
c3QgYmUgZ2l2ZW4gYmFjayB0byB0aGUgZnVuY3Rpb24gZHJpdmVyLiBUaGlzIHdvdWxkIG1ha2UN
Cj4gc2Vuc2UgZm9yIGNvbnRyb2xsZXJzIHRoYXQgdXNlIFRSQiByaW5nIGJ1ZmZlciBhbmQgZGVx
dWV1ZS9lbnF1ZXVlIFRSQiBwb2ludGVycy4NCj4gQnV0IHRoaXMgaWRlYSBzdGlsbCBuZWVkcyBt
b3JlIHRob3VnaHRzLg0KPiANCiANCkkgdGhpbmsgY2xhc3MgZHJpdmVyIG5lZWRzIHRvIGNvbnNp
ZGVyIHRoYXQsIHRoZSBjb250cm9sbGVyIGRyaXZlciBvbmx5IG5lZWRzIHRvIGhhbmRsZQ0KcmVx
dWVzdCBhbmQgcmVsYXRlZCBUUkJzLg0KDQpQZXRlcg0KDQo=

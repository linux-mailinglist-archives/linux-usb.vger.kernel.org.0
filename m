Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE9860159
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 09:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbfGEHV1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 03:21:27 -0400
Received: from mail-eopbgr30112.outbound.protection.outlook.com ([40.107.3.112]:21825
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbfGEHV1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 03:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBwo2CIPRyDhMA9J04pUl1iHeOVEiieGFh+lNIL1U44=;
 b=BzBky75N9G4q42D5aiXo8IVuF0KAw675uG6JEz/uPH3Ye+o8aHsVFqxFqlLo1qbqU61v+Gpl7pQY2nSc5GByUS/YYliYR0dNzXsuoU4kY2ep0HhgY3hemcrRWFLP/3pcpNLZ85pGm6U85uKm0+4ucI6uHjfVjpqKda1QJEJNNm4=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB5905.eurprd02.prod.outlook.com (52.132.214.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 07:21:22 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2032.019; Fri, 5 Jul 2019
 07:21:22 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PAABPEL0AAkgO9AAAj0V4AAA/2TMAACNVdgAF1YWiAANNltoA==
Date:   Fri, 5 Jul 2019 07:21:22 +0000
Message-ID: <AM0PR02MB3841FC93308A86E88F1D4A0BC5F50@AM0PR02MB3841.eurprd02.prod.outlook.com>
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
 <AM0PR02MB3841A430DEB6ECEC0CBEE9B6C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <VI1PR04MB5327B582FFEF33AA52F7E6C58BFA0@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5327B582FFEF33AA52F7E6C58BFA0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:784c:7665:d0c5:734b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b84edb15-5d6d-4142-5cb1-08d7011961fd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB5905;
x-ms-traffictypediagnostic: AM0PR02MB5905:
x-microsoft-antispam-prvs: <AM0PR02MB5905E1754F458C1C066315DCC5F50@AM0PR02MB5905.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(366004)(346002)(136003)(376002)(40764003)(189003)(199004)(6506007)(102836004)(186003)(99286004)(76176011)(7696005)(46003)(71190400001)(6116002)(508600001)(71200400001)(9686003)(86362001)(6246003)(53936002)(55016002)(54906003)(446003)(76116006)(68736007)(8676002)(33656002)(5660300002)(229853002)(81156014)(256004)(11346002)(305945005)(44832011)(316002)(81166006)(2906002)(25786009)(8936002)(73956011)(476003)(6862004)(66446008)(14454004)(486006)(4326008)(52536014)(6436002)(7736002)(66476007)(74316002)(64756008)(66556008)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB5905;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: unwpCY+5oQ/cxveo9KByrjV6x2Lp9ZPRCQHB7kQ8mh/lYWBa5DXyWrB2tndHAeDMPDnLyTEvvN3iuO7+Fy1383o+zdsXnDVAMBveXXK8YTVisqVY9yq7wPociv8X9shbO2OZ39lHOjn8fAzOuyz9dw9VNuZgB+IdjohU59MSauoqjCIqOghl3zKoa6qLT5p1IIZETeR65GnKGbTh6pemgNM502oKUC486OgzFecia7MSf7Unses2RJc+v0pw9/8EbhI3mxYiI3xhG4UrEHFQ5+JRKFsNX7aYgIDYjYQ7pksUNUjxw+aC6n4Fotni2ZFGV3XHfsWgu/lLuk9z9yeCJ/2WhtY1LuUYMXm3mySw3GNea/qnoPAC8EejZRdBtsxzldW/V1MPiBpuBasHWu/HaDT9DND8YZFR+V1DLNLfyQ0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84edb15-5d6d-4142-5cb1-08d7011961fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 07:21:22.4419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5905
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQoNCj4+IA0KPj4gPiBEbyB5b3UgaGF2ZSBhbnkgY29tcG9uZW50cyBhdCBWQlVT
Pw0KPj4gDQo+PiBUaGVyZSB3ZXJlIEVTRCBwcm90ZWN0aW9uIGRpb2RlcyB0aGF0IGNvbm5lY3Rl
ZCBEKy9ELSB3aXRoIFZCVVMuICBXZSANCj4+IHJlbW92ZWQgdGhvc2UgZnJvbSB0aGUgUENCIGFu
ZCB0aGUgcHJvYmxlbSBpcyBnb25lIG1lYW5pbmcgVkJVUyANCj4+IGRpc2NoYXJnZXMgYXMgZXhw
ZWN0ZWQsIHRoZSBjb250cm9sbGVyIHJ1bnRpbWUtc3VzcGVuZHMgYW5kIHVsdGltYXRlbHkgDQo+
PiBzeXN0ZW1kLW5ldHdvcmtkIHJlcG9ydHMgYSBsb3N0IGNhcnJpZXIuDQo+PiBUaG9zZSBkaW9k
ZXMgaGF2ZW4ndCBiZWVuIGEgcHJvYmxlbSB3aXRoIDQuOSwgdGhvdWdoLiBEaWQgc29tZXRoaW5n
IGNoYW5nZSBoZXJlPw0KPj4gSSBzdXBlcmZpY2lhbGx5IGxvb2tlZCBhdCBTUlAsIEhOUCBhbmQg
QURQLCBidXQgbm90aGluZyBjYXVnaHQgbXkgZXllLi4uDQo+PiANCj4gDQo+IFlvdSBuZWVkIHRv
IGRpc2FibGUgT1RHIHN0dWZmcyBhdCBkdHMgaWYgT1RHIGFuZCBPVEdfRlNNIGFyZSBlbmFibGVk
IGF0IGNvbmZpZ3VyYXRpb24uDQo+IFNlZSBiZWxvdzoNCj4NCj4gNjU1ICZ1c2JvdGcxIHsNCj4g
NjU2ICAgICAgICAgdmJ1cy1zdXBwbHkgPSA8JnJlZ191c2Jfb3RnMV92YnVzPjsNCj4gNjU3ICAg
ICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gNjU4ICAgICAgICAgcGluY3RybC0w
ID0gPCZwaW5jdHJsX3VzYl9vdGcxX2lkPjsNCj4gNjU5ICAgICAgICAgc3JwLWRpc2FibGU7DQo+
IDY2MCAgICAgICAgIGhucC1kaXNhYmxlOw0KPiA2NjEgICAgICAgICBhZHAtZGlzYWJsZTsNCj4g
NjYyICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA2NjMgfTsNCj4NCj4gSXMgaXQgYXZhaWxh
YmxlIHRvIHNoYXJlIHlvdXIgVVNCIHBhcnQgc2NoZW1hdGljPw0KDQpXZSBoYXZlIGRlY2lkZWQg
dG8gY3JlYXRlIGEgaGFyZHdhcmUgcmV2aXNpb24uIFRoaW5ncyBsaWtlIHRoZSAiVVNCIFBsdWdn
ZWQtSW4gRGV0ZWN0b3IiIHRoYXQgZHJpdmUgRFAgYW5kIEROIGhpZ2ggd2lsbCBjaGFyZ2UgdXAg
VkJVUyBpbiBvdXIgY3VycmVudCBkZXNpZ24gYW5kIGFyZSBsaWtlbHkgb25lIG9mIHRoZSAoaWYg
bm90ICJ0aGUiKSBjb250cmlidXRpbmcgZmFjdG9ycyB0byB0aGUgaXNzdWUuIEkgd2lsbCBwaW5n
IGJhY2sgd2hlbiB3ZSBoYXZlIHRoZSBuZWNlc3NhcnkgY29tcG9uZW50cyB0byB0ZXN0Lg0KDQpU
aGFua3MgZm9yIHlvdXIgaGVscCwgUGV0ZXIhDQoNCkNoZWVycywNCkthaQ0K

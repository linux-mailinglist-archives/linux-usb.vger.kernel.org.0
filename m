Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFE5207764
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 17:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404336AbgFXP3B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 11:29:01 -0400
Received: from mail-eopbgr60128.outbound.protection.outlook.com ([40.107.6.128]:15934
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404291AbgFXP3A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jun 2020 11:29:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkwiTy0X4wXXg0jW4hsHYdoqgXgH4d28FrepZQ4uguwEswyU5nxYGKRCjB9tem0uSFD9t/kfHFxgT0OnSecsIKC1U1U1yMVNAFbsc5lN8DhnhxVl6aq+HepO1k5RD+mVB5py2m1zt53RNVbCobfgisEwevjKF63DVdiroCbXoiLHKf7h4k/aOTrcCau7/SCpySKxNzL8ZbXSuXr4YrTKTfV5uInSW/qOMg5ru974+IPsK0H1hBW0C8p3zXtrOrX545dsHpJiNaOsQRlBRXjyoW4vbWo4I4iqeE7JTS18f/7QbSxwr81VAx4NY1j520X7dpIFMpCtlyfqvqB2+hH/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/xtrglR9TSsiX9FwHVB2hoBPM9vu7swq+rzYJnZkfo=;
 b=Qcm6qCeTBQtfISc2OQ0L8LW1omzvPUbxpxPKVrwYePuE+ksfobar8pKAxXuE3MntAuWTYfx61l1UdEqMiToiitU6DLp4aQs1jpB0YkUJpKCXqMJngIURB+8eXL/1/iCVg4ykvIF7Yu8Ef3Ug9SX2RBPF/44v12CPv/zeL9UGYsX9x/ZdoN/bwiKwRwTpH+J3S3WM3zeZ4K8ndzNQhF0Qk6zOd3XmQN+wJw0e2nICgM/N3kU51skNt8YIF4gFEZqGbdM5NDWbquWMQ/6uPSU/PEEvVV+Xl+F5sS9GgpPOVCvZZh6V38pahTmWbKXGNnfbQjnfnlvdDLuQVKkekmL+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/xtrglR9TSsiX9FwHVB2hoBPM9vu7swq+rzYJnZkfo=;
 b=R8rHcso5kKpxx0jBx6YROxyeIu8JbSBreEhZ+oEuYHTaPHKdac6rdeTYhW8uv7YoBNofbiLU8/s9dVecCdvzloF4mp/AAaqOicvtjhAkT5ALib7alDn77s9hnd4U9ZxHl7F/FyVoEx3180ZfBnFzHJE3OBwGhvVtfC2sLwAasq4=
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com (2603:10a6:20b:a8::25)
 by AM6PR05MB4439.eurprd05.prod.outlook.com (2603:10a6:209:43::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 15:28:56 +0000
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::1d81:6a9b:8c26:3b7d]) by AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::1d81:6a9b:8c26:3b7d%4]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 15:28:56 +0000
From:   Philippe Schenker <philippe.schenker@toradex.com>
To:     "peter.chen@nxp.com" <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Igor Opanyuk <igor.opanyuk@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>
Subject: Re: USB difficulties with an iMX6ULL
Thread-Topic: USB difficulties with an iMX6ULL
Thread-Index: AQHWRX6bY1fYG3LvHU+Nxv9VFjLuK6jfLU+wgADoSoCAATYcAIAGoaWA
Date:   Wed, 24 Jun 2020 15:28:55 +0000
Message-ID: <a5dc003b37168862b6fda98e1e00257d8e6e25a9.camel@toradex.com>
References: <87837d44165d71ecfb0ec22ec2dae6460cb0503c.camel@toradex.com>
         <AM7PR04MB715741EAEAE277594DC0DE3B8B980@AM7PR04MB7157.eurprd04.prod.outlook.com>
         <f8d3d8233d3964e7eb726dc3ad0aa993b4e1567a.camel@toradex.com>
         <AM7PR04MB7157C0AA9DD8DC024B28EE3B8B990@AM7PR04MB7157.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7157C0AA9DD8DC024B28EE3B8B990@AM7PR04MB7157.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=toradex.com;
x-originating-ip: [31.10.206.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bcead54-eaa7-41de-f2f5-08d818534f13
x-ms-traffictypediagnostic: AM6PR05MB4439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB44391E65F4545E9E1A4B8236F4950@AM6PR05MB4439.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wcgYikGp3M3RrghCGof/oGn1JgmGzYuSTxn8ivDZ5hwF3kNiBMHixhTbTXRm1yMjk2PNzLAId9XxSnYqkGBTHVIlVdRdfxMMen0s7G9ttx/7w2gcMy9M58MQCZk+HnXU/oqYCPESAk6plzTTUylIIaNkeQDoGZkRZi08XisO8m2gII0qqHjDcKTlr9/6+pO8UxvYZyQzq9IMcigLOiOU4pVl+RWinSnaRlRqCpEGB+K6YsYxyQBSiS+g5jyFb/zzRSlsaYU5Yv0bUSFcz0PPcnMlbm0YcUiDoUNNJ4hBSOILGtQVjCEMLnunlLF8GBmx02kalGNWnl62CzO3DGxcWPv9Bzk/dPM8+HJUDDm3lp7rJ35QKiw0UxKc8UcSfUb0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6120.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(6512007)(54906003)(107886003)(86362001)(36756003)(6506007)(2616005)(4326008)(44832011)(2906002)(186003)(110136005)(26005)(498600001)(71200400001)(66446008)(66556008)(64756008)(91956017)(76116006)(5660300002)(8936002)(6486002)(8676002)(66476007)(66946007)(83380400001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WhI+ukXuPNe4NrAEEZovIbZwhmI4a0wLvGE7EWgfOJ6ywKX0BpTETEU5PAOhhH7RMQtih68MTlZWSkn6AS4Dr6W7Vef6KFakPLo1d/CbE2a4kfImZu1PtCvh5dMNIPkccXa7VgAoFgIvl0qzuq5qqcJRZS3t015myTaDFWzL5wSpK3GF8ySdftxD5GKf6o85zHcWn7SHaz+Ipo+IuaUeLch8jt1/0X/aYsaaRQmd25RifnW3cQxCOdxjgN5TUC/aywbxSZtFne9KkSgM+ZVIU6VfHu20aWk+Sr3gqIv5sAaXkLGOA1fS6rdOSvBD7+ZpevjVfr7ZxJS+otw3NR1nljOSJMRUb2Nos9SWDomtJdPaLzT9yJLBx3fvnMt4DfNZQFVOc3+kqB6UZcjdoDWtL2tY9h2ioEV3msatNDnIeFhTzFpQjq9q+cLUM67uIcprqcnErnKPVALPjQTHoIsXTu/Tx0OE5JNR1E4i+gYr1Qg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3ED18E09B9D9E6499CE28F9FBC049483@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB6120.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcead54-eaa7-41de-f2f5-08d818534f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 15:28:55.9745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7p1FEUBbxxjcnIjbYjE1oaeDk5vuzWBdWGDb32C3TRSUWP42EDrV2kZof8Y/xAZDB3h3tvrGPz3+Qt7JG9jeNUsDR/sBRBx5ovBrOINVBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4439
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU2F0LCAyMDIwLTA2LTIwIGF0IDEwOjE4ICswMDAwLCBQZXRlciBDaGVuIHdyb3RlOg0KPiAg
DQo+ID4gT24gRnJpLCAyMDIwLTA2LTE5IGF0IDAyOjA1ICswMDAwLCBQZXRlciBDaGVuIHdyb3Rl
Og0KPiA+ID4gPiAxc3QgcHJvYmxlbSAtIFJORElTDQo+ID4gPiA+IFdlIHRyeSB0byB1c2UgUk5E
SVMgb24gb25lIG9mIHRoZSBVU0IgcG9ydHMgdGhlIENvbGlicmkgaU1YNlVMTA0KPiA+ID4gPiBo
YXMuDQo+ID4gPiA+IEZvciB0aGlzDQo+ID4gPiA+IHB1cnBvc2UgSSdtIHVzaW5nIHRoZSB1c2Jf
Zl9ybmRpcy5rbyBrZXJuZWwgbW9kdWxlIGFuZCBzZXR0aW5nDQo+ID4gPiA+IGRyX21vZGUgb2YN
Cj4gPiA+ID4gJnVzYm90ZzEgdG8gInBlcmlwaGVyYWwiDQo+ID4gPiA+IFRoaXMgd29ya3MgZmlu
ZSBvbiBpTVg3IGJ1dCBkb2VzIG5vdCBvbiBpTVg2VUxMLiBPbiB0aGUgVUxMDQo+ID4gPiA+IGJv
YXJkIEkNCj4gPiA+ID4gY2FuIHNlZSBhICJjaV9oZHJjLjAiIGluIC9zeXMvY2xhc3MvdWRjIGFm
dGVyIGJvb3QuIElmIEkgYWRkIG5vdw0KPiA+ID4gPiBhbg0KPiA+ID4gPiBVU0IgR1BJTyBleHRj
b24gdG8gdXNib3RnIHRoaXMgY2hhbmdlcyB0byAiY2lfaGRyYy4xIiBhbmQNCj4gPiA+ID4gZXZl
cnl0aGluZw0KPiA+ID4gPiB3b3JrcyBmaW5lIGFmdGVyIGJvb3QsIGJ1dCBub3QgYWZ0ZXIgdW5w
bHVnZ2luZyBVU0IgYW5kDQo+ID4gPiA+IHJlcGx1Z2dpbmcuDQo+ID4gPiA+IFRvIHNldHVwIFJO
RElTIEkgdXNlIHRoZSBjb21tYW5kcyBbMV0gSSBwdXQgYXQgdGhlIGVuZCBvZiB0aGlzDQo+ID4g
PiA+IGVtYWlsDQo+ID4gPiA+IGZvciByZWZlcmVuY2UuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4g
PiBJZiB0aGUgYm9hcmQgZGVzaWducyBmb3IgVVNCIHBhcnQgYXJlIHRoZSBzYW1lIGJldHdlZW4g
aU1YNw0KPiA+ID4gdmVyc2lvbg0KPiA+ID4gYW5kIGlNWDZVTEwgdmVyc2lvbiwga2VlcCBkdHMg
Y29udGVudCBhcmUgdGhlIHNhbWUgZXhjZXB0IGZvciB0aGUNCj4gPiA+IFVTQg0KPiA+ID4gUEhZ
IHBvcnQgKGluY2x1ZGluZyB0aGUgcGhhbmRsZSBmb3IgaXQpLCB0aGVzZSB0d28gU29DcyB1c2Vz
IHRoZQ0KPiA+ID4gZGlmZmVyZW50IFVTQiBQSFkuDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGlz
IGhpbnQhIFRoZW4gaGVyZSBtYXkgc29tZXRoaW5nIGJlIGRpZmZlcmVudCBvciBub3QNCj4gPiBx
dWl0ZSByaWdodCB5ZXQgKGZvcg0KPiA+IG91ciB1c2VjYXNlKS4NCj4gPiANCj4gPiBJIHNhdyB0
aGF0IGluIHBoeS1teHMtdXNiLmMgdGhlcmUgaXMgbm8gIm1vZGUiIGluIHN0cnVjdCBteHNfcGh5
DQo+ID4gbGlrZSBpdCBpcyBvbg0KPiA+IGRvd25zdHJlYW0gY29kZS4gSSBjb3VsZG4ndCBmaW5k
IGhvdyB0aGUgY29kZSBzd2l0Y2hlcyB0aGUgUEhZIHRvDQo+ID4gcGVyaXBoZXJhbA0KPiA+IG1v
ZGUuDQo+ID4gDQo+ID4gU2hvdWxkIGl0IGV2ZW4gYmUgcG9zc2libGUgd2l0aCB0aGlzIHBoeSB0
byB1c2UgZHJfbW9kZSA9DQo+ID4gInBlcmlwaGVyYWwiPw0KPiA+IA0KPiANCj4gTm8sIHRoaXMg
bW9kZSBpcyBzZXQgYXQgdWRjLmMsIGl0IG1heSBiZSBub3QgcmVsYXRlZCB0byB5b3VyIGZhaWx1
cmUNCj4gdXNlIGNhc2UuDQo+IFRyeSB0byBkZWJ1ZyBhdCBwcm9iZSBmdW5jdGlvbiwgYW5kIHNl
ZSB3aGF0J3MgdGhlIGRpZmZlcmVuY2UuDQoNClRoYW5rcyBmb3IgaGVscGluZyBtZSBkZWJ1Z2dp
bmcgdGhpcyEgSW4gdGhlIG1lYW50aW1lIEkgZm91bmQgdGhlIGlzc3VlLg0KV2UgaGF2ZSBhIGRp
ZmZlcmVudCBoYXJkd2FyZSBkZXNpZ24uIE9uIHRoZSBpTVg2VUxMIFZCVVMgaXMgbm90IGhvb2tl
ZA0KdXAuIEknbSB1c2luZyBub3cgZXh0Y29uIHdpdGggYSBHUElPIHdoaWNoIHdvcmtzIGZpbmUu
DQoNCj4gDQo+ID4gPiBJZiB0aGUgUk5ESVMgY291bGQgd29yayBhdCB0aGUgZmlyc3QgdGltZSwg
aXQgc2VlbXMgeW91ciBjb25maWdmcw0KPiA+ID4gc2NyaXB0IHNob3VsZCBiZSBPSy4NCj4gPiA+
IA0KPiA+ID4gPiAybmQgcHJvYmxlbSAtIGNvbnN0YW50IHJlc2V0dGluZw0KPiA+ID4gPiBXaGVu
IEkgY29tcGlsZSBhIHBsYWluIG1haW5saW5lIGtlcm5lbCB3aXRoDQo+ID4gPiA+ICJpbXhfdjZf
djdfZGVmY29uZmlnIg0KPiA+ID4gPiBhbmQgYm9vdCB0aGUNCj4gPiA+ID4gaU1YNlVMTCB3aXRo
IGl0IEkgc2VlIHRoYXQgdGhlIFVTQiBpcyBjb25zdGFudGx5IHJlc2V0dGluZyB0aGUNCj4gPiA+
ID4gaHViDQo+ID4gPiA+IHRoYXQgaXMgcHJlc2VudCBvbiB0aGUgQ29saWJyaSBFdmFsdWF0aW9u
IGNhcnJpZXIgYm9hcmQuDQo+ID4gPiA+IA0KPiA+ID4gPiBbICAgNDkuNjU0NjIxXSB1c2IgMS0x
OiByZXNldCBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDINCj4gPiA+ID4gdXNpbmcNCj4g
PiA+ID4gY2lfaGRyYw0KPiA+ID4gPiBbICAgNTIuMTgwNzgxXSB1c2IgMS0xOiByZXNldCBoaWdo
LXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDINCj4gPiA+ID4gdXNpbmcNCj4gPiA+ID4gY2lfaGRy
Yw0KPiA+ID4gPiBbICAgNTQuNjk5Njc4XSB1c2IgMS0xOiByZXNldCBoaWdoLXNwZWVkIFVTQiBk
ZXZpY2UgbnVtYmVyIDINCj4gPiA+ID4gdXNpbmcNCj4gPiA+ID4gY2lfaGRyYw0KPiA+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gVHJ5IHRvIGFkZCBleHRlcm5hbCBwb3dlciB0byB0aGUgVVNCIEhVQiBh
dm9pZCB0aGUgYm9hcmQgY2FuJ3QNCj4gPiA+IHN1cHBseQ0KPiA+ID4gZW5vdWdoIHBvd2VyLg0K
PiA+ID4gSWYgbm90LCB0cnkgdG8gZGlzYWJsZSBydW50aW1lIHBtLCBhbmQgc2VlIGlmIGl0IHdv
cmtzLg0KPiA+ID4gDQo+ID4gPiAgNTkgc3RhdGljIGNvbnN0IHN0cnVjdCBjaV9oZHJjX2lteF9w
bGF0Zm9ybV9mbGFnIGlteDZ1bF91c2JfZGF0YQ0KPiA+ID4gPSB7DQo+ID4gPiAgNjAgICAgICAg
ICAuZmxhZ3MgPSBDSV9IRFJDX1NVUFBPUlRTX1JVTlRJTUVfUE0gfA0KPiA+ID4gIDYxICAgICAg
ICAgICAgICAgICBDSV9IRFJDX1RVUk5fVkJVU19FQVJMWV9PTiwNCj4gPiA+ICA2MiB9Ow0KPiA+
ID4gIDYzDQo+ID4gDQo+ID4gVGhlIHBvd2VyIGlzIG5vIHByb2JsZW0uIFRoZSB1c2ItaHViIGlz
IHNvbGRlcmVkIHRvIHRoZSBjYXJyaWVyLQ0KPiA+IGJvYXJkLCBJIG1lYXN1cmVkDQo+ID4gaXQg
YW5kIHZvbHRhZ2UgaXMgcm9jayBzb2xpZC4gV2UgdXNlIGFuIFVTQjI1MTQgY2hpcC4NCj4gPiAN
Cj4gPiBUaGFua3MgZm9yIHRoZSBoaW50LCBkaXNhYmxpbmcgQ0lfSERSQ19TVVBQT1JUU19SVU5U
SU1FX1BNIHNvbHZlcw0KPiA+IHRoZQ0KPiA+IGlzc3VlLg0KPiA+IA0KPiANCj4gVHJ5IHRvIHBv
cnQgdGhpcyBwYXRjaCBmcm9tIGRvd25zdHJlYW0gQlNQLg0KPiANCj4gY29tbWl0IDU4NDBiMTc0
ZTg1ZTY2YjUwMmI0ODg3MDI2Y2U0NGM1NjY1YzI5YjENCj4gQXV0aG9yOiBMaSBKdW4gPGp1bi5s
aUBueHAuY29tPg0KPiBEYXRlOiAgIE1vbiBPY3QgMTYgMjM6MTM6MTkgMjAxNyArMDgwMA0KPiAN
Cj4gICAgIE1MSy0xNjU3NiB1c2I6IHBoeTogbXhzOiBzZXQgaG9sZF9yaW5nX29mZiBmb3IgVVNC
MiBQTEwgcG93ZXIgdXANCj4gICAgIA0KPiAgICAgVVNCMiBQTEwgdXNlIHJpbmcgVkNPLCB3aGVu
IHRoZSBQTEwgcG93ZXIgdXAsIHRoZSByaW5nIFZDT+KAmXMNCj4gc3VwcGx5IGFsc28NCj4gICAg
IHJhbXAgdXAuIFRoZXJlIGlzIGEgcG9zc2liaWxpdHkgdGhhdCB0aGUgcmluZyBWQ08gc3RhcnQN
Cj4gb3NjaWxsYXRpb24gYXQNCj4gICAgIG11bHRpIG5vZGVzIGluIHRoaXMgcGhhc2UsIGVzcGVj
aWFsbHkgZm9yIFZDTyB3aGljaCBoYXMgbWFueQ0KPiBzdGFnZXMsIHRoZW4NCj4gICAgIHRoZSBt
dWx0aXdhdmUgd2lsbCBrZXB0IHVudGlsIFBMTCBwb3dlciBkb3duLiBIb2xkX3Jpbmdfb2ZmKGJp
dDExKQ0KPiBjYW4NCj4gICAgIGZvcmNlIHRoZSBWQ08gaW4gb25lIGRldGVybWluZWQgc3RhdGUg
d2hlbiBWQ08gc3VwcGx5IHN0YXJ0IHJhbXANCj4gdXAsIHRvDQo+ICAgICBhdm9pZCB0aGlzIG11
bHRpd2F2ZSBpc3N1ZS4gUGVyIElDIGRlc2lnbidzIHN1Z2dlc3Rpb24gaXQncyBiZXR0ZXINCj4g
dGhpcw0KPiAgICAgYml0IGNhbiBiZSBvZmYgZnJvbSAyNXVzIGFmdGVyIHBsbCBwb3dlciB1cCB0
byAyNXVzIGJlZm9yZSBVU0INCj4gVFgvUlguDQo+ICAgICANCj4gICAgIEFja2VkLWJ5OiBQZXRl
ciBDaGVuIDxwZXRlci5jaGVuQG54cC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4g
PGp1bi5saUBueHAuY29tPiQNCg0KSSBmb3J3YXJkIHBvcnRlZCB0aGlzIHBhdGNoIHRvIDUuOC1y
YzIgdW5mb3J0dW5hdGVseSBpdCBkaWQgbm90IGhlbHAuIEkNCmd1ZXNzIEkgd2lsbCBqdXN0IHJl
bW92ZSBDSV9IRFJDX1NVUFBPUlRTX1JVTlRJTUVfUE0gZm9yIG5vdy4NCg0KVGhhbmtzIGFnYWlu
IQ0KDQpCZXN0IFJlZ2FyZHMsDQpQaGlsaXBwZQ0KPiANCj4gUGV0ZXINCg==

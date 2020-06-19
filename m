Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AC92011AE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 17:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404571AbgFSPnH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 11:43:07 -0400
Received: from mail-eopbgr50110.outbound.protection.outlook.com ([40.107.5.110]:6530
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393579AbgFSPm6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 11:42:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXYw08pQHYCjcIvY1HIGWGYrxGroJ51QlMMWXrITZssLtWZePQG9awPMYFrXOus1c9gy/Zgtn7dKUF8Ra9SMsNG1ujz7tI10FhbSmHeMlpSdzo8oGyqizAumV5bRFtCN1SEhfmLMQtOnuvzqHujhVZooJu7BCeML6vTkomVcpBecQTeG19f+azHfGOmhia8Wo/sSMnLmRQuuIKXqFziA1j12xiVMe5QMr/FAg+ipk+27+XSE4U/JrmChkVZmJz5apwRPg+ux8ATy1/WyaFMxm4Ic1EffFHULwClPFq2oH18DkHxTpnm50NykQ/nQoOWIHPlLp0Uu9AwIWVBFp8o2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TW0q953jusbk70NEl0Hs9j3IFyTglftUudyRVmS9DE=;
 b=QD8muDJlHWPkKAsEvnohjHYqrUrxnTZN3hbYZIvISajcO9bc1rLLdwvV7Ido0dZ9BM3BYJjfpcS3J0GlqmXV2OR52sVhylZVGcbLLVG0Vs9Qn0WVUa0xvlR86yp8i5prKuhzdfpacsXtbCCmXhxR+XjhhPobMyjHBUnOjJ+RhTEoDOGpPeh4oYzf2H94J9MoGuLavPhKAePtR33OMrDgsOIomhfQOFI5FTPULkkAJdABSzcN/mlQEmg5hHwpCTkVq43jV2E/5IH/VS/eVeOuCDJgDXl2Vx0bBw8BBFLoI3NTzVSESb3D3YtrLV5AgBPqRIAYjZPxVgm9IIp7NR+anA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TW0q953jusbk70NEl0Hs9j3IFyTglftUudyRVmS9DE=;
 b=Y5fwMG/8t4mMpbp1cXhgH0cNKJMrPXfeQBHAWeWw4EIvcAVzKopRBwkTLNt9IhqGeSEm+lysasDkcv202rjIr1lLqpcWWwjbpxAommv5G1BbLGX+z2jNxow1wEM+KSnEsFhhh2+s2PTnDdiLw2xeTcE+jH0D4ZAzcgoSUMxsEn8=
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com (2603:10a6:20b:a8::25)
 by AM6PR05MB5237.eurprd05.prod.outlook.com (2603:10a6:20b:64::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 15:42:53 +0000
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::d8d3:ead7:9f42:4289]) by AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::d8d3:ead7:9f42:4289%6]) with mapi id 15.20.3088.029; Fri, 19 Jun 2020
 15:42:53 +0000
From:   Philippe Schenker <philippe.schenker@toradex.com>
To:     "peter.chen@nxp.com" <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Igor Opanyuk <igor.opanyuk@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>
Subject: Re: USB difficulties with an iMX6ULL
Thread-Topic: USB difficulties with an iMX6ULL
Thread-Index: AQHWRX6bY1fYG3LvHU+Nxv9VFjLuK6jfLU+wgADoSoA=
Date:   Fri, 19 Jun 2020 15:42:53 +0000
Message-ID: <f8d3d8233d3964e7eb726dc3ad0aa993b4e1567a.camel@toradex.com>
References: <87837d44165d71ecfb0ec22ec2dae6460cb0503c.camel@toradex.com>
         <AM7PR04MB715741EAEAE277594DC0DE3B8B980@AM7PR04MB7157.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB715741EAEAE277594DC0DE3B8B980@AM7PR04MB7157.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=toradex.com;
x-originating-ip: [51.154.7.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ae1055a-8d90-4780-6e37-08d814676e63
x-ms-traffictypediagnostic: AM6PR05MB5237:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB5237B33659A987CE604FD784F4980@AM6PR05MB5237.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QyAvIBlMTE65My2DMDmRiVoKP1xD14IXhHhc/7IYPe32G2TToyKe7iZT6J/0wmVi7SqHz/x9PC5Llp4khJTGjWDtvAer5koTqcgKtZ47I26kBd1v9isckhjE5M0H5TbUpiILZ/q1QcqN1h+WB5IGc33MniDi2CTA9UpNTmwWuPgKZRY8EkZzkYDV6w0OcMEc2zRLdFKJRgnoeQB5MNaYwW6KIDRs9E8GgLgTGICxTGsGeGA3EmgJcOoEkXtzhA14B20eu95Pr8A3vxz9HR9//ppNJ//nxINDVybv11WQe/myfOMJK/LulYbT1nyZAn3THZDphbj6QpMKZT2apAgRhEWu1++u81DQAabWm0QjNaHgjxUuWAAdpnprBOTRkTRn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6120.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(5660300002)(107886003)(86362001)(36756003)(44832011)(2616005)(71200400001)(8936002)(186003)(316002)(54906003)(110136005)(26005)(478600001)(6486002)(6512007)(66946007)(6506007)(66556008)(66446008)(66476007)(2906002)(4326008)(64756008)(91956017)(8676002)(76116006)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: AQHrBJDONuUgsmQGii+SHEDrm+5PCkB4HIBAGX2uubHqfA915dkY7BCS5OH2C8AqPNwSjro45NntM9dzzoLh9Z+R3Ec1Oo+kptwf+6iJh6ePQmjDuHesEb9f5FZO5lYFuJoIAlOSsD/9yaZQhM2FsresMjkWa4yQBI9AJeNdIO0znCQovEUxkzOEyRAwjwk+nFMy/SfDPVWUgcEHv9e9PXGCR7hn7AlfoDnokL9QE7imEGbUNHX19sSksoCITkg5dY+d3duJ6GD9Jpre2egolL7t5Br41a0FvCXAkv+E4FTKXX2X++yOszkz75y7HPdsJkEW6crWFhCGdw4BOdeXQP2++t2dCWk5KlwnY49L/NaLQrqhDaeBL2StQ3gpQLFhQGQ94IEpMkOGKV8rkv8Hh834syYoeAnM7kPrK/g+ma1qJl6lnvWq7BghRwNB/t8epxT5t2PcrAVrz5WOlXB3+MW7ZfcmtL8+E2qPpjnpBCw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC987867517BCD4BB7753D57204FE8DC@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae1055a-8d90-4780-6e37-08d814676e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 15:42:53.7982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBLprsSZmsqZrDIS5DkMg5RxjZwgNYWGd3eH3wV/lI/ngAK3hGUAfDwDiPOUJ1BYe8rUc4CNziWCg7Y5CGrUnGJ26RgDbtlN5kA7n0fFuNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5237
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsIHRoYW5rcyBmb3IgeW91ciBhbnN3ZXJzIEkgcmVhbGx5IGFwcHJlY2lhdGUhIA0K
DQpJIHB1dCBteSBhbnN3ZXJzIGJlbG93Lg0KDQoNCk9uIEZyaSwgMjAyMC0wNi0xOSBhdCAwMjow
NSArMDAwMCwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gIA0KPiA+IA0KPiA+IDFzdCBwcm9ibGVtIC0g
Uk5ESVMNCj4gPiBXZSB0cnkgdG8gdXNlIFJORElTIG9uIG9uZSBvZiB0aGUgVVNCIHBvcnRzIHRo
ZSBDb2xpYnJpIGlNWDZVTEwgaGFzLg0KPiA+IEZvciB0aGlzDQo+ID4gcHVycG9zZSBJJ20gdXNp
bmcgdGhlIHVzYl9mX3JuZGlzLmtvIGtlcm5lbCBtb2R1bGUgYW5kIHNldHRpbmcNCj4gPiBkcl9t
b2RlIG9mDQo+ID4gJnVzYm90ZzEgdG8gInBlcmlwaGVyYWwiDQo+ID4gVGhpcyB3b3JrcyBmaW5l
IG9uIGlNWDcgYnV0IGRvZXMgbm90IG9uIGlNWDZVTEwuIE9uIHRoZSBVTEwgYm9hcmQgSQ0KPiA+
IGNhbiBzZWUgYQ0KPiA+ICJjaV9oZHJjLjAiIGluIC9zeXMvY2xhc3MvdWRjIGFmdGVyIGJvb3Qu
IElmIEkgYWRkIG5vdyBhbiBVU0IgR1BJTw0KPiA+IGV4dGNvbiB0byB1c2JvdGcNCj4gPiB0aGlz
IGNoYW5nZXMgdG8gImNpX2hkcmMuMSIgYW5kIGV2ZXJ5dGhpbmcgd29ya3MgZmluZSBhZnRlciBi
b290LA0KPiA+IGJ1dCBub3QgYWZ0ZXINCj4gPiB1bnBsdWdnaW5nIFVTQiBhbmQgcmVwbHVnZ2lu
Zy4NCj4gPiBUbyBzZXR1cCBSTkRJUyBJIHVzZSB0aGUgY29tbWFuZHMgWzFdIEkgcHV0IGF0IHRo
ZSBlbmQgb2YgdGhpcyBlbWFpbA0KPiA+IGZvciByZWZlcmVuY2UuDQo+ID4gDQo+IA0KPiBJZiB0
aGUgYm9hcmQgZGVzaWducyBmb3IgVVNCIHBhcnQgYXJlIHRoZSBzYW1lIGJldHdlZW4gaU1YNyB2
ZXJzaW9uDQo+IGFuZCBpTVg2VUxMIHZlcnNpb24sDQo+IGtlZXAgZHRzIGNvbnRlbnQgYXJlIHRo
ZSBzYW1lIGV4Y2VwdCBmb3IgdGhlIFVTQiBQSFkgcG9ydCAoaW5jbHVkaW5nDQo+IHRoZSBwaGFu
ZGxlIGZvciBpdCksDQo+IHRoZXNlIHR3byBTb0NzIHVzZXMgdGhlIGRpZmZlcmVudCBVU0IgUEhZ
Lg0KDQpUaGFua3MgZm9yIHRoaXMgaGludCEgVGhlbiBoZXJlIG1heSBzb21ldGhpbmcgYmUgZGlm
ZmVyZW50IG9yIG5vdCBxdWl0ZQ0KcmlnaHQgeWV0IChmb3Igb3VyIHVzZWNhc2UpLg0KDQpJIHNh
dyB0aGF0IGluIHBoeS1teHMtdXNiLmMgdGhlcmUgaXMgbm8gIm1vZGUiIGluIHN0cnVjdCBteHNf
cGh5IGxpa2UgaXQNCmlzIG9uIGRvd25zdHJlYW0gY29kZS4gSSBjb3VsZG4ndCBmaW5kIGhvdyB0
aGUgY29kZSBzd2l0Y2hlcyB0aGUgUEhZIHRvDQpwZXJpcGhlcmFsIG1vZGUuDQoNClNob3VsZCBp
dCBldmVuIGJlIHBvc3NpYmxlIHdpdGggdGhpcyBwaHkgdG8gdXNlIGRyX21vZGUgPSAicGVyaXBo
ZXJhbCI/DQoNCj4gDQo+IElmIHRoZSBSTkRJUyBjb3VsZCB3b3JrIGF0IHRoZSBmaXJzdCB0aW1l
LCBpdCBzZWVtcyB5b3VyIGNvbmZpZ2ZzDQo+IHNjcmlwdCBzaG91bGQgYmUgT0suDQo+IA0KPiA+
IDJuZCBwcm9ibGVtIC0gY29uc3RhbnQgcmVzZXR0aW5nDQo+ID4gV2hlbiBJIGNvbXBpbGUgYSBw
bGFpbiBtYWlubGluZSBrZXJuZWwgd2l0aCAiaW14X3Y2X3Y3X2RlZmNvbmZpZyINCj4gPiBhbmQg
Ym9vdCB0aGUNCj4gPiBpTVg2VUxMIHdpdGggaXQgSSBzZWUgdGhhdCB0aGUgVVNCIGlzIGNvbnN0
YW50bHkgcmVzZXR0aW5nIHRoZSBodWINCj4gPiB0aGF0IGlzIHByZXNlbnQgb24NCj4gPiB0aGUg
Q29saWJyaSBFdmFsdWF0aW9uIGNhcnJpZXIgYm9hcmQuDQo+ID4gDQo+ID4gWyAgIDQ5LjY1NDYy
MV0gdXNiIDEtMTogcmVzZXQgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nDQo+
ID4gY2lfaGRyYw0KPiA+IFsgICA1Mi4xODA3ODFdIHVzYiAxLTE6IHJlc2V0IGhpZ2gtc3BlZWQg
VVNCIGRldmljZSBudW1iZXIgMiB1c2luZw0KPiA+IGNpX2hkcmMNCj4gPiBbICAgNTQuNjk5Njc4
XSB1c2IgMS0xOiByZXNldCBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIgdXNpbmcNCj4g
PiBjaV9oZHJjDQo+ID4gDQo+IA0KPiBUcnkgdG8gYWRkIGV4dGVybmFsIHBvd2VyIHRvIHRoZSBV
U0IgSFVCIGF2b2lkIHRoZSBib2FyZCBjYW4ndCBzdXBwbHkNCj4gZW5vdWdoIHBvd2VyLg0KPiBJ
ZiBub3QsIHRyeSB0byBkaXNhYmxlIHJ1bnRpbWUgcG0sIGFuZCBzZWUgaWYgaXQgd29ya3MuDQo+
IA0KPiAgNTkgc3RhdGljIGNvbnN0IHN0cnVjdCBjaV9oZHJjX2lteF9wbGF0Zm9ybV9mbGFnIGlt
eDZ1bF91c2JfZGF0YSA9IHsNCj4gIDYwICAgICAgICAgLmZsYWdzID0gQ0lfSERSQ19TVVBQT1JU
U19SVU5USU1FX1BNIHwNCj4gIDYxICAgICAgICAgICAgICAgICBDSV9IRFJDX1RVUk5fVkJVU19F
QVJMWV9PTiwNCj4gIDYyIH07DQo+ICA2MyANCg0KVGhlIHBvd2VyIGlzIG5vIHByb2JsZW0uIFRo
ZSB1c2ItaHViIGlzIHNvbGRlcmVkIHRvIHRoZSBjYXJyaWVyLWJvYXJkLCBJDQptZWFzdXJlZCBp
dCBhbmQgdm9sdGFnZSBpcyByb2NrIHNvbGlkLiBXZSB1c2UgYW4gVVNCMjUxNCBjaGlwLg0KDQpU
aGFua3MgZm9yIHRoZSBoaW50LCBkaXNhYmxpbmcgQ0lfSERSQ19TVVBQT1JUU19SVU5USU1FX1BN
IHNvbHZlcyB0aGUNCmlzc3VlLg0KDQpQaGlsaXBwZQ0KDQo+IA0KPiA+IFRoaXMgbG9va3MgdG8g
bWUgbGlrZSBzb21ldGhpbmcgaXMgc3RpbGwgbm90IHF1aXRlIHJpZ2h0IGZvciB0aGUNCj4gPiB1
c2UtIGNhc2Ugb2YgVUxMLiBJDQo+ID4gZG91YnQgdGhhdCBvdXIgaGFyZHdhcmUgaXMgdGhlIHBy
b2JsZW0gYXMgd2UgbmV2ZXIgaGF2ZSBzZWVuIHRob3NlDQo+ID4gcHJvYmxlbXMNCj4gPiBkb3du
c3RyZWFtLg0KPiANCj4gWW91IG1lYW4geW91ciBoYXJkd2FyZSBzaG91bGQgYmUgTk8gcHJvYmxl
bSBhcyB0aGUgZG93bnN0cmVhbSBjb2RlDQo+IHJ1bnMgT0s/DQo+IA0KPiBQZXRlcg0KPiANCj4g
IA0K

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFED202327
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jun 2020 12:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgFTKSb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 06:18:31 -0400
Received: from mail-db8eur05on2084.outbound.protection.outlook.com ([40.107.20.84]:25026
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725298AbgFTKS2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 20 Jun 2020 06:18:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNlp4Ac5MakOHkiq5qQ3T07pI6c5gc2Up42EmaliCvBKtlp2nJC4D8S53nuSQ9G7okMOeSx2q+X4iTw2h7dZvUMFj+I8lk1x2A7nM4FDbdOwc/UiOHxO9lPFlSqNO7bUj/5W/eErU6R/0gh3P0VsWZGXlNGV67aBx+hlCqH7XLPPds0UMQOQD2bH4TVXxA/y0QRbeSL6B0UDKdvGW1er8iPrPb4A/yhT014yC47bSWGACcqQBBnC1262LaB06Fh2mxXb/atimiS7O01SZNIH/gzOyDLddqiye6c00puG+KEMQnxEctBTJTF1gUtjkB635et1FQmPQ/TbPIEgkIiQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wxLamc2oGw5nLQnK+jTNSJiTIhpqGjVzyoqUiv3sf0=;
 b=kGoggKWrVOyPd5zEjMXMvGrSn3vLsG2mVRjN+Ua/dSwgMQyLuCvXf8ppq6B5nqaBW90edHc6YjbIlm86NAvaXfJRucbIVZOfb3+3aMlaxED0Z6fsjMY3gcp8OAe5dBap1Y2Fuv8IgFq/yTcxWOQIiG6v+soXCVBCJsnKNvMg9NQtBxdCv8TcmAakA6XZWUjhI0Gtv+vcXRDZ0Fill8hwNblWraE6uLPVdSs//4PXRkmzuVAYcyPOY+mImvVANinhPQ9xGG3gAxjz69x5ohXuaFc2uUK8a1QWzKoa0mQsPAvZ/5F4wP68nus41+udrwo+bKfHGF+EP6Eht/ik5zya3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wxLamc2oGw5nLQnK+jTNSJiTIhpqGjVzyoqUiv3sf0=;
 b=rHTB+20kHWEt58ErNnUhF/5zDuwt05bmUtHVgdB+1RxrdqApr925adrx7KyvsRSSwrvLqtgagqIvYU1nP6cA+75lPfR9reQP7XJFNmHbm4A5tbQ3YJUsBfYDbMKMMV5ZbSGaTrZg/oG0ETBI2ov3o5GS5Nv9ghevZxJrJwQ0uxY=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7061.eurprd04.prod.outlook.com (2603:10a6:20b:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sat, 20 Jun
 2020 10:18:24 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.025; Sat, 20 Jun 2020
 10:18:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Philippe Schenker <philippe.schenker@toradex.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Igor Opanyuk <igor.opanyuk@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>
Subject: RE: USB difficulties with an iMX6ULL
Thread-Topic: USB difficulties with an iMX6ULL
Thread-Index: AQHWRX6bY1fYG3LvHU+Nxv9VFjLuK6jfLU+wgADoSoCAATYcAA==
Date:   Sat, 20 Jun 2020 10:18:24 +0000
Message-ID: <AM7PR04MB7157C0AA9DD8DC024B28EE3B8B990@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <87837d44165d71ecfb0ec22ec2dae6460cb0503c.camel@toradex.com>
         <AM7PR04MB715741EAEAE277594DC0DE3B8B980@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <f8d3d8233d3964e7eb726dc3ad0aa993b4e1567a.camel@toradex.com>
In-Reply-To: <f8d3d8233d3964e7eb726dc3ad0aa993b4e1567a.camel@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.251.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e6e31dd-f679-4ffb-10f6-08d815034419
x-ms-traffictypediagnostic: AM7PR04MB7061:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM7PR04MB70619CEE885645D3BCD286668B990@AM7PR04MB7061.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0440AC9990
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IxXZKC9aUhjRR3epbT8eCzMmAUoeS1O8+lGmSg632dCWj/OhzgJN4KohF2zwnSOg6ZXWbmrQXSKBJdlo8/AnstuPW3cD6qOTMM6RGxccZ9buM5QwgXAEaGS/87pEf9eY2pk39gL+l4dk+3kA7gFEox3HT9KKv+Zndu9UkX6iqRz/PS0g+b2urUmVo9hlrdNFj6ZXMVLASD0yKly6aQW5SgBitf8HT450p0iRJfQfv73trV9cu6PoviiqLkODIi7tPqMgKxbkZng/61evNflFN0Iv+jb2OEw7K0yXiPAhflsKNFbQZivk5G81JSdD9AOOKRan21aQ8nOKVPuca5UY7rIZwGc3IVLWD7sSxUbHf40wRlAhGOh1jw6kYBjvUSGb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(7696005)(26005)(186003)(33656002)(316002)(54906003)(83380400001)(86362001)(44832011)(6506007)(71200400001)(8936002)(52536014)(8676002)(110136005)(2906002)(5660300002)(4326008)(9686003)(55016002)(478600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DuITVa8mxBRWqdvhMgfnRlkTdIy++qHPRLFPsvulZUhtzZMxVge9TeqO+2Vo7MW2OXyR7mCZ+ST1B3opVkzUZfsPH9pHnX1EMHaZCrh6qErRiQVMzdlkvE2q6IUEEbc8OFY+FZWvd2ODoTJTgBxCbCLjHz8JgPH8O777mR3k9i3b0+vGs0Q9LjaQUZmJvq/HEBxQ3G57hWDWPmmKvEo/ye9DW7W6P2KDTdyHrS0nzTq8wsky6KRTPyZKzdP6RQPxtA2fdmWrJFP9RV79nqXU/u94aHl7CBNIoIz85h4/V9nkMJ8b9y/MGCjcriKCM42cAuA70jejikRfl0VHulRyV5o2cUD2YxvStzBY4N4ez2KWk3eLfVoFLN10HAxJFRDMH+YezNjRcZi4ShD6UXJL3YWFTCJuMy2pPXX9g/1FWtiypBiex/09yiwp8phLUQUlpoXgGAw4Iw7s4U7tVzbDQnuNarPYKI067tfMwR6bq+Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6e31dd-f679-4ffb-10f6-08d815034419
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2020 10:18:24.3607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzoJEaUyR2PW96EeB7awAk090tIziBLKZrtCNFIdl2UeR1C7augctvZmDv2KMiGNwWSkvr0tCl3HKEEKLWOjGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7061
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiBPbiBGcmksIDIwMjAtMDYtMTkgYXQgMDI6MDUgKzAwMDAsIFBldGVyIENoZW4gd3JvdGU6
DQo+ID4NCj4gPiA+DQo+ID4gPiAxc3QgcHJvYmxlbSAtIFJORElTDQo+ID4gPiBXZSB0cnkgdG8g
dXNlIFJORElTIG9uIG9uZSBvZiB0aGUgVVNCIHBvcnRzIHRoZSBDb2xpYnJpIGlNWDZVTEwgaGFz
Lg0KPiA+ID4gRm9yIHRoaXMNCj4gPiA+IHB1cnBvc2UgSSdtIHVzaW5nIHRoZSB1c2JfZl9ybmRp
cy5rbyBrZXJuZWwgbW9kdWxlIGFuZCBzZXR0aW5nDQo+ID4gPiBkcl9tb2RlIG9mDQo+ID4gPiAm
dXNib3RnMSB0byAicGVyaXBoZXJhbCINCj4gPiA+IFRoaXMgd29ya3MgZmluZSBvbiBpTVg3IGJ1
dCBkb2VzIG5vdCBvbiBpTVg2VUxMLiBPbiB0aGUgVUxMIGJvYXJkIEkNCj4gPiA+IGNhbiBzZWUg
YSAiY2lfaGRyYy4wIiBpbiAvc3lzL2NsYXNzL3VkYyBhZnRlciBib290LiBJZiBJIGFkZCBub3cg
YW4NCj4gPiA+IFVTQiBHUElPIGV4dGNvbiB0byB1c2JvdGcgdGhpcyBjaGFuZ2VzIHRvICJjaV9o
ZHJjLjEiIGFuZCBldmVyeXRoaW5nDQo+ID4gPiB3b3JrcyBmaW5lIGFmdGVyIGJvb3QsIGJ1dCBu
b3QgYWZ0ZXIgdW5wbHVnZ2luZyBVU0IgYW5kIHJlcGx1Z2dpbmcuDQo+ID4gPiBUbyBzZXR1cCBS
TkRJUyBJIHVzZSB0aGUgY29tbWFuZHMgWzFdIEkgcHV0IGF0IHRoZSBlbmQgb2YgdGhpcyBlbWFp
bA0KPiA+ID4gZm9yIHJlZmVyZW5jZS4NCj4gPiA+DQo+ID4NCj4gPiBJZiB0aGUgYm9hcmQgZGVz
aWducyBmb3IgVVNCIHBhcnQgYXJlIHRoZSBzYW1lIGJldHdlZW4gaU1YNyB2ZXJzaW9uDQo+ID4g
YW5kIGlNWDZVTEwgdmVyc2lvbiwga2VlcCBkdHMgY29udGVudCBhcmUgdGhlIHNhbWUgZXhjZXB0
IGZvciB0aGUgVVNCDQo+ID4gUEhZIHBvcnQgKGluY2x1ZGluZyB0aGUgcGhhbmRsZSBmb3IgaXQp
LCB0aGVzZSB0d28gU29DcyB1c2VzIHRoZQ0KPiA+IGRpZmZlcmVudCBVU0IgUEhZLg0KPiANCj4g
VGhhbmtzIGZvciB0aGlzIGhpbnQhIFRoZW4gaGVyZSBtYXkgc29tZXRoaW5nIGJlIGRpZmZlcmVu
dCBvciBub3QgcXVpdGUgcmlnaHQgeWV0IChmb3INCj4gb3VyIHVzZWNhc2UpLg0KPiANCj4gSSBz
YXcgdGhhdCBpbiBwaHktbXhzLXVzYi5jIHRoZXJlIGlzIG5vICJtb2RlIiBpbiBzdHJ1Y3QgbXhz
X3BoeSBsaWtlIGl0IGlzIG9uDQo+IGRvd25zdHJlYW0gY29kZS4gSSBjb3VsZG4ndCBmaW5kIGhv
dyB0aGUgY29kZSBzd2l0Y2hlcyB0aGUgUEhZIHRvIHBlcmlwaGVyYWwNCj4gbW9kZS4NCj4gDQo+
IFNob3VsZCBpdCBldmVuIGJlIHBvc3NpYmxlIHdpdGggdGhpcyBwaHkgdG8gdXNlIGRyX21vZGUg
PSAicGVyaXBoZXJhbCI/DQo+IA0KDQpObywgdGhpcyBtb2RlIGlzIHNldCBhdCB1ZGMuYywgaXQg
bWF5IGJlIG5vdCByZWxhdGVkIHRvIHlvdXIgZmFpbHVyZSB1c2UgY2FzZS4NClRyeSB0byBkZWJ1
ZyBhdCBwcm9iZSBmdW5jdGlvbiwgYW5kIHNlZSB3aGF0J3MgdGhlIGRpZmZlcmVuY2UuDQoNCj4g
Pg0KPiA+IElmIHRoZSBSTkRJUyBjb3VsZCB3b3JrIGF0IHRoZSBmaXJzdCB0aW1lLCBpdCBzZWVt
cyB5b3VyIGNvbmZpZ2ZzDQo+ID4gc2NyaXB0IHNob3VsZCBiZSBPSy4NCj4gPg0KPiA+ID4gMm5k
IHByb2JsZW0gLSBjb25zdGFudCByZXNldHRpbmcNCj4gPiA+IFdoZW4gSSBjb21waWxlIGEgcGxh
aW4gbWFpbmxpbmUga2VybmVsIHdpdGggImlteF92Nl92N19kZWZjb25maWciDQo+ID4gPiBhbmQg
Ym9vdCB0aGUNCj4gPiA+IGlNWDZVTEwgd2l0aCBpdCBJIHNlZSB0aGF0IHRoZSBVU0IgaXMgY29u
c3RhbnRseSByZXNldHRpbmcgdGhlIGh1Yg0KPiA+ID4gdGhhdCBpcyBwcmVzZW50IG9uIHRoZSBD
b2xpYnJpIEV2YWx1YXRpb24gY2FycmllciBib2FyZC4NCj4gPiA+DQo+ID4gPiBbICAgNDkuNjU0
NjIxXSB1c2IgMS0xOiByZXNldCBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIgdXNpbmcN
Cj4gPiA+IGNpX2hkcmMNCj4gPiA+IFsgICA1Mi4xODA3ODFdIHVzYiAxLTE6IHJlc2V0IGhpZ2gt
c3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZw0KPiA+ID4gY2lfaGRyYw0KPiA+ID4gWyAg
IDU0LjY5OTY3OF0gdXNiIDEtMTogcmVzZXQgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAy
IHVzaW5nDQo+ID4gPiBjaV9oZHJjDQo+ID4gPg0KPiA+DQo+ID4gVHJ5IHRvIGFkZCBleHRlcm5h
bCBwb3dlciB0byB0aGUgVVNCIEhVQiBhdm9pZCB0aGUgYm9hcmQgY2FuJ3Qgc3VwcGx5DQo+ID4g
ZW5vdWdoIHBvd2VyLg0KPiA+IElmIG5vdCwgdHJ5IHRvIGRpc2FibGUgcnVudGltZSBwbSwgYW5k
IHNlZSBpZiBpdCB3b3Jrcy4NCj4gPg0KPiA+ICA1OSBzdGF0aWMgY29uc3Qgc3RydWN0IGNpX2hk
cmNfaW14X3BsYXRmb3JtX2ZsYWcgaW14NnVsX3VzYl9kYXRhID0gew0KPiA+ICA2MCAgICAgICAg
IC5mbGFncyA9IENJX0hEUkNfU1VQUE9SVFNfUlVOVElNRV9QTSB8DQo+ID4gIDYxICAgICAgICAg
ICAgICAgICBDSV9IRFJDX1RVUk5fVkJVU19FQVJMWV9PTiwNCj4gPiAgNjIgfTsNCj4gPiAgNjMN
Cj4gDQo+IFRoZSBwb3dlciBpcyBubyBwcm9ibGVtLiBUaGUgdXNiLWh1YiBpcyBzb2xkZXJlZCB0
byB0aGUgY2Fycmllci1ib2FyZCwgSSBtZWFzdXJlZA0KPiBpdCBhbmQgdm9sdGFnZSBpcyByb2Nr
IHNvbGlkLiBXZSB1c2UgYW4gVVNCMjUxNCBjaGlwLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgaGlu
dCwgZGlzYWJsaW5nIENJX0hEUkNfU1VQUE9SVFNfUlVOVElNRV9QTSBzb2x2ZXMgdGhlDQo+IGlz
c3VlLg0KPiANCg0KVHJ5IHRvIHBvcnQgdGhpcyBwYXRjaCBmcm9tIGRvd25zdHJlYW0gQlNQLg0K
DQpjb21taXQgNTg0MGIxNzRlODVlNjZiNTAyYjQ4ODcwMjZjZTQ0YzU2NjVjMjliMQ0KQXV0aG9y
OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KRGF0ZTogICBNb24gT2N0IDE2IDIzOjEzOjE5IDIw
MTcgKzA4MDANCg0KICAgIE1MSy0xNjU3NiB1c2I6IHBoeTogbXhzOiBzZXQgaG9sZF9yaW5nX29m
ZiBmb3IgVVNCMiBQTEwgcG93ZXIgdXANCiAgICANCiAgICBVU0IyIFBMTCB1c2UgcmluZyBWQ08s
IHdoZW4gdGhlIFBMTCBwb3dlciB1cCwgdGhlIHJpbmcgVkNP4oCZcyBzdXBwbHkgYWxzbw0KICAg
IHJhbXAgdXAuIFRoZXJlIGlzIGEgcG9zc2liaWxpdHkgdGhhdCB0aGUgcmluZyBWQ08gc3RhcnQg
b3NjaWxsYXRpb24gYXQNCiAgICBtdWx0aSBub2RlcyBpbiB0aGlzIHBoYXNlLCBlc3BlY2lhbGx5
IGZvciBWQ08gd2hpY2ggaGFzIG1hbnkgc3RhZ2VzLCB0aGVuDQogICAgdGhlIG11bHRpd2F2ZSB3
aWxsIGtlcHQgdW50aWwgUExMIHBvd2VyIGRvd24uIEhvbGRfcmluZ19vZmYoYml0MTEpIGNhbg0K
ICAgIGZvcmNlIHRoZSBWQ08gaW4gb25lIGRldGVybWluZWQgc3RhdGUgd2hlbiBWQ08gc3VwcGx5
IHN0YXJ0IHJhbXAgdXAsIHRvDQogICAgYXZvaWQgdGhpcyBtdWx0aXdhdmUgaXNzdWUuIFBlciBJ
QyBkZXNpZ24ncyBzdWdnZXN0aW9uIGl0J3MgYmV0dGVyIHRoaXMNCiAgICBiaXQgY2FuIGJlIG9m
ZiBmcm9tIDI1dXMgYWZ0ZXIgcGxsIHBvd2VyIHVwIHRvIDI1dXMgYmVmb3JlIFVTQiBUWC9SWC4N
CiAgICANCiAgICBBY2tlZC1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KICAg
IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54cC5jb20+DQoNClBldGVyDQo=

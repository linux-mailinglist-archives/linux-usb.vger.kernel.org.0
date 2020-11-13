Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A0D2B18BD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 11:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKMKDF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 05:03:05 -0500
Received: from mail-am6eur05on2060.outbound.protection.outlook.com ([40.107.22.60]:24576
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgKMKDE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 05:03:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYy7UAESNdmNqlz39V6uhm16o7cM4YnvT/Wx4z1Iv9StIyCaJxy3mbnYzNcLiLBod/SwzcLwRvYJngOYqg9KbMrcAWZdpH7NKiyXGTvdgaNq0Co9cW4xtWdhbAPf2thj3zqE3fsDh6FI2BM3q2Ldlo1/L7dUPbVmGSBU6BxTABSaXVTPd3ol26nkkRUNH38RIi6/Y3miVAp4fcmdkhq/3aas7vJxQjVdWziHZL7Vcf5dkEP5intATufcBtRAsC4TZVJyLZybgm4qOpRP5YLrJ26N5HB9rKslNZzIL0MqmISzTAaKebxFbred1wNNoEXWQo9p9hshYPD8DLqOaBDDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpum+GgdTsZpu9PVbrQ4hKRcEJAn+H/Bj1cwHYvhdEs=;
 b=REI4F+fWoDh8pJeoPpFYK+oyO7qpDXxYY2nTpOItz8z8oaaUfposI3xSCqVQYhdopiE7h1Bkxwr00PhUSf4nbOmJ9a49vL/MmElMftV0ZBi/PpOZJcxgVexgWssR7d02oXL6y13MYnXJWZnAoj2aZkZiBc1mhXWgA2SqNySaEcu7Tea12PE7sSWo43AsZmzJ7q5v9TpjoYotU0BZ2X4Udfc6PyerIPfRALRPonZsmgjjdQBSTro9R2KM+4//OI2sR8odsbVD1kxjBANEI/Ayd5wFqrELKiRmIu2vRu1JFRzJyc7mncAyB9g3LqwesOR8U5fQC7LTyQRnNqcQtGFeZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpum+GgdTsZpu9PVbrQ4hKRcEJAn+H/Bj1cwHYvhdEs=;
 b=K00aNZyqNrzK/71+lpdxFfXdLUGbOxM2hnt5Uzk1/wDk+HUPF2dyhpSBlPYj+CGK4RPMcSYuB5Bv7VTCv6A2Cw0VTpjwxRmurcOduM22ZEIGVk+qd+tLqizbb4Ngjs4/JIg9RFFVdyDm6T4wryJL7EuboQtwOqjIqqmeubYxuyE=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6620.eurprd04.prod.outlook.com (2603:10a6:10:107::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 10:02:58 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:02:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "g@rowland.harvard.edu" <g@rowland.harvard.edu>,
        Kyungtae Kim <kt0755@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Thread-Topic: WARNING in usb_composite_setup_continue
Thread-Index: AQHWts63EhYqxw4n/06tOdNAYgT+7anBhpYAgAHSrwCAAN22AIAAdOWAgAEus4A=
Date:   Fri, 13 Nov 2020 10:02:58 +0000
Message-ID: <20201113100229.GB21517@b29397-desktop>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
 <20201111194710.GA245264@rowland.harvard.edu>
 <20201112090042.GA19895@b29397-desktop>
 <20201112155905.GB276702@rowland.harvard.edu>
In-Reply-To: <20201112155905.GB276702@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7bc89f41-06f1-4537-17be-08d887bb4caa
x-ms-traffictypediagnostic: DB8PR04MB6620:
x-microsoft-antispam-prvs: <DB8PR04MB66205A46677E23AD0E56FA378BE60@DB8PR04MB6620.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fDGYkAjDqKvNEoM2J4lNTcch1/DLf0t4LvBQ2nzUraMOSrW+SytEfmpC8OqapbgIDmvK9P1f31yyX4HwSjqWAvyibEi9XxgwJjEd0bNG3MRd7uT464Kmurfq2WzdznxPRMLs6ssmbUra7xsjxdzvigwCIqBkBVL5QIxtAFkx2Uhhf70YtH7j6/hp3/jmPry6h9KQv9zFx5RtLi39aX7Y4pnAuTK0JlU1qjSL5ZNxaLGZS5V+lP3lR/TiCb1sdybaaEQy+cIoTQHTZhjGBcdzE5kqgW6cxdzVzCssnvxW47OVBs+2RYVy9yGCFwpmsI7ioYdLUsYO8fcDuY/RCqLJHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(346002)(376002)(396003)(136003)(54906003)(64756008)(66946007)(33716001)(6486002)(186003)(71200400001)(1076003)(91956017)(66446008)(76116006)(33656002)(6916009)(4326008)(66556008)(66476007)(8936002)(7116003)(26005)(8676002)(478600001)(83380400001)(53546011)(5660300002)(86362001)(6506007)(44832011)(2906002)(316002)(6512007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 59KC1qc4AYOYycd8SKH31XOwIwmhfuvBdksVilbepw+2mBMKzmnqoHzbtF6z3QAgi8T7flJuFhftVNDsfZEKIaKHtD47H+fQ1shxeGi2L9t4R74ogrYYGLIBRch0G/ouePmqUIRDTB1H6ektjpG2zZska7bnE1lpbIHplmDEN/qVC2K8cFPShbxC41iODh9g6OMTjz/k9U2enNLx962Ri8Xzr0sKwvtR1G4122M5zonW6saTnHb7GPUbGia4lGozy8Xmro82dASA/g4HAmttMA+l8VGGsA2DFtXuIMsO/nThnWEIcEPpdR5ASXFhcTizXyH95AqdLzsEPtsWaq86YcTxNgEm+kduBJBi5k0Amq9LiujtvjidJWXmgkygnlLnuWAIIs9wtfWcden5YNkAW/V1LriboQQJElby30CwhB7DZ2VRjXiE5dR9PUfebesJ0PRNUpg+6lU5NIw/T/J+TmSDnI1o0OtL+lHl5ji18Trp58+Z6u04c6IZjp8aCF3H8O2yBhyFnPifoWkw586pZ0WRv+qAKExNGrrIUA2BHGzI4VvDIUUH9s8hdVpAPGWlzjtjWRReIXfLj07GkUTQappYbOncBRPljB8Md8lAMLsjd2EsaDMvYf+K4C3yW5ucVGelQ+WAuh7KUR6b4FW7jA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8BAF45CC0D6B1409F9EF34AE91BE67A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc89f41-06f1-4537-17be-08d887bb4caa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 10:02:58.7316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GSuwM3qntSsAzp7NLSHBv3hMXvZHkGZNR4X4mrnCE/uy4/+PXSTLc4IRg+RJ0n8NxAQYPYbZBMwcSEhgwWwFyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6620
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjAtMTEtMTIgMTA6NTk6MDUsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgTm92IDEy
LCAyMDIwIGF0IDA5OjAxOjExQU0gKzAwMDAsIFBldGVyIENoZW4gd3JvdGU6DQo+ID4gT24gMjAt
MTEtMTEgMTQ6NDc6MTAsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gPiBUaGVyZSdzIHN0aWxsIGEg
cG9zc2libGUgcmFjZSwgYWx0aG91Z2ggaXQncyBhIGRpZmZlcmVudCBvbmU6IFRoZSANCj4gPiA+
IGdhZGdldCdzIGRlbGF5ZWQgc3RhdHVzIHJlcGx5IGNhbiByYWNlIHdpdGggdGhlIGhvc3QgdGlt
aW5nIG91dCBhbmQgDQo+ID4gPiBzZW5kaW5nIGEgbmV3IFNFVFVQIHBhY2tldDoNCj4gPiA+IA0K
PiA+ID4gCUhvc3Qgc2VuZHMgU0VUVVAgcGFja2V0IEENCj4gPiA+IA0KPiA+ID4gCUZ1bmN0aW9u
IHJlY2VpdmVzIEEgYW5kIGRlY2lkZXMNCj4gPiA+IAl0byBzZW5kIGEgZGVsYXllZCBzdGF0dXMg
cmVwbHkNCj4gPiA+IA0KPiA+ID4gCQkJCQlGdW5jdGlvbiB0aHJlYWQgc3RhcnRzIHRvDQo+ID4g
PiAJCQkJCXByb2Nlc3MgcGFja2V0IEENCj4gPiA+IA0KPiA+ID4gCUhvc3QgdGltZXMgb3V0IHdh
aXRpbmcgZm9yIEEgc3RhdHVzDQo+ID4gPiANCj4gPiA+IAlIb3N0IHNlbmRzIG5ldyBTRVRVUCBw
YWNrZXQgQg0KPiA+ID4gDQo+ID4gPiAJQ29tcG9zaXRlIGNvcmUgcmVjZWl2ZXMgcGFja2V0IEIN
Cj4gPiA+IAlhbmQgcmVzZXRzIGNkZXYtPmRlbGF5ZWRfc3RhdHVzDQo+ID4gDQo+ID4gcmVzZXRz
IGNkZXYtPmRlbGF5ZWRfc3RhdHVzPyBXaGVyZSB0byBkbyB0aGF0Pw0KPiANCj4gU29ycnksIGZv
ciBzb21lIHJlYXNvbiBJIHRob3VnaCBJIHJlYWQgYSBsaW5lIHRoYXQgc2V0IGRlbGF5ZWRfc3Rh
dHVzIHRvIA0KPiAwIGluIGNvbXBvc2l0ZV9zZXR1cCgpLiAgSSBtdXN0IGhhdmUgYmVlbiBmYW50
YXNpemluZy4uLg0KPiANCj4gPiAgRXZlbiB0aGUgaG9zdCByZS10cnkgdGhlDQo+ID4gY29udHJv
bCB0cmFuc2ZlciwgaXQgc2hvdWxkIHNlbmQgdGhlIHNhbWUgY29udHJvbCByZXF1ZXN0LCBlZywN
Cj4gPiBTRVRfQ09ORklHVVJBVElPTiwgYW5kIGluY3JlYXNlIGNkZXYtPmRlbGF5ZWRfc3RhdHVz
LiBUaGVyZSBpcyBhIGRlc2NyaXB0aW9uDQo+ID4gZm9yIHBvc3NpYmxlIGhvc3Qgc2VuZHMgbmV4
dCBjb250cm9sIHJlcXVlc3QgYmVmb3JlIHJlY2VpdmluZyBzdGF0dXMNCj4gPiBwYWNrZXQgYXQg
VVNCIDIuMCBTcGVjLCBDSCA1LjUuNSBDb250cm9sIFRyYW5zZmVyIERhdGEgU2VxdWVuY2VzDQo+
ID4gDQo+ID4gCSAgSWYgYSBTZXR1cCB0cmFuc2FjdGlvbiBpcyByZWNlaXZlZCBieSBhbiBlbmRw
b2ludCBiZWZvcmUgYSBwcmV2aW91c2x5DQo+ID4gCSAgaW5pdGlhdGVkIGNvbnRyb2wgdHJhbnNm
ZXIgaXMgY29tcGxldGVkLA0KPiA+IAkgIHRoZSBkZXZpY2UgbXVzdCBhYm9ydCB0aGUgY3VycmVu
dCB0cmFuc2Zlci9vcGVyYXRpb24gYW5kDQo+ID4gCSAgaGFuZGxlIHRoZSBuZXcgY29udHJvbCBT
ZXR1cCB0cmFuc2FjdGlvbi4gQSBTZXR1cA0KPiA+IAkgIHRyYW5zYWN0aW9uIHNob3VsZCBub3Qg
bm9ybWFsbHkgYmUgc2VudCBiZWZvcmUgdGhlIGNvbXBsZXRpb24NCj4gPiAJICBvZiBhIHByZXZp
b3VzIGNvbnRyb2wgdHJhbnNmZXIuIEhvd2V2ZXIsIGlmIGENCj4gPiAJICB0cmFuc2ZlciBpcyBh
Ym9ydGVkLCBmb3IgZXhhbXBsZSwgZHVlIHRvIGVycm9ycyBvbiB0aGUgYnVzLA0KPiA+IAkgIHRo
ZSBob3N0IGNhbiBzZW5kIHRoZSBuZXh0IFNldHVwIHRyYW5zYWN0aW9uDQo+ID4gCSAgcHJlbWF0
dXJlbHkgZnJvbSB0aGUgZW5kcG9pbnTigJlzIHBlcnNwZWN0aXZlLg0KPiANCj4gWWVzLiAgVGhl
IGNvbXBvc2l0ZSBjb3JlIGRvZXMgbm90IGFib3J0IHRoZSBjdXJyZW50IHRyYW5zZmVyL29wZXJh
dGlvbiANCj4gd2hlbiBhIG5ldyBTZXR1cCB0cmFuc2FjdGlvbiBvY2N1cnMuICBCdXQgaXQgc2hv
dWxkIC0tIGFuZCBpdCBzaG91bGQgc2V0IA0KPiBkZWxheWVkX3N0YXR1cyBiYWNrIHRvIDAuICAo
TWF5YmUgdGhpcyBpcyB3aGF0IEkgd2FzIGZhbnRhc2l6aW5nLikNCj4gDQo+ID4gPiAJCQkJCUZ1
bmN0aW9uIHRocmVhZCBmaW5pc2hlcyBhbmQgY2FsbHMNCj4gPiA+IAkJCQkJdXNiX2NvbXBvc2l0
ZV9zZXR1cF9jb250aW51ZSgpDQo+ID4gPiANCj4gPiA+IAkJCQkJVGhlIGNvbXBvc2l0ZSBjb3Jl
IHNlbmRzIGEgc3RhdHVzDQo+ID4gPiAJCQkJCXJlcGx5IGZvciBwYWNrZXQgQSwgbm90IHBhY2tl
dCBCDQo+ID4gPiANCj4gPiA+IAlIb3N0IHJlY2VpdmVzIHN0YXR1cyBmb3IgQSBidXQgdGhpbmtz
DQo+ID4gPiAJaXQgaXMgdGhlIHN0YXR1cyBmb3IgQiENCj4gPiA+IA0KPiA+ID4gCQkJCQlGdW5j
dGlvbiB0aHJlYWQgcHJvY2Vzc2VzIHBhY2tldCBCDQo+ID4gPiANCj4gPiA+IAkJCQkJRnVuY3Rp
b24gdGhyZWFkIGZpbmlzaGVzIGFuZCBjYWxscw0KPiA+ID4gCQkJCQl1c2JfY29tcG9zaXRlX3Nl
dHVwX2NvbnRpbnVlKCkNCj4gPiA+IA0KPiA+ID4gCQkJCQlUaGUgY29tcG9zaXRlIGNvcmUgc2Vl
cw0KPiA+ID4gCQkJCQljZGV2LT5kZWxheWVkX3N0YXR1cyA9PSAwIGFuZCBXQVJOcy4NCj4gPiA+
IA0KPiA+ID4gQXQgdGhlIG1vbWVudCBJIGRvbid0IHNlZSBob3cgdG8gcHJldmVudCB0aGlzIHNv
cnQgb2YgcmFjZSBmcm9tIA0KPiA+ID4gaGFwcGVuaW5nLiAgV2UgbWF5IG5lZWQgdG8gY2hhbmdl
IHRoZSBBUEksIGdpdmluZyB0aGUgY29tcG9zaXRlIGNvcmUgYSANCj4gPiA+IHdheSB0byBtYXRj
aCB1cCBjYWxscyB0byB1c2JfY29tcG9zaXRlX3NldHVwX2NvbnRpbnVlKCkgd2l0aCB0aGUgDQo+
ID4gPiBjb3JyZXNwb25kaW5nIGNhbGwgdG8gY29tcG9zaXRlX3NldHVwKCkuICBCdXQgZXZlbiB0
aGF0IHdvdWxkbid0IGZpeCANCj4gPiA+IHRoZSBlbnRpcmUgcHJvYmxlbS4NCj4gPiA+IA0KPiA+
IA0KPiA+IEhpIEFsYW4sDQo+ID4gDQo+ID4gSSBtb3JlIHRoaW5rIGEgcG9zc2libGUgcmVzZXQg
b3IgZGlzY29ubmVjdCBvY2N1cnJlbmNlIGJldHdlZW4gdGhlbSwgYW5kDQo+ID4gY29tcG9zaXRl
X2Rpc2Nvbm5lY3QgaXMgY2FsbGVkLg0KPiANCj4gVGhhdCBzb3VuZHMgcmVhc29uYWJsZS4NCj4g
DQo+IFRoaXMgaXMgd2h5IEkgdGhpbmsgd2Ugd2lsbCBuZWVkIHRvIGNoYW5nZSB0aGUgQVBJLiAg
VGhlcmUgaGFzIHRvIGJlIGEgDQo+IHdheSB0byB0ZWxsIHVzYl9jb21wb3NpdGVfc2V0dXBfY29u
dGludWUoKSB3aGljaCBTRVRVUCBpdCBpcyBiZWluZyANCj4gY2FsbGVkIGZvci4gIEEgbmV3IFNF
VFVQIG9yIGEgZGlzY29ubmVjdCBzaG91bGQgaW52YWxpZGF0ZSB0aGUgb2xkIA0KPiBTRVRVUCwg
YW5kIHRoZW4gdXNiX2NvbXBvc2l0ZV9zZXR1cF9jb250aW51ZSgpIHdvdWxkIGlnbm9yZSBhbnkg
Y2FsbHMgDQo+IHRoYXQgd2VyZSBmb3IgdGhlIG9sZCBTRVRVUCBwYWNrZXQuDQo+IA0KDQpJIHRo
aW5rIHVzYl9jb21wb3NpdGVfc2V0dXBfY29udGludWUgbG9naWMgaGFzIG5vIGlzc3VlLCB3ZSBv
bmx5IG5lZWQgdG8NCmNvbnNpZGVyIGlmIGNoYW5naW5nIFdBUk4gdG8gREJHIGlzIG5lY2Vzc2Fy
eSwgRnV6elVTQiBzZWVtcyB0byBiZQ0KdHJpZ2dlciBwYW5pYyBmb3IgV0FSTi4NCg0KU2VlIGJl
bG93IG1lc3NhZ2Ugb24gaXRzIHRyYWNlIGxvZw0KPiBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2lu
ZzogcGFuaWNfb25fd2FybiBzZXQgLi4uDQoNCg0KRm9yIG5ldyBTRVRVUCwgY3VycmVudCBjb21w
b3NpdGUgbGF5ZXIgbWFrZXMgc3VyZSB0aGUgcGVuZGluZyByZXF1ZXN0DQp3aWxsIG5vdCBnZXQg
dGhlIHN0YXR1cyBzaW5jZSB0aGUgc3RhZ2UgcmVxdWVzdCBpcyBvbmx5IHF1ZXVlZCB3aGVuDQpj
ZGV2LT5kZWxheWVkX3N0YXR1cyBpcyAxLiBCdXQgdGhlIFVEQyBkcml2ZXIgc2hvdWxkIG1ha2Ug
c3VyZSBubyBuZXcNCnJlcXVlc3QgaWYgb2xkIHJlcXVlc3QgaGFzIG5vdCBmaW5pc2hlZCwgY29u
c2lkZXIgdGhlIGNvcm5lciBjYXNlIHRoYXQNCnRoZSBuZXcgU0VUVVAgY29tZXMgYWZ0ZXIgdGhl
IHBlbmRpbmcgcmVxdWVzdCBjYWxscyB1c2JfY29tcG9zaXRlX3NldHVwX2NvbnRpbnVlDQphbmQg
cXVldWVzIHRoZSBzdGF0dXMgc3RhZ2UsIHRoZW4sIHRoZSB0d28gemVyby1sZW5ndGggcGFja2V0
cyBmcm9tIGRldmljZQ0Kd2lsbCBiZSB0aGUgYnVzLCBidXQgaG9zdCBvbmx5IHdhbnRzIGdldCBv
bmUuIE1lYW53aGlsZSwgdGhlcmUgaXMgb25seSBvbmUNCnJlcXVlc3QgZm9yIGNvbXBvc2l0ZSBk
ZXZpY2UgKHNlZTogdXNiX2NvbXBvc2l0ZV9kZXYucmVxKSwgaXQgbWVhbnMgdGhlDQpjb21wb3Np
dGUgbGF5ZXIgY2FuJ3QgaGFuZGxlIG11bHRpcGxlIGVwMCByZXF1ZXN0Lg0KDQpGb3IgZGlzY29u
bmVjdCBldmVudCwgaXQgaXMgYW4gdW5leHBlY3RlZCBldmVudCBiZXR3ZWVuIFNFVFVQKERBVEEp
IHN0YWdlDQphbmQgc3RhdHVzIHN0YWdlLCBhbmQgdXNiX2NvbXBvc2l0ZV9zZXR1cF9jb250aW51
ZSBqdXN0IGRvZXMgbm90aGluZw0Kc2luY2UgdGhlIGJ1cyBoYXMgYWxyZWFkeSBub3QgYXQgY29u
ZmlndXJlZCBzdGF0ZS4NCg0KLS0gDQoNClRoYW5rcywNClBldGVyIENoZW4=

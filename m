Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9094B22ACA6
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 12:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgGWKfe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 06:35:34 -0400
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:41441
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgGWKfe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 06:35:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlQAJadl/gFxCvwlPE6GMWor5ozdlgwpZ5iVISi2oSb2toKhgRzmjRELmZuM5b+B17xKt40Zy8dmyc7wdcShva9/T/+uNxSmkdmQ9gPawSJOZxjgLEeLvEndMp92pmOnEmZvD/3aqWd+XpgSEzojHq/ylneKBVUwyv2T9HYDkQUk6XcpYOo3EhAxRqAuezCVlvFkwUl4/D3dDRBdREXfooaC6oSk9u2H+VHcYdqa7Wmo/Cqay+tKNe76Kio011IsAMrKHQ5lqQd3ZZ3WCgrtS9n5k9vYtE5YqYJL9wFr9puf5al5Z/Dv4VPNYFVxUdu69PfJn0SdFct4gq5+f8au4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb1dTmnP2Q7ohAYFwQQyXi0r9CxLFYoGySE6ktQV4Co=;
 b=N4iEYBxAoN7Tptr9JBeYpHozZ2/XA3XO2V17EweRpi+n4hhR/Pfrwm17TVp9dD8O3YuR3XhwYCsqJ6Og0IwNGDUODJEs7eget2zgVhK8oXDy9B162lV/kZ45GpN9uZKd4WIELbVjtH325x2EcmzFKqd1yL0exiCFNYnqPfXQ5UmUgBawL9Msp0RBJ3bAYmigN/lADmm3PRoOgdPDIGSoyOrCfUTBWA2xnkE/09HuIgb2xFgoqNVRf5zq3bJhxSQQImPtK+Nxpzg6v8RfmX0ztVj1OfegikMs4tMvBxxkl8aPJc7pklIW7FS6gRaUv7uP6wVvTggy2A1BLGxMFt5XOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb1dTmnP2Q7ohAYFwQQyXi0r9CxLFYoGySE6ktQV4Co=;
 b=DDolD5LbF/e4RPRv+lKEpkV69jqE8oxWPJO1DNo0mSX7S3STpKzOIgDenoj9JARQhGxKbEzpQGuAoopVgWiRlghvpQoVBs9exJ41jCGAo0bXGAoOusie7KhwMxhw3KHTVCL+DrwfuDV93HwC83bjiquxyCLpTE3rn/ZenltflLk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2593.eurprd04.prod.outlook.com (2603:10a6:203:37::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Thu, 23 Jul
 2020 10:35:30 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 10:35:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Bastien Nocera <hadess@hadess.net>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/2] USB: Fix device driver race
Thread-Topic: [PATCH 1/2] USB: Fix device driver race
Thread-Index: AQHWYA0AzAqBUavxXE2biSfq3fmPF6kTuOQAgAAHeYCAAK7OAIAAcNQAgAAWgEA=
Date:   Thu, 23 Jul 2020 10:35:30 +0000
Message-ID: <AM7PR04MB71570D838FDDB467A302423E8B760@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722152640.GC1310843@rowland.harvard.edu>
         <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
         <20200723021904.GA5798@b29397-desktop>
 <bbc6bd03507d8ec3462f671f06587317f3fcbfca.camel@hadess.net>
In-Reply-To: <bbc6bd03507d8ec3462f671f06587317f3fcbfca.camel@hadess.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hadess.net; dkim=none (message not signed)
 header.d=none;hadess.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [218.82.62.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 68d4e962-954d-4845-fa0e-08d82ef41f77
x-ms-traffictypediagnostic: AM5PR0401MB2593:
x-microsoft-antispam-prvs: <AM5PR0401MB2593750A0F13C1A1D4FB73488B760@AM5PR0401MB2593.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6/V7pxRlaFcsTl90Py8FQ2oAjoddg2jUik2vFisz1clKZ6/J4HDlpjlA1phISqcDQ6EkQ1Nwi2SGZ3M1c7pcG7zK5qDQDC/MK1N1N3qOGi0P51W25wWTkMFEv6ETmuGuRyolbVjpbY9MWCOyAMcp8rg51MlEBhsRGNlP6vlooGw8FXCitlduKDxJ1FLeqUp2aBMNCtodZ7lKVqVvo6wveFffUcoICnkQISvH6HB8JosjaIeYwIcKp39GrQD3qvxAIpBa7oNjjOxxAWdxvL1UzqZbMNqC5jyZeYoOYAktIwP6z5NQ/FePrpWWhfK3h3FjSIFrYI/kyDvw1juc8CXExQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(66446008)(478600001)(76116006)(9686003)(55016002)(54906003)(64756008)(66556008)(71200400001)(186003)(316002)(66946007)(44832011)(83380400001)(66476007)(6506007)(26005)(4326008)(52536014)(2906002)(5660300002)(6916009)(8936002)(7696005)(8676002)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7hZ7EyADp8Jm6A/pqcj72hQjIgU5txK6sb3w8zES2C5k8R9Rz7hwyf7zgnZ0XYeH/TaxBavHY7rr8ZffDKoksLRZw8hpPSnaq64tIFOD7DtyGJ2PYyfBKnohMp0kDgOirnQvw0lD/gXNwi5P+Iw8zQNjz0empvFeLnwhlZvy7+bLqKrI93823jUkjirbtHvSqyOwbd3JNKVwx1yx++6cfRLEx1BcrNC7BivfKjOQM0qj5kCnkE5h4B7Hd76x8s7j0B2hSqD3DsiZ4ZSy3WdMH5v7daG7fC6bEwxl1wvEunz+W0t+FKMjVNjakjfGaprqT7qCxb775N2iJ7eyygZ9xnAC09mRyHu3bZDGBKgleGVTAnu6zSs/FaQVMcvhCb3gRy4BzOB487hGp19KmmrRdkdQq28i5WaDVs4ONtYmAYdaSflNCNAg9pgrkrjgLR4gu3q1uZ3XoDm4nj3bxE+b5Xe20koqlTmD8wQ+a5wcp4o=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d4e962-954d-4845-fa0e-08d82ef41f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 10:35:30.6734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SleIWOyhHS4QGoyzdc77rG76Ckl0YcRPda3B8DULR9fYLUlZ0t/k2PFbbegyTWVYRXAtyON4zV7JIAyIn2glWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2593
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+ID4gPiA+IEFmdGVyIHRoYXQsIG5vdGhpbmcgd2lsbCB0cmlnZ2VyIGEgcmVwcm9iZSB3
aGVuIHRoZSBtb2Rwcm9iZSgpJ2QNCj4gPiA+ID4gPiBkZXZpY2UgZHJpdmVyIGhhcyBmaW5pc2hl
ZCBpbml0aWFsaXNpbmcsIGFzIHRoZSBkZXZpY2UgaGFzIHRoZQ0KPiA+ID4gPiA+ICJnZW5lcmlj
Ig0KPiA+ID4gPiA+IGRyaXZlciBhdHRhY2hlZCB0byBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IFRyaWdnZXIgYSByZXByb2JlIG91cnNlbHZlcyB3aGVuIG5ldyBzcGVjaWFsaXNlZCBkcml2ZXJz
IGdldA0KPiA+ID4gPiA+IHJlZ2lzdGVyZWQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBCYXN0aWVuIE5vY2VyYSA8aGFkZXNzQGhhZGVzcy5uZXQ+DQo+ID4gPiA+ID4gLS0t
DQo+ID4gPiA+ID4gIGRyaXZlcnMvdXNiL2NvcmUvZHJpdmVyLmMgfCAzMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2NvcmUvZHJpdmVyLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvdXNiL2NvcmUv
ZHJpdmVyLmMgaW5kZXggZjgxNjA2YzZhMzViLi5hNjE4N2RkMjE4NmMNCj4gPiA+ID4gPiAxMDA2
NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9jb3JlL2RyaXZlci5jDQo+ID4gPiA+ID4g
KysrIGIvZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYw0KPiA+ID4gPiA+IEBAIC05MDUsNiArOTA1
LDMwIEBAIHN0YXRpYyBpbnQgdXNiX3VldmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gPiA+
ID4gc3RydWN0IGtvYmpfdWV2ZW50X2VudiAqZW52KQ0KPiA+ID4gPiA+ICAJcmV0dXJuIDA7DQo+
ID4gPiA+ID4gIH0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICtzdGF0aWMgaW50IF9fdXNiX2J1c19y
ZXByb2JlX2RyaXZlcnMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkDQo+ID4gPiA+ID4gKmRhdGEp
DQo+ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiArCXN0cnVjdCB1c2JfZGV2aWNlX2RyaXZlciAqdWRy
aXZlciA9DQo+ID4gPiA+ID4gdG9fdXNiX2RldmljZV9kcml2ZXIoZGV2LQ0KPiA+ID4gPiA+ID4g
ZHJpdmVyKTsNCj4gPiA+ID4gPiArCXN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2ID0gdG9fdXNiX2Rl
dmljZShkZXYpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCWlmICh1ZHJpdmVyID09ICZ1c2Jf
Z2VuZXJpY19kcml2ZXIgJiYNCj4gPiA+ID4gPiArCSAgICAhdWRldi0+dXNlX2dlbmVyaWNfZHJp
dmVyKQ0KPiA+ID4gPiA+ICsJCXJldHVybiBkZXZpY2VfcmVwcm9iZShkZXYpOw0KPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gPiA+ICt9DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICtzdGF0aWMgaW50IF9fdXNiX2RldmljZV9kcml2ZXJfYWRkZWQoc3RydWN0IGRldmlj
ZV9kcml2ZXINCj4gPiA+ID4gPiAqZHJ2LA0KPiA+ID4gPiA+IHZvaWQgKmRhdGEpDQo+ID4gPiA+
ID4gK3sNCj4gPiA+ID4gPiArCXN0cnVjdCB1c2JfZGV2aWNlX2RyaXZlciAqdWRydiA9DQo+ID4g
PiA+ID4gdG9fdXNiX2RldmljZV9kcml2ZXIoZHJ2KTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
KwlpZiAodWRydi0+bWF0Y2gpIHsNCj4gPiA+ID4gPiArCQlidXNfZm9yX2VhY2hfZGV2KCZ1c2Jf
YnVzX3R5cGUsIE5VTEwsIHVkcnYsDQo+ID4gPiA+ID4gKwkJCQkgX191c2JfYnVzX3JlcHJvYmVf
ZHJpdmVycyk7DQo+ID4gPiA+DQo+ID4gPiA+IFdoYXQgZG9lcyB1ZHJ2IGdldCB1c2VkIGZvciBo
ZXJlPw0KPiA+ID4gPg0KPiA+ID4gPiA+ICsJfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCXJl
dHVybiAwOw0KPiA+ID4gPiA+ICt9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICAvKioNCj4gPiA+
ID4gPiAgICogdXNiX3JlZ2lzdGVyX2RldmljZV9kcml2ZXIgLSByZWdpc3RlciBhIFVTQiBkZXZp
Y2UgKG5vdA0KPiA+ID4gPiA+IGludGVyZmFjZSkgZHJpdmVyDQo+ID4gPiA+ID4gICAqIEBuZXdf
dWRyaXZlcjogVVNCIG9wZXJhdGlvbnMgZm9yIHRoZSBkZXZpY2UgZHJpdmVyIEBADQo+ID4gPiA+
ID4gLTkzNCwxMyArOTU4LDE2IEBAIGludCB1c2JfcmVnaXN0ZXJfZGV2aWNlX2RyaXZlcihzdHJ1
Y3QNCj4gPiA+ID4gPiB1c2JfZGV2aWNlX2RyaXZlciAqbmV3X3Vkcml2ZXIsDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiAgCXJldHZhbCA9IGRyaXZlcl9yZWdpc3RlcigmbmV3X3Vkcml2ZXItPmRydndy
YXAuZHJpdmVyKTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC0JaWYgKCFyZXR2YWwpDQo+ID4gPiA+
ID4gKwlpZiAoIXJldHZhbCkgew0KPiA+ID4gPiA+ICsJCWJ1c19mb3JfZWFjaF9kcnYoJnVzYl9i
dXNfdHlwZSwgTlVMTCwgTlVMTCwNCj4gPiA+ID4gPiArCQkJCSBfX3VzYl9kZXZpY2VfZHJpdmVy
X2FkZGVkKTsNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBsb29rcyBmdW5ueS4gIFlvdSdyZSBjYWxs
aW5nIGJvdGggYnVzX2Zvcl9lYWNoX2RydigpIGFuZA0KPiA+ID4gPiBidXNfZm9yX2VhY2hfZGV2
KCkuICBDYW4ndCB5b3Ugc2tpcCB0aGlzIGl0ZXJhdG9yIGFuZCBqdXN0IGNhbGwNCj4gPiA+ID4g
YnVzX2Zvcl9lYWNoX2RldigpIGRpcmVjdGx5Pw0KPiA+ID4NCj4gPiA+IFlvdSdyZSByaWdodCwg
bG9va3MgbGlrZSB0aGlzIGNvdWxkIGJlIHNpbXBsaWZpZWQgc29tZXdoYXQuIEknbQ0KPiA+ID4g
YnVpbGRpbmcgYW5kIHRlc3RpbmcgYSBzbWFsbGVyIHBhdGNoLg0KPiA+ID4NCj4gPg0KPiA+IFdo
YXQgZG8geW91IG1lYW4gInJlcHJvYmUiIGZvciB5b3VyIGRldmljZT8gRG8geW91IG1lYW4gdGhl
DQo+ID4gbWZpX2ZjX3Byb2JlIGlzIG5vdCBjYWxsZWQ/IElmIGl0IGlzLCBXb3VsZCB5b3UgcGxl
YXNlIGNoZWNrIHdoeQ0KPiA+IHVzYl9kZXZpY2VfbWF0Y2ggYXQgZHJpdmVycy91c2IvY29yZS9k
cml2ZXIuYyBkb2VzIG5vdCByZXR1cm4gdHJ1ZSBmb3INCj4gPiB5b3VyIGRldmljZT8NCj4gDQo+
IG1maV9mY19wcm9iZSgpIGlzbid0IGNhbGxlZCBiZWNhdXNlIHRoZSBkZXZpY2UgYWxyZWFkeSBo
YXMgdGhlIGdlbmVyaWMgZHJpdmVyDQo+IGF0dGFjaGVkIGJ5IHRoZSB0aW1lIHRoZSBhcHBsZS1t
ZmktZmFzdGNoYXJnZSBkcml2ZXIgaXMgbG9hZGVkLg0KDQpXb3VsZCB5b3UgcGxlYXNlIGV4cGxh
aW4gbW9yZSwgd2h5IG9ubHkgdGhpcyBkcml2ZXIgaGFzIHRoaXMgaXNzdWU/IFNlZW0geW91DQpj
cmVhdGUgYSBzdHJ1Y3QgdXNiX2RldmljZV9kcml2ZXIsIGJ1dCBub3Qgc3RydWN0IHVzYl9kcml2
ZXIsIGZldyBkcml2ZXJzIGRvIGxpa2UNCnRoYXQuIFlvdSBtYXkgc2VlIGRyaXZlcnMvdXNiL21p
c2MvZWhzZXQuYyBhbmQgZHJpdmVycy91c2IvbWlzYy9hcHBsZWRpc3BsYXkuYw0KYXMgYW4gZXhh
bXBsZS4NCg0KUGV0ZXINCg==

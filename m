Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837FB24D1D6
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 11:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgHUJ5d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Aug 2020 05:57:33 -0400
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:6725
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725855AbgHUJ5c (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Aug 2020 05:57:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TukpHbE615tDJv6YPjnUSmYiKgOfPCmeHM2hJc05nYuwSWGjiRjgC3VZzKi6GF4XCshIum7LUNAFwMJnIYg3RxbkdHSzbKMIpeuP9PvWI/i/4i4fVf6YBhFm9xkF2tA6v02gy1DY9ThvN9ecyBzKrTKsGoqVn8IhVQZKHI7691gjZ/i2EXaOLxNt+WOo4023MGZF0OY9dpmxfw3TYlI+x18liu/Z1UZzCf2cAylg5p2OFLgVmkE8dsh3yocWmp52Tyzj5yY6k7prLRvuf3A5JbajMuj0MfHZVQ9P/siwhnkVvL9XCoYIiPrjGgS6vy1XWrht6B6I9QNuyJQhTLCdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s43hq6R/YlEl2oACohf/g1tzw/AJMZjOXs0TXohek4M=;
 b=j4nXoh0zZGsDpqE/za5i+txC0v9ZOyQwEauMtgaFzckHx4OnqQCEXV9ciHMLDd1+YCytN2vxKaJcmLvk4T2F6k4i8AG6yftpQgZHzzJNU0tQIlrRJz6t8JhUIfKsbRGRQuXkksCElSOiIUFYEpyox50QlxuToFKtEIwGX7kN7g/49f/GKqUSwFU8zqe2poy4GeDDDLPQU70sRmSo7msV3ZgQgQzWRU4CdBwNWN9h4YKr1Ar2KVux78DK0Ln3u6Lz3bqCC0fsgFTPmYaH1+mXXiBmc85INroxeHjlzjwvFQGqKeqDPst6ns4vzCfaSuJwWgTu/dSOdIPX8rjh5WVLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s43hq6R/YlEl2oACohf/g1tzw/AJMZjOXs0TXohek4M=;
 b=PsVG6XFD05/NuMOLUffmz4oP11ZIZniP6lppi00kaiPQON4kp57WWFc3On+0Lxm5RCxasV9Tj+tdorF5Hbk5k3aM9jL8VlAoC0EQBu0dZW2uAOrG886lBjVsbqQmD9HsjjIHlZsHvdeyIEIfXWvN4zxsH/JmymY+l+qYeyd4qV8=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 09:57:29 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3305.026; Fri, 21 Aug 2020
 09:57:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH v2 5/7] usb: host: xhci-plat: add wakeup entry at sysfs
Thread-Topic: [PATCH v2 5/7] usb: host: xhci-plat: add wakeup entry at sysfs
Thread-Index: AQHWdHs32D1j1Wm7l0SpC4L1jEA7PKlCVHeAgAADxEA=
Date:   Fri, 21 Aug 2020 09:57:29 +0000
Message-ID: <AM7PR04MB715743B72D2A8ED9D81C57848B5B0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
 <20200817094440.23202-6-peter.chen@nxp.com>
 <65210245-6324-44f7-3a27-fa78ca568407@linux.intel.com>
In-Reply-To: <65210245-6324-44f7-3a27-fa78ca568407@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5fb89296-e9c7-45d8-be81-08d845b89d9f
x-ms-traffictypediagnostic: AM7PR04MB6997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB69978ACCD8549419A2D7107A8B5B0@AM7PR04MB6997.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UACLOb8Y8pbVEFTjYw+3UsViJmx7ekQ540HzmgiKxlMuNFBB7l59WBlAchhJuYLVCFRSz1yqZlQyrjD2+VndAUqdbkI9MF1tjpsJuVC4pHuJ0Qe9KZFSS15FTatRxhYmMdkH86S/nkTrhp2UI4SR+g9000ZxONe2/IwB6oV7/inIWy4ZYS3Tw3L0Zp2YzgOm7GnLkrrBjhG84dC3SS5Qjdr5oWRSY9dxWJreUlGQFqMmDRLAA+EDenkCHW2NRZo5dk+qzW2OUsNBQMB3riOqLRbJwozKLwqDYVQJ/ebVVLT2GKmk6Ni6vuV9oshaqvFpv3vvnrQ7BKXuSsDvYWrBrTPFz7hyNcIjzdurDJwOz5lBSM8FF89Vv/eyRTzlVsDZ3Jbt+ccXVBMM4NbahYWA6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(8676002)(2906002)(66946007)(7696005)(966005)(76116006)(54906003)(44832011)(55016002)(6506007)(478600001)(4326008)(52536014)(316002)(8936002)(110136005)(66446008)(33656002)(66556008)(86362001)(26005)(64756008)(66476007)(9686003)(5660300002)(71200400001)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LeRHpjyThlhIW9CKFIQ3AFOGSWKzmKimslhGohBy5k8FncsEPeUqIYZu6Xf/IoRbQrv+RNduI5UJCadbzP+gor29poWPE97X0iLirLO6pnHW+xor0MnD8QjQit6X5m6ntk0uxivhXi2R5TVv2zLCin3QLsSsKK+SIuO3TfLLMGUPRg5DB/iN0r+loIT+hGLiJ3TDG7+nVXvA9gHOhUBEbQMzGxRcr07xq2XSpnhMqamDYgDL9YLsgicIZxEDTrFofkJJ4TBLaG87LTxNoEdm9UsnsL1XNb7V90JI05W2C8PF0kZM0EOO8nlPZYc5QVvGjZcWYryfNUByM9p0xx5W7/VKpogGX5qDX4ewzHEFU+NdamPr/76IULA4JddI9YLaRqUm/QYw4qPD2Kgocobxvir1IoFuZNu82D6qi7crtm8trsnuvFQgwS6/nD6B3r3O8HttHKVzTSrXspEzFeshNfV3pt0JpJTA3gIR4SYU8maqjuQioMmYxKIXD9hYazvazHQJ58qu238rt1dccd8geB71BMAVzeQXZT8S6IeN/53HGmtm6dsNBIiisWp3dNGHOGCiL+E/jqizmcGIIAyb35s/EdIiQgCbXhoymzjSEmI+MfAnXbt8S6Ok5PbSZrVEtfzZPixT2RF9aJZwBagY3g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb89296-e9c7-45d8-be81-08d845b89d9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 09:57:29.2551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2nYAZuT13o5jQJ+iuSRHo6letrQEhJKY9PxWg15eQxiS8G1KcqXmi9EIPQ2uy65tfj3Q24XHkyjUNOICMrUKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIHwgMiArLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ID4gYi9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcGxhdC5jIGluZGV4IDE0ZmY2NWEzODdlOC4uY2ZjYTZmYzg5NDdjIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gPiArKysgYi9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ID4gQEAgLTI4Nyw3ICsyODcsNyBAQCBzdGF0
aWMgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+
ICAJCSpwcml2ID0gKnByaXZfbWF0Y2g7DQo+ID4gIAl9DQo+ID4NCj4gPiAtCWRldmljZV93YWtl
dXBfZW5hYmxlKGhjZC0+c2VsZi5jb250cm9sbGVyKTsNCj4gPiArCWRldmljZV9zZXRfd2FrZXVw
X2NhcGFibGUoJnBkZXYtPmRldiwgdHJ1ZSk7DQo+IA0KPiBBbGwgb3RoZXIgcGF0Y2hlcyBzZWVt
IHByZXR0eSBzdHJhaWdodCBmb3J3YXJkLCBidXQgd2l0aCB0aGlzIG9uZSBJIGhhdmUgdG8gc29t
ZQ0KPiBtb3JlIGRpZ2dpbmcuDQo+IEkgc2F3IHlvdSBoYWQgYSBkaXNjdXNzaW9uIHdpdGggQWxh
biBhYm91dCB0aGlzIHRvcGljIGFib3V0IGEgbW9udGggYWdvLCBidXQgSSdtDQo+IG5vdCBzdXJl
IGlmIHRoZXJlIHdhcyBhbnkgY29uY2x1c2lvbiBhYm91dCB0aGlzLg0KPiANCg0KQWxhbiBzdWdn
ZXN0ZWQgc2V0IHBvd2VyL3dha2V1cCBhcyBkZWZhdWx0IGVuYWJsZWQgYmVmb3JlLCBidXQgaXQg
d2lsbCBjYXVzZSB0aGUgcG93ZXIgZG9tYWluIG9mDQp0aGlzIGRldmljZSAoYW5kIHBhcmVudCkg
d2lsbCBub3QgYmUgb2ZmIGR1cmluZyB0aGUgc3lzdGVtIHN1c3BlbmQvcmVzdW1lIHNpbmNlIHRo
ZSBwb3dlciBtYW5hZ2VtZW50DQpjb2RlIHRoaW5rcyB0aGF0IHRoZSBwb3dlciBzaG91bGQgbm90
IGJlIG9mZiBpZiB0aGUgZGV2aWNlIG5lZWRzIHRvIHJlc3BvbmQgdGhlIHdha2V1cCBkdXJpbmcN
CnRoZSBzeXN0ZW0gc3VzcGVuZHMuIFdlIGhhdmUgYWdyZWVkIHRvIHNldCBwb3dlci93YWtldXAg
YXMgZGVmYXVsdCBkaXNhYmxlZC4NCg0KaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGlu
dXgtdXNiL21zZzE5OTMxNi5odG1sDQoNClBldGVyDQoNCg==

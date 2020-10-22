Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA162958ED
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 09:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508373AbgJVHRW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 03:17:22 -0400
Received: from mail-eopbgr50041.outbound.protection.outlook.com ([40.107.5.41]:41089
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2508362AbgJVHRT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Oct 2020 03:17:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jco9vBb9si9evHvWlgjhr6xTblQ731mmWmeGBG4Uv6Ktz/JHH9g4oTTrisYJYlfQSAGtH/BfxF7uGTgWGaFpR/zDgOqah6Q86F/9h5AY9OSMwTjzqVXVENWJmlvG4qsIUiZNqpaIInfxiR80IONe/WC7/KeWwThvvD47ZN3N6KdnYb+Shaa4QIsWp2zMRlmz+KS9MfQ62SsRALtRzHS5Zt/wNg3+D4aJn5OUK6yQJ3UV0yEJAYYyBP4hS2EDRCnxv/ShskoQ6nprzqnHEAlg4QWMnCBVlmAngwXtfec/ZLPevVRSW6uhS6MEz9QGnmZ0cW2LlFDAspjBsShdTKvqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHnwIHys9nZS2JyJAbcSddo754ZTZNMVVmdpvGXwpoM=;
 b=G7GtTWEQokGWh1lt+RyR9oPuvjicoNImDvIAm2/+/RKtLz7FldaMyx7ailaVdDzVQ5t13zfEOpxSEI/EaCot3ytGq1hGefVnBbSEgYU5rCeC5+OaZCcqIcEer79lAZwpw9R0KDW38XGOq9S+Dqc+YJaLKLuMq2y5Ggj7Jd0559jcmMw/AQRCugs7mi+gFYiYglFNfFyzCNXzGBvcVIOtgIPHnntvV45/kOCugx4Ipuf6fvMMsan8glcP7dmirt0M0U4bLSKy4jiTM2u/RKNv2quAqp/rwKQhWcn5aVJGajMOKvJ7R0G/zkvUZ+hZGLaTBJavd+EdoQtLCJmfBFVAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHnwIHys9nZS2JyJAbcSddo754ZTZNMVVmdpvGXwpoM=;
 b=WS4VCAYiaQoBFZmJcmAQWRbiq+V5xuBAb6xgtHWILDC0N8Bb96fJUbvkjI7EiJIhHJ0y3WYJd/GLjnJmFh9788g0HRHD0ZMMBAUKtNvMS5MOksXMgOUDbxnM1592uXZ199zixDc2HyF9Jt8Kthb/K7TJOv2mV4cuCVTMuiX43ac=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3364.eurprd04.prod.outlook.com (2603:10a6:208:17::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 07:17:15 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 07:17:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Roger Quadros <rogerq@ti.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Topic: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Index: AQHWqB+8EkbyC5HZU0qhM2+GN/QOFamjLluAgAAHqjA=
Date:   Thu, 22 Oct 2020 07:17:14 +0000
Message-ID: <AM8PR04MB7300B94F884BC9D4ABC0DF958B1D0@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201022030133.19528-1-peter.chen@nxp.com>
 <fb21b4ca-9c56-a555-8716-13cd9d2e69b7@ti.com>
In-Reply-To: <fb21b4ca-9c56-a555-8716-13cd9d2e69b7@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4b01ae4b-7945-4385-8314-08d8765a809c
x-ms-traffictypediagnostic: AM0PR0402MB3364:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR0402MB3364A3031848A1E60E2CADB78B1D0@AM0PR0402MB3364.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sED5dxGkWcAyCRbZ02ngpmjyfpJhrHQ4u9D0nqFHxpX+zX4/PTHGlDkEE+nMElrqCqXIU+AQVP8CNEITV0kRuJ89Fc6TPchpehq0kkg6HLg0UDY5BE3rwOAAPtlReuRbylFS5L6nSE+OV+7Se7VtusA3e6wU2VeZD9e4E0SXMBGu+jEh4K7mXOyXDz+KJYEy/3xheMLJIwIpxwp9u+0sCFc0qv3NYFNlMxljHsnCuLj8toF5QvuBFsfbybDCRXbsVEbOzwzuoqMWzoWyTmY53Qn/eM3FCPN8NX1kmtcqXX5Z+yUMWzDNxSOwVbgOZL1v6V6gyQxLoxD/lH+z5pV6RA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(76116006)(71200400001)(66556008)(86362001)(9686003)(44832011)(66476007)(66946007)(4326008)(316002)(33656002)(110136005)(54906003)(64756008)(5660300002)(6506007)(53546011)(52536014)(4744005)(8936002)(66446008)(55016002)(186003)(7696005)(8676002)(26005)(2906002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rHnz/UBKIoP6fSStGza4Eoh+snopeynhiEoEkRD6LUFf8htG8lSnk7SZrKPNmsadVdfFfOJb7fF+AT4eTxZrUsO5Shno+pCmKjZmihgG3p4X9T3ZD3PbzGIHJ444jE133FHQWuX0gdJZ7bucjsOUYV3nlxVbYZbBLEGhiQYdQonR25CnYyxYTuxoc3JDxuvhGQ4uBfKhouXeD+Vvi8CJGMe0QkwGPsMkF4jxRup5hmSH2Zj/UEF0+gN8Jkeo9+usHK1JTecEAtmPPw29ar1P0AnGlUcdfK93YG/NjTN69cTZjyFeLQvrmY3CRJvjgV05xuPMbrQBptPbEjEUlSg/3hbcTBSLl3INiybQ3ZI9iJtnUgbsvyuZqtmUiaLaCOUKRxP6HHIgMRqS9zIBsckIG7sCMkeLlRyij8KOuNbdlg0/UkRYgSwsxbfYk4kRd5tsfqXkX40a1EcfgBUVM45M1ADeLq61uRAbGHrCVoVqg0OtMVJJcYjL7QXDrj/X1o9hQ9ZVEQz8ciLf/B+1bzAOEzN7XSg+0Xzdev2ShRN10IV0iXARyAwAYGlELwJB71HY8vpT+KLXlu/Txht2MomeVBw203nCcBIAVtqmpbCl4P46VZ3rN2oKt43kqFX4xPMcI0pSJaE22s8GYmGzjy8STA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b01ae4b-7945-4385-8314-08d8765a809c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 07:17:14.8993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmQJzZziT91LO8EQdaj8LNrjmGmZk+PsDs8/CgCFc8QrGpCaSmvp3Dm7VuhxgIgGrDcS1rqvo448eLhRui2E0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3364
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gT24gMjIvMTAvMjAyMCAwNjowMSwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPiBUaGUg
Q2FkZW5jZSB4SENJIGhvc3QgaGFzIHRoZSBzYW1lIGlzc3VlIHdpdGggSW50ZWwncywNCj4gDQo+
IHMvd2l0aC9hcw0KPiANCj4gPiBpdCBpcyB0cmlnZ2VyZWQgYnkgcmVib290IHN0cmVzcyB0ZXN0
Lg0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgcHJvdmlkZSBzb21lIG1vcmUgZGV0YWlscyBhYm91dCB0
aGUgdGVzdCBzbyBJIGNhbiB0cnkgYXQgbXkgZW5kLg0KPiBUaGFua3MuDQo+IA0KIA0KQ29ubmVj
dCBVU0IzIERyaXZlIGF0IHBvcnQsIGFuZCByZWJvb3Qgc3lzdGVtIG92ZXIgbmlnaHQuDQoNClBl
dGVyDQo=

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2CF2AE8F9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 07:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgKKGcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 01:32:17 -0500
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:65054
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726090AbgKKGcL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 01:32:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKRpVotZF7VRi31c5tyMglyXkyUKr5L/IC0P6o+23wNfO7rkxLYsEmVBWfUyPEHJxrnd/lfvQarrey2XE6cpI3WOS3Nc0RxPCPFIt897TDLWtDwO4gvyZ240BKtZ7TzU669Ap3ix6lJMHMw+xh3+dW8lFsEyqOI4ZgeDgkMF488RvMzaWq4DOX7YFCSr8aO7XHy15p6jeh9HywnDXMvif9up1YVwD20Yf4dwIFg3zwwMgcVVwwczMqfBt/QGJp6csvuszjAirTP8AuuMtSPYtTBgAgbEjdaSSmUQz8odrzfZ+v/87Z2vZv872L7UXq9pNDabt2sSD6wSP/HYwQfK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5er+o2Tv46NoMemMep1byGW9Bg4JezAYaIC+Ocg8+8=;
 b=lHaAoR32X7he5PQGoNvLyH+yN4BzbjGyODXSw+WCW5eMK8Q0kCcNV1e988U32In7SsnjeoZ2rEf8Fc/z3MsOSSEodrQTPDX02q8FGUpZGI98DIAUlomIwMcAvOgQWnMU3UNM7w6pGDi1i/L3AP/kVzEX6K5DCvf+x0F4hNMvMjIym9pW4FWebjkp5sudJN5L0cDypbqUoHyKyzhIehCe0NQ9uBDu+WVit01kWTgP22AaVK9hxxnysQx6atTtQ6TGfVAM/b7DaBPzlKfROiJf/zUA8FAPl0HMSAROUf4RI4hFHXvYre7teaCDnSPH1dQARsxLERVk8ZoIW/DXrDeq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5er+o2Tv46NoMemMep1byGW9Bg4JezAYaIC+Ocg8+8=;
 b=a5/svLJJ3rA8ujrg0oQVmr9SE7tT9bqx3pWeUETos+AO7Kp2HsSkfdxaLsQCWof2vqWKB5iHqunv6+YmcoBPaTmBLPvTh53gGbPI/vF91bxaE88t4IIchfyBl8f0ydjF8hwLdGhYMau6JBkNcDKFUqDIG0JqOJcH4mM0h9v/QfI=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 06:32:08 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 06:32:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     USB list <linux-usb@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>, Jun Li <jun.li@nxp.com>
Subject: RE: chip idea: Crash on i.MX27
Thread-Topic: chip idea: Crash on i.MX27
Thread-Index: AQHWt1yHJ9O+tJmkPUaZqcU76hhJeqnCJ6CAgAAN3QCAAEPcAA==
Date:   Wed, 11 Nov 2020 06:32:08 +0000
Message-ID: <DBBPR04MB79790AED7ABC5F8320753C518BE80@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <CAOMZO5AMuRv5AZ2HOEgqzaPcbLeNXWajpTB40Dejs7gcsL=BhQ@mail.gmail.com>
 <20201111013711.GA14896@b29397-desktop>
 <CAOMZO5Aik9vSdQCMea5B7CAOs0UBzUgdDBiW9S9-o+_-isWKJQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Aik9vSdQCMea5B7CAOs0UBzUgdDBiW9S9-o+_-isWKJQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0bc3b73b-21d6-43b8-6098-08d8860b83d1
x-ms-traffictypediagnostic: DB8PR04MB6858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB68588EF25B53C77B9174924D8BE80@DB8PR04MB6858.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GxlQuxyH63JG895a/ZBjyQskoPmzB19Hh3bFchAn3nZSMlvBrkL+wLk6mjhgl0NUHfE5TNKWWI0rzRAgYbReZKGBbKcOhLviqp32HElUfI124xKKvpWle9CzqVzfO37lgRkmlomSiyV1F7AGpYODnRWF1ZJMl4ubS1ZOgfT1/IGpsD641JIsmnk4uJoNnzO1H5k/cOB9F3c4pfQw22AvDEWl+O1U5PouTQZdP/dWtwD6GWnd+tG0XhkqMaBbWqoJU8+Yz8DQ9UtkikHYqxH97bMAccZvcTNw1/0sGiWNxju3OmFGJ53bKlKuZYfsfVyazMSJJnyTaRb9vm9bhRgo9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(316002)(7696005)(54906003)(76116006)(5660300002)(186003)(26005)(8676002)(66556008)(33656002)(86362001)(66476007)(64756008)(478600001)(66446008)(66946007)(52536014)(53546011)(4326008)(55016002)(6916009)(9686003)(6506007)(83380400001)(8936002)(44832011)(4744005)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d05ZGwqfxLT6qXq2G3HbovisT5517ZsAkN3/zcAV67rE6H7qUHeKDZ4n3KD3AGoq69I5Bc9riwSyx/7dro6mk9UALUZPUOFfx7Ipkz45dy0vbN6FSWDJ5VHf85b2sLNWTmfh8LGLp0121MXRUQhJB/2KvJan2pQnzyWK+t57NGjCol03UwNXwqSuTmSttmz0h3EcfwdFwq8jMTpF3dxd2hPOuRho3pbfimfFn4jRkB1vpVJK+/U7VHEbXR4yrTDDJx8Ja7m7L5E5JXiDyLswxPwdlkk8vcT/UacJPR1bioKiLOQsjTDvTx4/fWL7MyJubtIYF9RZ1QGnc6M52RBYm8HOVrOdchlef0SeQY8Lfx0n512R1mAmXMJtor6drsauWya2ky0sFBZwJ1iLEhs64SdcgKFN03EYl4GOR4+DiD4VAI/0A3FUg8dD5JbxOuuCaK/dpvovlGmnpwKibjoKoEC91Kq/mWJBcRmv9nXo9d18iG42s23xPPauwOB4VT9OBywmVjVoPJEbxlksTvMkkeNPeYBkJVCeHyBq5NEJB+wrmkjIPUQLDhd1i2qS79fJk494/0qbvEzy8HLaFDFl9R8rR9jZ+jz1xB+GyTRNA4TGGinFznBh7jxbpVNIQj9firI+XPKj3wqaMkT6rdCHkQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc3b73b-21d6-43b8-6098-08d8860b83d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 06:32:08.6686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijiDo+10tWeOsqZnD2S4oB0z+lAwzk0GjK7X6Na+wTJh1muuOgQU38h8JqC4TUkxusEBp5TNN7/qY6qauov81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBPbiBUdWUsIE5vdiAxMCwgMjAyMCBhdCAxMDozNyBQ
TSBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54cC5jb20+IHdyb3RlOg0KPiANCj4gPiAweGY0NDI0
MTg0IHNob3VsZCBiZSB0aGUgdmlydHVhbCBhZGRyZXNzIGZvciB0aGUgcmVnaXN0ZXIgUE9SVFND
Lg0KPiA+IFRoZXJlIGFyZSB0d28gcG9zc2libGUgcmVhc29ucyBmb3IgdGhpcyBpc3N1ZToNCj4g
PiAtIFRoZSBQSFkgaXMgbm90IGluaXRpYWxpemVkIGNvcnJlY3RseQ0KPiA+IC0gVGhlIHJlbGF0
ZWQgY2xvY2sgaGFzIG5vdCBvcGVuZWQgY29ycmVjdGx5Lg0KPiANCj4gSWYgeW91IGhhdmUgYSBz
dWdnZXN0aW9uIGZvciBhIGRlYnVnIHBhdGNoLCBJIGNhbiBnaXZlIGl0IGEgdHJ5Lg0KPiANCg0K
SGkgRmFiaW8sDQoNClRoaXMgcGxhdGZvcm0gc2hvdWxkIGV4aXN0IG1vcmUgdGhhbiAxMCB5ZWFy
cywgYW5kIEkgaGF2ZSBuZXZlciB1c2VkIHRoYXQgcGxhdGZvcm0uDQpZb3UgbWF5IHRyeSB0byBm
aW5kIHdoaWNoIGtlcm5lbCB2ZXJzaW9uIGNvdWxkIHdvcmssIGFuZCB3aGljaCBub3QsIHRoZW4s
DQpJIGNvdWxkIGhhdmUgYSBjaGVjayBmb3IgZGlmZmVyZW5jZS4NCg0KUGV0ZXINCg==

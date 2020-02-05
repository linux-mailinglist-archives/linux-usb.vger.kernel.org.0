Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D68B1529B9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 12:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgBELRJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 06:17:09 -0500
Received: from mail-eopbgr40051.outbound.protection.outlook.com ([40.107.4.51]:51410
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727522AbgBELRI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Feb 2020 06:17:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbeV43k1IcfBndUc6iNIwrrgP9+0dHnWXfy56vVydQDNAygcPLNePI6CyI95OPu2fFb579LrY2hWbTLCwqgOwxpIpkTXZ91ul/qN4FhPiDd7MJxZvs0d7NTc6s75nELYMo7aMKm+2HZ8GkGQi8Vd97ijVRIm1aoEXZPsB14mTgtoDKdiH4vPdm+hgMJUNc1lFGLvk5LG+v30U25yGbVviuufBBgfqgbCr/f2OunqJi6TnD/87AC3dIcCZ7g5fBSoCOR1lFfI92ABBGp9Ai+hBFxRQbWwd1jvBPoXgoPMIXU0uvqOZcZZ3vy0DlSCpsy4wXUd/3huLaxpReBgK5L7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFedgqTPPygZzuGUHTv7wASPmaWU5uMWt4gYVNe+M8A=;
 b=T5vTjMf2tc3vEKQSgDWpkUVd6zXbO4m+6FkRR1YDO8thOQoW97TSwNYpXlJXnVaHQ9loM6OP/QCiYNtRXtMtug/sAtkDXS6zvf2Lvj4cBhd0GD4FAHU6SQ1kY1O6FvtrUhDcNQJSIJeTHC7jnpRWEe2ELR0tYfE2TeYzq9oz6TkfQXb4w+Kb33bZnZIROX+9CVoq1nx9mgW6bEgB9lKbw99mxO6soSAoNyZ5VCEt5cizNPmhNAcIwiN8Lh/lf4JlCGjhihqZIZJEHT6eRS0hw8uFjUL9MwVbxXhj5550/oZimNbfQNou0llro1PMT037GFw37Motr4jwwsqUf235oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFedgqTPPygZzuGUHTv7wASPmaWU5uMWt4gYVNe+M8A=;
 b=Do1oWxPjqGONIsV0LCRkYrPK4ke7PCr1Z87Is1D/YOgfhdqxZcZjnJUueS2Fn4O2H6v9p+iT0ygQesbV6QwvHW4i9UOzbeiAbHv4XFOwkxxv/2uzLuZxYoLHKJmfQ+T1ouLKfTZIfy1rQw9duAi3G+WeFKZIpsZAY+kbkfQObfU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4974.eurprd04.prod.outlook.com (20.177.48.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Wed, 5 Feb 2020 11:17:04 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2686.031; Wed, 5 Feb 2020
 11:17:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Topic: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Thread-Index: AQHV1LqaVEQK+QBFlEajUWQRaUhLOagERL0AgAD/9wCAAJ9JAIAD35yAgADwwoCAAHLiAIABWpKQ
Date:   Wed, 5 Feb 2020 11:17:04 +0000
Message-ID: <VI1PR04MB5327AF1B75732C9E24988A2F8B020@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
 <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
 <20200201061330.GA9178@b29397-desktop>
 <CAMdYzYrbvsTunwxJLcC_-ZhczsQfyDLOjTnZ+eorb325qO-QhA@mail.gmail.com>
 <20200204074419.GA6681@b29397-desktop>
 <CAMdYzYo8Vgw8h=LtfLnQNF4j-rVzgKJTp1hCyf7BFKrdhAhAHQ@mail.gmail.com>
In-Reply-To: <CAMdYzYo8Vgw8h=LtfLnQNF4j-rVzgKJTp1hCyf7BFKrdhAhAHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fd7bc43d-17b2-4ebd-63bf-08d7aa2cee2b
x-ms-traffictypediagnostic: VI1PR04MB4974:
x-microsoft-antispam-prvs: <VI1PR04MB4974C0CE46ED38202FB97C438B020@VI1PR04MB4974.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0304E36CA3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(199004)(189003)(9686003)(52536014)(55016002)(54906003)(316002)(4744005)(76116006)(478600001)(66446008)(66946007)(66476007)(64756008)(6916009)(66556008)(5660300002)(33656002)(7696005)(26005)(8676002)(86362001)(186003)(81166006)(81156014)(4326008)(2906002)(71200400001)(8936002)(6506007)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4974;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CQ8ae+08L9DkbfcwQZixNXR4k7PfHKZXAPSaKnpId8aSkW5lngEZyDx/GvG+Yz9E1SS+4PoP74ox7FCQ4yqBT8KYzI9bYGNGARm9DcW+XVXmXPAHcHPBQfstKBN3VOVJeCnT7TgdNG0q+qguo2pijJKpqvqtWAbX887iGT302TDq3KBxBqN+VLWo9/boiznWU7fP/J2E9YkH1+0pTptUaMdrfw/zJpU2LIFPjEDV9FLtAbwG3dV4M7YkQw6T0p+wCkOA2QalljKMS0RRljBlenCdRvybOiS0gPB+gD/RKtIESKerEi5Hf52uQGxskAtT/LSM2Ry9+1DlsOcrMLW8S9zlLX+6u1Rq6aes3WAaySgwj3snp1gIwAVgFlvSiFRNnZ5S8fa//zkvm4Fkgtz5Np4SIDrrQzDx/oZZpfxShn9QGcbO8vCZt8yl9c6DSzB2
x-ms-exchange-antispam-messagedata: WzZ85bQhIOABWOz6ACbXpywrwY/9gbwxcLsr72MyfMydMNS5sJnsxSCSnVOmQaH7t1ejM5uMDfXjFWhI0+9w9JS239NGYO8Va+wo6/lxXYDlwko0rxbhbP8jTVAAHXUVpPEBRj2+CJwQNdfM5YYwyw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7bc43d-17b2-4ebd-63bf-08d7aa2cee2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2020 11:17:04.6199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSRuRK+om4bD4EGpCnR3SIFBR2UMDTZtuWQIkcvW0eW85YJVoQXCypPHosmFplT24wHiZ+oxDyqomjZt4tHVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4974
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+ID4gPiBTZWNvbmQsIHlvdSBtYXkgY2hlY2sgaWYgdG91Y2ggb3Rnc2Mgd2lsbCBoYW5n
IG9yIGRlYWRsb2NrIHRoZSBzeXN0ZW0uDQo+ID4gPiA+IElmIHlvdSBjYW4ndCB0b3VjaCBvdGdz
YyB3aGVuIHBvcnRzYy5waGNkID0gMCwgeW91IG1heSBuZWVkIHRoZQ0KPiA+ID4gPiBmbGFnIENJ
X0hEUkNfRFVBTF9ST0xFX05PVF9PVEcsIGFmYWlrLCBmZXcgU29DcyBjYW4ndCB0b3VjaCBvdGdz
Yw0KPiA+ID4gPiBpZiBpdCBzdXBwb3J0cyBkdWFsLXJvbGUuDQo+ID4gPg0KPiA+ID4gSSBhZGRl
ZCBzb21lIHRyYWNlcyB0byB0aGUgZHJpdmVyLCBhbmQgaXQgZG9lc24ndCBhY3R1YWxseSBhcHBl
YXIgdG8NCj4gPiA+IGJlIGEgcmVnaXN0ZXIgcmVhZC93cml0ZSB0aGF0IGlzIGJyZWFraW5nIHRo
aW5ncy4gKE5vdCBkaXJlY3RseQ0KPiA+ID4gYW55d2F5cykuDQo+ID4gPiBUaGUgaGFuZyBvY2N1
cnMgYWZ0ZXIgaXQgZW51bWVyYXRlcyB0aGUgdXNiIGdhZGdldHMgYW5kIGh1Yi4NCj4gPiA+IFN0
aWxsIHRyeWluZyB0byB0cmFjayBkb3duIGV4YWN0bHkgd2hlcmUgdGhlIGhhbmcgb2NjdXJzLg0K
PiA+ID4NCj4gPg0KPiA+IFRyeSB0byBzZWUgaWYgaXQgaXMgcmVsYXRlZCB0byBydW50aW1lIHBv
d2VyIG1hbmFnZW1lbnQuDQo+IA0KPiBUaGF0J3MgaXQhDQo+IFRoZXJlIGRvZXNuJ3QgYXBwZWFy
IHRvIGJlIGEgbWV0aG9kIHRvIGRpc2FibGUgUE0gaW5zaWRlIHRoZSBjaGlwaWRlYSBkcml2ZXIu
DQo+IERvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiBvbiBob3cgdG8gZG8gaXQsIGFzaWRlIGZyb20g
dGhlIGdsb2JhbCBtZXRob2Q/DQo+IA0KIA0KDQpTZWUgZHJpdmVycy91c2IvY2hpcGlkZWEvY2lf
aGRyY19pbXguYyBmb3IgcmVmZXJlbmNlIHBsZWFzZS4NCg0KUGV0ZXINCg==

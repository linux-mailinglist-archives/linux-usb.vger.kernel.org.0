Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD8D1E1879
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 02:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgEZA1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 20:27:00 -0400
Received: from mail-eopbgr60084.outbound.protection.outlook.com ([40.107.6.84]:25668
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726350AbgEZA07 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 20:26:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dulhhecevW9YW4cbNnrWiGZcwUaEBDEyl2gxlboTA8eSJkUDPPu0ir9ehCAYrVfUYFg39cX7eo8XNXg3j5ZUlZkro3a/gVX/A2DYkrCptosiSGOOMOU0pT88Ql8MST96BHQ4/oZQ40GWw4Xkojcn0MxE0eQco8QbTl3uSaRJLqfsydx1lI1A5VoWEh6SHr6e/1102Su2UAGp1g5XaLqdapdThR7XQJg8zwgSvX1BgT/yx2jJR+wxna6wBw4sS+UxUn2SJDo4kmb3rPyMRfUWTulE+2XwpLBdudlpz2dONbD/Trgyiia6YoealRyHN8+OPcLHbblf4g6nbZRpAQ4F6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPARpPaqd+sBVCDi5FtBDS1f71vTucgMeMMUltzO9aY=;
 b=VHfRhcTQ11T3KYl7lv0t76XVD5K8L9ayiFKIQxD+lE8hVwzot9cwmLvxBbFBTPkcn8u2bRoPbIbg7io/48tYhSGmUi/fACqRTwlhdtHVOp5pBFfY8PGfGi81xvToBHIKbSgvMp4KGSCNiOGpwqy71AnCGxOhS5GE3IcqPcS5w6Xy0JkOpM3Xst6mHIgNdnwXAm865AQUa3oTtIN/0MkfBRnC5EpapReNnnc4XJpZiKo2KFczXkFfXyUrw6oxhaut0LJcGz3WgtPsI7OYbiMQf2YG14cLTwj+1wkXvtBhYKusO2qaTRjT/sYS2Aq+yJDpkz481hEw9nyiuNbptcA38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPARpPaqd+sBVCDi5FtBDS1f71vTucgMeMMUltzO9aY=;
 b=nmvwbsCXItx1QtoTbX5YZ3oB9Yw7emvAlcZrNzRZHcExxjrMDCyZ+tIM6OSk2cZse+mgG7nwGRUhbMciRCFnLDg19co6jNIgBHlsbuQSQXNTrooa9SdWJgdCOUCwPUuuulnk1HSUsA91lRtC30b/vMjorkX3JEHj0wZYsumatLI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7175.eurprd04.prod.outlook.com (2603:10a6:20b:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25; Tue, 26 May
 2020 00:26:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 00:26:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Topic: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Index: AQHWMVkhNTTKDE+VhEWiCwuIqij7b6i22oUAgAFFJACAAJ5JgIAAyDMA
Date:   Tue, 26 May 2020 00:26:56 +0000
Message-ID: <20200526002721.GA27933@b29397-desktop>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-8-peter.chen@nxp.com>
 <VE1PR04MB6528C7F33B4C35AF9DBCE84489B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <20200525030418.GC16948@b29397-desktop>
 <VE1PR04MB65288C26F1F79234332E757D89B30@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB65288C26F1F79234332E757D89B30@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e765a8af-989a-4880-392d-08d8010b7fa3
x-ms-traffictypediagnostic: AM7PR04MB7175:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB71756BC5B022E1CC71878F698BB00@AM7PR04MB7175.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LW5ZNmlgRtyIeV3tJJopnAxz+JVrke1nCY5lO7kdG8ZXUeNzwpVP31yLv18UYylNUje6d4N6Fv8j/RSJ7VRNcoVv5FKwzmKKES8suRpbo2pH93FmmOGovy6TMfQwFqM2d32FP11wO2/j+mwS2jNmO83pe5deMnX7ag6QgdxASCcOrotB6RxwPxNnvq5Y6FuHzua1X7F1g7RWjPwKuUYrEdpPYc+OYv2wzE1QCsF8d9orHLvfiGrYV/QnHKujxFaPFy2gt+gDndYuThTOAoQ3BYsIP1Ye0AeJzhWOKXBoh3L2FBIX5y6DnZpvuOY18bzmb2+QX9IT3YMy0UdH5GG+LQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(53546011)(6506007)(9686003)(26005)(6486002)(6512007)(8676002)(6862004)(86362001)(186003)(2906002)(33716001)(1076003)(478600001)(5660300002)(71200400001)(66556008)(44832011)(66446008)(64756008)(66946007)(316002)(6636002)(33656002)(76116006)(91956017)(8936002)(54906003)(66476007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: B0q/Mle6ico69vbzWxbtACyyEC2Prx3sXT7ZXnoYuL4p5HtGPXJchONpZl/qE6+D2Vm/TP7WyZ4qJKM+ihEb+JickDAyy/vzYquIelzL3c9xNUfRAyoEq+APbU72JKlN2t6RyC7z3oSXtU3KY8NP3iJoa9bi8GJOMeMeD74k2bLrBPDSZuxngPsM/YV3teGQN4cmHiR+yoyMwLxd8ZLOnsg1NZnBoowxASkooLpygbZOB7RtlsmvH8c8zM/5uVCaYaTtvdxCMGgW2VsahipePTWNFEs916ebHp0kYZaWcgFDY6Y3OES2nx4mpUuenlUOYjln8WSvxfeXJY6dH1LzhxcF3Ae592gXKezq9bsQeGbE+CfgWmEKS9P0NKjs0RGLjaNPgGKAXHkDe6ScoIEWHkGmmGmT7xNFvU515AJBeOD4jfcyWK74GoaYLLIruwCqZHcN6SybCj4zWComVpNKYH95iqmq0fc8xNILnZt3eRg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7FFB661EFF97C4DBC91CF66A4696721@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e765a8af-989a-4880-392d-08d8010b7fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 00:26:56.9670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqHWyinIslopgOuNH/QMHJoNd/S5CUT6JQTyhyZV2dhm1ELh7gfAHh9BS5oA6OhTDjywbpyklEcuvRRBrsICFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7175
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjAtMDUtMjUgMTI6MzA6NDksIEp1biBMaSB3cm90ZToNCj4gDQo+IA0KPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAu
Y29tPg0KPiA+IFNlbnQ6IDIwMjDlubQ15pyIMjXml6UgMTE6MDQNCj4gPiBUbzogSnVuIExpIDxq
dW4ubGlAbnhwLmNvbT4NCj4gPiBDYzogYmFsYmlAa2VybmVsLm9yZzsgbWF0aGlhcy5ueW1hbkBp
bnRlbC5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gZGwtbGludXgtaW14IDxs
aW51eC1pbXhAbnhwLmNvbT47IHBhd2VsbEBjYWRlbmNlLmNvbTsgcm9nZXJxQHRpLmNvbTsNCj4g
PiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
Ny85XSB1c2I6IGhvc3Q6IHhoY2ktcGxhdDogYWRkIHByaXYgZmxhZyBmb3INCj4gPiBza2lwX3Bo
eV9pbml0aWFsaXphdGlvbg0KPiA+IA0KPiA+IE9uIDIwLTA1LTI0IDA3OjQwOjM0LCBKdW4gTGkg
d3JvdGU6DQo+ID4gPiBIaQ0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+ID4gRnJvbTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiA+ID4g
PiBTZW50OiAyMDIw5bm0NeaciDI05pelIDc6MjMNCj4gPiA+ID4gVG86IGJhbGJpQGtlcm5lbC5v
cmc7IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+ID4gPiA+IENjOiBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4gPiA+ID4gcGF3
ZWxsQGNhZGVuY2UuY29tOyByb2dlcnFAdGkuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
ZzsgSnVuDQo+ID4gPiA+IExpIDxqdW4ubGlAbnhwLmNvbT47IFBldGVyIENoZW4gPHBldGVyLmNo
ZW5AbnhwLmNvbT4NCj4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDcvOV0gdXNiOiBob3N0OiB4
aGNpLXBsYXQ6IGFkZCBwcml2IGZsYWcgZm9yDQo+ID4gPiA+IHNraXBfcGh5X2luaXRpYWxpemF0
aW9uDQo+ID4gPiA+DQo+ID4gPiA+IFNvbWUgRFJEIGNvbnRyb2xsZXJzIChlZywgZHdjMyAmIGNk
bnMzKSBoYXZlIFBIWSBtYW5hZ2VtZW50IGF0IHRoZWlyDQo+ID4gPiA+IG93biBkcml2ZXIgdG8g
Y292ZXIgYm90aCBkZXZpY2UgYW5kIGhvc3QgbW9kZSwgc28gYWRkIG9uZSBwcml2IGZsYWcNCj4g
PiA+ID4gZm9yIHN1Y2ggdXNlcnMgdG8gc2tpcCBQSFkgbWFuYWdlbWVudCBmcm9tIEhDRCBjb3Jl
Lg0KPiA+ID4NCj4gPiA+IENhbiB0aGlzIGZsYWcgYmUgc2V0IGRpcmVjdGx5IGluIF9fY2RuczNf
aG9zdF9pbml0KCk/DQo+ID4gDQo+ID4gTm8sIHNpbmNlIGJvdGggSENEIGNyZWF0aW9uIGFuZCB1
c2JfYWRkX2hjZCBpbnZva2luZyBhcmUgYXQgeGhjaV9wbGF0X3Byb2JlLCBnbHVlDQo+ID4gbGF5
ZXIgaGFzIG5vIGNoYW5jZSB0byBjaGFuZ2UgaGNkIGZsYWdzLg0KPiANCj4gSSBzZWUgYWZ0ZXIg
cGF0Y2hbMi85XSwNCj4gDQo+IEBAIC00Myw2ICs0NSwxMSBAQCBzdGF0aWMgaW50IF9fY2RuczNf
aG9zdF9pbml0KHN0cnVjdCBjZG5zMyAqY2RucykNCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJy
MTsNCj4gICAgICAgICB9DQo+IA0KPiArICAgICAgIC8qIEdsdWUgbmVlZHMgdG8gYWNjZXNzIHhI
Q0kgcmVnaW9uIHJlZ2lzdGVyIGZvciBQb3dlciBtYW5hZ2VtZW50ICovDQo+ICsgICAgICAgaGNk
ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoeGhjaSk7DQo+ICsgICAgICAgaWYgKGhjZCkNCj4gKyAg
ICAgICAgICAgICAgIGNkbnMtPnhoY2lfcmVncyA9IGhjZC0+cmVnczsNCj4gKw0KPiANCj4gWW91
IGFscmVhZHkgY2FuIGFjY2VzcyBoY2QgZGlyZWN0bHkuDQo+IA0KDQpBdCB0aGF0IHRpbWUsIHVz
Yl9hZGRfaGNkIHdhcyBjYWxsZWQsIGFuZCB0aGUgcG93ZXIgd2FzIHBvd2VyZWQgb24gaWYNCnRo
ZSBza2lwIGZsYXQgd2FzIG5vdCBzZXQuDQoNCi0tIA0KDQpUaGFua3MsDQpQZXRlciBDaGVu

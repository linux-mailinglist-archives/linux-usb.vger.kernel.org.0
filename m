Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A7D21550A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 11:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgGFJ4f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 05:56:35 -0400
Received: from mail-am6eur05on2072.outbound.protection.outlook.com ([40.107.22.72]:44096
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728135AbgGFJ4e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 05:56:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYiHN+4nxjRROayiOF48NWMIiwpRRACW5uordsnv5KRav3KRw3VxExhicN38MFNv72/E4QFjY3BgnqPDEY5EudopwJKz04brlpnVdsSuha2KWdLVbSUfz7ZMabopMhRVuuXcr79txpNSplfetCxOFCMsmJai/wOs5QYrSxOANiUOZ/sRp6q5kCkGQrm3YRcst/AExZ0eEssjN5/xLKfBjpxfJeF8pozuGXmQU+gX6QhhNkWtphVnIVEYWN0QcTtjPiauISYRVT5fNMOn1fcQxoqd7qkytawCxE3SJ3rx5Ewx2ht7V5q5noGrU7CB5eXVRfYIaOfWwZ5ufm6aculTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595u8KlFRciGd7obqQrmn8/cub9CI3okgqVVXHvuReA=;
 b=HYAoVL79nBmg4cRe57xGF82HUaHJCVMLsAObzTXrf6CbvQUxW56wfhtTOFb7e/EZdnFKCDRFc5iOdkT8XprVVly6J6oDeRkHI+miJqi//iHy1fUoxSdegPkOu4XDxNsePqBdma2uNo7Zd0AhSdvUT3tEi72/lQGgFFNPm1+yechZ2pqcYkJHZaaiIvmGgsVuqkajIoQgBH6IQ8tki2HAlF6D3ph2jXdi249CxcOPdLQJHtNMlP3ZEkeaS/SVO8iOT3BVEUArUdtf043RRmWnIwMAxqj+eqlcszLjYA23O4oS1ygEne7m/gUWumgllFhNDuBQZ41hGRxfZeQYg+i8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595u8KlFRciGd7obqQrmn8/cub9CI3okgqVVXHvuReA=;
 b=mY5UIC70UB99nAJ67NxcE9MmJuyqT50ReychOZIZH48jde2mEdrmJGDjGwFH7PeQFILCF60asGkDWiQCe2Wy8+l68RuLnzjPl/UfFFrU+M3OyfnNMxjIkwneX5Un9D5kLZCYGzUEWbfYpXiiRthMC68PwwabYfxjSlZoaCXQHw4=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:56:30 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:56:30 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Peter Chen <peter.chen@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/6] dt-bindings: usb: dwc3: add property to disable xhci
 64bit support
Thread-Topic: [PATCH 1/6] dt-bindings: usb: dwc3: add property to disable xhci
 64bit support
Thread-Index: AQHWPlBpv/LbvwTCsk69ybGxbcXBV6jRJnAAgAAabwCAKTiOcA==
Date:   Mon, 6 Jul 2020 09:56:30 +0000
Message-ID: <VE1PR04MB6528DCE2411E81039D51961089690@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
 <1591701165-12872-2-git-send-email-jun.li@nxp.com>
 <20200610024816.GA18494@b29397-desktop>
 <5e4d7227-afd7-27cf-720c-defeadff8450@gmail.com>
In-Reply-To: <5e4d7227-afd7-27cf-720c-defeadff8450@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27536870-4cb3-441b-d34d-08d82192db97
x-ms-traffictypediagnostic: VI1PR0402MB3520:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB35205FA53DE9253F42431D3F89690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qnhFl2q5ST5jX9PpVOAZTSXIkiz/rbRwZP5l1HNny52ysAcRCoAw2uq42R0RaoBY7dQbMrlQCA9aKhtbdVzRHZGCsdnIYpalRbGIr74of8rrOdeGTn/VBxOsNByafdA/CNUpze+wzJPGB9tUAhgr7xVSI3aW5V1tNmOrtg4PGyUOzNhOVO7mhP6ANsZbrMGMdwjLht7wAp1MMQjkrjy8qJaaRtcthl/tmt5dRRIGUANf/HqiPXhZWbY6apTsKKPsGDxI9vTkEG5maPQQqK8ysPhiUrVcc4zouanfdxBwMeT61KcX4jbLfTCFjbXWrAMiE55NUo71Ff1YDWDFUtd2xA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(6636002)(71200400001)(8676002)(7696005)(8936002)(186003)(2906002)(9686003)(55016002)(53546011)(6506007)(66946007)(66476007)(66446008)(64756008)(66556008)(26005)(52536014)(86362001)(83380400001)(76116006)(478600001)(110136005)(44832011)(5660300002)(54906003)(33656002)(316002)(7416002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JnTtXQqSOXSKDz0CaGf6lwJLUXIV6BO2UUCFRyNCibS4uhNYZT2jXba6z6lLghpMcCB/MTo3Jp2Lfu5VD2mOtQ/x9mW6E1FAG7YbCpiRti5gglSa+AyM/4ZD3LOYNPrj8W6/Y59Zj/PHda2SPhKUBWGcDqXJMF62Iu+GxQQi3Ggcy9blWWYonxYEoyNxgChMSsLyAXdppqGdT2QOYg797jiwtjrllDz4eO1hY/rVKr6ZKoh2Vh/P3DNPXwY3fe47S+ox4/SYka152kYu1kJOyHB7V5AUoz02K+LkA6RjTfyMMdoTsyKZYNkLAmaYn76CtVhb9RIDd4+AC5/m7/A76tOmvOwn1F+w/cYsHQ6f5HkeS0f5FU1awEcYYT5F/WiFuv++8utmIWooJHwTxrK0gYM6d/hIKFm/PZZbnBOaKPHSgR/a2lTWhmNxuAbnsz+88BhgZ+Wab6m2I35SmQM701ylmJi7lUoW9fyWkbe9Gvc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27536870-4cb3-441b-d34d-08d82192db97
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 09:56:30.5377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zAwaaEmGH5jRoHhCjgUq8dqoKlMyO1tF9YiKLb5eu5B/VdkGaGXvFuXhDclYTqwT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZsb3JpYW4gRmFpbmVsbGkg
PGYuZmFpbmVsbGlAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTAsIDIwMjAg
MTI6MjIgUE0NCj4gVG86IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT47IEp1biBMaSA8
anVuLmxpQG54cC5jb20+DQo+IENjOiBiYWxiaUBrZXJuZWwub3JnOyBmZXN0ZXZhbUBnbWFpbC5j
b207IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiBzLmhhdWVyQHBlbmd1dHJvbml4LmRl
OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IGRsLWxp
bnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IHNoYXdu
Z3VvQGtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0gZHQtYmluZGluZ3M6IHVzYjogZHdjMzogYWRkIHBy
b3BlcnR5IHRvIGRpc2FibGUgeGhjaSA2NGJpdA0KPiBzdXBwb3J0DQo+IA0KPiANCj4gDQo+IE9u
IDYvOS8yMDIwIDc6NDcgUE0sIFBldGVyIENoZW4gd3JvdGU6DQo+ID4gT24gMjAtMDYtMDkgMTk6
MTI6NDAsIExpIEp1biB3cm90ZToNCj4gPj4gQWRkIGEgcHJvcGVydHkgInNucHMseGhjaS1kaXMt
NjRiaXQtc3VwcG9ydC1xdWlyayIgdG8gZGlzYWJsZSB4aGNpDQo+ID4+IDY0Yml0IGFkZHJlc3Mg
c3VwcG9ydCwgdGhpcyBpcyBkdWUgdG8gU29DIGludGVncmF0aW9uIGNhbid0IHN1cHBvcnQNCj4g
Pj4gaXQgYnV0IHRoZSBBQzY0IGJpdCAoYml0IDApIG9mIEhDQ1BBUkFNUzEgaXMgc2V0IHRvIGJl
IDEuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54cC5jb20+DQo+
ID4+IC0tLQ0KPiA+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2Mz
LnR4dCB8IDMgKysrDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4+
DQo+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2R3YzMudHh0DQo+ID4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9k
d2MzLnR4dA0KPiA+PiBpbmRleCBkMDNlZGY5Li5kMTZjYmE3IDEwMDY0NA0KPiA+PiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+ID4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4gPj4gQEAg
LTEwOSw2ICsxMDksOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+PiAgCQkJV2hlbiBqdXN0
IG9uZSB2YWx1ZSwgd2hpY2ggbWVhbnMgSU5DUlggYnVyc3QgbW9kZSBlbmFibGVkLiBXaGVuDQo+
ID4+ICAJCQltb3JlIHRoYW4gb25lIHZhbHVlLCB3aGljaCBtZWFucyB1bmRlZmluZWQgbGVuZ3Ro
IElOQ1IgYnVyc3QgdHlwZQ0KPiA+PiAgCQkJZW5hYmxlZC4gVGhlIHZhbHVlcyBjYW4gYmUgMSwg
NCwgOCwgMTYsIDMyLCA2NCwgMTI4IGFuZCAyNTYuDQo+ID4+ICsgLSBzbnBzLHhoY2ktZGlzLTY0
Yml0LXN1cHBvcnQtcXVpcms6IHNldCBpZiB0aGUgQUM2NCBiaXQgKGJpdCAwKSBvZiBIQ0NQQVJB
TVMxDQo+IGlzIHNldA0KPiA+PiArCQkJdG8gYmUgMSwgYnV0IHRoZSBjb250cm9sbGVyIGFjdHVh
bGx5IGNhbid0IGhhbmRsZSA2NC1iaXQgYWRkcmVzcw0KPiA+PiArCQkJZHVlIHRvIFNvQyBpbnRl
Z3JhdGlvbi4NCj4gPj4NCj4gPj4gICAtIGluIGFkZGl0aW9uIGFsbCBwcm9wZXJ0aWVzIGZyb20g
dXNiLXhoY2kudHh0IGZyb20gdGhlIGN1cnJlbnQgZGlyZWN0b3J5IGFyZQ0KPiA+PiAgICAgc3Vw
cG9ydGVkIGFzIHdlbGwNCj4gPg0KPiA+IFdoeSBub3QgYWRkaW5nIGl0IGF0IHVzYi14aGNpLnR4
dCBkaXJlY3RseT8gSXQgaXMgbW9yZSBsaWtlIGdlbmVyYWwNCj4gPiBwcm9wZXJ0eSwgSSBzZWUg
UmVuZXNhcyByY2FyIHBsYXRmb3JtcyBhbHNvIGhhdmUgdGhpcyBxdWlyay4NCj4gPg0KPiANCj4g
T3IgcmF0aGVyIGRlZmluZSBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgc3BlY2lmaWMgU29D
IGludGVncmF0aW9uIGhlcmUgYW5kIGJhc2VkDQo+IHVwb24gdGhhdCBjb21wYXRpYmlsaXR5IHN0
cmluZyBzZXQgdGhlIHhoY2ktPnF1aXJrcyB0byBoYXZlIFhIQ0lfTk9fNjRCSVRfU1VQUE9SVA0K
PiBzZXQuDQoNCkhpIEZsb3JpYW4sIFBldGVyDQoNClNlbnQgb3V0IHYyIHdpdGggY2hhbmdlcyB0
byB1c2UgcGxhdGZvcm0gZGF0YSBzbyBjb21wYXRpYmxlIHN0cmluZyBiYXNlZA0KdG8gcGFzcyB0
aG9zZSB4aGNpIHF1aXJrcyB0byB4aGNpLXBsYXQuDQoNClRoYW5rcw0KTGkgSnVuDQogDQo+IC0t
DQo+IEZsb3JpYW4NCg==

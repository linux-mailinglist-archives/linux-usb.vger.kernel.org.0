Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C922AB826
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 13:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgKIMY5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 07:24:57 -0500
Received: from mail-db8eur05on2067.outbound.protection.outlook.com ([40.107.20.67]:25312
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729741AbgKIMY5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 07:24:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyDlwx0YsqYmTXVkHkF3iq54yCkZHsxgBdh3nMS3QnX2KEDw2W4WkNNWUg1IBuYPAAQxAdB+PTZglRtG+OWLkdvoTPMXk4QUYX921J8RTJfNPTVnDQHfN/Uzm2HfHhFxqk10T7kUmUlvhsLX/6BspWM2fSH2YtzvZM7XxH1AOzbAyr1PVEyx6yORHnPY1uym1YRLmpwy0nTdmdNZJCbnWKRlYg3fufjEyWVmAmt6LUKP3PS2e3HbszNaCB8yuQW0Q6PpOI3MlE5nJN2zwGgiUyKwtvuLohb2fMJlLKxUPyUfMnQPa55SxB1wN9PJ992I8UMiwHQRqM8KQdC10dp2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcSxkylZ09HdQrzJWl7ugGk7F7xQ9+JoubBR2X0KKxE=;
 b=n1l/PyNWWEWsByRBGofniQ2K7LR8MahEZbNweTSBVFMUSVblqqJkCKhBPyM71A1wnELx6jzHVfFNmT30pPxXCkmoO+brW2CLctxXvXLapPveohWZgzd7OtbgdlWFIWeJqaYbgBBBryVjK6wDjgg340ssevg4Xk6KBj2d5fKcjj1eJ43Y7kQFpg4FvQwGRI2mNveK/i5FQcNLtxHzFTFQAjVhQB6QWp9cOvQuOHionb+RAEkSUeY0rEgSb0nfTiHZFHjVp1igPto9nscIZtvnCZqcUIIHPYECN4iRXrDEdBP2fLCaEvy+8vwBvZ5ElRWLImP4X6XeUBPgrBLGVY122A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcSxkylZ09HdQrzJWl7ugGk7F7xQ9+JoubBR2X0KKxE=;
 b=Tk+TBcpjH9IpRwJKUiu2Zn24jXYo8253zO1kOxtQtzJwXLV8ROFQr2yrD3kANsF0FdFiset+pNNMCoazoVl/vFxe7XR+w4alo2wVl1vEC3SiNMcIfKhoyjCJ4+Nfa4ghFQOX/z01tpXJZSDEMqEAC7jd8QYkYlA6pm03M0+kwB4=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4669.eurprd04.prod.outlook.com (2603:10a6:803:70::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 12:24:47 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::51de:dd88:2928:ee03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::51de:dd88:2928:ee03%3]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 12:24:47 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
 switch simple driver
Thread-Topic: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
 switch simple driver
Thread-Index: AQHWsdbzASvYBj2HdUCPlXdENcrxN6m6IZeAgACOpnCAAH0egIAER2WQ
Date:   Mon, 9 Nov 2020 12:24:47 +0000
Message-ID: <VE1PR04MB6528D5291F820CDDA8EBE65A89EA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <20201105222559.GA1701705@bogus>
 <VE1PR04MB6528DB5965EFE139C7E0FAFA89ED0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <CAL_JsqJxvkG05Ds7Wa4RBU8eDqr4O=OcmgyogAYQjVwhcs02aA@mail.gmail.com>
In-Reply-To: <CAL_JsqJxvkG05Ds7Wa4RBU8eDqr4O=OcmgyogAYQjVwhcs02aA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 484223da-43c9-4977-f02b-08d884aa728a
x-ms-traffictypediagnostic: VI1PR04MB4669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4669A1C3BBC08FD332F73C9789EA0@VI1PR04MB4669.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y6opzNWJZjjUy0YvNyG0vz/qdF2iwmQVOkQOLRs2cz85v/Zz3VqnqSu2jo8W8ISeJe1jZkvibFxVPmPoHoKt0DN8XkfGOzNJvUv+rkCOPRiqSqRH91BXP8oqGKhWN+rY0TBkEYAcascA28BU+9GNmp186unIFCBARg6lkYDomLDkyXqyigVRXWLrqKJNC3M9bfzQjCa9SzIO3Wjqkyo8F6rG91e/VGgioj+bBEbUEhgi7gm8gaSnn50IzW2lm9L+5vUW3QV5jHQXoOwjh4s46CTuTCvEuVbnTpFhAuM9CbR5lXxL7HBjjKW83QM68ycKWbjJok9lKsY4RxELgh35iqHvyp3LzAMsxDlNr055xPjFtCk+oleb8TwB/Rsw3uAcPOhgQqBO+0wjSlBRy2sV5SMFewHgdMR9tirsnnrMHJOjAJC8sR9F3XyoUHaqXr/1yZJqBcXBJ9ZPEeTpO/D+qQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(26005)(52536014)(478600001)(186003)(53546011)(45080400002)(6506007)(8676002)(54906003)(4326008)(86362001)(5660300002)(966005)(316002)(7416002)(7696005)(44832011)(8936002)(83380400001)(55016002)(76116006)(33656002)(66946007)(66476007)(66446008)(66556008)(9686003)(64756008)(6916009)(71200400001)(2906002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sIip40Sjj7sMAcETlh/HEShPaEmZfLiNRQi8rMqTED9wvl4+fKp6M8J6z4D814+9GFQo2ASCpWxaZydLwSoVetyr/UAnXhDR3fdK7dBwGNacHHSpZi++rgn6zkX3ku1Axjpmm5+1BnfX/WSTNkGbkkmrxlwqEl0TFjUL/xtWlWQPHn2hHxobWbxo6PpGjIFNkdwCHIzwdSFnXlI8uelyhcAldxDx7vJKKSlRiwBvnukKfAa2i/oLQIAPt0qoNj6NjU0dzcCVcHf7UgSe5dS73zoJcDN5kAYx8kon/QLrDcIusEyT+LA92CWxOdcKrcy4kVkV4QWq/37pB6YeSBu1zwwZLnLRrhVcaxlGLy219Bi3WLmi11LsFfHqXccBP4SE4iKJbzANodvNqbC0YpKO86DpbV74je2x+anQ8X/f0k7qnsSnm29nEP78yBQl2jlNaKWn9DpCnx/BQUpSeGGPKju+/wIXi3K91wcVqrlSFTHlpnB3XY01OF62k+TKQbHUUn2ETN2e7S5V8k8M0m2Dlxh5IlGP0hoiVIor2x7/7XSG/TdLtfgHxewNgC5R72566hN/4HYHZK1642c66CQ1i2vxGakeE3kFv5twJQ/MNcR0W+36/EQ1uqvpXf4LhVmvgLoaC8C4FvbObuzkC4IWEg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484223da-43c9-4977-f02b-08d884aa728a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 12:24:47.2950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ff6UymA8JsVqqgvyAlWR/ZcYKn89t4zjDyMTy01A6d3ZuJMdXPLks2McraBMlLsn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4669
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA2LCAyMDIwIDEwOjI0IFBN
DQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiBDYzogaGVpa2tpLmtyb2dlcnVzQGxp
bnV4LmludGVsLmNvbTsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+IGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnOyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207DQo+IGhkZWdvZWRlQHJl
ZGhhdC5jb207IGxlZS5qb25lc0BsaW5hcm8ub3JnOw0KPiBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tOyBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOw0KPiBwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb207DQo+IGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVh
c29uYm9hcmQuY29tOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IFBldGVyIENo
ZW4NCj4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzRd
IGR0LWJpbmRpbmdzOiB1c2I6IGFkZCBkb2N1bWVudGF0aW9uIGZvciB0eXBlYw0KPiBzd2l0Y2gg
c2ltcGxlIGRyaXZlcg0KPiANCj4gT24gRnJpLCBOb3YgNiwgMjAyMCBhdCA1OjA3IEFNIEp1biBM
aSA8anVuLmxpQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+DQo+ID4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDYsIDIwMjAgNjoyNiBBTQ0KPiA+ID4g
VG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+ID4gPiBDYzogaGVpa2tpLmtyb2dlcnVzQGxp
bnV4LmludGVsLmNvbTsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+ID4gPiBncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZzsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOw0KPiA+ID4gaGRl
Z29lZGVAcmVkaGF0LmNvbTsgbGVlLmpvbmVzQGxpbmFyby5vcmc7DQo+ID4gPiBtaWthLndlc3Rl
cmJlcmdAbGludXguaW50ZWwuY29tOyBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOw0KPiA+ID4g
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tOw0KPiA+ID4gbGF1cmVudC5w
aW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb207DQo+ID4gPiBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+ID4g
PiA8bGludXgtaW14QG54cC5jb20+OyBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54cC5jb20+DQo+
ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDEvNF0gZHQtYmluZGluZ3M6IHVzYjogYWRkIGRv
Y3VtZW50YXRpb24gZm9yDQo+ID4gPiB0eXBlYyBzd2l0Y2ggc2ltcGxlIGRyaXZlcg0KPiA+ID4N
Cj4gPiA+IE9uIFR1ZSwgTm92IDAzLCAyMDIwIGF0IDA3OjQwOjA3UE0gKzA4MDAsIExpIEp1biB3
cm90ZToNCj4gPiA+ID4gU29tZSBwbGF0Zm9ybXMgbmVlZCBhIHNpbXBsZSBkcml2ZXIgdG8gZG8g
c29tZSBjb250cm9scyBhY2NvcmRpbmcNCj4gPiA+ID4gdG8gdHlwZWMgb3JpZW50YXRpb24sIHRo
aXMgY2FuIGJlIGV4dGVuZGVkIHRvIGJlIGEgZ2VuZXJpYyBkcml2ZXINCj4gPiA+ID4gd2l0aCBj
b21wYXRpYmxlIHdpdGggInR5cGVjLW9yaWVudGF0aW9uLXN3aXRjaCIuDQo+ID4gPiA+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54cC5jb20+DQo+ID4gPiA+IC0tLQ0K
PiA+ID4gPiBObyBjaGFuZ2VzIGZvciB2NS4NCj4gPiA+ID4NCj4gPiA+ID4gY2hhbmdlcyBvbiB2
NDoNCj4gPiA+ID4gLSBVc2UgY29tcGF0aWJsZSBpbnN0ZWFkIG9mIGJvb2wgcHJvcGVydHkgZm9y
IHN3aXRjaCBtYXRjaGluZy4NCj4gPiA+ID4gLSBDaGFuZ2Ugc3dpdGNoIEdQSU8gdG8gYmUgc3dp
dGNoIHNpbXBsZS4NCj4gPiA+ID4gLSBDaGFuZ2UgdGhlIGFjdGl2ZSBjaGFubmVsIHNlbGVjdGlv
biBHUElPIHRvIGJlIG9wdGlvbmFsLg0KPiA+ID4gPg0KPiA+ID4gPiBwcmV2aW91cyBkaXNjdXNz
aW9uOg0KPiA+ID4gPg0KPiA+ID4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZwYXQNCj4gPiA+IGNoDQo+ID4gPiA+DQo+ID4g
PiB3b3JrLm96bGFicy5vcmclMkZwYXRjaCUyRjEwNTQzNDIlMkYmYW1wO2RhdGE9MDQlN0MwMSU3
Q2p1bi5saSU0MG54cA0KPiA+ID4gLmMNCj4gPiA+ID4NCj4gPiA+IG9tJTdDNzhjYTUyMDU2OTUx
NDllMjc0MzIwOGQ4ODFkOWM3NTMlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwDQo+ID4g
PiAxNg0KPiA+ID4gPg0KPiA+ID4gMzUlN0MwJTdDMCU3QzYzNzQwMjExOTY2NDEwMTg1NiU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHcNCj4gPiA+IExqDQo+ID4gPiA+DQo+ID4g
PiBBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdD
MTAwMCZhbXA7c2RhdA0KPiA+ID4gYT0NCj4gPiA+ID4gOFRZJTJCUFJJdWk2SGh4aFlFMSUyQkxt
d1dMMzhWcDdTWTFDZWI1ckdHJTJCNERVbyUzRCZhbXA7cmVzZXJ2ZWQ9DQo+ID4gPiA+IDANCj4g
PiA+ID4NCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy91c2IvdHlwZWMtc3dpdGNoLXNpbXBsZS55YW1s
ICAgICAgICAgIHwgNjkNCj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1n
aXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3R5cGVj
LXN3aXRjaC1zaW1wbGUueWFtbA0KPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvdHlwZWMtc3dpdGNoLXNpbXBsZS55YW1sDQo+ID4gPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAuLjI0NDE2MmQNCj4gPiA+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL3R5cGVjLXN3aXRjaC1zaW1wbGUueWENCj4gPiA+ID4gKysrIG1sDQo+ID4gPiA+IEBAIC0w
LDAgKzEsNjkgQEANCj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTA0KPiA+ID4gPiArMS4yDQo+ID4gPiA+ICstLS0N
Cj4gPiA+ID4gKyRpZDoNCj4gPiA+ID4NCj4gPiA+ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRlDQo+ID4gPiArdmkNCj4g
PiA+ID4NCj4gPiA+ICtjZXRyZWUub3JnJTJGc2NoZW1hcyUyRnVzYiUyRnR5cGVjLXN3aXRjaC1z
aW1wbGUueWFtbCUyMyZhbXA7ZGF0YT0wDQo+ID4gPiArNCUNCj4gPiA+ID4NCj4gPiA+ICs3QzAx
JTdDanVuLmxpJTQwbnhwLmNvbSU3Qzc4Y2E1MjA1Njk1MTQ5ZTI3NDMyMDhkODgxZDljNzUzJTdD
Njg2ZWExDQo+ID4gPiArZDMNCj4gPiA+ID4NCj4gPiA+ICtiYzJiNGM2ZmE5MmNkOTljNWMzMDE2
MzUlN0MwJTdDMCU3QzYzNzQwMjExOTY2NDExMTg1NCU3Q1Vua25vd24lN0NUDQo+ID4gPiArV0YN
Cj4gPiA+ID4NCj4gPiA+ICtwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJs
dU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDDQo+ID4gPiArSTYNCj4gPiA+ID4NCj4gPiA+ICtN
bjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1IaldmS2xETHlxYiUyRktMbEw2dmRueVBlJTJCbkI4cFNs
bGhva0lYUSUyDQo+ID4gPiArQncNCj4gPiA+ID4gK3l5dzglM0QmYW1wO3Jlc2VydmVkPTANCj4g
PiA+ID4gKyRzY2hlbWE6DQo+ID4gPiA+DQo+ID4gPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZQ0KPiA+ID4gK3ZpDQo+
ID4gPiA+DQo+ID4gPiArY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUyMyZh
bXA7ZGF0YT0wNCU3QzAxJTdDanVuLmxpJQ0KPiA+ID4gKzQwDQo+ID4gPiA+DQo+ID4gPiArbnhw
LmNvbSU3Qzc4Y2E1MjA1Njk1MTQ5ZTI3NDMyMDhkODgxZDljNzUzJTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOQ0KPiA+ID4gKzljDQo+ID4gPiA+DQo+ID4gPiArNWMzMDE2MzUlN0MwJTdDMCU3QzYz
NzQwMjExOTY2NDExMTg1NCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSQ0KPiA+ID4gK2pv
DQo+ID4gPiA+DQo+ID4gPiAraU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJg0KPiA+ID4gK2FtDQo+ID4gPiA+DQo+ID4gPiAr
cDtzZGF0YT16MGJPNDdRVmw1Z3cwVUUlMkJ4M2E1RTI3QUxnejU2OHpwJTJCZjRzdUdsY2glMkZv
JTNEJmFtcDtyZQ0KPiA+ID4gK3NlDQo+ID4gPiA+ICtydmVkPTANCj4gPiA+ID4gKw0KPiA+ID4g
PiArdGl0bGU6IFR5cGVjIE9yaWVudGF0aW9uIFN3aXRjaCBTaW1wbGUgU29sdXRpb24gQmluZGlu
Z3MNCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ICsgIC0gTGkgSnVu
IDxqdW4ubGlAbnhwLmNvbT4NCj4gPiA+ID4gKw0KPiA+ID4gPiArZGVzY3JpcHRpb246IHwtDQo+
ID4gPiA+ICsgIFVTQiBTdXBlclNwZWVkIChTUykgbGFuZXMgcm91dGluZyB0byB3aGljaCBzaWRl
IG9mIHR5cGVjDQo+ID4gPiA+ICtjb25uZWN0b3IgaXMNCj4gPiA+ID4gKyAgZGVjaWRlZCBieSBv
cmllbnRhdGlvbiwgdGhpcyBtYXliZSBhY2hpZXZlZCBieSBzb21lIHNpbXBsZQ0KPiA+ID4gPiAr
Y29udHJvbCBsaWtlDQo+ID4gPiA+ICsgIEdQSU8gdG9nZ2xlLg0KPiA+ID4gPiArDQo+ID4gPiA+
ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICBjb21wYXRpYmxlOg0KPiA+ID4gPiArICAgIGNvbnN0
OiB0eXBlYy1vcmllbnRhdGlvbi1zd2l0Y2gNCj4gPiA+ID4gKw0KPiA+ID4gPiArICBzd2l0Y2gt
Z3Bpb3M6DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+ID4gKyAgICAgIGdwaW8g
c3BlY2lmaWVyIHRvIHN3aXRjaCB0aGUgc3VwZXIgc3BlZWQgYWN0aXZlIGNoYW5uZWwsDQo+ID4g
PiA+ICsgICAgICBHUElPX0FDVElWRV9ISUdIOiBHUElPIHN0YXRlIGhpZ2ggZm9yIGNjMTsNCj4g
PiA+ID4gKyAgICAgIEdQSU9fQUNUSVZFX0xPVzogIEdQSU8gc3RhdGUgbG93IGZvciBjYzEuDQo+
ID4gPg0KPiA+ID4gV2hhdCBkb2VzIGFjdGl2ZSBtZWFuPyBUaGVyZSBpc24ndCByZWFsbHkgYW4g
YWN0aXZlIGFuZCBpbmFjdGl2ZSBzdGF0ZSwNCj4gcmlnaHQ/DQo+ID4gPiBJdCdzIG1vcmUgYSBt
dXggc2VsZWN0aW5nIDAgb3IgMSBpbnB1dD8NCj4gPg0KPiA+IFllcywgSSB3aWxsIGNoYW5nZSB0
aGUgZGVzY3JpcHRpb246DQo+ID4gZ3BpbyBzcGVjaWZpZXIgdG8gc2VsZWN0IHRoZSB0YXJnZXQg
Y2hhbm5lbCBvZiBtdXguDQo+IA0KPiBJIHdvbmRlciBpZiB0aGUgZXhpc3RpbmcgbXV4IGJpbmRp
bmdzIHNob3VsZCBiZSB1c2VkIGhlcmUuDQoNCklmIG9ubHkgY29uc2lkZXIgdHlwZWMgc3dpdGNo
IHZpYSAiZ3BpbyIsIGV4aXN0aW5nICJtdXgtZ3BpbyINCmJpbmRpbmcgbWF5IGJlIHVzZWQgd2l0
aCBwcm9wZXJ0eSAibXV4LWNvbnRyb2wtbmFtZXMiIHRvIGJlDQoidHlwZWMteHh4IiBmb3IgbWF0
Y2gsIGJ1dCB3ZSBzdGlsbCBuZWVkIGNyZWF0ZSB0eXBlYyBzdHVmZiBhdA0KbXV4IGRyaXZlciB0
byBob29rIHRvIHR5cGVjIHN5c3RlbSwgc28gbGl0dGxlIGJlbmVmaXQsIGNvbnNpZGVyaW5nDQp0
aGlzIGJpbmRpbmcgaXMgZ29pbmcgdG8gYmUgZm9yIGEgZ2VuZXJpYyB0eXBlYyBvcmllbnRhdGlv
biBzd2l0Y2gNCnNpbXBsZSBkcml2ZXIsIEkgdGhpbmsgYSBuZXcgdHlwZWMgYmluZGluZyBtYWtl
IHNlbnNlLiAgDQoNCj4gDQo+ID4gPiBJIHRoaW5rIHlvdSB3YW50IGZsYWdzIDAgKGFrYSBHUElP
X0FDVElWRV9ISUdIKSB1bmxlc3MgdGhlcmUncyBhbg0KPiA+ID4gaW52ZXJ0ZXIgaW4gdGhlIG1p
ZGRsZS4NCj4gPg0KPiA+IFRoaXMgZGVwZW5kcyBvbiB0aGUgc3dpdGNoIElDIGRlc2lnbiBhbmQg
Ym9hcmQgZGVzaWduLCBsZWF2ZSAyIGZsYWdzDQo+ID4gKEdQSU9fQUNUSVZFX0hJR0ggYW5kIEdQ
SU9fQUNUSVZFX0xPVykgY2FuIGNvdmVyIGFsbCBwb3NzaWJsZSBjYXNlcy4NCj4gPg0KPiA+IE5Y
UCBoYXMgMiBkaWZmIElDIHBhcnRzIGZvciB0aGlzOg0KPiA+IDEuIFBUTjM2MDQzKHVzZWQgb24g
aU1YOE1RKQ0KPiA+IE91dHB1dCBzZWxlY3Rpb24gY29udHJvbA0KPiA+IFdoZW4gU0VMPTAsIFJY
X0FQXyovVFhfQVBfKiBhcmUgY29ubmVjdGVkIHRvIFJYX0NPTl8yKi9UWF9DT05fMiosIGFuZA0K
PiA+IFJYX0NPTl8xKi9UWF9DT05fMSogYXJlIGNvbm5lY3RlZCB0byBWREQgdGhydSBsb3cgb2ht
aWMgcmVzaXN0b3IuDQo+ID4gV2hlbiBTRUw9MSwgUlhfQVBfKi9UWF9BUF8qIGFyZSBjb25uZWN0
ZWQgdG8gUlhfQ09OXzEqL1RYX0NPTl8xKiwgYW5kDQo+ID4gUlhfQ09OXzIqL1RYX0NPTl8yKiBh
cmUgY29ubmVjdGVkIHRvIFZERCB0aHJ1IGxvdyBvaG1pYyByZXNpc3Rvci4NCj4gPg0KPiA+IEJv
YXJkIGRlc2lnbiBjb25uZWN0cyBSWF9DT05fMSovVFhfQ09OXzEqIHRvIHR5cGVjIGNvbm5lY3Rv
ciBDQzEsIHNvDQo+ID4gR1BJT19BQ1RJVkVfSElHSA0KPiA+DQo+ID4gMi4gQ0JUVTAyMDQzKHVz
ZWQgb24gaU1YOE1QKQ0KPiA+IFNFTCAgICAgICAgRnVuY3Rpb24NCj4gPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IExvdyAgICAgICAgQSB0byBCIHBvcnRzIGFu
ZCB2aWNlIHZlcnNhDQo+ID4gSGlnaCAgICAgICBBIHRvIEMgcG9ydHMgYW5kIHZpY2UgdmVyc2EN
Cj4gPg0KPiA+IEJvYXJkIGRlc2lnbiBjb25uZWN0cyBCIHRvIHR5cGVjIGNvbm5lY3RvciBDQzEs
IHNvIEdQSU9fQUNUSVZFX0xPVw0KPiA+DQo+ID4gVGhlcmVmb3JlLCB3ZSBuZWVkIDIgZmxhZ3Mu
DQo+IA0KPiBJJ20gbm90IHNheWluZyB5b3UgZG9uJ3QuIEp1c3QgdGhhdCB0aGUgZGVzY3JpcHRp
b24gaXMgYSBiaXQgb2RkLg0KPiBQbGVhc2UgZXhwYW5kIHRoZSBkZXNjcmlwdGlvbiBmb3IgaG93
IG9uZSBkZWNpZGVzIGhvdyB0byBzZXQgdGhlIGZsYWdzLg0KDQpNaXN1bmRlcnN0b29kIHlvdXIg
cG9pbnQsIE9LLCBJIHRob3VnaHQgdGhlICJob3cgdG8gc2V0IHRoZSBmbGFncyIgd2FzDQpzaW1w
bGUgYW5kIGNsZWFyIGVub3VnaDoNClVzZSBHUElPX0FDVElWRV9ISUdIIGlmIEdQSU8gcGh5c2lj
YWwgc3RhdGUgaGlnaCBpcyBmb3IgY2MxOyBvcg0KVXNlIEdQSU9fQUNUSVZFX0xPVyBpZiBHUElP
IHBoeXNpY2FsIHN0YXRlIGxvdyBpcyBmb3IgY2MxLg0KDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4g
PiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcG9ydDoNCj4gPiA+ID4g
KyAgICB0eXBlOiBvYmplY3QNCj4gPiA+ID4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogLXwNCj4gPiA+ID4gKyAgICAgIENvbm5lY3Rp
b24gdG8gdGhlIHJlbW90ZSBlbmRwb2ludCB1c2luZyBPRiBncmFwaCBiaW5kaW5ncw0KPiA+ID4g
PiArIHRoYXQgbW9kZWwNCj4gPiA+IFNTDQo+ID4gPiA+ICsgICAgICBkYXRhIGJ1cyB0byB0eXBl
YyBjb25uZWN0b3IuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ID4g
PiArICAgICAgZW5kcG9pbnQ6DQo+ID4gPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+ID4g
PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiA+ID4gKw0KPiA+ID4g
PiArICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICAgICAgICAgIHJlbW90ZS1lbmRwb2lu
dDogdHJ1ZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgIHJlcXVpcmVkOg0KPiA+ID4gPiAr
ICAgICAgICAgIC0gcmVtb3RlLWVuZHBvaW50DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICByZXF1
aXJlZDoNCj4gPiA+ID4gKyAgICAgIC0gZW5kcG9pbnQNCj4gPiA+ID4gKw0KPiA+ID4gPiArcmVx
dWlyZWQ6DQo+ID4gPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ID4gPiArICAtIHBvcnQNCj4gPiA+
ID4gKw0KPiA+ID4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPiA+ICsNCj4g
PiA+ID4gK2V4YW1wbGVzOg0KPiA+ID4gPiArICAtIHwNCj4gPiA+ID4gKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gPiA+ICsgICAgcHRuMzYwNDMgew0KPiA+ID4g
PiArICAgICAgICBjb21wYXRpYmxlID0gInR5cGVjLW9yaWVudGF0aW9uLXN3aXRjaCI7DQo+ID4g
PiA+ICsgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gPiA+ICsgICAgICAg
IHBpbmN0cmwtMCA9IDwmcGluY3RybF9zc19zZWw+Ow0KPiA+ID4gPiArICAgICAgICBzd2l0Y2gt
Z3Bpb3MgPSA8JmdwaW8zIDE1IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ID4gPiArDQo+ID4gPiA+
ICsgICAgICAgIHBvcnQgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgIHVzYjNfZGF0YV9zczog
ZW5kcG9pbnQgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZ0eXBlY19jb25fc3M+Ow0KPiA+ID4NCj4gPiA+IFRoZSBkYXRhIGdvZXMgZnJvbSB0
aGUgY29ubmVjdG9yIHRvIGhlcmUgYW5kIHRoZW4gd2hlcmU/IFlvdSBuZWVkIGENCj4gPiA+IGNv
bm5lY3Rpb24gdG8gdGhlIFVTQiBob3N0IGNvbnRyb2xsZXIuDQo+ID4NCj4gPiBUaGUgb3JpZW50
YXRpb24gc3dpdGNoIG9ubHkgbmVlZCBpbnRlcmFjdCB3aXRoIHR5cGUtYywgbm8gYW55DQo+ID4g
aW50ZXJhY3Rpb24gd2l0aCBVU0IgY29udHJvbGxlciwgZG8gd2Ugc3RpbGwgbmVlZCBhIGNvbm5l
Y3Rpb24gdG8gaXQ/DQo+IA0KPiBJZiB5b3UgaGF2ZSAyIFVTQiBob3N0cyBhbmQgMiBjb25uZWN0
b3JzIChhbmQgMiBtdXhlcyksIGhvdyB3b3VsZCB5b3UgZGVzY3JpYmUNCj4gd2hpY2ggY29ubmVj
dG9yIGdvZXMgd2l0aCB3aGljaCBob3N0Pw0KDQpPbmUgaW5zdGFuY2Ugb2YgdHlwZWMgb3JpZW50
YXRpb24gc3dpdGNoIGRlZmluZWQgYnkgdGhpcyBiaW5kaW5nIG9ubHkgZm9yDQpPbmUgdHlwZWMg
Y29ubmVjdG9yLiBXaXRoIHRoYXQsIG15IHVuZGVyc3RhbmRpbmcgaXMNCldoZXRoZXIgYSBjb25u
ZWN0aW9uIG5lZWQgYmUgZGVzY3JpYmVkIGRlcGVuZHMgb24gaWYgdGhlIGNvbm5lY3Rvcg0KKHR5
cGVjIGRyaXZlcikgbmVlZCBub3RpZnkgdGhlIGhvc3QgY29udHJvbGxlciBkcml2ZXIgdG8gZG8g
c29tZXRoaW5nDQooZS5nLiByb2xlIHN3aXRjaCBuZWVkIGEgY29ubmVjdGlvbiBiZXR3ZWVuIGNv
bnRyb2xsZXIgbm9kZSBhbmQgY29ubmVjdG9yDQpub2RlIGZvciBjb250cm9sbGVyIGRyaXZlciB0
byBzd2FwIHVzYiByb2xlKS4gSWYgdGhlIG11eC9zd2l0Y2ggY29udHJvbCBpcw0KdHJhbnNwYXJl
bnQgdG8gdXNiIGhvc3QgY29udHJvbGxlciAoZS5nLiBteSBjYXNlLCB1c2IgY29udHJvbGxlciBk
cml2ZXJzDQpub3JtYWxseSBkb24ndCBuZWVkIGRvIGFueXRoaW5nIGZvciBvcmllbnRhdGlvbiBj
aGFuZ2UpLCB0aGVyZSBpcyBubyBuZWVkDQp0byBkZXNjcmliZSBjb25uZWN0aW9uIGJldHdlZW4g
b3JpZW50YXRpb24gc3dpdGNoIG5vZGUgYW5kIGhvc3QgY29udHJvbGxlcg0Kbm9kZS4NCg0KVGhh
bmtzDQpMaSBKdW4NCj4gDQo+IFJvYg0K

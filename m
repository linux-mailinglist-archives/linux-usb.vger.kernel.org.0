Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7952746E7
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 18:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIVQpc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 12:45:32 -0400
Received: from mail-eopbgr140088.outbound.protection.outlook.com ([40.107.14.88]:45216
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbgIVQpc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 12:45:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEDDviSCf5vcpDiao1MptCUJVGRsM5RQYuUTRlGMOmN9dsjBMUjBsZRTRKORx15/2455QRjf0H99HQC9JLtR7vpei73HXlMhwX7X2b3iqoFYsamfwGutaRzBnlK6LqTa+YmVquceN1mW/VBip8OJPXXWqcPDqtUm6FZpUIElx5Soy5QkMXGZ3cto7+ChoELWK1NFLRvmvyXSuTaXrc8/0RBfdu1sU8ljUv9EX6BXHiufb02KG78OB3fWPv9xYplHiOeTg2HGfERE7Z4Pu7L9tmZhfiHjG8nYFOI+iMLcBnkKKR2uvcfGRw48oEwi7AHFUeLIUciIf0MxswQpV1ddvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k/Ce4fawZvBefn4z/9bQqmox5DD07y95dDe3feHoCk=;
 b=bc64gZMn3CvMoaKEvEk5lEMx0eJIL2WdDUvCJeIKhw8NtQZqDF6rEygy21O4+Iues1iMoYZSJib7iqqtOkJkRPqXnmSQKx+CtSs6fVL8FAH2ZUBXnJJ5vbpYVzdmQeqW2J+aRSjyCjvH49yQ84rz7cUhAcsrSzIb9R/bVxLMvD3ZQOXiG8/++EGTg6ujhpoIABFXoaFYxU7lF3VYA2ufh248EXHDwc9kdPWu13xF0bBFLpr9wIViuI394nd0UYEqzbtj4Do0mZLBRMelHaoPpnltDquJiZVZZZ661wDuIB4RERbXNIRmCzlyB70nAvc9pKzfYMltdVY/lATEFYUGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k/Ce4fawZvBefn4z/9bQqmox5DD07y95dDe3feHoCk=;
 b=cjJW3Rhx4BgjV6S+pHyLrpI9JcbzIf/I3Z09SV1a4u9hesJ87DvnGMgT4SRe0qJAeLR/HEJfcRwQmqh+iU+FhBZi/TSkHBDn+lCMaAIRjVTbwzw947tgxFa9F9tzNl0r5qJHVMPRDn5WJSAOJwVQrenfuk+n11A4tE/iSh8H35E=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 16:45:28 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 16:45:28 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
Thread-Topic: [PATCH v3 3/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
Thread-Index: AQHWkM68nvZd4rCY+0GwyWqImRmfDKl0uNoAgAAkU9A=
Date:   Tue, 22 Sep 2020 16:45:27 +0000
Message-ID: <VE1PR04MB6528C9AF51263B92EA687BEB893B0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
 <1600771612-30727-4-git-send-email-jun.li@nxp.com>
 <CAJKOXPfocQZY-5Xmn5q=oetmS1doe0zXsQH=uXx0+CxGaESgUg@mail.gmail.com>
In-Reply-To: <CAJKOXPfocQZY-5Xmn5q=oetmS1doe0zXsQH=uXx0+CxGaESgUg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3b8efc6-d5ff-4160-9227-08d85f16e941
x-ms-traffictypediagnostic: VI1PR04MB6912:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6912E72080A0831772F5EF02893B0@VI1PR04MB6912.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5SiRtEega4xENeyMxvbmQHaPMPnE5xkUUK726lUdgNODOFSMnkxGACzS+402ryCcuaZz7ZJ+RAgbEaQei9gvM/GcTsb6D1DyUYRZhXmkLGEjmc3N6sBsrJGk4WYZDL6+3BKqAIYuUaI/xkoGXP22oVaiG2hEdWe7U5XyEXwY6fykLjkoyDI2LHUk6VjNAVyEccCR2E1sgDNKxwnxEDJBnPbkjPnFNDhfXxFNpud24pas3aKYfnthvCJID+sZ99WDSYgf445gw9ND8bHws5ieRBPcRpzKxpN3k54rsrb0jfgKz9ntKjfuj9hrsYuER4E3HBOecxj/0DEakzZT7C8XldH1O8do3ziZc1UBO+iR/1b1/Yahzbo+t06vJ46ABuJuVuLi3e/tOt15U6dwxIJD0HxMW6H7LY/R5tCcdWqzbnT0lI4W4KO2+AYBvCAsrS16X0LnRcnZpydQsMAGpfusZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(8936002)(66476007)(66556008)(64756008)(66446008)(5660300002)(8676002)(45080400002)(66946007)(7696005)(83380400001)(76116006)(33656002)(2906002)(478600001)(6916009)(52536014)(316002)(4326008)(9686003)(186003)(53546011)(55016002)(71200400001)(6506007)(54906003)(44832011)(86362001)(83080400001)(26005)(7416002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: RW+bKcCYv3Mr+0qYGF+W0pIYqPucOThp9NOoEzJaCDjnp+x4avJ9hPQhMoM0FIfmbmDi2KJ2GcpBcUMtsuNNejlS8nua7zqVui6BoorGNs16DCvTZlI56d0MHMOz8V3YLIilVkQeiNlHKhjjvrexlzJwe0HqMknhTUzq9aaY9zOKXvPRpLwEz0EaC24gmjhvdOhut37uW6e9ouy7baOzAMn2vM+8FAEWR+y7CzF8xt42SR2dpGIDdiTZG01wAm8xLXb/UtZ9YjlYX7GtdfZAL/lnaocICmNEYPqZxeauUVcZE1r7/w3C1POUQC2wPoUwUlQvQ+t36BOUvQkDHCE4zL6EC0V9vTe2oxMgBdH1XD0cBlVvoW7MBsvsJrDkDiZj8gLklVuw28DNndFVXGEJyIrytu69oEF+tpepn2pZl0VSaiBAaGyrgRmT1UD+MA5da+n9FAXe1b29avatU4w8qI0dI559tU5/Ef7/PBbH4EmqQHMFO+vwsJVA6V7yAvcaOjRNLhT4vQnOB/xg+LveGQ7JO2wfp4YVZO2i8NOw0Gay0ZahS+8HEGqFwV490NFzQjysDHNBJZvFNnwEHj5WnQoQ5eun7yfSSNrbQ3bZHl6YoMP+Hw0MOlEzChHHQpXqHL9Ws8eNHbCtpc4eB+hWdQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b8efc6-d5ff-4160-9227-08d85f16e941
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 16:45:27.7944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2ROiRp6FwRu+CTkRhw5nYE48pvuemNLzkFFH2oXJarLXMTHgQaK4grwA8CRV+Jw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjIsIDIw
MjAgMTA6MzMgUE0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IENjOiByb2JoK2R0
QGtlcm5lbC5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IGJhbGJpQGtlcm5lbC5vcmc7DQo+IG1h
dGhpYXMubnltYW5AaW50ZWwuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gcy5o
YXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFp
bC5jb207DQo+IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBBbnNvbiBIdWFuZyA8
YW5zb24uaHVhbmdAbnhwLmNvbT47DQo+IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5j
b20+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IEFuZHkgRHVhbg0KPiA8ZnVnYW5nLmR1
YW5AbnhwLmNvbT47IEpvYWtpbSBaaGFuZyA8cWlhbmdxaW5nLnpoYW5nQG54cC5jb20+OyBIb3Jp
YQ0KPiBHZWFudGEgPGhvcmlhLmdlYW50YUBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVs
Lm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvNl0gZHQtYmluZGlu
Z3M6IHVzYjogZHdjMy1pbXg4bXA6IGFkZCBpbXg4bXAgZHdjMw0KPiBnbHVlIGJpbmRpbmdzDQo+
IA0KPiBPbiBUdWUsIDIyIFNlcCAyMDIwIGF0IDEyOjU2LCBMaSBKdW4gPGp1bi5saUBueHAuY29t
PiB3cm90ZToNCj4gPg0KPiA+IE5YUCBpbXg4bXAgaW50ZWdyYXRlcyAyIGR3YzMgMy4zMGIgSVAg
YW5kIGFkZCBzb21lIHdha2V1cCBsb2dpYyB0bw0KPiA+IHN1cHBvcnQgbG93IHBvd2VyIG1vZGUs
IHRoZSBnbHVlIGxheWVyIGlzIGZvciB0aGlzIHdha2V1cA0KPiA+IGZ1bmN0aW9uYWxpdHksIHdo
aWNoIGhhcyBhIHNlcGFyYXRlZCBpbnRlcnJ1cHQsIGNhbiBzdXBwb3J0IHdha2V1cA0KPiA+IGZy
b20gVTMgYW5kIGNvbm5lY3QgZXZlbnRzIGZvciBob3N0LCBhbmQgdmJ1cyB3YWtldXAgZm9yIGRl
dmljZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9mc2wsaW14OG1wLWR3YzMu
eWFtbCAgIHwgOTkNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgOTkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9mc2wsaW14OG1wLWR3YzMueWFtbA0KPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9mc2wsaW14OG1wLWR3YzMueWFt
bA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4uYTVkNTU2Ng0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2ZzbCxpbXg4bXAtZHdjMy55YW1sDQo+ID4gQEAgLTAsMCArMSw5OSBAQA0KPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkgIyBDb3B5cmlnaHQNCj4gPiArKGMpIDIwMjAgTlhQICVZQU1MIDEuMg0KPiA+ICstLS0NCj4g
PiArJGlkOg0KPiA+DQo+ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPg0KPiArY2V0cmVlLm9yZyUyRnNjaGVt
YXMlMkZ1c2IlMkZmc2wlMkNpbXg4bXAtZHdjMy55YW1sJTIzJmFtcDtkYXRhPTAyJTdDDQo+ID4N
Cj4gKzAxJTdDanVuLmxpJTQwbnhwLmNvbSU3Q2VhZWRlYjY0ZWMxNTQ3MjE4M2QxMDhkODVmMDQ2
ODQxJTdDNjg2ZWExZDNiYw0KPiA+DQo+ICsyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAl
N0M2MzczNjM4MTk4MTk2Njc5MzYmYW1wO3NkYXRhPUl2RlE4bDANCj4gPiArN1ZYVU1iRzhyaXlJ
VFNUWmIxUDUwb0lYcyUyQmtBViUyRmVYOG50ayUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ICskc2No
ZW1hOg0KPiA+DQo+ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPg0KPiArY2V0cmVlLm9yZyUyRm1ldGEtc2No
ZW1hcyUyRmNvcmUueWFtbCUyMyZhbXA7ZGF0YT0wMiU3QzAxJTdDanVuLmxpJTQwDQo+ID4NCj4g
K254cC5jb20lN0NlYWVkZWI2NGVjMTU0NzIxODNkMTA4ZDg1ZjA0Njg0MSU3QzY4NmVhMWQzYmMy
YjRjNmZhOTJjZDk5Yw0KPiA+DQo+ICs1YzMwMTYzNSU3QzAlN0MwJTdDNjM3MzYzODE5ODE5Njc3
OTM0JmFtcDtzZGF0YT1IMyUyQmN3Z2lMS0J5bkh2NE4lMkYNCj4gPiArZG9nQmkzU3dhaXpWSG1x
aWVKWFZyRXJ2MEklM0QmYW1wO3Jlc2VydmVkPTANCj4gPiArDQo+ID4gK3RpdGxlOiBOWFAgaU1Y
OE1QIFNvYyBVU0IgQ29udHJvbGxlcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAg
LSBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiAr
ICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+IA0KPiBJdGVtcyBhcmUgbm90IG5lY2Vz
c2FyeQ0KPiANCj4gDQo+ID4gKyAgICAtIGNvbnN0OiBmc2wsaW14OG1wLWR3YzMNCj4gPiArDQo+
ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArICAgIGRlc2NyaXB0aW9uOiBB
ZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVyIHNldCBmb3IgdGhlIHdyYXBwZXINCj4g
b2YNCj4gPiArICAgICAgZHdjMyBjb3JlIG9uIHRoZSBTT0MuDQo+ID4gKw0KPiA+ICsgICIjYWRk
cmVzcy1jZWxscyI6DQo+ID4gKyAgICBlbnVtOiBbIDEsIDIgXQ0KPiA+ICsNCj4gPiArICAiI3Np
emUtY2VsbHMiOg0KPiA+ICsgICAgZW51bTogWyAxLCAyIF0NCj4gPiArDQo+ID4gKyAgcmFuZ2Vz
OiB0cnVlDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSBpbnRlcnJ1cHQgdGhhdCBpcyBhc3NlcnRlZCB3aGVu
IGEgd2FrZXVwIGV2ZW50IGlzDQo+ID4gKyAgICAgIHJlY2VpdmVkLg0KPiA+ICsNCj4gPiArICBj
bG9ja3M6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgQSBsaXN0IG9mIHBoYW5k
bGUgYW5kIGNsb2NrLXNwZWNpZmllciBwYWlycyBmb3IgdGhlIGNsb2Nrcw0KPiA+ICsgICAgICBs
aXN0ZWQgaW4gY2xvY2stbmFtZXMuDQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogc3lzdGVtIGhzaW8gcm9vdCBjbG9jay4NCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogc3VzcGVuZCBjbG9jaywgdXNlZCBmb3IgdXNiIHdha2V1cCBsb2dpYy4NCj4gPiArDQo+ID4g
KyAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogaHNp
bw0KPiA+ICsgICAgICAtIGNvbnN0OiBzdXNwZW5kDQo+ID4gKw0KPiA+ICsjIFJlcXVpcmVkIGNo
aWxkIG5vZGU6DQo+ID4gKw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAiXmR3YzNA
WzAtOWEtZl0rJCI6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4gPiArICAgIGRlc2NyaXB0aW9u
Og0KPiA+ICsgICAgICBBIGNoaWxkIG5vZGUgbXVzdCBleGlzdCB0byByZXByZXNlbnQgdGhlIGNv
cmUgRFdDMyBJUCBibG9jaw0KPiA+ICsgICAgICBUaGUgY29udGVudCBvZiB0aGUgbm9kZSBpcyBk
ZWZpbmVkIGluIGR3YzMudHh0Lg0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21w
YXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtICIjYWRkcmVzcy1jZWxscyINCj4gPiArICAt
ICIjc2l6ZS1jZWxscyINCj4gPiArICAtIHJhbmdlcw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAg
LSBjbG9jay1uYW1lcw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsNCj4gPiArYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBEbyB5b3UgYWN0dWFsbHkgdmFsaWRhdGUgeW91ciBE
VFMgY2hhbmdlcyB3aXRoIHRoaXMgc2NoZW1hPyBUaGV5IGRvIG5vdCBsb29rDQo+IGxpa2UgcGFz
c2luZyB0aGUgdmFsaWRhdGlvbi4uLg0KDQpJIGRpZCBydW4gZHRfYmluZGluZ19jaGVjaywgbWF5
YmUgSSBtaXNzZWQgc29tZSBlcnJvcnMgYXMgdGhlcmUgYXJlIGFsd2F5cyBzb21lIG90aGVyDQpm
YWlsdXJlcywgSSB3aWxsIHJlLXJ1biB0byBkb3VibGUgY2hlY2suDQoNCkxpIEp1bg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

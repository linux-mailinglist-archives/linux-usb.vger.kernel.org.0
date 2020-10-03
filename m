Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8A3282409
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 14:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgJCMKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 08:10:32 -0400
Received: from mail-eopbgr00042.outbound.protection.outlook.com ([40.107.0.42]:15495
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725777AbgJCMKc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 08:10:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0+FwDB/28QEOx9J7TLT5/FxMs2mNCoM8gyY2CuH3gpA97xRw4wUDPSq12ZeMFv3zStp9/j3QyvFEPVb2TKLG7Ay1WnriZijWNMug2CUI3AHCNMENCIAJywsfinR7JMGp5jZFYkEEejr7WIewFRr02Lc5SnIN7UHMa62MVaI+pBkqyJ5xUc42GGiZCbLeROdfr+Tj9weMivYCCEb7ZM5hGQIJGBiC3eD594OfM0lSPgBEDwHShABeRVrKdWAD9wF8diJa49QIKwn9fggPgNFOHJFZ+TrbS5p5pVJ2nR6mZlkkuy/IHMgYRTgbCrZJW3JNHeFLthhgw6uUYKhI2dZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuipAwmB5jTZoB0ITccoZYZHY3+CGd2TG15DqoTytVY=;
 b=QXj3jjSJDb/+jPTMjfdk50BX+lF7cDuYc2UNEFqH+Dtm9WcKjjt4RiXeH2IWeThbvhYKzzCFcNpaonjl8ZXCir9FcL0QYJV16ZqvNo0PkBL9S0BmZq5JOXnSUZ61nNN1aPYaqQmP/8WIIqh+02arG08wIMd8xyddn6Ra3CuOS0/Xb29egaZ9IBt0DvgmMQAO5cyQpXXp0OftG+ga6rGi2v8eNs2fnHa/Iytcd8rY+btUAJwzr2upXKkwuGPW6F6BAfS8ZOqmjrE9llIiyhcsFFB6ijc74N0AFhyxRdwp4CWznOBc7zFhiLLGwmt14L0V5AKxyMa/3bwimZuQlsqCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuipAwmB5jTZoB0ITccoZYZHY3+CGd2TG15DqoTytVY=;
 b=aM3NgAJd0JSul5owNPC0QKEOgTXh59fkJ0uuHVCfpxiQNrNBFzUFHoBzzUj3rM6fXi6eQrJivAK5JzgLZT4mJh8R9h4PnNx6Wf0miQo1g11Y0Nt6C6fNC55DkSYQ5FhPO1S1BE66cjXJ3sGHtYCwNi75cLxXNjYEXCnoy+f7cYM=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4064.eurprd04.prod.outlook.com (2603:10a6:803:4c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sat, 3 Oct
 2020 12:10:28 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.039; Sat, 3 Oct 2020
 12:10:28 +0000
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
        Horia Geanta <horia.geanta@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
Thread-Topic: [PATCH v4 1/4] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
Thread-Index: AQHWmNn4bUFVzxWfGEa+wQxxGlLZp6mFtisAgAAT2NA=
Date:   Sat, 3 Oct 2020 12:10:27 +0000
Message-ID: <VE1PR04MB65283B9218B858632F55350A890E0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
 <1601656238-22232-2-git-send-email-jun.li@nxp.com>
 <CAJKOXPcoCR7FKe234bDeVvGUpwwOdBv=mb42_NbEXtUc1MLpHA@mail.gmail.com>
In-Reply-To: <CAJKOXPcoCR7FKe234bDeVvGUpwwOdBv=mb42_NbEXtUc1MLpHA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.117.242.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3ef334a-20f4-4d98-4326-08d86795511e
x-ms-traffictypediagnostic: VI1PR04MB4064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4064B89B9C4E99B236AB627A890E0@VI1PR04MB4064.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2b/pN+mQ3rr4JqUQrPCjaRKKvsyeCxTQrRDC4gj4RRc5PCD05sJpMZDdFaSbeggh030szGhjpmVFYk/psjH5lwLq2MDAAPANYJS68PfCHXtRBm2CHSB0h2iFwPwwJc0BPDR95aqfGM8nMHNoUphjxVf6ax9+NHWwF/dasu8CkLCqAX/MlO7WmmneVILMRdEkCPI1yma2HtiPRnAeoGP7cfIQoZ6aHfHH8Kt14HJ0mvuJTWjzvag3YEXzs9FXyy0xD3XXmx383w2S93mQntGRgGnqbl7SHKDgc6W3uUSfnwYrXeEseXWV/U4joim9wr3vJ7dBmgL7HBX26GjJYwphf9x+gmFFDSIyQoO9GDj9/Z0OGNkpFGUFrdCrqllbga8zIjRp/WQdhHm1NX3MmFgWtr528FuF9Y8BUeCP8YEEsfiUop3xSSkFInok8a/jgUKppQeYctNzB8t5eBi+dMBRZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(2906002)(8936002)(9686003)(76116006)(33656002)(66946007)(66446008)(64756008)(66556008)(66476007)(186003)(55016002)(8676002)(7416002)(83380400001)(26005)(52536014)(5660300002)(6916009)(71200400001)(45080400002)(83080400001)(478600001)(7696005)(316002)(54906003)(53546011)(44832011)(86362001)(6506007)(4326008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: tD1/Jk8sYGTL5YX6Rzy6rs8wzns50ToGjhup/ysElapBZRUEj8TJYHRLFgMJu466WZziZCGtoST/5K14SrTI2NaRgmIuXr40aS8K6j1nq8onwcXOwxcZ8rIXMvYcQc4dV1/EQW5atP3b1P+qITd+Xtt0ylMtrXATzmFYTZHCNwqi6TSHKWaALF+ILTgxahTg/X6XGQdDgkdQuvjucgrvtWt3JnDvMLzeYI4Hf+DczWCMo1x12E4vG+AGCE6vJckp/uZH7kMkz6OTWpxncvH52m887nQuZXsjOWQPTfLYTWnHU6PFRUZsQVHpUW88GlrhVLXmo+UC3bBvZUzDnu8ZBgDTXzqQUlcIzmL/72JdjjbF6KkyHsATxml3z0VX1Ip1/npJ4JLmd01X80xRY871K8NLIZV8Qf3Gr7YqiHmqorWG4+Cj1OwdD9OjHdU5N8wk6SvenTqUXHZA6oraO4gusI9nCVuK/hHEd986EpwWpo6Y5HP0UD+zonnnJv9QL4cXUY8isHmUdyCD/VTBkvQz2gP3MpQe2InW2deZucnAJjfNZwFr6L00cCJ/9rb2MUz9C76zCvR2L0YfQeHKRTlFHprpWHOSpZW2f0leuQSLZbbHvY9zmYvKncqwl7m7Gnlma6bT/U0wwAjzACLTFaCrDQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ef334a-20f4-4d98-4326-08d86795511e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2020 12:10:28.0121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJr5r0e4a8vo3LhCKySNu1KkrvTS/paw9gNvwaXyS5Rit28f7XbE13NI7cJutAuZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4064
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgT2N0b2JlciAzLCAyMDIw
IDY6NTcgUE0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IENjOiByb2JoK2R0QGtl
cm5lbC5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IGJhbGJpQGtlcm5lbC5vcmc7DQo+IG1hdGhp
YXMubnltYW5AaW50ZWwuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gcy5oYXVl
ckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5j
b207DQo+IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBBbnNvbiBIdWFuZyA8YW5z
b24uaHVhbmdAbnhwLmNvbT47DQo+IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+
OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IEFuZHkgRHVhbg0KPiA8ZnVnYW5nLmR1YW5A
bnhwLmNvbT47IEhvcmlhIEdlYW50YSA8aG9yaWEuZ2VhbnRhQG54cC5jb20+Ow0KPiBsaW51eC11
c2JAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQg
MS80XSBkdC1iaW5kaW5nczogdXNiOiBkd2MzLWlteDhtcDogYWRkIGlteDhtcCBkd2MzDQo+IGds
dWUgYmluZGluZ3MNCj4gDQo+IE9uIEZyaSwgMiBPY3QgMjAyMCBhdCAxODozNSwgTGkgSnVuIDxq
dW4ubGlAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBOWFAgaW14OG1wIGludGVncmF0ZXMgMiBk
d2MzIDMuMzBiIElQIGFuZCBhZGQgc29tZSB3YWtldXAgbG9naWMgdG8NCj4gPiBzdXBwb3J0IGxv
dyBwb3dlciBtb2RlLCB0aGUgZ2x1ZSBsYXllciBpcyBmb3IgdGhpcyB3YWtldXANCj4gPiBmdW5j
dGlvbmFsaXR5LCB3aGljaCBoYXMgYSBzZXBhcmF0ZWQgaW50ZXJydXB0LCBjYW4gc3VwcG9ydCB3
YWtldXANCj4gPiBmcm9tIFUzIGFuZCBjb25uZWN0IGV2ZW50cyBmb3IgaG9zdCwgYW5kIHZidXMg
d2FrZXVwIGZvciBkZXZpY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5s
aUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZnNs
LGlteDhtcC1kd2MzLnlhbWwgICB8IDEwNg0KPiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+
ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ZzbCxpbXg4bXAtZHdj
My55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2ZzbCxp
bXg4bXAtZHdjMy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwLi5jMTZjOTRjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZnNsLGlteDhtcC1kd2MzLnlhbWwNCj4gPiBAQCAtMCww
ICsxLDEwNiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkgIyBDb3B5cmlnaHQNCj4gPiArKGMpIDIwMjAgTlhQICVZQU1MIDEu
Mg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+DQo+ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPg0KPiArY2V0
cmVlLm9yZyUyRnNjaGVtYXMlMkZ1c2IlMkZmc2wlMkNpbXg4bXAtZHdjMy55YW1sJTIzJmFtcDtk
YXRhPTAyJTdDDQo+ID4NCj4gKzAxJTdDanVuLmxpJTQwbnhwLmNvbSU3QzY1ZGFkYjg2YWZmMzRh
OTc3NTBkMDhkODY3OGIxYjhkJTdDNjg2ZWExZDNiYw0KPiA+DQo+ICsyYjRjNmZhOTJjZDk5YzVj
MzAxNjM1JTdDMCU3QzAlN0M2MzczNzMxOTQ0NDUzNjk1NjAmYW1wO3NkYXRhPXlMJTJCQ0oNCj4g
PiArWFZoV25TMkxsbndsRjM3OTNkeWd4UERGSlZDWmhWUWNqOERKREklM0QmYW1wO3Jlc2VydmVk
PTANCj4gPiArJHNjaGVtYToNCj4gPg0KPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4NCj4gK2NldHJlZS5v
cmclMkZtZXRhLXNjaGVtYXMlMkZjb3JlLnlhbWwlMjMmYW1wO2RhdGE9MDIlN0MwMSU3Q2p1bi5s
aSU0MA0KPiA+DQo+ICtueHAuY29tJTdDNjVkYWRiODZhZmYzNGE5Nzc1MGQwOGQ4Njc4YjFiOGQl
N0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWMNCj4gPg0KPiArNWMzMDE2MzUlN0MwJTdDMCU3QzYz
NzM3MzE5NDQ0NTM2OTU2MCZhbXA7c2RhdGE9SzIlMkZVdktyS0VlRmY1SjRNNWRDDQo+ID4gK0w1
ZiUyQjduVkJTRFB4VW9wWmd3bGZlTjhJJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gKw0KPiA+ICt0
aXRsZTogTlhQIGlNWDhNUCBTb2MgVVNCIENvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWlu
ZXJzOg0KPiA+ICsgIC0gTGkgSnVuIDxqdW4ubGlAbnhwLmNvbT4NCj4gPiArDQo+ID4gK3Byb3Bl
cnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgLSBj
b25zdDogZnNsLGlteDhtcC1kd2MzDQo+IA0KPiBUaGUgc2FtZSBjb21tZW50IGFzIGZvciB2My4N
Cg0KTWlzc2VkIHRoaXMgY29tbWVudCwgc2VudCBvdXQgVjUgdG8gYWRkcmVzcyB0aGlzLg0KDQpU
aGFua3MNCkxpIEp1bg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A1921B56E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 14:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgGJMsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 08:48:39 -0400
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:56964
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726664AbgGJMsh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jul 2020 08:48:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWjcJP2xMEj6ZCOnGQdrDCXvcLd6lBMj5EZy49Mme2bgmp8rMNnviAJpPAEWV+PFiKUYnO3if1rOfIekLq96siP5ESK5/p6+1hclwWwKPiord/wo9AM5sENyczWy4g0jJJhXXRGoz11JiWOvZvEUX5CN+NeVSx2JnySQkKwxDcSecZsuhAb4d/f3zdrjJYqm2iw/oYKqE/NNHx3LPYxVjoGFMwJq51+tbZji9qwF9HagoNQyqHkKa9eJ2oA/aTH+WexyxP3Ixm2Y5fLasLmjzPMSRWLw/dBkOkMXBwuVGik0Crs3a2mAPDx9uaIHQSun47UpM3ir/tLYyiAUFVNIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ievOX8uQMLYS0D+5knOJuFsVoyHCtADmFqNWgQRmLOo=;
 b=f4KaorYiT5xQrlcafI82u7XtG+1Kd9kttO80Gi+BModyw/SzCm61A9wHtPN79oHaQw/g2T56Vfis/ZSx/lKSO8Gny7qfeiQCMYKJHIiVe8hIoOctFoRZu81zoFMXXWvVzTW70I0FvFED1QF0JGCqjV0wHF8jVsV+rPhSP9qqb0b9G2Osyjy9vQO6Q4SQMI7eRQpJjQWcDN+HlhkL4p17wqVT2ON66M/Wdp4LvhMPbZ2RSsioHZ6ApYsRT5T53ClLSXLlXSIYG7DqK249MayM+uwIIj7NYWiUgF/GF1nqfyF5N5QQ4iTu2whskkwDDk1HofBCIGloC6P1Kazf4ecEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ievOX8uQMLYS0D+5knOJuFsVoyHCtADmFqNWgQRmLOo=;
 b=B77SuTNok4R2CQztPyu9nbcmtc8QDI7yrgZJhsDk9qTtm2lHAzr5s2EBaB9xXcTlBOGwwHlebcXJQPVbCepZsd1q9ucDxjbTr5i5iDkBcSm0U8FHWdDONYDQeHlKFT4yhBlSccdKkFkUT0kmVhRmrSIUyoZKrbt3xIuKXhEUkqI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3138.eurprd04.prod.outlook.com (2603:10a6:206:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 10 Jul
 2020 12:48:33 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 12:48:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [GIT PULL] USB: fixes for v5.8-rc3
Thread-Topic: [GIT PULL] USB: fixes for v5.8-rc3
Thread-Index: AQHWVpX3k5L51YihREGwRf3ybXs+qKkAwybA
Date:   Fri, 10 Jul 2020 12:48:33 +0000
Message-ID: <AM7PR04MB71572518D9185BE6EEFF58B58B650@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <87pn93ep85.fsf@kernel.org>
In-Reply-To: <87pn93ep85.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 552a898a-44a2-43d3-7ba1-08d824cf8e13
x-ms-traffictypediagnostic: AM5PR04MB3138:
x-microsoft-antispam-prvs: <AM5PR04MB3138FFD7EA336BA56053F8428B650@AM5PR04MB3138.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ffn5Ne2vFYrhucQa/KIgNkaV1f5ULIhWFI4B3gahDC7Fw5jNUCRggNLjHNihPV9FL9zrism9bzn04i81uHO5voB6jEyjIl5eBnnUneDpceYzxAIFvfJiNmP50nUOQoYTKsCJcBc0nYf37OswOu8iPMFe0f7dUTf5+Y/mW35TvcFVvX34xdzsSCy8mFN3iZRyAFhKJjZXWw9TtY7+0f33APdytfbP6DbqLv0akjac1AxCvqGa9oGuuPIDkO/SARke3RExzCTjSiBpoBzejzZIZ8/HrlvRS0wcHeEVSR1z3k3fKxffI8/ZhqSf6JSWFSYh9zXbPwAotGKLjMBsZYPkAYo3hfC331qAXPwHJx00d+uNCDrBdtdG1PJ3Rm+K19sMFBb6jXYrPAmQqtWotekJwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(86362001)(64756008)(66446008)(316002)(966005)(7696005)(66476007)(8936002)(9686003)(52536014)(33656002)(71200400001)(8676002)(44832011)(76116006)(478600001)(5660300002)(66946007)(2906002)(55016002)(6506007)(26005)(186003)(110136005)(66556008)(83380400001)(4326008)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Q4pDPfPiJDgwdzyPXphflH5hXeV5Dg88KAbs1qLoYFNOuzHD6bvZmEZ54p7NQajWwQiLR7Nb4briWq/uG9LtMb+dGgqB7OQ+NN/jzfvbFZ1l3IMzAeKt3W2GitBlObedy67IEjfNK4UPqBgrGzdtV90GM98uGjj94aylP2POL6jBx1dpFaVCsapjkyorhahZOtkp1kqD2HN1O8jU8zgSI+pRcNvpK79XEXrNODtt8A42wEJYKtZplqd66wAEqOwk3k6lwV7H439tCqi2y9BWCzhk/JtfT17iHkRkW2dL1JJKlqqQt5p6kdbIJgVqnItUN5nRjpmNIHFb+TQqBKfXVENuuaSCsyXuH+Mmx+NEc/lv71kTVUjIYAWULk89AbB395Z5tfgsBR6zBUHrE+UxngViWngjXSc529JV3mmoegaoJNjOoovt03grj+jn4r+F7oVFSWtY5sYPRBd/hDyWonX9qBuU2ew6cV7U9q52V2U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552a898a-44a2-43d3-7ba1-08d824cf8e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 12:48:33.1873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mHsiCeElhze5Z8giG3yzlqkIyt+2Suhq67d3aig9NCMHLmmqZ3lW9e9OLGFFtL0mvXhqosGddom7lNHf+EKLGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3138
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gaGVyZSdzIG15IHNlY29uZCBwdWxsIHJlcXVlc3QgZm9yIHRoZSBjdXJyZW50IG1l
cmdlIHdpbmRvdy4gTm90aGluZyBtYWpvciBnb2luZw0KPiBvbiBhcGFydCBmcm9tIHRoZSBzcGlu
bG9jayBmaXggaW4gbGVnYWN5IGF1ZGlvIGZ1bmN0aW9uIGFuZCBhIG1lbWxlYWsgcGx1ZyBvbg0K
PiBncl91ZGMuDQo+IA0KPiBQYXRjaGVzIGhhdmUgYmVlbiBjb29raW5nIGZvciBxdWl0ZSBhIHdo
aWxlLiBMZXQgbWUga25vdyBpZiB5b3Ugd2FudCBhbnl0aGluZyB0bw0KPiBiZSBjaGFuZ2VkDQo+
IA0KPiBjaGVlcnMNCj4gDQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCj4g
YWYzY2YwYWM2ODA1YTM2NzQwMDg5YTVmMjAwYzI4YTA0ZDQ1MjQwNDoNCj4gDQo+ICAgTWVyZ2Ug
dGFnICd1c2Itc2VyaWFsLTUuOC1yYzUnIG9mDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2pvaGFuL3VzYi1zZXJpYWwgaW50byB1c2ItbGludXMgKDIw
MjAtDQo+IDA3LTA4IDE3OjEwOjE3ICswMjAwKQ0KPiANCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6DQo+IA0KPiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9iYWxiaS91c2IuZ2l0IHRhZ3MvZml4ZXMtZm9yLXY1LjgtcmMzDQo+
IA0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gODc3OGViMDkyN2RkY2QzZjQzMTgw
NWMzN2I3OGZhNTY0ODFhZWVkOToNCj4gDQo+ICAgdXNiOiBnYWRnZXQ6IGZ1bmN0aW9uOiBmaXgg
bWlzc2luZyBzcGlubG9jayBpbiBmX3VhYzFfbGVnYWN5ICgyMDIwLTA3LTA5IDEwOjEzOjA3DQo+
ICswMzAwKQ0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBVU0I6IGZpeGVzIGZvciB2NS44LXJjMw0KPiANCj4g
QWRkaW5nIHN1cHBvcnQgZm9yIHJlY2VudCBJbnRlbCBkZXZpY2VzIChUaWdlciBMYWtlIGFuZCBK
YXNwZXIgTGFrZSkgb24gZHdjMy4gV2UNCj4gaGF2ZSBzb21lIGVuZGlhbmVzcyBmaXhlcyBpbiBj
ZG5zMywgYSBtZW1sZWFrIGZpeCBpbiBncl91ZGMgYW5kIGxvY2sgQVBJIHVzYWdlDQo+IGZpeCBp
biB0aGUgbGVnYWN5IGZfdWFjMQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogRmVsaXBlIEJhbGJpIDxi
YWxiaUBrZXJuZWwub3JnPg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBFdmdlbnkgTm92aWtvdiAoMSk6DQo+
ICAgICAgIHVzYjogZ2FkZ2V0OiB1ZGM6IGdyX3VkYzogZml4IG1lbWxlYWsgb24gZXJyb3IgaGFu
ZGxpbmcgcGF0aCBpbiBncl9lcF9pbml0KCkNCj4gDQo+IEhlaWtraSBLcm9nZXJ1cyAoMik6DQo+
ICAgICAgIHVzYjogZHdjMzogcGNpOiBhZGQgc3VwcG9ydCBmb3IgdGhlIEludGVsIFRpZ2VyIExh
a2UgUENIIC1IIHZhcmlhbnQNCj4gICAgICAgdXNiOiBkd2MzOiBwY2k6IGFkZCBzdXBwb3J0IGZv
ciB0aGUgSW50ZWwgSmFzcGVyIExha2UNCj4gDQo+IE1pY2hhxYIgTWlyb3PFgmF3ICgyKToNCj4g
ICAgICAgdXNiOiBnYWRnZXQ6IHVkYzogYXRtZWw6IHJlbW92ZSBvdXRkYXRlZCBjb21tZW50IGlu
IHVzYmFfZXBfZGlzYWJsZSgpDQo+ICAgICAgIHVzYjogZ2FkZ2V0OiB1ZGM6IGF0bWVsOiBmaXgg
dW5pbml0aWFsaXplZCByZWFkIGluIGRlYnVnIHByaW50aw0KPiANCj4gTWluYXMgSGFydXR5dW55
YW4gKDEpOg0KPiAgICAgICB1c2I6IGR3YzI6IEZpeCBzaHV0ZG93biBjYWxsYmFjayBpbiBwbGF0
Zm9ybQ0KPiANCj4gUGV0ZXIgQ2hlbiAoMik6DQo+ICAgICAgIHVzYjogY2RuczM6IGVwMDogZml4
IHNvbWUgZW5kaWFuIGlzc3Vlcw0KPiAgICAgICB1c2I6IGNkbnMzOiB0cmFjZTogZml4IHNvbWUg
ZW5kaWFuIGlzc3Vlcw0KPiANCg0KSGkgRmVsaXBlLA0KDQpJIGhhdmUgdGhyZWUgZW5kaWFuIGlz
c3VlIGZpeCBwYXRjaGVzIGZvciBjZG5zMywgdGhlcmUgaXMgc3RpbGwgb25lIGF0Og0KDQpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNTg1MTM1Lw0KDQpUaGFua3MsDQpQZXRl
cg0KDQoNCj4gUmFuZHkgRHVubGFwICgxKToNCj4gICAgICAgdXNiOiBnYWRnZXQ6IGZpeCBsYW5n
aWQga2VybmVsLWRvYyB3YXJuaW5nIGluIHVzYnN0cmluZy5jDQo+IA0KPiBaaGFuZyBRaWFuZyAo
MSk6DQo+ICAgICAgIHVzYjogZ2FkZ2V0OiBmdW5jdGlvbjogZml4IG1pc3Npbmcgc3BpbmxvY2sg
aW4gZl91YWMxX2xlZ2FjeQ0KPiANCj4gIGRyaXZlcnMvdXNiL2NkbnMzL2VwMC5jICAgICAgICAg
ICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVy
cy91c2IvY2RuczMvdHJhY2UuaCAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQ0KPiAgZHJp
dmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICB8ICAzICsrLQ0KPiAgZHJp
dmVycy91c2IvZHdjMy9kd2MzLXBjaS5jICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrDQo+
ICBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl91YWMxX2xlZ2FjeS5jIHwgIDIgKysNCj4g
IGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXRtZWxfdXNiYV91ZGMuYyAgICAgfCAxMCArKy0tLS0t
LS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jICAgICAgICAgICAgIHwgIDcg
KysrKystLQ0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L3VzYnN0cmluZy5jICAgICAgICAgICAgICB8
ICAyICstDQo+ICA4IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9u
cygtKQ0KPiANCj4gLS0NCj4gYmFsYmkNCg==

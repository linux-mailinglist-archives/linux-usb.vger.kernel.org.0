Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24458166118
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 16:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbgBTPhz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 10:37:55 -0500
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:38529
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728276AbgBTPhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Feb 2020 10:37:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYwbakfB8bbxdJ2/KvDR4So1KDExQIKikaUIkRRpHoQiF8zUbAK+Tk0vdQAYybP/19xsce24Z+rFZUdGR9Vz8NHGmzKcX9G0LUlLXwPn9HPgeKWv2OSpJPhLqsXAp/ux7NeG2BPXTKDvYMF78tBoREQtdzMKL8+k7Sr9UCcOHWHjaFDq6Rw9NUSTc0bElD62VRSGdCth9JWeIfyPtypl/XD4WudelYbjUeO58sTwgbQX0KXYEAjLhky5mR6aJBEK0C5QkYnb+WQ5Dt/IessyInQ3qe339Br0cAeD5Fk5p509NOERlAU43rbu5t0CnQDCDqFO1AgEXcIHbwrz60F58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SUEXNSYufZ9LCdYbdc3Eh7CxKqh1bHHzEr0wxO9g3c=;
 b=ba0B+XQXdRpDGhNqzlzp5b2+yUtkYzVNcbpTRDw8Na8KzNs1rmJ822SoVMcOaj0s+ft8S7XBdmlZcI9kP+G+OiWYaBcy6GmA8VwccdZIphffWZstOjM1rdchwhMZ3Qlu7P+KU5BOfxS38AQ7wzMnldl0d8VwOF43I9vJ35cHV090bdtvkHlFH6xHQ+PzVe+C2ikq0V7HAOuHDO5BpBloMtw5tr1WzghiMovxFR27creur46qNqs6dYIq3u29Rz7e2eYPtIFRIAHIkqak/gqBR4v8UORyD/zb39XKcberba0aKCdsAGasyGt3ykCqE87oNabrCZYQeP7FPLLK4XRCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SUEXNSYufZ9LCdYbdc3Eh7CxKqh1bHHzEr0wxO9g3c=;
 b=Q/iDf9aZ8co2sFD7KwAalMEBGoyVpgmui21c0W7OwLYslBgJR1NxFZBuhWnhNv6gtGGOjpdbbZaeWUYbIErLXLmOK1bbh3ti9bHWI61vMZeA8I/pWHpwXdTBbxC7mwV6XzAp9S7k8M4dbJcSfWxH4/8VLsla3/V6X4cPdcH0FP0=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6751.eurprd04.prod.outlook.com (20.179.235.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 20 Feb 2020 15:37:50 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c%4]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 15:37:50 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        Peter Chen <peter.chen@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] usb: host: xhci-plat: add XHCI_MISSING_CAS quirk
Thread-Topic: [PATCH] usb: host: xhci-plat: add XHCI_MISSING_CAS quirk
Thread-Index: AQHV50tVUicR6IQm20awkZ0QLiZyBagjlLUAgABiqACAAD3VMA==
Date:   Thu, 20 Feb 2020 15:37:49 +0000
Message-ID: <VE1PR04MB65282F4FFCFAF3D1F0C9825B89130@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200219173727.9882-1-martin.kepplinger@puri.sm>
 <VE1PR04MB65289878A84E662D6CCAF13089130@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <ddbb9543-f632-b1da-cbb8-d390fcd3b4f8@puri.sm>
In-Reply-To: <ddbb9543-f632-b1da-cbb8-d390fcd3b4f8@puri.sm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bad2266c-de21-49bc-4e4e-08d7b61ad7bf
x-ms-traffictypediagnostic: VE1PR04MB6751:|VE1PR04MB6751:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6751D8708CD0DD4FC191D0F689130@VE1PR04MB6751.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(199004)(189003)(64756008)(76116006)(86362001)(66556008)(66446008)(8676002)(33656002)(66946007)(7696005)(81156014)(66476007)(54906003)(110136005)(44832011)(81166006)(8936002)(6506007)(53546011)(52536014)(26005)(55016002)(9686003)(498600001)(71200400001)(45080400002)(186003)(5660300002)(2906002)(966005)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6751;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvixrwH0S6CQcaSd5igLe91E/Y3KNpM6Hy1C6Hy3fakqRN0PfRNLY2H9vM8YK9iFC9HzfoZCQhtCN/miifiEIOAwnkOam3twmUt2iLMzBa+9hl4QEjhO6ghkux37gQn5waAwdO5e5VFYni9FdCMQVcYS0O+Vldus3vAxtJtfkTdG8sjgyI0SxbfzDZ4pABxr6OuL4Dkh0Tsc4TbzEBMjpQt94uGBs3m3XVeyXi/ZkbVThpB3xWumobiLtNnmxofzvQX0A7mbfdAUG0sPQH6tzMaeot4BWnbrnJNRPHFdvBJ6iwPKmc0Wn57eI8N15b+yEoL7TTDGrVfcciNDmOyhOjOthbPz5wbJPctVGDY+1ghtRhDygpw6mDypCIKeRbg+3dlwHcWP+h54uXMWxK9VIffGipzadsvBVgn/lKGFUggkOHuzlsaC/Hn1xuDNrJzdu4XBo7r/IEmxGq47B+G/FWBJnzU0SP9TfxpvUXTmcGQu40Rdd/ErRDk0gcyGow1m+RUCMEvcSFPO8eYzSM32vA==
x-ms-exchange-antispam-messagedata: 5XtmQ+C0lSAqs/8MoUv+Zk939br9exH7AaqsfqSeIT9wBovylgZ3wn8n35WoqO1Zgzlx8xgYsn5sDD+U+2D8WKnMczLdwQBh4VyhOCVxNFkPBV7x2sUluLQizfKn3OF25+wW7GF1v6s4p2VirL+GFA==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad2266c-de21-49bc-4e4e-08d7b61ad7bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 15:37:50.0019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2kaFjkzMOHhJH2I1XNg1/8OxFxl+xQPsUT3l7wrjg+q/KewwuDoO7bwVVEjjr4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6751
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGluIEtlcHBsaW5n
ZXIgPG1hcnRpbi5rZXBwbGluZ2VyQHB1cmkuc20+DQo+IFNlbnQ6IDIwMjDE6jLUwjIwyNUgMTk6
NDQNCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBQZXRlciBDaGVuIDxwZXRlci5jaGVu
QG54cC5jb20+Ow0KPiBtYXRoaWFzLm55bWFuQGludGVsLmNvbQ0KPiBDYzogbGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEFuc29uIEh1
YW5nDQo+IDxhbnNvbi5odWFuZ0BueHAuY29tPjsgc2hhd25ndW9Aa2VybmVsLm9yZzsga2VybmVs
QHBlbmd1dHJvbml4LmRlDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogaG9zdDogeGhjaS1w
bGF0OiBhZGQgWEhDSV9NSVNTSU5HX0NBUyBxdWlyaw0KPiANCj4gT24gMjAuMDIuMjAgMDc6MzEs
IEp1biBMaSB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogTWFydGluIEtlcHBsaW5nZXIgPG1hcnRpbi5rZXBwbGluZ2VyQHB1cmkuc20+DQo+ID4+IFNl
bnQ6IDIwMjDE6jLUwjIwyNUgMTozNw0KPiA+PiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47
IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT47DQo+ID4+IG1hdGhpYXMubnltYW5AaW50
ZWwuY29tDQo+ID4+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgg
PGxpbnV4LWlteEBueHAuY29tPjsNCj4gPj4gQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5j
b20+OyBzaGF3bmd1b0BrZXJuZWwub3JnOw0KPiA+PiBrZXJuZWxAcGVuZ3V0cm9uaXguZGUNCj4g
Pj4gU3ViamVjdDogW1BBVENIXSB1c2I6IGhvc3Q6IHhoY2ktcGxhdDogYWRkIFhIQ0lfTUlTU0lO
R19DQVMgcXVpcmsNCj4gPj4NCj4gPj4gRnJvbTogTGkgSnVuIDxqdW4ubGlAbnhwLmNvbT4NCj4g
Pj4NCj4gPj4gaS5NWDhNUSBVU0IzIGhvc3QgbmVlZHMgWEhDSV9NSVNTSU5HX0NBUyBxdWlyayB0
byB3YXJtIHJlc2V0IHRoZSBwb3J0DQo+ID4+IHRvIGVudW0gdGhlDQo+ID4+IFVTQjMgZGV2aWNl
IHBsdWdnZWQgaW4gd2hpbGUgc3lzdGVtIHNsZWVwLCBhcyB0aGUgcG9ydCBzdGF0ZSBpcyBzdHVj
aw0KPiA+PiBpbiBwb2xsaW5nIG1vZGUgYWZ0ZXIgcmVzdW1lLg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiA+PiBBY2tlZC1ieTogUGV0ZXIgQ2hl
biA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiA+PiAtLS0NCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+
ID4+IEJlY2F1c2UgcmVzdW1lIGZyb20gUzMgc3VzcGVuZCBpcyBicm9rZW4gZm9yIG1lIG9uIGlt
eDhtcSwgSSBzdHVtYmxlZA0KPiA+PiB1cG9uIHRoaXMgcGF0Y2ggaW4gTlhQJ3MgbGludXggdHJl
ZS4gKFBsZWFzZSBub3RlIHRoYXQgSSdtIG5vdCB0aGUNCj4gPj4gYXV0aG9yIGFuZCBJJ3ZlIG5v
dCB5ZXQgcHV0IG15IFNvQiB0YWcgdW5kZXIgaXQpLiBUaGlzIGlzIGp1c3QgYQ0KPiA+PiBxdWVz
dGlvbjoNCj4gPj4NCj4gPj4gVGhpcyBwYXRjaCAoYW5kIHRoZSBkb2NzKSBjbGVhcmx5IGlzIG1p
c3NpbmcgaW4gbWFpbmxpbmUgTGludXgNCj4gPj4gYmVjYXVzZSB0aGUgaW14OG1xIGRldmljZXRy
ZWUgZGVzY3JpcHRpb24gaW5jbHVkZXMgaXQgKHdoaWNoIGRvZXMgbm90aGluZyBub3cpLg0KPiA+
Pg0KPiA+PiBJJ3ZlIHRlc3RlZCB0aGlzIGFuZCB0aGlzIHBhcnRpY3VsYXIgYWRkaXRpb24gZG9l
c24ndCBmaXggbXkgcHJvYmxlbToNCj4gPj4NCj4gPj4gWyAgIDg0LjI1NzUzOF0gaW14OG1xLXVz
Yi1waHkgMzgxZjAwNDAudXNiLXBoeTogYnVzIHJlc3VtZQ0KPiA+PiBbICAgODQuMjYzMTk1XSBp
bXg4bXEtdXNiLXBoeSAzODJmMDA0MC51c2ItcGh5OiBidXMgcmVzdW1lDQo+ID4+IFsgICA4NC4y
Njg4OThdIGR3YzMgMzgxMDAwMDAudXNiOiBkcml2ZXIgcmVzdW1lDQo+ID4+DQo+ID4+IGR1cmlu
ZyByZXN1bWUgZnJvbSBTMyBzdXNwZW5kLCBoZXJlIGl0IHN0aWxsIGhhbmdzLg0KPiA+DQo+ID4g
SXMgeW91ciBwcm9ibGVtIGEgc3lzdGVtIGhhbmc/IElmIHllcywgdGhpcyBtYXkgYW5vdGhlciBp
c3N1ZSwgd2hlcmUNCj4gPiB0aGUgaGFuZyBoYXBwZW5zPyBkd2MzX3Jlc3VtZV9jb21tb24oKT8N
Cj4gDQo+IGV4YWN0bHkhIEkgZm9sbG93ZWQgdG8gdGhlIHBvaW50IGl0IGhhbmdzIG9uY2UgYWdh
aW4gYW5kIGl0J3MNCj4gDQo+IGR3YzNfY29yZV9pbml0KCkgY2FsbGVkIGZyb20gZHdjM19yZXN1
bWVfY29tbW9uKCkncyAiT1RHIiBjYXNlLg0KPiANCj4gU3BlY2lmaWNhbGx5LCBkd2MzX3dyaXRl
bCgpIGlzIHdoYXQgSSBkb24ndCBnZXQgcGFzdDoNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZWxpeGlyLmJvb3RsDQo+
IGluLmNvbSUyRmxpbnV4JTJGdjUuNi1yYzIlMkZzb3VyY2UlMkZkcml2ZXJzJTJGdXNiJTJGZHdj
MyUyRmNvcmUuYyUyM0w5MzQmYW1wOw0KPiBkYXRhPTAyJTdDMDElN0NqdW4ubGklNDBueHAuY29t
JTdDMTMwY2QyOTg3NWM0NDc5MmQxYTkwOGQ3YjVmYTI1MTYlN0M2ODZlYTFkM2INCj4gYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzE3Nzk1ODI4NDY5NjA0MSZhbXA7c2RhdGE9
bXFoOU1INkVTTFZ4S3ZXDQo+IHZ2TXE0dnd0MmRjVHV2Tm9wZ0dWZFhFYmJNd2slM0QmYW1wO3Jl
c2VydmVkPTANCg0KU28gd2hpbGUgZHdjMyByZXN1bWUsIHRoZSBmaXJzdCByZWdpc3RlciBhY2Nl
c3MgY2F1c2UgaGFuZy4NCkxvb2tzIGxpa2Ugc29tZSByZXF1aXJlZCBjbG9ja3Mgb3IgcG93ZXIg
ZG9tYWluIG9mIFVTQjAgaXMgbm90IG9uLg0KIA0KPiANCj4gZG8geW91IGhhdmUgYW4gaWRlYSB3
aHkgdGhpcyB3cml0ZWwoKSBoYW5ncz8NCg0KSSBuZXZlciBlbmNvdW50ZXIgc3VjaCBoYW5nIG9u
IG15IGlNWDhNUSBFVksgYm9hcmQNCnVzaW5nIHVwc3RyZWFtIGtlcm5lbCg1LngpICsgY2hhbmdl
cyBvZiBlbmFibGUgVVNCMCBwb3J0LA0KYnV0IEkgZGlkbid0IHRyeSBsYXRlc3QgNS42IGtlcm5l
bC4NCkkgd2lsbCBlbmFibGUgdGhlIGZpcnN0IHBvcnQgYmFzZWQgb24gTGludXgtbmV4dCB0byBn
aXZlIGENCnRyeSBvbiBteSBOWFAgaU1YOE1RIEVWSyBib2FyZCwgZG8geW91IHRoaW5rIEkgY2Fu
IHJlcHJvZHVjZQ0KeW91ciBwcm9ibGVtPw0KDQpMaSBKdW4NCj4gDQo+ID4NCj4gPiBUaGUgcXVl
c3Rpb24gcGF0Y2ggaXMgdG8gZ2l2ZSBhIHdhcm0gcmVzZXQgZm9yIGNvbm5lY3RlZCBVU0IgZGV2
aWNlIGlmDQo+ID4gdGhlIGxpbmsgc3RhdGUgaXMgbm90IGNvbm5lY3QvQ0FTIGFmdGVyIHN5c3Rl
bSByZXN1bWUsIG90aGVyd2lzZSBob3N0DQo+ID4gd2lsbCB3YWl0IDJzIGZvciBkZXZpY2UgYXBw
ZWFyOg0KPiA+DQo+ID4gWyAgIDQ0LjgzNDgzMV0gdXNiIDItMTogV2FpdGVkIDIwMDBtcyBmb3Ig
Q09OTkVDVA0KPiA+IC4uLg0KPiA+IFsgICA0NS4wNTU3MThdIFBNOiByZXN1bWUgZGV2aWNlcyB0
b29rIDMuMTMyIHNlY29uZHMNCj4gPg0KPiA+IEkgd2lsbCBwb3N0IHRoaXMgcGF0Y2ggYW5kIGRv
Yyh0byBiZSB1cGRhdGVkKSB0byB1cHN0cmVhbSBsYXRlci4NCj4gPg0KPiANCj4gb2ssIGdvb2Qs
IHRoYW5rcywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcnRpbg0K
DQo=

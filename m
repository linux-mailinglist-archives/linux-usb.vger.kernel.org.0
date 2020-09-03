Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B4225BBE5
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 09:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgICHqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 03:46:19 -0400
Received: from mail-eopbgr60046.outbound.protection.outlook.com ([40.107.6.46]:45529
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726814AbgICHqT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 03:46:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRVpjzbCn0UkVOYzZA8vkojoLFyT34T25B6K9enqP55aX/MmMqj61y4k1Xrf32LjAJcmQO0QIOyAa2RYD6Vhgbc3EyJoNwOVwpSEugQtZhpLDA9ckr9FsgBOliiECxlzfl46ZlMBzK9mvof53fuQCtBqhNQzbYvoAjaMOhgFq4lEOWlb0aZcq0txXNiRRgczkXHrgQNdlDAAI4OLpoY9a/dA3eMbI2NgxmJvTYKvP0fMcLV7xNy98VVsv+MpyPzYCXF6dFUWa+gBkzO8Zt2Js1SuE2L/lyN8OLitk8PUboaQqufW6l2dWp5Tr5KD77uIpm44UQ393tG82IYlNIFNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obvEj1rjpKDljls61/7IkrkvmhZt3lxO4Hii6tnThyg=;
 b=LJqQ8Co6t4h8WIB9snMkXD6v3jh0hvpc23z3elUEAtF7angPZ5l/L43jTqwDWNtamnkuZUeLcvJ7IffTSslrfYPtRlmrOzMX3QTHXae4MwSvNJvJj996G0y3hwiiHeqoVk753gtJEjr1tMm6piuaQ2c32rhP2tps6Cv5R2/8wimFqHVvU5kYYX/O/xZJuk0N/WihZwf3M7Aj/ZVTOYvWzQ28oLeCXrpbPURxhJg8r2kdMFtdn3CbOzdaOOMO1AvmPWKAj7pCLm5ScHeiFZsgF9mIyffFNvhkSDbSiUYYRSH7cQ4Smtoyni1MNK30pvaDUjHwDljJgXPcElG4p7PCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obvEj1rjpKDljls61/7IkrkvmhZt3lxO4Hii6tnThyg=;
 b=b+eXf/I82e/Aob9YF9pI8spC/BapaHA/JhO9+rbgmIZoe/JQrTp6A7irLW8WHi6s0t4ZEEhdYNYidVqSaz9OQm/XvdDXZynGiOYGb8kZbB9yQKIIgeKn0+JCgcIyaXKHhF3NsLpOwGbPQ0Martc/aVyx0udIWDzfd38yERkdrgs=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4063.eurprd04.prod.outlook.com (2603:10a6:803:43::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 07:46:15 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3348.015; Thu, 3 Sep 2020
 07:46:15 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Topic: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Index: AQHWW240LsQE47DpHka0ISI6aMQrkKk1+RLggAZonYCAAOs9cIAVLJ6AgALqhdCAADHCAIAANZjwgAEEFICAAAJf8A==
Date:   Thu, 3 Sep 2020 07:46:14 +0000
Message-ID: <VE1PR04MB65284B29C99AE18505D29ACC892C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
 <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
 <c6c4f598-ff8a-8b51-d87c-c5d20f4421a4@linux.intel.com>
 <VE1PR04MB65289D522279DD1267A1FFF5895C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <5257ec39-9f59-58fe-661f-a1cd69955f1e@linux.intel.com>
 <VE1PR04MB6528936627B6478BE76813D6892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <aa359d28-c53f-37b0-6e4f-19a312fb6293@linux.intel.com>
 <VE1PR04MB65285CCF5DDF72D2F990B7DB892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <ed0df478-f17e-e276-55fe-c712118e9898@linux.intel.com>
In-Reply-To: <ed0df478-f17e-e276-55fe-c712118e9898@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7220d9e7-579d-47ca-122b-08d84fdd6f96
x-ms-traffictypediagnostic: VI1PR04MB4063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4063EDC9C6AA86F94430D0F1892C0@VI1PR04MB4063.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WUVufwROu4OCTLkC+ByEkzm37EifDN93jgjc+UtyMpiAsQ21tJMJf/61KCE6rTxTTWHFSIelS7qKJ31dZd6/te881VizAaSZ45X5bwb45RKelGPLHgdbiBqk6PPYJvaI2U6qU8xs4xTmprCaNanmQkWHuWzehBxRcWnABufTw/YU5vWSKVy8D4SaAWEeXMJJUt5Pjam0kIOzuBXHFBvt8BXI7Z6PCJ8OENDAABP60nOx8cVD0pyTTrjgWwfAYIvsvSp0CrrzR8YUjJm22Nx+uI7+yYa+ZtN4At5OlWj4pMxIS2xCCh/clp5ZCcBPViu02FETza4bypZxwyBmR7Re+K2+QGMYHBEjGfQf56nI9CbYnz08sN+0sjwW891ZSUIJikX1g1e8M7Rz1LH77hP8+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(186003)(478600001)(26005)(83080400001)(45080400002)(6506007)(4326008)(86362001)(966005)(33656002)(83380400001)(7696005)(54906003)(64756008)(71200400001)(2906002)(9686003)(5660300002)(316002)(76116006)(8936002)(66446008)(55016002)(66476007)(52536014)(110136005)(66946007)(8676002)(66556008)(44832011)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: viQENlj3NYzo/zNm3m6+ZYls18G6NCPggAvCKGzMej/7W5PDW/nO+OhcibhiT/UydFRP2NyEnzErCQ2W2ca6cUvqwum258d9l0TVtBr4CO5V6MZZrnOEmx1Bn5yckD5qBOoBG/GSTIzo1DLPWlXBZyUL8+OI0gMjI3Pnv4/m+7REW8r8t60mRoo4Ki1NLjM9GT8DCzVdfWtDG7ygFrjswafdBhS4K/pUvFPZrBwQfCNss6Q8gUTR1cFjwAuVZ6OaXer/P+ekVl6ZfW3hxlFjG7c+Jf9gAAQ5I5BsbrMOzg4eP8UGx4CYgTpAr5rGpvn5pjhngC/7i1jd/7qjpt3eoKI2PlDEgutGBdS6qjx+SS0GdAwrEdrtzorjdB6y+y3WHTNrdyLEAvRoZSseJfUyPfwPW4FaTVXs/TX4R4XRZb5Qar1T5yUZeh3VmXUQkJJIrsXi1ALZ/L3LONN8VldocwyzSuyiIOMX8ZlqjdHzoJlJmfus8gE4aTDOCYzGOrlKLCz7+qa6tzFJqRkxE0+SF+fDRneqJbmCs5bHrjGdJYW5jYCIs7DA1CPsrrach94DIaf3i/TBQRcup6syRVJo5wqBQ3TUJvI9QdTdCbEIGcpslQFlKr7aPDD3MlcyG7nqbBKj+L9ThG2twj1Qh/LH0w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7220d9e7-579d-47ca-122b-08d84fdd6f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 07:46:15.0118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 226B/ZP3Tdm2sYd1gx8ynBonFYNx53n+aAGcYKo3h0cf/N6PGDdH8SyJO0/gDx3G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4063
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpYXMgTnltYW4gPG1h
dGhpYXMubnltYW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVy
IDMsIDIwMjAgMzoyNCBQTQ0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47IG1hdGhpYXMu
bnltYW5AaW50ZWwuY29tDQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbGludXgt
dXNiQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gdXNiOiB4aGNpOiBhZGQgZGVidWdmcyBzdXBwb3J0
IGZvciBlcCB3aXRoIHN0cmVhbQ0KPiANCj4gPj4gSSB0aGluayB0aGlzIGRlYnVnZnMgY29kZSBp
cyBqdXN0IGNhbGxlZCB0b28gZWFybHkuIEl0IHNob3VsZG4ndCBuZWVkDQo+ID4+IHRvIGNoZWNr
IG5ld19yaW5nIHBvaW50ZXIgYXQgYWxsLg0KPiA+Pg0KPiA+PiBJIHdyb3RlIGEgZml4IHRoYXQg
Y2hhbmdlcyB0aGUgb3JkZXIgYW5kIG1ha2VzIHN1cmUgZW5kcG9pbnQgaXMNCj4gPj4gZW5hYmxl
ZCBhbmQgcmluZyBwb2ludGVyIGlzIHNldCBjb3JyZWN0bHkgYmVmb3JlIHdlIGNhbGwNCj4gPj4g
eGhjaV9kZWJ1Z2ZzX2NyZWF0ZV9lbmRwb2ludCgpDQo+ID4+DQo+ID4+IGh0dHBzOi8vZXVyMDEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdA0K
PiA+PiAua2VybmVsLm8NCj4gPj4gcmclMkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdp
dCUyRm1ueW1hbiUyRnhoY2kuZ2l0JTJGY29tbWl0JTJGDQo+ID4+ICUzRmglM0Rmbw0KPiA+PiBy
LXVzYi1saW51cyUyNmlkJTNEY2Y5OWFlZjU2MjRhNTkyZmQ0ZjMzNzRjNzA2MGJmYTFhNjVmMTVk
ZiZhbXA7ZGF0YT0NCj4gPj4gMDIlN0MwMSU3DQo+ID4+IENqdW4ubGklNDBueHAuY29tJTdDNzNl
NDY2M2E2ZjY2NDFmYmI4YjMwOGQ4NGYzZDAyMWElN0M2ODZlYTFkM2JjMmI0Yw0KPiA+PiA2ZmE5
MmNkOTkNCj4gPj4gYzVjMzAxNjM1JTdDMCU3QzAlN0M2MzczNDY0NzA4MDM5MjI4OTUmYW1wO3Nk
YXRhPWk0RGZDVzhFVlVTQVduemI4UWw0DQo+ID4+IGpQakFPRDV3cA0KPiA+PiB0ZmJhTXJPOHZL
dnREYyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+DQo+ID4gVGhpcyBpcyBhIGdvb2QgcGxhY2UgZm9y
IG5vbi16ZXJvIEVwcywgYnV0IGRvZXMgbm90IGNvdmVyIGVwMC4NCj4gPg0KPiANCj4gZXAwIGlz
IHNwZWNpYWwsIGl0J3Mgbm90IHRvdWNoZWQgaW4gdGhlc2UgYWRkL2Ryb3AgZW5kcG9pbnQgb3Ig
Y2hlY2sgYmFuZHdpZHRoDQo+IGZ1bmN0aW9ucy4NCj4gDQo+IGVwMCByaW5nIGlzIGFsbG9jYXRl
ZCBlYXJsaWVyIGR1cmluZyBzbG90IGNyZWF0aW9uIGluDQo+IHhoY2lfYWxsb2NfdmlydF9kZXZp
Y2UoKQ0KPiAgIC4uLg0KPiAgIC8qIEFsbG9jYXRlIGVuZHBvaW50IDAgcmluZyAqLw0KPiAgIGRl
di0+ZXBzWzBdLnJpbmcgPSB4aGNpX3JpbmdfYWxsb2MoeGhjaSwgMiwgMSwgVFlQRV9DVFJMLCAw
LCBmbGFncyk7DQo+IA0KPiBhbmQgZm9yIGRlYnVnZnMgZXAwMCBpcyBhZGRlZCBtYW51YWxseSB0
b2dldGhlciB3aXRoIHRoZSBzbG90DQo+IHhoY2lfZGVidWdmc19jcmVhdGVfc2xvdCgpDQo+ICAg
Li4uDQo+ICAgeGhjaV9kZWJ1Z2ZzX2NyZWF0ZV9yaW5nX2Rpcih4aGNpLCAmZGV2LT5lcHNbMF0u
cmluZywgImVwMDAiLCBwcml2LT5yb290KTsNCj4gDQo+IFNvIHJlZ2FyZGluZyBlcDAgdGhlIGNo
YW5nZSBzaG91bGQgYmUgb2suDQoNClNvcnJ5LCBJIGZvcmdvdCBkZWJ1Z2ZzIG9mIGVwMCBpcyBj
cmVhdGVkIHZpYSB4aGNpX2RlYnVnZnNfY3JlYXRlX3Nsb3QoKS4NCg0KVGhlbiBJIHRoaW5rIHlv
dXIgY2hhbmdlIGlzIE9LLCBhbHNvIEkgZ2F2ZSBhIHRlc3Qgd2l0aCBteSBzdHJlYW0vVUFTIGRl
dmljZQ0Kb24gdG9wIG9mIHlvdXIgcGF0Y2ggYW5kIGl0IGNhbiB3b3JrIGZpbmUuDQoNCkRvIHlv
dSBuZWVkIEkgcG9zdCBhIG5ldyB2ZXJzaW9uIG9mIG15IHBhdGNoKHRvIHJlbW92ZSB0b3VjaCBv
ZiAubmV3X3JpbmcpPw0KDQpUaGFua3MNCkxpIEp1bg0KPiANCj4gLU1hdGhpYXMNCg==

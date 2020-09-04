Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF1325D591
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 12:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgIDKBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 06:01:41 -0400
Received: from mail-eopbgr10089.outbound.protection.outlook.com ([40.107.1.89]:4164
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726114AbgIDKBd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Sep 2020 06:01:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj+v+A4u5t8lo1n0OACQrP62hJRxtmOXFsi+BcZUFCf2cRKRGYdiXhIbOkiVcmj+m40p6yMWTyqI4j+mPOymU3koh/P6OxFN/vAQ/5BYTMOFu3idmimHd58Vvx/3xDYZ3Hfz5qp/PJTVXou5j6IbnYL+lQ16iJcZ2ljj0aWmjEdthXzv+TfhqqookroQ6qVPvlxQaYrDdnZ70PLcFb4RYOO4RVcJVrWQ2oWJUZ0LmxJzDqom9018nJpnEkkqbmPMwT+ix3K7yK8lJaOljqpawVgsUkWNb6T0Wp/jtTbUn0URmqxfeBvhhJPRoSr2+wlanbbju6cglQe1bg6oo8BFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/N6PIQyGq4QsnGQ8mO/xSpP6F9iuz+oYBYuqxUMA50=;
 b=iK5wk1Bc6cVskS5R+AUF01PnALrEVqhfBNG5U7rJ8MJtNFReiKPll3GMgTs0wIoqebVAR5UkEbonZv6ruX/2kHOEGmVeMKxo14WRW8ILRQ1WnMP/8Ga73dvKYd4j2sKjes4gd+ifHILqHiGxj2ANp7eVRDqFg2pSVyPMI4ZGBTJoCDw9iCQi87KUX8h202cXxctBA4nIlHKRKHCJdtuCKr3PORHXTUlxZ3BzSxAcCUmMhDEmCcHzG7OHh2U8jGvACoOknzNl9Vh+eLSqgvaLEvbwCqoE/UxHILgfsVBvjjUJ6OlQ3MESQo+Hpueg6KNRTCZbjEz4y8ggn1P+ugJKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/N6PIQyGq4QsnGQ8mO/xSpP6F9iuz+oYBYuqxUMA50=;
 b=fK0HjaSTQ7XDhrxA46haD0M9j1JpuhcmL8rDsBOLzaLn82cSO7JZ7qgQ729cyQlc1t4lK+g6W0Z4qcx7GxaJoZNRYGfaZZVaK0D5oghs9L9Hp5/KZ9mLh5Z/3kPzCHYN81pyH69OdpEozd7Q5osPBwp/I382olC6EKblxYcwI28=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6719.eurprd04.prod.outlook.com (2603:10a6:803:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 10:01:28 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3348.017; Fri, 4 Sep 2020
 10:01:28 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Topic: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Index: AQHWW240LsQE47DpHka0ISI6aMQrkKk1+RLggAZonYCAAOs9cIAVLJ6AgALqhdCAADHCAIAANZjwgAEEFICAAAJf8IAAI0aAgAGDyhA=
Date:   Fri, 4 Sep 2020 10:01:27 +0000
Message-ID: <VE1PR04MB6528004CF712BEA3B8A626D6892D0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
 <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
 <c6c4f598-ff8a-8b51-d87c-c5d20f4421a4@linux.intel.com>
 <VE1PR04MB65289D522279DD1267A1FFF5895C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <5257ec39-9f59-58fe-661f-a1cd69955f1e@linux.intel.com>
 <VE1PR04MB6528936627B6478BE76813D6892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <aa359d28-c53f-37b0-6e4f-19a312fb6293@linux.intel.com>
 <VE1PR04MB65285CCF5DDF72D2F990B7DB892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <ed0df478-f17e-e276-55fe-c712118e9898@linux.intel.com>
 <VE1PR04MB65284B29C99AE18505D29ACC892C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <bb98c950-6a38-bb29-7443-47eaed424cda@linux.intel.com>
In-Reply-To: <bb98c950-6a38-bb29-7443-47eaed424cda@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 157aa535-cc1a-47db-72be-08d850b97dc4
x-ms-traffictypediagnostic: VE1PR04MB6719:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6719AA79261ACECEFBDC1E19892D0@VE1PR04MB6719.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QbWzK23Zw7diRRd7EdeI5/ZJmUnqyPtuPovwYcv38BvLEomAChZtEbXm2uIclKq0tKRSSrVYbS/US/yPr94BoHFifxTikYT42gomij+Jk3UkXPmztnIXa1iM8LA5EPmVNbgz4sYeznCOyyDwgLWG7kHWn0ewbTncT3rmnKx3kH1AY1ItbLRY+1qrhSKuOzJkPx6uoxOxqshuOf2E0IthQXs9zjj+1YQ1KKLVZYdbIC95FPFIXuVhAjv+8W1YXkkUGBx++TIHdsVqgUhXunVnEWuXiHCqk4mh9gp+xNfQjCYUgEL9ucqtb5zJgpRAJM76PFQ30L25XEoy7ACAUbV/8nzd8v2mDmrm4YS5w6KE5iTmCca/fupGk+y5cvMpVJVeUa4SRVuS4H2OA+pzFBaUog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(5660300002)(86362001)(9686003)(53546011)(966005)(6506007)(55016002)(186003)(478600001)(4326008)(26005)(2906002)(316002)(8936002)(83080400001)(52536014)(45080400002)(66946007)(7696005)(76116006)(8676002)(71200400001)(44832011)(66476007)(83380400001)(110136005)(33656002)(66446008)(66556008)(64756008)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FXdFdwW07w/so8nlvgJ0Khs5oTlOQjIT8I0VeZ3wM04QLjEz740gvLjRO/pBqYi8Oup4TP1zwijwKMHJu57rd3u+yCpYki4vaO9Hd6bTf2hOAmyectP/onw/ZdlgMuVmZYFxHRFAYpAjyAb7a4v1UaFXk/rNcO8BKfq7DmrJayHBdTQzBaJlIEX2y18TKB03TI7aV6jI8h6Y7pXXSfKQmLHcEyN8yuvBiAGTjKYXJE1Ay3pgNdJdHN/9oIxCWhpaVfBdpOsMi27VvKTNkU8IMDmy0dRGFwUPZ0irr28Sk72OME0JfCqzCisKnJnrdGTxwqRW9AQyZH9bfejZiP3Gb9PFdFW5EaHPJZAEPronch/CRQ8c7VtG+LbqdDk7Lv6c/ro75bAFGfvRzXl6c9qlkEmbBmNTDMw0/cZOWuw+5RkAOdGACyFxvXWL9TDWduUcCGv6UtvlXz7xEDXdNPqPdnCpTtQxn6H58h7AD15JrHji3m3ZwSp5N7S0t0susZoClr8BY5FPmrmu+SSY+Cw8LpPv1J5fWzfxVbVNBB3QtJsTtCTjfJdI7huJDmyfwUijl0/NjEx8GLehk9jZ1GAF2BRD6MUQXsGSTEKJopwcAxrHAF+za6rqGcz3Y7A4rxaP9dZx0GzGaVHOD0LMY1poQA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157aa535-cc1a-47db-72be-08d850b97dc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 10:01:28.0574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhMasilLRLi30AEm7JOZxtJE6oGPiggljqHuAXbKloUHO8ukGWTuszwUwQHb4m2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6719
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlhcyBOeW1hbiA8
bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1i
ZXIgMywgMjAyMCA1OjM5IFBNDQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgbWF0aGlh
cy5ueW1hbkBpbnRlbC5jb20NCj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgNCj4gPGxpbnV4LWlteEBueHAuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB1c2I6IHhoY2k6IGFkZCBkZWJ1Z2ZzIHN1cHBv
cnQgZm9yIGVwIHdpdGggc3RyZWFtDQo+IA0KPiBPbiAzLjkuMjAyMCAxMC40NiwgSnVuIExpIHdy
b3RlOg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IE1h
dGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AbGludXguaW50ZWwuY29tPg0KPiA+PiBTZW50OiBU
aHVyc2RheSwgU2VwdGVtYmVyIDMsIDIwMjAgMzoyNCBQTQ0KPiA+PiBUbzogSnVuIExpIDxqdW4u
bGlAbnhwLmNvbT47IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+ID4+IENjOiBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gZGwtbGlu
dXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0g
dXNiOiB4aGNpOiBhZGQgZGVidWdmcyBzdXBwb3J0IGZvciBlcCB3aXRoDQo+ID4+IHN0cmVhbQ0K
PiA+Pg0KPiA+Pj4+IEkgdGhpbmsgdGhpcyBkZWJ1Z2ZzIGNvZGUgaXMganVzdCBjYWxsZWQgdG9v
IGVhcmx5LiBJdCBzaG91bGRuJ3QNCj4gPj4+PiBuZWVkIHRvIGNoZWNrIG5ld19yaW5nIHBvaW50
ZXIgYXQgYWxsLg0KPiA+Pj4+DQo+ID4+Pj4gSSB3cm90ZSBhIGZpeCB0aGF0IGNoYW5nZXMgdGhl
IG9yZGVyIGFuZCBtYWtlcyBzdXJlIGVuZHBvaW50IGlzDQo+ID4+Pj4gZW5hYmxlZCBhbmQgcmlu
ZyBwb2ludGVyIGlzIHNldCBjb3JyZWN0bHkgYmVmb3JlIHdlIGNhbGwNCj4gPj4+PiB4aGNpX2Rl
YnVnZnNfY3JlYXRlX2VuZHBvaW50KCkNCj4gPj4+Pg0KPiA+Pj4+IGh0dHBzOi8vZXVyMDEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmcNCj4gPj4+
PiBpdA0KPiA+Pj4+IC5rZXJuZWwubw0KPiA+Pj4+IHJnJTJGcHViJTJGc2NtJTJGbGludXglMkZr
ZXJuZWwlMkZnaXQlMkZtbnltYW4lMkZ4aGNpLmdpdCUyRmNvbW1pdCUNCj4gPj4+PiAyRg0KPiA+
Pj4+ICUzRmglM0Rmbw0KPiA+Pj4+IHItdXNiLWxpbnVzJTI2aWQlM0RjZjk5YWVmNTYyNGE1OTJm
ZDRmMzM3NGM3MDYwYmZhMWE2NWYxNWRmJmFtcDtkYXQNCj4gPj4+PiBhPQ0KPiA+Pj4+IDAyJTdD
MDElNw0KPiA+Pj4+IENqdW4ubGklNDBueHAuY29tJTdDNzNlNDY2M2E2ZjY2NDFmYmI4YjMwOGQ4
NGYzZDAyMWElN0M2ODZlYTFkM2JjMmINCj4gPj4+PiA0Yw0KPiA+Pj4+IDZmYTkyY2Q5OQ0KPiA+
Pj4+IGM1YzMwMTYzNSU3QzAlN0MwJTdDNjM3MzQ2NDcwODAzOTIyODk1JmFtcDtzZGF0YT1pNERm
Q1c4RVZVU0FXbnpiOFENCj4gPj4+PiBsNA0KPiA+Pj4+IGpQakFPRDV3cA0KPiA+Pj4+IHRmYmFN
ck84dkt2dERjJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4+Pg0KPiA+Pj4gVGhpcyBpcyBhIGdvb2Qg
cGxhY2UgZm9yIG5vbi16ZXJvIEVwcywgYnV0IGRvZXMgbm90IGNvdmVyIGVwMC4NCj4gPj4+DQo+
ID4+DQo+ID4+IGVwMCBpcyBzcGVjaWFsLCBpdCdzIG5vdCB0b3VjaGVkIGluIHRoZXNlIGFkZC9k
cm9wIGVuZHBvaW50IG9yIGNoZWNrDQo+ID4+IGJhbmR3aWR0aCBmdW5jdGlvbnMuDQo+ID4+DQo+
ID4+IGVwMCByaW5nIGlzIGFsbG9jYXRlZCBlYXJsaWVyIGR1cmluZyBzbG90IGNyZWF0aW9uIGlu
DQo+ID4+IHhoY2lfYWxsb2NfdmlydF9kZXZpY2UoKQ0KPiA+PiAgIC4uLg0KPiA+PiAgIC8qIEFs
bG9jYXRlIGVuZHBvaW50IDAgcmluZyAqLw0KPiA+PiAgIGRldi0+ZXBzWzBdLnJpbmcgPSB4aGNp
X3JpbmdfYWxsb2MoeGhjaSwgMiwgMSwgVFlQRV9DVFJMLCAwLA0KPiA+PiBmbGFncyk7DQo+ID4+
DQo+ID4+IGFuZCBmb3IgZGVidWdmcyBlcDAwIGlzIGFkZGVkIG1hbnVhbGx5IHRvZ2V0aGVyIHdp
dGggdGhlIHNsb3QNCj4gPj4geGhjaV9kZWJ1Z2ZzX2NyZWF0ZV9zbG90KCkNCj4gPj4gICAuLi4N
Cj4gPj4gICB4aGNpX2RlYnVnZnNfY3JlYXRlX3JpbmdfZGlyKHhoY2ksICZkZXYtPmVwc1swXS5y
aW5nLCAiZXAwMCIsDQo+ID4+IHByaXYtPnJvb3QpOw0KPiA+Pg0KPiA+PiBTbyByZWdhcmRpbmcg
ZXAwIHRoZSBjaGFuZ2Ugc2hvdWxkIGJlIG9rLg0KPiA+DQo+ID4gU29ycnksIEkgZm9yZ290IGRl
YnVnZnMgb2YgZXAwIGlzIGNyZWF0ZWQgdmlhIHhoY2lfZGVidWdmc19jcmVhdGVfc2xvdCgpLg0K
PiA+DQo+ID4gVGhlbiBJIHRoaW5rIHlvdXIgY2hhbmdlIGlzIE9LLCBhbHNvIEkgZ2F2ZSBhIHRl
c3Qgd2l0aCBteSBzdHJlYW0vVUFTDQo+ID4gZGV2aWNlIG9uIHRvcCBvZiB5b3VyIHBhdGNoIGFu
ZCBpdCBjYW4gd29yayBmaW5lLg0KPiA+DQo+ID4gRG8geW91IG5lZWQgSSBwb3N0IGEgbmV3IHZl
cnNpb24gb2YgbXkgcGF0Y2godG8gcmVtb3ZlIHRvdWNoIG9mIC5uZXdfcmluZyk/DQo+IA0KPiBJ
ZiB5b3UgY291bGQgeWVzLCBhbmQgYWxzbyBjaGFuZ2UgdG8gYSBkb3VibGUgcG9pbnRlcjoNCj4g
DQo+ICBzdHJ1Y3QgeGhjaV9lcF9wcml2IHsNCj4gCS4uLg0KPiArCXN0cnVjdCB4aGNpX3JpbmcJ
KipzaG93X3Jpbmc7DQoNCldpdGggY3VycmVudDogc3RydWN0IHhoY2lfcmluZwkqc2hvd19yaW5n
Ow0KQXMgSSB1c2Ugb25lIHRyYiBmaWxlIHRvIHNob3cgZGlmZmVyZW50IHRyYiByaW5ncyBmb3Ig
b25lIEVQLCBzbyBJIG5lZWQgZ2V0DQp0aGUgYWRkciBvZiB0cmIgcmluZyBwb2ludGVkIGJ5IHNo
b3dfcmluZyh3aGljaCBjYW4gYmUgdXBkYXRlZCkuDQoNCklmIEkgY2hhbmdlIGl0IHRvIGJlICoq
c2hvd19yaW5nLCB0aGVuIEkgYW0gcGFzc2luZyB0aGUgYWRkciBvZiBkZXYtPmVwc1tpXS5yaW5n
DQp0byBkZWJ1Z2ZzIHNvIEkgY2FuJ3QgdXNlIHNob3dfcmluZydzIHVwZGF0ZSB2YWx1ZSB3aGVu
IHNob3cgdHJiLCBtYWtlcyBtZQ0Kbm90IGVhc3kgdG8gZ2V0IHRoZSBhZGRyIG9mIHRhcmdldCB0
cmIgcmluZy4NCg0KVGhhbmtzDQpMaSBKdW4NCg0KPiAgfTsNCj4gDQo+IEFuZCBtb2RpZnkgb3Ro
ZXIgcGxhY2VzIHRoaXMgY2hhbmdlIGFmZmVjdHMsIHN1Y2ggYXM6DQo+IGVwcml2LT5zaG93X3Jp
bmcgPSAmZGV2LT5lcHNbZXBfaW5kZXhdLnJpbmc7DQo+IA0KPiAtTWF0aGlhcw0K

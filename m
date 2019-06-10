Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128743BAB0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 19:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388571AbfFJRND (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 13:13:03 -0400
Received: from mail-eopbgr50054.outbound.protection.outlook.com ([40.107.5.54]:5262
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387496AbfFJRNC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 13:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NaBGDUmAcv19IfF1PCBap9ebj5FYYcci2emYxcYrBM=;
 b=aj7ybnHMdjDW6j9T0cgtl61oUndkckENFZLO5I5o4OjvOEvjUelx+OTxCn96OzieHnmRemaj5OGGlzPtn1ChAJoE8tX+8gZI1LnbG/6vhWnAOkZur+U+F7/yRYOnZy5JZdLBxXpXm3IgC8ywcIR/ZVMJYVKyjg0gDEpTGmU1VJU=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6719.eurprd04.prod.outlook.com (20.179.235.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 17:12:59 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::9e6:e136:4c09:fe67]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::9e6:e136:4c09:fe67%5]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 17:12:59 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ran Wang <ran.wang_1@nxp.com>
Subject: RE: fsl_udc status?
Thread-Topic: fsl_udc status?
Thread-Index: AQHVH2FeViVekb5FTkyBYafYtN/FkaaVHuBQ
Date:   Mon, 10 Jun 2019 17:12:59 +0000
Message-ID: <VE1PR04MB6687C0AD101BF0747EB0077D8F130@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
In-Reply-To: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ae9d6b4-1de5-45bc-8dd7-08d6edc6e37c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6719;
x-ms-traffictypediagnostic: VE1PR04MB6719:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VE1PR04MB6719F2E58BE4D36AFDBF772B8F130@VE1PR04MB6719.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(13464003)(199004)(6116002)(4744005)(52536014)(33656002)(66066001)(7736002)(5660300002)(25786009)(11346002)(74316002)(3846002)(53546011)(316002)(7116003)(99286004)(476003)(6436002)(6506007)(186003)(86362001)(14454004)(7696005)(229853002)(446003)(76176011)(2501003)(26005)(68736007)(102836004)(66556008)(2906002)(66446008)(66476007)(71200400001)(110136005)(53936002)(486006)(9686003)(55016002)(478600001)(966005)(6636002)(71190400001)(6306002)(73956011)(81166006)(305945005)(64756008)(81156014)(8936002)(6246003)(256004)(8676002)(66946007)(76116006)(491001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6719;H:VE1PR04MB6687.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: accKI8JLc/ygxIFzlJ4xaw37W6ErZcyUI8mZg12RnGhWkB6jaVsDo09o3IfZFtWE2w3hpa6MzU5jqIQ6Hfpn5FibNZUkH/3jxw4ehCLbcLHZ7H+Wmp3sQ+30G9d0D5P1s1p5NpwrbSvUc6UsByeKidcY0GyzO+Y2xkwddc3rumSlquhW53UAHoWVau9sNSc/YRVAfiZwnBFhKSKFluyvecspXw6nW8jkEKg+0wztS0Ap1Qy+JdydDi8WufmigOSQCF4uNrJ6HbskT03tK37fcR7KzsAh9RpGd1MXPeZtRCKFBxFDspEg7vtwHRvA1EJLJ9P2vt+8obN419FxuDjrmscCDVu1qLAAViLIC8WioZ4aGqny35sPFXfPMViCxzwnELbzQWuwzQXEhy01A/kRL6dMqPUKQwjVAiYrjjVfj5E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae9d6b4-1de5-45bc-8dd7-08d6edc6e37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 17:12:59.3983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6719
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9ha2ltIFRqZXJubHVu
ZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAx
MCwgMjAxOSAyOjUyIEFNDQo+IFRvOiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGxpbnV4
LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogZnNsX3VkYyBzdGF0dXM/DQo+IA0KPiBX
ZSBhcmUgdHJ5aW5nIHRvIGdldCBmc2xfdWRjIHVwIGFuZCBydW5uaW5nIG9uIGEgVDEwNDIgd2l0
aCB3aXRob3V0IHN1Y2Nlc3MuDQo+IFNlZW1zIGxpa2UgdGhpcyBkcml2ZXIgaXMgbGFnZ2luZyBi
ZWhpbmQgdGhlIGNvcnJlc3BvbmRpbmcgaG9zdCBkcml2ZXIobXBoKS4NCj4gVGhlIG1waCBkcml2
ZXIgaGFzIGEgbnVtYmVyIG9mIFVTQiBlcnJhdGEgd29ya2Fyb3VuZHMgd2hpbGUgdWRjIGhhcyBu
b25lLg0KPiBBdCBsZWFzdCBlcnJhdGFzIEEwMDc3OTIgc2VlbXMgYXBwbGljYWJsZSBmb3IgdWRj
IHRvby4NCj4gDQo+IElzIHRoZSBmc2xfdWRjIGRyaXZlciBmdW5jdGlvbmFsIG9uIDQuMTQueCh3
aGljaCB3ZSB1c2UpPyBXaGF0IGlzIG1pc3NpbmcgPw0KDQpXZSBhcmUgY3VycmVudGx5IHByb3Zp
ZGluZyA0LjE0IHN1cHBvcnQgd2l0aCBvdXIgUW9ySVEgU0RLLiAgWW91IGNhbiB0cnkgdGhlIGtl
cm5lbCB0cmVlIGF0IGh0dHBzOi8vc291cmNlLmNvZGVhdXJvcmEub3JnL2V4dGVybmFsL3Fvcmlx
L3FvcmlxLWNvbXBvbmVudHMvbGludXgvbG9nLz9oPWxpbnV4LTQuMTQuICBJIHRoaW5rIGl0IGlz
IHRlc3RlZCBvbiBUMTA0Mi4NCg0KSSBzZWUgdGhhdCB0aGVyZSBhcmUgYSBmZXcgdWRjIHJlbGF0
ZWQgcGF0Y2hlcyB0aGF0IG9ubHkgZXhpc3Qgb24gb3VyIFNESyBjb2RlIGJhc2UuICBBZGRpbmcg
UmFuIFdhbmcgd2hvIGlzIG1haW50YWluaW5nIHRoZXNlIFVTQiBwYXRjaGVzIGludGVybmFsbHku
ICBXZSBzaG91bGQgZGVmaW5pdGVseSB0cnkgdG8gdXBzdHJlYW0gdGhlbSBpbnN0ZWFkIG9mIG1h
aW50YWluaW5nIHRoZW0gaW50ZXJuYWxseSBmb3JldmVyLg0KDQpSZWdhcmRzLA0KTGVvDQoNCg==

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B4D47783
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 03:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfFQBN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jun 2019 21:13:58 -0400
Received: from mail-eopbgr140085.outbound.protection.outlook.com ([40.107.14.85]:10999
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbfFQBN5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 Jun 2019 21:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKu/5AO3LYlUOafsJvWox9oW2htgTMMYAxeUYPHktgY=;
 b=l7MxlT8wQCPgXiFdoFIimqzOfW/zxIBy4m73oD7o/OhqoE4Nnl8/qqXfTtLfuTcTKxF9flnnh67oU2n65hhhAvdF10hR+BH/aPbHZm6cOsNnD+rVZ/JtkWJJxmoeyilmF1n1wUmxknH/fTFBTWuxKN+a7FX+vet5n1MTBbE1xhU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4736.eurprd04.prod.outlook.com (20.177.48.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 01:13:53 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 01:13:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>
Subject: RE: [PATCH v4 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Topic: [PATCH v4 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Index: AQHVIpRSNr6mYKZVAEKkjfl1njA6J6acbVKAgAKdzIA=
Date:   Mon, 17 Jun 2019 01:13:52 +0000
Message-ID: <VI1PR04MB5327B9EF844F9C7505D337298BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190614093544.11730-1-peter.chen@nxp.com>
 <20190614093544.11730-7-peter.chen@nxp.com>
 <0dbf01f9-7c5c-ce0b-4feb-378c9147f15a@cogentembedded.com>
In-Reply-To: <0dbf01f9-7c5c-ce0b-4feb-378c9147f15a@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ccf280b-8dc0-4c49-0bfc-08d6f2c11011
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4736;
x-ms-traffictypediagnostic: VI1PR04MB4736:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR04MB4736E098631B8C1C481902C88BEB0@VI1PR04MB4736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(346002)(376002)(396003)(189003)(199004)(9686003)(966005)(86362001)(186003)(256004)(26005)(14454004)(305945005)(33656002)(99286004)(2201001)(8676002)(229853002)(7736002)(74316002)(66066001)(4744005)(52536014)(478600001)(71200400001)(71190400001)(81156014)(81166006)(5660300002)(2501003)(8936002)(76176011)(6506007)(476003)(66446008)(64756008)(66556008)(66476007)(4326008)(7696005)(2906002)(68736007)(44832011)(486006)(446003)(11346002)(3846002)(6116002)(73956011)(6306002)(110136005)(54906003)(6246003)(76116006)(66946007)(6436002)(316002)(55016002)(25786009)(53936002)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4736;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x+LAx2e/ycMS1MKCzNVnmLvs2Fa2XocWmf36F4pbK1Y9747xTRdei3QWfNQfbKjmAjo2961iCDJ6Gv2BipJzLtgB3+C9tlY5khrlkAVwp9eMVSFuM9qfNCJ57HBuNPkNCNqoYopSZ949OYJKBJeSfPbzhU5+1UOEnLSq7Ipw3+SXgJcufMYdMjrP25v7S82+h2mgv6FDJ1V71mm6vnwPryPc9Sp+Y72C29r+3/F1OM9xieS6r7IEGUxh00/Wpx5advpvxfWH5hOjQnIFkvJm9LBTA5e5w6oS6xavjp/75rUfo0FozVdRRpHRi12Dw/8StAv2SWwtQWLmJHD4lQgWWXsGjhISxDTPOpxvqnPWu/83XzQXLVxiOLhK4RaiZ1kfnfehtLAIzhGGMh4hN12NZYVmwW39oKMJu58yMrTjG2c=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccf280b-8dc0-4c49-0bfc-08d6f2c11011
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 01:13:53.0477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4736
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNpIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxw
LmR0c2kNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRzaSBpbmRleCBmY2E2ZTUw
ZjM3YzguLjUxMTVlNDc3MTVjMw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDd1bHAuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRz
aQ0KPiA+IEBAIC0zMCw2ICszMCw3IEBADQo+ID4gICAJCXNlcmlhbDEgPSAmbHB1YXJ0NTsNCj4g
PiAgIAkJc2VyaWFsMiA9ICZscHVhcnQ2Ow0KPiA+ICAgCQlzZXJpYWwzID0gJmxwdWFydDc7DQo+
ID4gKwkJdXNicGh5MCA9ICZ1c2JwaHkxOw0KPiANCj4gICAgIElzIHRoYXQgcmVhbGx5IG5lZWRl
ZD8NCj4gDQoNClllcywgc2luY2UgdGhlIGRyaXZlciBjb2RlIHVzZXMgYWxpZ25lZCBpZCwgYW5k
IHRoZSBjb250cm9sbGVyIG51bWJlciBpcyBmcm9tIDAgYXQgdGhlIGNvZGUuDQpJIGNvbW1lbnRl
ZCBpdCBoZXJlOiBbMV0NCg0KPiBbLi4uXQ0KPiA+IEBAIC0xMzMsNiArMTM0LDMzIEBADQo+IFsu
Li5dDQo+ID4gKwkJdXNicGh5MTogdXNicGh5QDB4NDAzNTAwMDAgew0KPiANCj4gICAgIE5hbWUg
aXQgInVzYi1waHlANDAzNTAwMDAiIHBsZWFzZS4NCj4gDQoNCldvdWxkIHlvdSBwbGVhc2UgbGlz
dCBiaW5kaW5nIGRvYyBmb3IgeW91ciBzdWdnZXN0aW9uPw0KDQpUaGFua3MsDQpQZXRlcg0KDQpb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDkyMDU5OS8NCg==

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC801E715
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 05:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfEODRY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 23:17:24 -0400
Received: from mail-eopbgr00050.outbound.protection.outlook.com ([40.107.0.50]:8615
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726201AbfEODRY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 23:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTLRSYRRE1X3lagvSdPJb6a97s0vJB6yVmf6HzlOoeI=;
 b=qMmS0hp7FnBA1IOzfcRvEB/BYbGB2TVBpXhZvng80pZ7qItcSS9JWx0G20eMri+6f7rLfOhrRcIOentWJwX3vcC6QHvGTrs4SkwiN1F67wHyxkFoZPwxAvHSqEttpP142z1/zH1oGRN+W+N+51Qj/rKtoHIHRWqcB9QzWfzS7iU=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4050.eurprd04.prod.outlook.com (52.134.91.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 03:17:19 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::3095:ca86:db25:e7a]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::3095:ca86:db25:e7a%7]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 03:17:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 5/8] usb: chipidea: imx: add imx7ulp support
Thread-Topic: [PATCH v2 5/8] usb: chipidea: imx: add imx7ulp support
Thread-Index: AQHVCif+XZX4hwLQGESDEzGVDSHbZqZqi1YAgAD5rqA=
Date:   Wed, 15 May 2019 03:17:19 +0000
Message-ID: <AM0PR04MB531442A89E7E71F8AC8DA6CB8B090@AM0PR04MB5314.eurprd04.prod.outlook.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
 <20190514073529.29505-6-peter.chen@nxp.com>
 <CAOMZO5DzqeDkfOh7gw7xQYHF1pDfe-LbC2jGybVDpEKUor+NNA@mail.gmail.com>
In-Reply-To: <CAOMZO5DzqeDkfOh7gw7xQYHF1pDfe-LbC2jGybVDpEKUor+NNA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b96097e4-3154-44e8-bfa7-08d6d8e3d708
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4050;
x-ms-traffictypediagnostic: AM0PR04MB4050:
x-microsoft-antispam-prvs: <AM0PR04MB4050E1BEEC2D1754C0285D678B090@AM0PR04MB4050.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(76176011)(99286004)(66446008)(7696005)(8676002)(81156014)(52536014)(81166006)(8936002)(4326008)(2906002)(558084003)(86362001)(6246003)(55016002)(3846002)(6506007)(229853002)(305945005)(7736002)(6916009)(71190400001)(71200400001)(316002)(11346002)(446003)(9686003)(26005)(6116002)(44832011)(64756008)(66946007)(5660300002)(66476007)(66556008)(73956011)(76116006)(478600001)(14444005)(476003)(102836004)(25786009)(53936002)(256004)(6436002)(74316002)(486006)(54906003)(1411001)(186003)(14454004)(33656002)(66066001)(68736007)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4050;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9SKF1etsmENT8MAC+uTMxoh1Ea/mKgITtQC/3x7EbC573UQaZLU6oNpy2ubY1QPSbnfLlhYxI+RTCEve8gOQUnuezR9dCnxPFvAiJChI/QHQOjlQPVAmfu4mowU1uuUCt91THfV2pzknjq1ccamMIVUVNLBIQ4WtLFJrfnal06iJQozBcubC3i0lf1/bgALdYSQTy9HM3G+nWAEsHxf7IqFoKnyt9gEM3hTqnVnsIuCf03xbWJ0UTTXH0dAPeDwURJzO0JOj6F+wnTB20tqlaOr/0qowIHGEtdezr6lXEEOvWKXtN3nTwFWuvasbXm1pH3pKr4ma2ZGon1O7OemaEv15i4ilMvjnMHrvJOZdWRaruTBh9m/lpfRurPt66xULqU5dYoVaY+k7k2vyxQp7fZVHwq1zkJYb/CA3tqdYwGM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96097e4-3154-44e8-bfa7-08d6d8e3d708
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 03:17:19.5445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4050
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgNDozOSBBTSBQZXRlciBDaGVuIDxwZXRl
ci5jaGVuQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIGlteDd1bHAgc3VwcG9ydA0KPiAN
Cj4gU2luY2UgeW91IGFyZSBhZGRpbmcgYSBuZXcgZmxhZyBDSV9IRFJDX1BNUU9TLCBpdCB3b3Vs
ZCBiZSBuaWNlIHRvIGV4cGFuZCB0aGUNCj4gY29tbWl0IGxvZyBhIGJpdCB0byBleHBsYWluIGFi
b3V0IGl0Lg0KDQpPaywgSSB3aWxsLiBUaGFua3MuDQoNClBldGVyDQo=

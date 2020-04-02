Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83F919BEC1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 11:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387752AbgDBJhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 05:37:35 -0400
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:19237
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725965AbgDBJhf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 05:37:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI2GBFVL5v7FjVZmvF9lC4vERbUS+DT3FY6jq/Vnntr6sYwRgQcyNUMfB673BEC6as+xASkVIfk4rejggseT5q7XSngF9wW6f7d+hoxHUtL2Woath69lhxv0ai8RwEOF9Kvy75EUNiG9zWHT32XlHBUVkEv7mPftTaB84a2NGRPQ2Azer1FMYFETOnCSdFg4XffJdeERS6gP0jstlJ8m+mcbMB0AdPlU2xG5D7Pgj3DYR0OYHU/RmoYLksZvOIHhIG1ceOGlROf1nZKClw7+xRRFE1a9WNYVLV4TRyDDbovI9R+Z23/CC3LoPfyk7axuChp1saUvwd60tAj9hJKuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCxK/ugDNB3DULknxXGhWrwtK8SZyTdyGmF9LTGsxvw=;
 b=ew27qXTvDeii1hkuauEfrbqv+WFGfy1DvJoPpmVuHAidLmyjGnWgzr7qpOMCZKDu6OHdD7glNDrXF0f06yKUEyluvejtiVEWRVXak9RPTen8jF/4M2WGlLCC0caQ1+faQ+utTEju012X6JglAgpQtEvH3OQu101ywrGBn4/pPFO+JIqHsp5I9VpBRbnWxz84w67Z2NPhMMbB4wGlGVrJM2J70YQ9KnpGFfayOSqRsrgg9dY4nV+RzJx9TGFj6ehboLDX7YCqBtuxPx/gB7KgyYHyDh4CLKjDeiidoeTe4a54MQTL2JnPhU8HfLpg3xZ374KILQpr2MC9mlakDwCgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCxK/ugDNB3DULknxXGhWrwtK8SZyTdyGmF9LTGsxvw=;
 b=Qd6V2twaxtevJwSBsqjvchOV9quEPZRzCxuhtq9CW/VA4k58msgPG34NwfJAj34OgwI53CsjdcQsYkqPYw9tSiIQxYmqMMLTyqoekEuplH5sYVljPU4SO1OCHWUs6b+AjnaecL+PKPxwwSSTpsK2EMx8FGIJx9k0916lbivgDuA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6981.eurprd04.prod.outlook.com (10.141.171.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 09:37:28 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 09:37:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Roger Quadros <rogerq@ti.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
Thread-Topic: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
Thread-Index: AQHWBzPHmgeMtxTLwk2TQY59TihVrKhlieWAgAAH/6CAAAFoAIAAASQw
Date:   Thu, 2 Apr 2020 09:37:28 +0000
Message-ID: <AM7PR04MB7157ABD50D68ACEB669FF2C08BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
 <bc2c6e57-accd-ccc9-caec-527773056744@ti.com>
 <AM7PR04MB7157C5ECA0597F2BBB3C29EC8BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <1b745ded-b0b2-1c4b-3052-41aaccad8a9c@ti.com>
In-Reply-To: <1b745ded-b0b2-1c4b-3052-41aaccad8a9c@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a28e579e-01a7-4cea-0a0e-08d7d6e975a6
x-ms-traffictypediagnostic: AM7PR04MB6981:|AM7PR04MB6981:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB69812B7A8C8E79AF075F01568BC60@AM7PR04MB6981.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(26005)(55016002)(5660300002)(44832011)(81156014)(81166006)(52536014)(66446008)(316002)(66476007)(64756008)(8936002)(66946007)(33656002)(8676002)(9686003)(71200400001)(76116006)(4744005)(110136005)(186003)(2906002)(66556008)(54906003)(478600001)(6506007)(86362001)(7696005)(4326008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9AzY1pPDcx9ridYyYVsVmqaPV0ubBi0nnSrs3hDr1oNxJuoMjL829Z4d6F2MHrGZQ9tozaGGvMR0RTKKv2FCBZ+h2nBGdX6Z37dFjEgc2+vGhvTXNOl5jGxn1CQyQIVCyeQFKMMTPPKRnxAaLIXvlJapeiU0R/XG9BAA42O6oxHm0RrX9TYLCbPDhQDXnmRQZ11f8TDcw4BDc4RyqLrFfuI3ic95F4ftdAuY5xaGC/5Duq7+1BcDvdomP70pPU7bZnj0tN99lNM1c6A3/ABB3I26ZYWS75uv0NTh+P6tgs8mRr0JiRXBo+QAb4Gs5VQzyp+zNd5TcXHjqaFT//ztd1Yhac4J5M3hDn8GRsGVWFXLMwfXJ235Y9bsHg8MwTTKmCwV7TbhpTjD+QO5EKmODgt8x+DsF4iGOaV1bGMrN17qegDT87P2jv8ETkO0T1SN
x-ms-exchange-antispam-messagedata: accP1QcOnIA9GdoSFbPD417AUm2n188XpH8n7zFpJ6riDwgI6PZXfHylONra3QcNeufUa7ZyCAilBQqy6BTDwkNZwADz80AbXIp8CGc7ESiGMPsHJfzHdOBQHEnCNEuNyMeNPeFKj6wiz4ufOOWjBw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28e579e-01a7-4cea-0a0e-08d7d6e975a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 09:37:28.4758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDweojBmVt1C9W8VxM58mZfysotDnIqtL6xJoDYxzlIMBmg+ZYudc20QumG2R01Zcw/I0r0t7S8rprmFf39MIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6981
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiA+Pg0KPiA+DQo+ID4gSGkgUm9nZXIsDQo+ID4NCj4gPiBJIHVzZSA1LjYtcmM0LiAgV2hpY2gg
Y29uZmxpY3QgeW91IGhhdmUgbWV0PyBEbyB5b3UgaGF2ZSBiZWxvdyBwYXRjaD8NCj4gPg0KPiA+
IDg3MDhhOWZhMjkzOCB1c2I6IHJvbGVzOiBQcm92aWRlIHRoZSBzd2l0Y2ggZHJpdmVycyBoYW5k
bGUgdG8gdGhlDQo+ID4gc3dpdGNoIGluIHRoZSBBUEkNCj4gDQo+IEFwcGx5aW5nOiB1c2I6IGNk
bnMzOiBjb3JlOiBnZXQgcm9sZSBzd2l0Y2ggbm9kZSBmcm9tIGZpcm13YXJlDQo+IGVycm9yOiBw
YXRjaCBmYWlsZWQ6IGRyaXZlcnMvdXNiL2NkbnMzL2NvcmUuYzo1MjgNCj4gZXJyb3I6IGRyaXZl
cnMvdXNiL2NkbnMzL2NvcmUuYzogcGF0Y2ggZG9lcyBub3QgYXBwbHkgUGF0Y2ggZmFpbGVkIGF0
IDAwMDEgdXNiOg0KPiBjZG5zMzogY29yZTogZ2V0IHJvbGUgc3dpdGNoIG5vZGUgZnJvbSBmaXJt
d2FyZSBVc2UgJ2dpdCBhbSAtLXNob3ctY3VycmVudC1wYXRjaCcNCj4gdG8gc2VlIHRoZSBmYWls
ZWQgcGF0Y2ggV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1biAiZ2l0IGFt
IC0tDQo+IGNvbnRpbnVlIi4NCj4gSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMgcGF0Y2gsIHJ1
biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4NCj4gVG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwgYnJh
bmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAtLWFib3J0Ii4NCj4gDQogDQpJIGp1
c3QgdHJpZWQgdGhlIGxhdGVzdCBHcmVnJ3MgdXNiLW5leHQsIGl0IGNvdWxkIGFwcGx5LiBEbyB5
b3UgaGF2ZSB0aGUgcGF0Y2ggSSBtZW50aW9uZWQ/DQpXaGF0J3MgdGhlIGNvbmZsaWN0IGluIHNv
dXJjZSBmaWxlPw0KDQpQZXRlciANCg==

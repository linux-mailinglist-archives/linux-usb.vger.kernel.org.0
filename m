Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D6995486
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 04:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbfHTCnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 22:43:45 -0400
Received: from mail-eopbgr150057.outbound.protection.outlook.com ([40.107.15.57]:53875
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728719AbfHTCnp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 22:43:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBQRVXvULY2Y4EsmVo7sKbUc7YOIfejgSokahC7iPqj5TAEDQZ3QEinMAaK+dV0xsYIYy/YfTRbBpf57EVaq/h1d9FoijfDP7u50twZ9Q2jB6PjY4GYilkSI+LsX7SPGi3rbz0CB77cDVTNrWs+KuElTdZ1dN6AJAvawEg0SfSB+dJR6gif8hF6FTkoNpklzEXVsJBGbwqp5yz1MR+Wu6HjkaJSHT4pyal/Nk882ggvee7f02IOAaNDE4IuLMf7cQVWrTf5NIlfQ5jW/O2T0ivu5BFPiOEF1g+vdc5LkJ1lK+wEYMXCaVkVEKSkBirM/OGKgKvf1KIuojT7DCjzoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDiqsWGwNSWtT4C/VDvNLmMnYJJo6GoILEwILe/S8qg=;
 b=EeBL4OzpJFEBgz0ExiAjGccG/sy3/7RwM9O9dhuoasEEiNGU9sIogx93QSpUsAEjya+pIJwSUu2Y0OCPDVWLnTYfApXe1m62EpcMsdffmTD8ys5I+S9rsr+3ksZv3NkfOLesM80tH01XXG3wU6pzy+8PocvKD7onDM9R3K4cc0nm3zszG+winUTFkiX/kvD6KVjdUWhzj9pZmlkNfrHiHZcDyNezyaY6sOsVUo13lmjmJSuoYhEDMp6aLeccpWYYsJ1YR8Fa305EQb4Wsf3k0aerw+qzvuABwHlYppqMcAWYzlLWAgoMm5rRZ2WelF90RYzOjaFb7XltLQt88kFmFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDiqsWGwNSWtT4C/VDvNLmMnYJJo6GoILEwILe/S8qg=;
 b=AXK90JU4Y+dcIWxeMlJBPNdxhR4uJfqIZXcPpCp/hw1/DYkmDAGbTK5IZHpkhOyW4Dk/pk6J3mgnC2FcA3lAz1TbcPgjSQ45D/nAd2Fzi+FEgexRS+AWePG/98B1ueq3BRaVsAXSsAu5LNWclruAD6Ewnam4CZYY0F1uAbrW22w=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6158.eurprd04.prod.outlook.com (20.179.27.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 20 Aug 2019 02:43:41 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 02:43:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] dt-binding: usb: usbmisc-imx: add imx7ulp compatible
Thread-Topic: [PATCH 2/2] dt-binding: usb: usbmisc-imx: add imx7ulp compatible
Thread-Index: AQHVVwETFMzfUGIykkeLbaekMl0Yaw==
Date:   Tue, 20 Aug 2019 02:43:40 +0000
Message-ID: <20190820024046.27755-2-peter.chen@nxp.com>
References: <20190820024046.27755-1-peter.chen@nxp.com>
In-Reply-To: <20190820024046.27755-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c732fa91-ea7b-4c8c-3aa8-08d7251835aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6158;
x-ms-traffictypediagnostic: VI1PR04MB6158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6158CCD8F9E4482D6FA445B98BAB0@VI1PR04MB6158.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(6436002)(3846002)(66066001)(8936002)(6916009)(305945005)(66556008)(2501003)(26005)(52116002)(36756003)(4326008)(2906002)(446003)(6116002)(53936002)(6506007)(81166006)(25786009)(476003)(2616005)(486006)(102836004)(8676002)(2351001)(186003)(14454004)(50226002)(7736002)(81156014)(5640700003)(316002)(76176011)(1076003)(86362001)(478600001)(44832011)(386003)(71200400001)(64756008)(11346002)(6512007)(66946007)(256004)(5660300002)(99286004)(71190400001)(66476007)(4744005)(54906003)(66446008)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6158;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g7cEa3jnpvOn6sSoX3RNuY/faDvZ+CMoTTeC/5t7TBnc+6Hx6YE4L/7pQORaIQ8N9Xr6ySwCGaBaP5wIrrIIY/SunTr2jbaeq1/zo9GnzAeL++xjDP/KidJ2o8Z3Z7BRANQ/ffLI+xSXZWfr5UJ001QLXigyXAmFST10mKhLrd07KU3g9zDpSvC3kCZkAyB2OdDh28wyyw+WN0tthcdzmo2l4AjaMi0iOx5kSJhUiG2oko9bPeMoVQRG17bI2JEdgnv6HcYs41vnQjrWd+p85uOTvsne8jI/JPSdqkUGB4xGh29HKM8w+jnF1/MDDRAg8mBpVzPZtiwgFPIOkgynTzS51JOmEv5PgS9gW/CgX7g+MKsGqI8tQOyqGznAZFuCmGeEJVrKOrP5wDeHrKx452/AoVv4VaRhuv0clOp3WzA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c732fa91-ea7b-4c8c-3aa8-08d7251835aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 02:43:41.0323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSRYnA4sFwjeoAeuC/WFjNNpwOtVjfmny8Kb/2+q7zad/rr0atP18kiBEBhpbbUumvWD1oTSdaneri7zh6DdiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6158
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx7ulp compatible

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/usbmisc-imx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt b/Docume=
ntation/devicetree/bindings/usb/usbmisc-imx.txt
index a85a631ec434..b353b9816487 100644
--- a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
+++ b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
@@ -7,6 +7,7 @@ Required properties:
 	"fsl,vf610-usbmisc" for Vybrid vf610
 	"fsl,imx6sx-usbmisc" for imx6sx
 	"fsl,imx7d-usbmisc" for imx7d
+	"fsl,imx7ulp-usbmisc" for imx7ulp
 - reg: Should contain registers location and length
=20
 Examples:
--=20
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1261C3F8
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfENHib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:31 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:64334
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726744AbfENHia (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mfe99sGv7P/Nja1qj4cjHUJMiXkAvKox2Ibjcxjm9I=;
 b=jLlhpaH7FwCayfa/zrAfuHus0l/qNsG8vlSHZjwCyVilnEg8042a77CVuvhoSQ4KJqMrsr63Ei9tbIsXQCu4m8eJ4XJmy4zx6SeRIANyCbVDh3Xfx6I7uMnm249r6a2+ZoZBhsN7mRcONhwB7fs/iczzBXN4hTf4MMIekgrEejA=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5392.eurprd04.prod.outlook.com (20.178.120.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:38:26 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:38:26 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 7/8] ARM: dts: imx7ulp-evk: enable USBOTG1 support
Thread-Topic: [PATCH v2 7/8] ARM: dts: imx7ulp-evk: enable USBOTG1 support
Thread-Index: AQHVCigEpURzdUKzV0GlmCEf7TIHgQ==
Date:   Tue, 14 May 2019 07:38:26 +0000
Message-ID: <20190514073529.29505-8-peter.chen@nxp.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
In-Reply-To: <20190514073529.29505-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.14.1
x-clientproxiedby: HK0PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:203:72::26) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc3448e2-362d-4f21-831b-08d6d83f2663
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5392;
x-ms-traffictypediagnostic: VI1PR04MB5392:
x-microsoft-antispam-prvs: <VI1PR04MB53921D2B808E078C75605B5D8B080@VI1PR04MB5392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(386003)(6506007)(102836004)(7736002)(305945005)(6436002)(66946007)(26005)(316002)(6512007)(73956011)(6486002)(66446008)(64756008)(66556008)(66476007)(76176011)(11346002)(446003)(2906002)(476003)(2616005)(25786009)(4326008)(3846002)(53936002)(186003)(486006)(44832011)(86362001)(6116002)(71190400001)(71200400001)(50226002)(256004)(66066001)(2501003)(1076003)(5660300002)(68736007)(8676002)(52116002)(99286004)(14454004)(36756003)(478600001)(8936002)(81156014)(81166006)(110136005)(54906003)(414714003)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5392;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T6OQ5l4hIUQUcWbwr43Q6sZC7XTfRx0N8yTkTuvacaJiNjd++BlImXQrkIkJ4YItO1V1nJQN7ZZhbgr97rKkCCiMyZ9HVDnJlwsgheUw8X7mAjzkYF1d5ycqFmjfHFxwWSMRwZuOOjue+WfPalyFcjSACVVWvUQJnnwIsl5dii9fCZdQMIWi65yRGrWWqlUlZ+o2PfxkLqB20PrhZ22gK5BNQmk8hrA3wxOc0Haz4MqoAZsRsgKpSW04x/DC+A51Icw450RFTX11p60nT+pNMl1opZ5KXVeoZIxcoG7iFIP9uhX6jiLgZkGlZ11Id4I5QmT9dQ+/eOsVGHX9yO4C+/gwIU+piWLwhtAnrBRW7+2fvCErdBuqIV0eW8SnefwTEsyjF0OZv9EtOu1gmL4YSej4TMaSOh5WkzChdjlhuuE=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <93AC2D794F08A54DB42E1EF04E8E79EB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3448e2-362d-4f21-831b-08d6d83f2663
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:38:26.2912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable USBOTG1 support for evk board, it is dual-role function
port.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm/boot/dts/imx7ulp-evk.dts | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp-evk.dts b/arch/arm/boot/dts/imx7ulp-=
evk.dts
index a09026a6d22e..c8a56a2ae9a5 100644
--- a/arch/arm/boot/dts/imx7ulp-evk.dts
+++ b/arch/arm/boot/dts/imx7ulp-evk.dts
@@ -22,6 +22,17 @@
 		reg =3D <0x60000000 0x40000000>;
 	};
=20
+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		compatible =3D "regulator-fixed";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_usbotg1_vbus>;
+		regulator-name =3D "usb_otg1_vbus";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		gpio =3D <&gpio_ptc 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_vsd_3v3: regulator-vsd-3v3 {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "VSD_3V3";
@@ -40,6 +51,17 @@
 	status =3D "okay";
 };
=20
+&usbotg1 {
+	vbus-supply =3D <&reg_usb_otg1_vbus>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usbotg1_id>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	over-current-active-low;
+	status =3D "okay";
+};
+
 &usdhc0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_usdhc0>;
@@ -57,6 +79,19 @@
 		bias-pull-up;
 	};
=20
+	pinctrl_usbotg1_vbus: otg1vbusgrp {
+		fsl,pins =3D <
+			IMX7ULP_PAD_PTC0__PTC0		0x20000
+		>;
+	};
+
+	pinctrl_usbotg1_id: otg1idgrp {
+		fsl,pins =3D <
+			IMX7ULP_PAD_PTC13__USB0_ID	0x10003
+			IMX7ULP_PAD_PTC16__USB1_OC2	0x10003
+		>;
+	};
+
 	pinctrl_usdhc0: usdhc0grp {
 		fsl,pins =3D <
 			IMX7ULP_PAD_PTD1__SDHC0_CMD	0x43
--=20
2.14.1


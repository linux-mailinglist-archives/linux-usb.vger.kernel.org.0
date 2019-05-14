Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6F21C3F6
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfENHi1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:27 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:64334
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726727AbfENHi1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+Fkz2S7BrDzHECMJTzAEpYyvjBYCr3U8FK2scz2P6g=;
 b=BnoE6gOR+8gmwBYbyAYlQlRhD60ewwkReIS6O/aRvoJSceFD/HnoCTSkFvg+Lm9it4NVty8MNkHa8CJAXjMDFviBBvf6IK4qsykmpxM1XxRNfWzcS7Kc3v1t1+BU1FM8ZzNV9Hzsr6vRCLGboqwMASZnQgXuIQiQfWjntL170XU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5392.eurprd04.prod.outlook.com (20.178.120.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:38:21 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:38:21 +0000
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
Subject: [PATCH v2 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Topic: [PATCH v2 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Index: AQHVCigBwvPXZQ0UVkuAwmjsg1TEmQ==
Date:   Tue, 14 May 2019 07:38:21 +0000
Message-ID: <20190514073529.29505-7-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 493f8dc9-6e1a-43ad-0f26-08d6d83f23d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5392;
x-ms-traffictypediagnostic: VI1PR04MB5392:
x-microsoft-antispam-prvs: <VI1PR04MB539237BF1D172C41499D95C58B080@VI1PR04MB5392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(386003)(6506007)(102836004)(7736002)(305945005)(6436002)(66946007)(26005)(316002)(6512007)(73956011)(6486002)(66446008)(64756008)(66556008)(66476007)(76176011)(11346002)(446003)(2906002)(476003)(2616005)(25786009)(4326008)(3846002)(53936002)(186003)(486006)(44832011)(86362001)(6116002)(71190400001)(71200400001)(50226002)(256004)(14444005)(66066001)(2501003)(1076003)(5660300002)(68736007)(8676002)(52116002)(99286004)(14454004)(36756003)(478600001)(8936002)(81156014)(81166006)(110136005)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5392;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y9CFtk3BdjpBmy17kzexBjRiuC0Z9KSZ0Zcnq/rb76HAqoGDs1iQMTrTclFZ+E/XC/LEB//755gZE1ZGlAxv1NBC06NAm3cHQ4gUEx1ohY+hrOiwFO+s7wnAvzL2PxjpvnlOdMM05gy0RQU3B5OMpLkOyisdOrdkx9cu3cgwo4aZf7rgsXpPdR1p66LngipeuUwAqDRQOYCDTGBFJpSMV5jVnf1vN1QEkVVJoqwmDB4edi4o8q0fwiay27iwKuXYVhktf4ckAa2KV8N/JqhvkdHUuHDPhEWNdme2jpCxCd+tY1HP09VBR6nf+tPO0/stqhY/sN8InLaUOkdKrgVNA0bPeo8IVFUkMqXskB0XDuBOgVciMrTh8UucejQ2Ts2+dduwYWCIAyEPpDjMnsRAN8WY9uCbGZIyxo1LcHKOfAY=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6926689D7D7B0840AE926BC8FBB6CB14@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493f8dc9-6e1a-43ad-0f26-08d6d83f23d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:38:21.8270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx7ulp USBOTG1 support.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dts=
i
index fca6e50f37c8..60c9ea116d0a 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -30,6 +30,7 @@
 		serial1 =3D &lpuart5;
 		serial2 =3D &lpuart6;
 		serial3 =3D &lpuart7;
+		usbphy0 =3D &usbphy1;
 	};
=20
 	cpus {
@@ -133,6 +134,36 @@
 			clock-names =3D "ipg", "per";
 		};
=20
+		usbotg1: usb@40330000 {
+			compatible =3D "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
+				"fsl,imx27-usb";
+			reg =3D <0x40330000 0x200>;
+			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&pcc2 IMX7ULP_CLK_USB0>;
+			phys =3D <&usbphy1>;
+			fsl,usbmisc =3D <&usbmisc1 0>;
+			ahb-burst-config =3D <0x0>;
+			tx-burst-size-dword =3D <0x8>;
+			rx-burst-size-dword =3D <0x8>;
+			status =3D "disabled";
+		};
+
+		usbmisc1: usbmisc@40330200 {
+			#index-cells =3D <1>;
+			compatible =3D "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
+				"fsl,imx6q-usbmisc";
+			reg =3D <0x40330200 0x200>;
+		};
+
+		usbphy1: usbphy@0x40350000 {
+			compatible =3D "fsl,imx7ulp-usbphy",
+				"fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
+			reg =3D <0x40350000 0x1000>;
+			interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&pcc2 IMX7ULP_CLK_USB_PHY>;
+			#phy-cells =3D <0>;
+		};
+
 		usdhc0: mmc@40370000 {
 			compatible =3D "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
 			reg =3D <0x40370000 0x10000>;
--=20
2.14.1


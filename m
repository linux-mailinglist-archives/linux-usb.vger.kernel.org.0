Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFC41C3EC
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfENHiJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:09 -0400
Received: from mail-eopbgr40041.outbound.protection.outlook.com ([40.107.4.41]:5889
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbfENHiI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hyLF5AeadJxFruUDqC+niOz1HgDME8iqrCMECAnXbU=;
 b=A5u3YfJYk/hKPBUjHb2TDHUsQEbwinC0wBuCRPlcmnlJb8WjCIfgkLncEplLGfx+JT1e/hKpCE3I7noZTivlXXJybYykMo59Oug/JQ0aGmS8r65ZxZhCkRotXdKYi+ubSyPnk8zAx/Twoe/kKfq0J3Npu5zaSRJIBlRiJmUeHeA=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5392.eurprd04.prod.outlook.com (20.178.120.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:38:04 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:38:04 +0000
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
Subject: [PATCH v2 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
Thread-Topic: [PATCH v2 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
Thread-Index: AQHVCif2vRA1gZTNi0O1cb14Aet16A==
Date:   Tue, 14 May 2019 07:38:03 +0000
Message-ID: <20190514073529.29505-3-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 426d9a9a-2481-4949-d035-08d6d83f193b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5392;
x-ms-traffictypediagnostic: VI1PR04MB5392:
x-microsoft-antispam-prvs: <VI1PR04MB5392E81CEAFDD4F8EB0B21B58B080@VI1PR04MB5392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(386003)(6506007)(102836004)(7736002)(305945005)(6436002)(66946007)(26005)(316002)(6512007)(73956011)(6486002)(66446008)(64756008)(66556008)(66476007)(76176011)(11346002)(446003)(2906002)(476003)(2616005)(25786009)(4326008)(3846002)(53936002)(186003)(486006)(44832011)(86362001)(6116002)(71190400001)(71200400001)(50226002)(256004)(14444005)(66066001)(2501003)(1076003)(5660300002)(68736007)(8676002)(52116002)(99286004)(14454004)(36756003)(478600001)(8936002)(81156014)(81166006)(110136005)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5392;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r9bIyeuH8PJx6MJCK/crAE8DgHrcfnpMuManhLDGylbpcEBKQTf7PgETBkgcNpYw8RxZFHtvuKLrkcXN53EuQRMQnc5ELLqMd7PSoDjc9cnDY90slz3e+GkTahYRhUxj/Wm6NOMccdJRhHq/9J8a+LB075Wc6QqsXa5eMthkTZZgWl+uu/gxCqW3dcoFp53VUsRpTJjuV96M8jL/frPaatEe5rGopFv41kjdaUWJ4utsj9p3VnPJHo4nHQqTDHz9bMBdL7KH10Do89f4uGE5LvfYxI+3HeOalkq7OdQtIrGnlIdIxccpT0GHPlo5XOlFghS9aPEjKz0QxTbvs2/6RLN0/MrGPEtzCh4AFXm1so7Qp6mT9MSCG2uCg6k5R+CD2kjuEsKDgOAr6u6hHl/7KURl8yCsoSx3ubzn0UoqjMM=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <935071CF78B7294EB38B20C78D69FE53@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426d9a9a-2481-4949-d035-08d6d83f193b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:38:04.0255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At imx7ulp, the USB related analog register is located in PHY register
region too, so we need to control PLL at PHY driver directly.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 76 +++++++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 1b1bb0ad40c3..90c96a8e9342 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -20,6 +20,7 @@
=20
 #define DRIVER_NAME "mxs_phy"
=20
+/* Register Macro */
 #define HW_USBPHY_PWD				0x00
 #define HW_USBPHY_TX				0x10
 #define HW_USBPHY_CTRL				0x30
@@ -37,6 +38,11 @@
 #define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
 #define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
=20
+/* imx7ulp */
+#define HW_USBPHY_PLL_SIC			0xa0
+#define HW_USBPHY_PLL_SIC_SET			0xa4
+#define HW_USBPHY_PLL_SIC_CLR			0xa8
+
 #define BM_USBPHY_CTRL_SFTRST			BIT(31)
 #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
 #define BM_USBPHY_CTRL_OTG_ID_VALUE		BIT(27)
@@ -55,6 +61,12 @@
 #define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
=20
 #define BM_USBPHY_DEBUG_CLKGATE			BIT(30)
+/* imx7ulp */
+#define BM_USBPHY_PLL_LOCK			BIT(31)
+#define BM_USBPHY_PLL_REG_ENABLE		BIT(21)
+#define BM_USBPHY_PLL_BYPASS			BIT(16)
+#define BM_USBPHY_PLL_POWER			BIT(12)
+#define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
=20
 /* Anatop Registers */
 #define ANADIG_ANA_MISC0			0x150
@@ -167,6 +179,9 @@ static const struct mxs_phy_data imx6ul_phy_data =3D {
 	.flags =3D MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
 };
=20
+static const struct mxs_phy_data imx7ulp_phy_data =3D {
+};
+
 static const struct of_device_id mxs_phy_dt_ids[] =3D {
 	{ .compatible =3D "fsl,imx6sx-usbphy", .data =3D &imx6sx_phy_data, },
 	{ .compatible =3D "fsl,imx6sl-usbphy", .data =3D &imx6sl_phy_data, },
@@ -174,6 +189,7 @@ static const struct of_device_id mxs_phy_dt_ids[] =3D {
 	{ .compatible =3D "fsl,imx23-usbphy", .data =3D &imx23_phy_data, },
 	{ .compatible =3D "fsl,vf610-usbphy", .data =3D &vf610_phy_data, },
 	{ .compatible =3D "fsl,imx6ul-usbphy", .data =3D &imx6ul_phy_data, },
+	{ .compatible =3D "fsl,imx7ulp-usbphy", .data =3D &imx7ulp_phy_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
@@ -198,6 +214,11 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_p=
hy)
 	return mxs_phy->data =3D=3D &imx6sl_phy_data;
 }
=20
+static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data =3D=3D &imx7ulp_phy_data;
+}
+
 /*
  * PHY needs some 32K cycles to switch from 32K clock to
  * bus (such as AHB/AXI, etc) clock.
@@ -221,14 +242,59 @@ static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
 	}
 }
=20
+static int wait_for_pll_lock(const void __iomem *base)
+{
+	int loop_count =3D 100;
+
+	/* Wait for PLL to lock */
+	do {
+		if (readl(base + HW_USBPHY_PLL_SIC) & BM_USBPHY_PLL_LOCK)
+			break;
+		usleep_range(100, 150);
+	} while (loop_count-- > 0);
+
+	return readl(base + HW_USBPHY_PLL_SIC) & BM_USBPHY_PLL_LOCK
+			? 0 : -ETIMEDOUT;
+}
+
+static int mxs_phy_pll_enable(void __iomem *base, bool enable)
+{
+	int ret =3D 0;
+
+	if (enable) {
+		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_SET);
+		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_SET);
+		ret =3D wait_for_pll_lock(base);
+		if (ret)
+			return ret;
+		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
+				HW_USBPHY_PLL_SIC_SET);
+	} else {
+		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
+				HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_SET);
+		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_CLR);
+	}
+
+	return ret;
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
 	void __iomem *base =3D mxs_phy->phy.io_priv;
=20
+	if (is_imx7ulp_phy(mxs_phy)) {
+		ret =3D mxs_phy_pll_enable(base, true);
+		if (ret)
+			return ret;
+	}
+
 	ret =3D stmp_reset_block(base + HW_USBPHY_CTRL);
 	if (ret)
-		return ret;
+		goto disable_pll;
=20
 	/* Power up the PHY */
 	writel(0, base + HW_USBPHY_PWD);
@@ -253,6 +319,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	mxs_phy_tx_init(mxs_phy);
=20
 	return 0;
+
+disable_pll:
+	if (is_imx7ulp_phy(mxs_phy))
+		mxs_phy_pll_enable(base, false);
+	return ret;
 }
=20
 /* Return true if the vbus is there */
@@ -374,6 +445,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	writel(BM_USBPHY_CTRL_CLKGATE,
 	       phy->io_priv + HW_USBPHY_CTRL_SET);
=20
+	if (is_imx7ulp_phy(mxs_phy))
+		mxs_phy_pll_enable(phy->io_priv, false);
+
 	clk_disable_unprepare(mxs_phy->clk);
 }
=20
--=20
2.14.1


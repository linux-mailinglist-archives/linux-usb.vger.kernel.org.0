Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C518D1C3F4
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfENHiY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:24 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:13761
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726727AbfENHiX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwXdeX0cwHcmQH9V9/CyGq6TCZI8PR9hHrKL8pTUMBY=;
 b=Mwp+fepAKJcJ5UW+qYRjWOOtqc0+igmPImwlf1lMt3z7NjPYrfRK4MLeY0dGrPFNmBQxCxh/8+Tbig1kNqTHvcf/cQ5QazAEdZ9UvQ/VTKLjVJnJQg99XiVdXyOeXxLbydSkuyxKwiLy4qBTe/Boq3rK0o2uFBBO3LYpm6MoEeE=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5392.eurprd04.prod.outlook.com (20.178.120.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:38:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:38:17 +0000
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
Subject: [PATCH v2 5/8] usb: chipidea: imx: add imx7ulp support
Thread-Topic: [PATCH v2 5/8] usb: chipidea: imx: add imx7ulp support
Thread-Index: AQHVCif+XZX4hwLQGESDEzGVDSHbZg==
Date:   Tue, 14 May 2019 07:38:17 +0000
Message-ID: <20190514073529.29505-6-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: e1abcbcb-0f84-4c4a-9a72-08d6d83f2132
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5392;
x-ms-traffictypediagnostic: VI1PR04MB5392:
x-microsoft-antispam-prvs: <VI1PR04MB53929098B83A32FB18B198E98B080@VI1PR04MB5392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:299;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(386003)(6506007)(102836004)(7736002)(305945005)(6436002)(66946007)(26005)(316002)(6512007)(73956011)(6486002)(66446008)(64756008)(66556008)(66476007)(76176011)(11346002)(446003)(2906002)(476003)(2616005)(25786009)(4326008)(3846002)(53936002)(186003)(486006)(44832011)(86362001)(6116002)(71190400001)(71200400001)(50226002)(256004)(14444005)(66066001)(2501003)(1076003)(5660300002)(68736007)(8676002)(52116002)(99286004)(14454004)(36756003)(478600001)(8936002)(81156014)(81166006)(110136005)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5392;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5Zu3SINiaPri0+FdC5/XugS/sH49Yosy/Xyqgb7kfU1tvaUGPoxI1/EbFI1feUwm0pwrYhS9rres/nIoYDaPup9i3oGJfWgGNnYrxeWquF64z9ElUt5eKJvTR3Yts8uZhyzjtyOpTDH7v8wn/rV3cG5srK6iud3GDPbjmD7GF6au5Ga0KzXmAQrM9fefnM16bEgdYWeVYj50xqUUUDk/oWOpHoIsVDtWHFwQJ2O3GS1NvdA0KnJShXNgZ7z93Lo1mOzEYwRS57skxCGCPTCNy1ALTS3II75yt7IZWfslh28wWvIgW8rDQz2rN+3SZSOm82VYdEfaBpCG03i92OAcDwJL6j3PwuX4wcNhSOPKVylihiwK+uamiBKVO9lfVtLfxu6tageFbAXYLKESty1gcOjVGQA39Zm9PHx8tDeFbQk=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9D9DCC204D4BCD45AF0A69CDDE505989@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1abcbcb-0f84-4c4a-9a72-08d6d83f2132
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:38:17.4339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx7ulp support

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 28 +++++++++++++++++++++++++++-
 drivers/usb/chipidea/usbmisc_imx.c |  4 ++++
 include/linux/usb/chipidea.h       |  1 +
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_h=
drc_imx.c
index ceec8d5985d4..a76708501236 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -13,6 +13,7 @@
 #include <linux/usb/of.h>
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_qos.h>
=20
 #include "ci.h"
 #include "ci_hdrc_imx.h"
@@ -63,6 +64,11 @@ static const struct ci_hdrc_imx_platform_flag imx7d_usb_=
data =3D {
 	.flags =3D CI_HDRC_SUPPORTS_RUNTIME_PM,
 };
=20
+static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data =3D {
+	.flags =3D CI_HDRC_SUPPORTS_RUNTIME_PM |
+		CI_HDRC_PMQOS,
+};
+
 static const struct of_device_id ci_hdrc_imx_dt_ids[] =3D {
 	{ .compatible =3D "fsl,imx23-usb", .data =3D &imx23_usb_data},
 	{ .compatible =3D "fsl,imx28-usb", .data =3D &imx28_usb_data},
@@ -72,6 +78,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] =3D=
 {
 	{ .compatible =3D "fsl,imx6sx-usb", .data =3D &imx6sx_usb_data},
 	{ .compatible =3D "fsl,imx6ul-usb", .data =3D &imx6ul_usb_data},
 	{ .compatible =3D "fsl,imx7d-usb", .data =3D &imx7d_usb_data},
+	{ .compatible =3D "fsl,imx7ulp-usb", .data =3D &imx7ulp_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
@@ -93,6 +100,8 @@ struct ci_hdrc_imx_data {
 	struct clk *clk_ahb;
 	struct clk *clk_per;
 	/* --------------------------------- */
+	struct pm_qos_request pm_qos_req;
+	const struct ci_hdrc_imx_platform_flag *plat_data;
 };
=20
 /* Common functions shared by usbmisc drivers */
@@ -309,6 +318,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pd=
ev)
 	if (!data)
 		return -ENOMEM;
=20
+	data->plat_data =3D imx_platform_flag;
+	pdata.flags |=3D imx_platform_flag->flags;
 	platform_set_drvdata(pdev, data);
 	data->usbmisc_data =3D usbmisc_get_init_data(dev);
 	if (IS_ERR(data->usbmisc_data))
@@ -369,6 +380,11 @@ static int ci_hdrc_imx_probe(struct platform_device *p=
dev)
 			}
 		}
 	}
+
+	if (pdata.flags & CI_HDRC_PMQOS)
+		pm_qos_add_request(&data->pm_qos_req,
+			PM_QOS_CPU_DMA_LATENCY, 0);
+
 	ret =3D imx_get_clks(dev);
 	if (ret)
 		goto disable_hsic_regulator;
@@ -396,7 +412,6 @@ static int ci_hdrc_imx_probe(struct platform_device *pd=
ev)
 		usb_phy_init(pdata.usb_phy);
 	}
=20
-	pdata.flags |=3D imx_platform_flag->flags;
 	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
 		data->supports_runtime_pm =3D true;
=20
@@ -439,6 +454,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pd=
ev)
 disable_hsic_regulator:
 	if (data->hsic_pad_regulator)
 		ret =3D regulator_disable(data->hsic_pad_regulator);
+	if (pdata.flags & CI_HDRC_PMQOS)
+		pm_qos_remove_request(&data->pm_qos_req);
 	return ret;
 }
=20
@@ -455,6 +472,8 @@ static int ci_hdrc_imx_remove(struct platform_device *p=
dev)
 	if (data->override_phy_control)
 		usb_phy_shutdown(data->phy);
 	imx_disable_unprepare_clks(&pdev->dev);
+	if (data->plat_data->flags & CI_HDRC_PMQOS)
+		pm_qos_remove_request(&data->pm_qos_req);
 	if (data->hsic_pad_regulator)
 		regulator_disable(data->hsic_pad_regulator);
=20
@@ -480,6 +499,9 @@ static int __maybe_unused imx_controller_suspend(struct=
 device *dev)
 	}
=20
 	imx_disable_unprepare_clks(dev);
+	if (data->plat_data->flags & CI_HDRC_PMQOS)
+		pm_qos_remove_request(&data->pm_qos_req);
+
 	data->in_lpm =3D true;
=20
 	return 0;
@@ -497,6 +519,10 @@ static int __maybe_unused imx_controller_resume(struct=
 device *dev)
 		return 0;
 	}
=20
+	if (data->plat_data->flags & CI_HDRC_PMQOS)
+		pm_qos_add_request(&data->pm_qos_req,
+			PM_QOS_CPU_DMA_LATENCY, 0);
+
 	ret =3D imx_prepare_enable_clks(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbm=
isc_imx.c
index d8b67e150b12..b7a5727d0c8a 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -763,6 +763,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] =
=3D {
 		.compatible =3D "fsl,imx7d-usbmisc",
 		.data =3D &imx7d_usbmisc_ops,
 	},
+	{
+		.compatible =3D "fsl,imx7ulp-usbmisc",
+		.data =3D &imx7d_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 911e05af671e..edd89b7c8f18 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -61,6 +61,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_OVERRIDE_PHY_CONTROL	BIT(12) /* Glue layer manages phy */
 #define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
 #define CI_HDRC_IMX_IS_HSIC		BIT(14)
+#define CI_HDRC_PMQOS			BIT(15)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
--=20
2.14.1


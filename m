Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6800D2A4481
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 12:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgKCLqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 06:46:53 -0500
Received: from mail-eopbgr40066.outbound.protection.outlook.com ([40.107.4.66]:28642
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727665AbgKCLqw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 06:46:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KItynheo1nhAOLjcEsswDYJOHIBizKRKfSehN6ItmIeLrdmDQ5DZULHKgzZrb8zVS2LZSar8oUFu9psvGFfUcMvquutPtINCtoWn7//npeiqclXi3Z+9et2izQQXn1EMijo70fnTILO/OIGVeV6n9CMGMgDW0iwA9spIaMi5seOHxR0jkJLj3WbYNdT85L9oowM203NX3kHOAvPOu/EHUwZaN5ruV9KiWE3Y5zi8MKba1T/DJuFTDq0P7vwVcO4gwbbsH2bu1FAODL4Vh10EuKBDZSCCm1be35Gj4QuNKUqOd21tagHl4uzgHov4Ga4DZAsPK+wu+2juRXIR23Hk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0nmpuMjyAzlYs7St5YcdiLOyI/IWKYRQ2TLTkVahaE=;
 b=Td74agiEX8Z7Xix4KBBf/cK89ImV/6YFhji0vabK5mzKgDZFSH2vvU2H8mlaCQedXqW7NRaqQxfa7QAX2z1PJjUl1HcLpNspdfCOdguSP1xJEggmGjh4gu+iwMNk+5kh7KWV8WFEv9o809XB0h/MQLuW9u+jZM9wlxQlZr2mEURZvAJFwMsfBt+7o1PP2eaLVsX+cDHlOvLpgZdcoq9cn4qysXIpk0wBC5VHSUw7Gz/Kx7wRSpUN0jXkJs4qXEenzJl5Cciv/NASMSArd5xV3XGlNDJ3YGkV78atgrz+Dyl80OyxaHLM88B0uKTqgsE3BZNCJRbFzwANHr/bh5Ufuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0nmpuMjyAzlYs7St5YcdiLOyI/IWKYRQ2TLTkVahaE=;
 b=Dlaw5BL1Ivq82PsewyQtHcCES/L1h4lhxpkc8RRgYVBDug4rGKq5XUVEgqiw2Ik6Wjzu5f0JFkoXeC1UTEn5P4F4DHdbjIc3mDmv3jV1G7KZU9eWsl0qGG9EgP+cdo2Z+mOCgwdHpL8pSB40vvs86PjomR/Zbzy5ewi/1MS6NrE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 11:46:36 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 11:46:36 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org
Cc:     gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, lee.jones@linaro.org,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: [PATCH v5 4/4] usb: typec: mux: add typec switch simple driver
Date:   Tue,  3 Nov 2020 19:40:10 +0800
Message-Id: <1604403610-16577-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0131.apcprd01.prod.exchangelabs.com (2603:1096:4:40::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 11:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 331594b9-e0bc-4c7d-e1b4-08d87fee1e91
X-MS-TrafficTypeDiagnostic: VE1PR04MB7278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB72786C7A421BEB365282F47489110@VE1PR04MB7278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9JI25Quze5J12+NygoKt6BUlzA2F+bo3O/vNburxgfERgXXjLQWS0XlF4e2WCfB454mmar0UW6vn5ZOBbUbDa/Mxv2GiBDbarPWTPg+rkAduJyrZVeCQrpbOc+DGfJ8/QSWJsMHPEq1FdDVoxGANL0nBYRFL8uLdiopWApCRe6OEjxB0+myDJBCcdVU8tatkebwrhc1K0wC1CgtX76m5FmnAGRprO2w6JZxIxZJFWq9Ohkn0CyscNMEfgV2AZUTvbhti6k07MoN3HIhbl43a20qT99Z5hgQFQ/8lF/LX1UYyl3oxJenbyExLqJ3nfD/UNwsIE42TBtc16xxgNMNOiG/P+nCCqU7cHAwKDXoFLkxqaunJjZYxEiNTcLyKBvzy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(69590400008)(26005)(316002)(16526019)(186003)(8936002)(6486002)(6506007)(7416002)(83380400001)(4326008)(6666004)(478600001)(36756003)(956004)(5660300002)(2906002)(66476007)(2616005)(86362001)(66556008)(52116002)(66946007)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: gmDJ+DP1OgLN5lHBDKGDIWTuEkZvNmTfw4SeKNavHWxxI5dzhrOIHr/8ZNWdHJgO4PHPAOye6pVY6HTScuq09Yk7GATca/eMX5zwrS8S4vhIzEBo2pSLY+J11A7hUpVWQyOzC2uX1DG9A/eMo3tqBk4lHEWxRB/qpZ8IDncEdFeHiqUiWJ8FrVhnlMOMKZRKF6wskKLZt0w4GvCgJgd/+W4lHT7mqvhE0az5jDpcm/KC+GsFDvpEJvnd1CZ/omLPV83IsKSPlRKJ0VJPah74RaO0j7UApEMhy/rn+5EIbDP+HFifO4RdPbgwe2+OyvGmo6GsgZFtcYhv9F+24/xb3M9Lm0V8+32FoknkxgaDrCSY6dvRpMIe1RixYFQbO992FwoMeJZLgqk7313Nfs373Hib2VoUUhK8hDVg70muBLxLniZrifRC1fgcIvl4N+dbgGKdn9e7RVQSnRF+vkGbYcWxdNx+7aGDZM7P96B4cLLME4h1zHCJEzxlzl/Tfh0juIy1G9XTVOahZzeuj8b6EYbu3WfojdSZFoHIjMR8cjE0PfN4J9WXXFJbGtQhgc3QivWZ+SJFd37ef6zwY4YLEykHI9klubUFpWklV6ZkrqzZGkfNFDA7vMW+qXy/B8nRi3LKZEnYY2EYBr1Dxd9faw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331594b9-e0bc-4c7d-e1b4-08d87fee1e91
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 11:46:36.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFYoPh54+QXW3HdMPTo4w9Hr7l+D2kHdb1n8gTTJBSOr/zRkSQaWiv1i4hYPHruk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a simple typec switch driver for cases which only
needs some simple operations but a dedicated driver is required,
current driver only supports GPIO toggle to switch the super speed
active channel according to typec orientation.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v5:
- A few changes address Andy's comment, remove gpio check as it's
  optional, add module name for Kconfig, use correct header files,
  and other minor changes.
- Remove the mutex lock as it's not required currently.

Changes for v4:
- Change driver name to be switch simple from switch GPIO, to make it
  generic for possible extention.
- Use compatiable "typec-orientation-switch" instead of bool property
  for switch matching.
- Make acitve channel selection GPIO to be optional.
- Remove Andy's R-b tag since the driver changes a lot.

Change for v3:
- Remove file name in driver description.
- Add Andy Shevchenko's Reviewed-by tag.

Changes for v2:
- Use the correct head files for gpio api and of_device_id:
  #include <linux/gpio/consumer.h>
  #include <linux/mod_devicetable.h>
- Add driver dependency on GPIOLIB

 drivers/usb/typec/mux/Kconfig         |  10 ++++
 drivers/usb/typec/mux/Makefile        |   1 +
 drivers/usb/typec/mux/switch-simple.c | 100 ++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index a4dbd11..11320d7 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -18,4 +18,14 @@ config TYPEC_MUX_INTEL_PMC
 	  control the USB role switch and also the multiplexer/demultiplexer
 	  switches used with USB Type-C Alternate Modes.
 
+config TYPEC_SWITCH_SIMPLE
+	tristate "Type-C orientation switch simple driver"
+	depends on GPIOLIB
+	help
+	  Say Y or M if your system need a simple driver for typec switch
+	  control, like use GPIO to select active channel.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called switch-simple.
+
 endmenu
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index 280a6f5..712d0ad 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
+obj-$(CONFIG_TYPEC_SWITCH_SIMPLE)	+= switch-simple.o
diff --git a/drivers/usb/typec/mux/switch-simple.c b/drivers/usb/typec/mux/switch-simple.c
new file mode 100644
index 0000000..8707703
--- /dev/null
+++ b/drivers/usb/typec/mux/switch-simple.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Type-C switch simple control driver
+ *
+ * Copyright 2020 NXP
+ * Author: Jun Li <jun.li@nxp.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/usb/typec_mux.h>
+
+struct typec_switch_simple {
+	struct typec_switch *sw;
+	struct gpio_desc *sel_gpio;
+};
+
+static int typec_switch_simple_set(struct typec_switch *sw,
+				   enum typec_orientation orientation)
+{
+	struct typec_switch_simple *typec_sw = typec_switch_get_drvdata(sw);
+
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NORMAL:
+		gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
+		break;
+	case TYPEC_ORIENTATION_NONE:
+		break;
+	}
+
+	return 0;
+}
+
+static int typec_switch_simple_probe(struct platform_device *pdev)
+{
+	struct device			*dev = &pdev->dev;
+	struct typec_switch_desc	sw_desc;
+	struct typec_switch_simple	*typec_sw;
+
+	typec_sw = devm_kzalloc(dev, sizeof(*typec_sw), GFP_KERNEL);
+	if (!typec_sw)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, typec_sw);
+
+	sw_desc.drvdata = typec_sw;
+	sw_desc.fwnode = dev->fwnode;
+	sw_desc.set = typec_switch_simple_set;
+
+	/* Get the super speed active channel selection GPIO */
+	typec_sw->sel_gpio = devm_gpiod_get_optional(dev, "switch", GPIOD_OUT_LOW);
+	if (IS_ERR(typec_sw->sel_gpio))
+		return PTR_ERR(typec_sw->sel_gpio);
+
+	typec_sw->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(typec_sw->sw)) {
+		dev_err(dev, "Error registering typec switch: %ld\n",
+			PTR_ERR(typec_sw->sw));
+		return PTR_ERR(typec_sw->sw);
+	}
+
+	return 0;
+}
+
+static int typec_switch_simple_remove(struct platform_device *pdev)
+{
+	struct typec_switch_simple *typec_sw = platform_get_drvdata(pdev);
+
+	typec_switch_unregister(typec_sw->sw);
+
+	return 0;
+}
+
+static const struct of_device_id of_typec_switch_simple_match[] = {
+	{ .compatible = "typec-orientation-switch" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_typec_switch_simple_match);
+
+static struct platform_driver typec_switch_simple_driver = {
+	.probe		= typec_switch_simple_probe,
+	.remove		= typec_switch_simple_remove,
+	.driver		= {
+		.name	= "typec-switch-simple",
+		.of_match_table = of_typec_switch_simple_match,
+	},
+};
+
+module_platform_driver(typec_switch_simple_driver);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("TypeC Orientation Switch Simple driver");
+MODULE_AUTHOR("Jun Li <jun.li@nxp.com>");
-- 
2.7.4


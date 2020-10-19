Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D7829246B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 11:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgJSJK2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 05:10:28 -0400
Received: from mail-eopbgr60057.outbound.protection.outlook.com ([40.107.6.57]:40419
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbgJSJK2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 05:10:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8iUYvXgctU2xLsIkeuL9KyzJRtgaRIpaV/6Pibb1+jD6nxaf1RfpkJoyc1QYNrReWWkzv5Czo/Bn0OkDlJpteg510v29oVwy/T9SqRm/GVqqsppEiD+/c8CEQzcxucL5uUwE/j7azk4CDX6bAYOYhPd7hpctVneVh1JxkHl0TeH92wVBArxhRsT1E8wmdXvctQgam8l2C9jFfAJsyR4ZVMaJtlQKN23NM3CrqURmQ/PwPm9jt4OR6Q+M293qXFufMvabuRlRUwuyXVBPLFHN9lCGllFQkO35A6NEzg15H8Skt+Y5xxYbpapG7kK+rQtNYxOCx2RyYCzQAYu5HSZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE74sv2IBt9Pcd3zUMCOek8sUliOPbaudik6Ly20dPM=;
 b=i0PWKQYH9piEjVjiwKEruimfa6HD7zcqt94orXtMU65mKaOUIPbOUxUK7LtHtTYN4NIBpNcHLbIvsVJY/Xaq8WDN3G7mMswmyM863WSiAJMxegvtjrYwZgXp936WUAaDRQRQasdfJ1reWGYSmm1RmclMdX8qfTQ1LNCC6mX+G5/EizmMQNai0bETteeAGcmhYTgy5bX1Ay9vXOMHL5fpw8yEOmSgNc9tKHAu6MnH6XBrn2hKFEWi18s98n+2xCC8OnvQHUPpZXjmfIzarlU8gzNwA614UIzTIr4f1+jnjyfV2sBPskF4Od6WN8QYvWXDbfXXNoCuLLnWQIiUVn0noQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE74sv2IBt9Pcd3zUMCOek8sUliOPbaudik6Ly20dPM=;
 b=slm7LAp9IG+VmAYVm0DnFdP0+e7R5zHea2Mf9SM5K1sufSMgFzFChzqiNdmoYsDr2Fd87aODMMq8otpvO7n180B3/nqfmGLjNy7kAYiyxLo52L4gW5NySzJBB5GJHHtK5tBGr3wex5QSFe1Bic7iUdIFit9nFjm2iBYVOjgIYJ4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2342.eurprd04.prod.outlook.com (2603:10a6:4:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 19 Oct
 2020 09:10:24 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:10:23 +0000
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
Subject: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Date:   Mon, 19 Oct 2020 17:03:15 +0800
Message-Id: <1603098195-9923-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0128.apcprd01.prod.exchangelabs.com (2603:1096:4:40::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 09:10:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2871977-9f76-48ae-767f-08d8740ecf76
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2342E550942A85DB77A6BCE9891E0@DB6PR0401MB2342.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/qyj7/36WZUz9mZfx4D0V6WMOwHIpWFbTYux1xJ38FmjlJ7MqzwzjySpPHNX0EHZ9FWkEe8UYMQgakioUiEmcrtrNibHHiuutwRDwt18n5LY9YUCqkuVQQs6RWtA8LJXNt9YGtpUpjEuuTQGeWMGDQoV97p1A5zMs9dtYckE/TLy5Df9xpxVU4msJgCkzf9T1Rwsb39002h5z/ivywJOfLcTrkbaybGtAV7p945yOAWgm4BEW8ljouWHka5voGUeZ+vfr0YucFy11InX4A2UmEIawpvK3hJkiKW7TQHvz/euEqiCev3keIS7IJPsjJZ35qBzCdYGsL2SWGr0sgMJVUbVUzrDCP6RBWktivp1Rz6TMWLS469IzmgVe1F99f8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6666004)(8936002)(66556008)(7416002)(316002)(5660300002)(6512007)(4326008)(36756003)(66476007)(66946007)(8676002)(52116002)(69590400008)(478600001)(83380400001)(2616005)(956004)(2906002)(16526019)(26005)(86362001)(186003)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ZMpREL/HTILtHMSVJicr1xuy/oSFjID5qVuQb8ULbU5tPPHn+aNWAbPIMse2OOkApzunC0X9QRugEJqOqA3TKDV+F26CPeZAXkjSPvWyF4bacaZKSzmsqzQAqiG6yoWkSft1mOzQB46R8cWIRhlj8/3KjPHPEkDyNlY/h0THLXABqxXVmwRbquRiv4E6hUOeUfcA9WyXmYSe2Zqq6scuDrLlDyLoRyMHkHg677bweOtFxZiJnhegzjzi1+bXskOIlHxqcrnw7ZgftHp2IdwGFMx7mrMISXWUV3hk2qxgwlMmaQnDjOECJsz3dduaMiknsI9JvE+djpsW0wyUiE5n2gQq4yckk1UFDTokBnZLUXE+zew8p5vv9/eQElRScBZWS3YrY5Uky4qaGUjMumH8hwuhzfkC5A1OEcyv+otTXWA/PoVbmkE2qjR4df0V8ORuVB8mmA+WTQ6v69H3oPJnbvMtnBuqWUynkiYbqs5vAzXflKJ40BwFSPdsZJOjcVP7XYqbg+NRgrKUczBtIbyAfAiP3E6BMkuYANdiANxslU26QShNOVDPwRGGo2zCFkh92NrqLgYP4Dkr3UXTb8mNDJhjvPTLuY1X0h1eaRQvLw9b1gEfuUXqsnLhmpij76zf75NI8yRiAwmeIZ5Nea7hKQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2871977-9f76-48ae-767f-08d8740ecf76
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:10:23.5884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1uIZHW+XBgGkg2JdkQ+D0t7Iq7ILC8YMLdvJ6uo3m2XQjvHo/Eh4ZUn+brU08pj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2342
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a simple typec switch driver for cases which only
needs some simple operations but a dedicated driver is required,
current driver only supports GPIO toggle to switch the super speed
active channel according to typec orientation.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
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

 drivers/usb/typec/mux/Kconfig         |   6 ++
 drivers/usb/typec/mux/Makefile        |   1 +
 drivers/usb/typec/mux/switch-simple.c | 110 ++++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index a4dbd11..2942588 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -17,5 +17,11 @@ config TYPEC_MUX_INTEL_PMC
 	  Driver for USB muxes controlled by Intel PMC FW. Intel PMC FW can
 	  control the USB role switch and also the multiplexer/demultiplexer
 	  switches used with USB Type-C Alternate Modes.
+config TYPEC_SWITCH_SIMPLE
+	tristate "Type-c orientation switch Simple driver"
+	depends on GPIOLIB
+	help
+	  Say Y or M if your system need a simple driver for typec switch
+	  control, like use GPIO to select active channel.
 
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
index 0000000..98f4b49
--- /dev/null
+++ b/drivers/usb/typec/mux/switch-simple.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * switch-simple.c - typec switch simple control.
+ *
+ * Copyright 2020 NXP
+ * Author: Jun Li <jun.li@nxp.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/usb/typec_mux.h>
+
+struct typec_switch_simple {
+	struct typec_switch *sw;
+	struct mutex lock;
+	struct gpio_desc *sel_gpio;
+};
+
+static int typec_switch_simple_set(struct typec_switch *sw,
+				   enum typec_orientation orientation)
+{
+	struct typec_switch_simple *typec_sw = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&typec_sw->lock);
+
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NORMAL:
+		if (typec_sw->sel_gpio)
+			gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		if (typec_sw->sel_gpio)
+			gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
+		break;
+	case TYPEC_ORIENTATION_NONE:
+		break;
+	}
+
+	mutex_unlock(&typec_sw->lock);
+
+	return 0;
+}
+
+static int typec_switch_simple_probe(struct platform_device *pdev)
+{
+	struct typec_switch_simple	*typec_sw;
+	struct device			*dev = &pdev->dev;
+	struct typec_switch_desc sw_desc;
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
+	mutex_init(&typec_sw->lock);
+
+	/* Get the super speed active channel selection GPIO */
+	typec_sw->sel_gpio = devm_gpiod_get_optional(dev, "switch",
+						     GPIOD_OUT_LOW);
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


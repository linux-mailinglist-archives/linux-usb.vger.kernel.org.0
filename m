Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABD12C0CFA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730620AbgKWOJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:09:18 -0500
Received: from mail-eopbgr40087.outbound.protection.outlook.com ([40.107.4.87]:5240
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730406AbgKWOJR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:09:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzEJKJIv8ifY5KmJiTeBIZfsJrkqc+GxfcYcIVrslpmaMQkO5+SWFNPOsYboAC9LsvSdrM/XylpaAcAUaw/ePoOby46tR6a92tu/pbUqxJ8hGgH+sqTrLXFacFDO2sOHuVQ6CSqq4QpVBXobTJ/a5dnTBNp3I6t7x2eC6SPuESyaICSv7yOW6onRqvPJxRMrg8ef0/UJXt6dJqGMXDhAIZJo8bRM4C75dgDGS6WwQqYGvx/Cd5jZF9xEJ012PXjAJxgyYENJ/S1JxaPUKs7Rk3eZFxu6W82MaSDnwZTT+6DzNvShtK6fcjCs0mtki7FiI2kDm1Amxu5gi+KwOUiuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewEsDJwYkMeMWryd/64pEBAIx0NxOSiiHoDu3fGyrCs=;
 b=fuzOLrECcLjXc/VXxhmr7+Yy52MBPkWXSq0AyaNJOiRrOt2MgZxV8C9PMp0XikWGY6kwgT94b1rMONtNRNYYsEctO6UaIu9Oow51J8/Fx+Mo8bxslYvkD1HBRphmI5Fj8ka/2f4w+Sc05GP+SPO7+tYsIcreyOWhtZkOEJC2WnY83eAq0k0ufGvN+xpgBluzG9i7dSkq1UApLGGsCr3gXqMr9bQNCutuIZiR3ZfVnslvsfMaL0K8MjrJCzaxUHbmzWujH+/ocrvF9D5dDkP9v7tPZFGb3uScnlcdlUIwVW3L4Hd85R15NeqdmoCqStX2JiFWkV76TO5wBIDG16zElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewEsDJwYkMeMWryd/64pEBAIx0NxOSiiHoDu3fGyrCs=;
 b=ANtLkP4jvmfDvpM59x3DjxAt1kCuXNg2SBxzf9857/l5S6vr7641c4la+8ip48PLqwaJ3Fu3ovjcqMZKV41N/c9w+SepNtEdyoqgkOPUiD9l0THjdD2eVRxUzf9xQcojlQaE3zjEuOXodDeGj2q6jFkIH6/S8wyjXfNmnP6O+SI=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5759.eurprd04.prod.outlook.com (2603:10a6:803:de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 14:09:12 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 14:09:12 +0000
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
Subject: [PATCH v6 6/6] usb: typec: mux: add typec switch simple driver
Date:   Mon, 23 Nov 2020 22:01:36 +0800
Message-Id: <1606140096-1382-6-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0164.apcprd06.prod.outlook.com
 (2603:1096:1:1e::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0164.apcprd06.prod.outlook.com (2603:1096:1:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 14:09:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 950c2f62-f283-4f97-3992-08d88fb95a2f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57590E5BE326E099C8EC0FF289FC0@VI1PR04MB5759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOjqrvJNLW8r78qop2vRBfkAp/zGPRJ/CdysTOllYnfkmpvi/WGDLvR78YiLvoy5Q0NRsg5vJCU3RUXSvRijO51QXuX46Nr5dWDICRusk8CWyJ0StqIlPhumCaYO+fONaAkrNDzInAdvTJG4UNqbqfDCFb1hu1F2MCzOAaERpBYh0w1heMt5pVoBoPqdIaXIv4Du45VZHp4WHaUdPx7JVscLAN9ZglbLlGziOeqACltEzJcCOF/hv8EYN3fqqlsBtwBxfdE8iPWQmVeaaDrifMExtTSqDi1JOiiH8qLY16tALAd1PVKVpSAsna/XdUbCq5APIf0vwetGWim55z00t3GItpiLo+sOr4Dti9AKswb+XmNO6D4b1zNfpKmExJ4U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(86362001)(8676002)(4326008)(26005)(69590400008)(16526019)(6666004)(186003)(6512007)(36756003)(2906002)(83380400001)(52116002)(956004)(316002)(2616005)(8936002)(6506007)(478600001)(7416002)(5660300002)(66946007)(66556008)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: d4fxjbXr8KfR5hcj9yzY/+eZiVTJkG+XCgg421Secx6uneFtG2LGIblf650+us+Lfo8LYYUh1d1E7YGvslpbb3s64bSi1VggCsGuQ9aikPpSf8t0XXmaLmdP3iQTYljNA6mx8NteJPat57uLGSJzuz1Re2ugPEUMUq71IC2usrLLGZOtwSi6gtdEFreKuaZZmZi2gTfdBDrr6jDKUyH/Wvat44TZrOcl1O+5BDad4UKrm5jDyAaxL9qFYUNCLPOOn0YJw8nf7T9xSYZXXBKkDuzsEo5WwFTpi3SUA/wy4CRJX0ufhiqw/AOlxSTM9T7SBs2jzxncEjoIdi15KersXjr3ss3V/ikTJLMiV/wSgrsYRYMDZFWIiPU8ME+HsTxKEUz7i6e5aiEuG3LDe4ptVh/8lMt0Jiup1Bhe7Zm+Unkz8B+duJfI5xn1oPJxXx3A9+mw2wxz2ZfvZ/E5oVO8Mwrxhx1t7z+xfMzGd+CNKGmrVlSzQoXs5VaP48OIf0ToCjkQXZAia1o7TUgVz6Ah2TyguLB6irBgRFFF71PgKA6afLq+YmTW1bgevVY5iVtnXporx3fQYxesh9/SNDABTZTlSOJRvYKuAMwBwTBnL38fD4JG8CAMcWqxWBvGZkLFX3SGggZ48aGayUpB81BEGNF6IEj8FiNG45cJ9qZvNbhJD+0Kj2jcXLG7GScz1ProrTCsCflZ+V017C2v3jB0C9iUYIBa7n39pii9DFIyby4y/Pth4BnfTJts+BYe5FdDSJwHu0OoLZ4sY3j6XPauXJx94ZEG9fZiQlqKG7TaI0kqm2UtX0wFVWmROz6LFREYXp7BvZLDXofcO7qVdDQSK5TBms7qHi0swDDnFWTRwiMZNZUfdXHejnsZfyAjqXFXMC+L2eYpUUBtZWC8PfVQpQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950c2f62-f283-4f97-3992-08d88fb95a2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:09:12.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLujDGNK+cuKp+PenSZqbHcBcHTmZ+UkZT3ZmnGHKDntxfCrxksAb0k/mcbkCQff
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5759
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a simple typec switch driver for cases which only
needs some simple operations but a dedicated driver is required,
current driver only supports GPIO toggle to switch the super speed
active channel according to typec orientation.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v6:
- Use general mux control for typec switch, currently only support
  max 2 GPIOs to control one typec switch with 3 states: orientation
  normal(cc1), reverse(cc2), none(deselected both channels).

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

 drivers/usb/typec/mux/Kconfig         |  10 +++
 drivers/usb/typec/mux/Makefile        |   1 +
 drivers/usb/typec/mux/switch-simple.c | 126 ++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)

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
index 0000000..4671169
--- /dev/null
+++ b/drivers/usb/typec/mux/switch-simple.c
@@ -0,0 +1,126 @@
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
+#include <linux/mux/driver.h>
+#include <linux/platform_device.h>
+#include <linux/usb/typec_mux.h>
+
+struct typec_switch_simple {
+	struct typec_switch *sw;
+	struct mux_control *mux;
+	struct gpio_descs *switch_gpios;
+};
+
+static int typec_switch_simple_mux_set(struct mux_control *mux, int state)
+{
+	struct typec_switch_simple *typec_ss = mux_chip_priv(mux->chip);
+	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
+
+	values[0] = state;
+	gpiod_set_array_value_cansleep(typec_ss->switch_gpios->ndescs,
+				       typec_ss->switch_gpios->desc,
+				       typec_ss->switch_gpios->info,
+				       values);
+
+	return 0;
+}
+
+static const struct mux_control_ops typec_switch_mux_ops = {
+	.set = typec_switch_simple_mux_set,
+};
+
+static int typec_switch_simple_probe(struct platform_device *pdev)
+{
+	struct device			*dev = &pdev->dev;
+	struct mux_chip			*mux_chip;
+	struct typec_switch_desc	sw_desc;
+	struct typec_switch_simple	*typec_ss;
+	int				idle_state;
+	int				pins;
+	int				ret;
+
+	pins = gpiod_count(dev, "switch");
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*typec_ss));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	typec_ss = mux_chip_priv(mux_chip);
+	mux_chip->ops = &typec_switch_mux_ops;
+
+	/* Get the super speed active channel selection GPIO */
+	typec_ss->switch_gpios = devm_gpiod_get_array_optional(dev,
+				 "switch", GPIOD_OUT_LOW);
+	if (IS_ERR(typec_ss->switch_gpios))
+		return PTR_ERR(typec_ss->switch_gpios);
+
+	if (pins) {
+		WARN_ON(pins != typec_ss->switch_gpios->ndescs || pins > 2);
+		mux_chip->mux->states = pins + 1;
+	}
+
+	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
+	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
+		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
+			dev_err(dev, "invalid idle-state %u\n", idle_state);
+			return -EINVAL;
+		}
+		mux_chip->mux->idle_state = idle_state;
+	}
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, typec_ss);
+	sw_desc.drvdata = typec_ss;
+	sw_desc.fwnode = dev->fwnode;
+
+	typec_ss->sw = typec_switch_register(&mux_chip->dev, &sw_desc);
+	if (IS_ERR(typec_ss->sw)) {
+		dev_err(dev, "Error registering typec switch: %ld\n",
+			PTR_ERR(typec_ss->sw));
+		return PTR_ERR(typec_ss->sw);
+	}
+
+	return 0;
+}
+
+static int typec_switch_simple_remove(struct platform_device *pdev)
+{
+	struct typec_switch_simple *typec_ss = platform_get_drvdata(pdev);
+
+	typec_switch_unregister(typec_ss->sw);
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


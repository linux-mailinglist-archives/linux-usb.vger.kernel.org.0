Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5933573612
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 14:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbiGMMJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 08:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236343AbiGMMJT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 08:09:19 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CEAF54F3;
        Wed, 13 Jul 2022 05:09:18 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DAqjXd027381;
        Wed, 13 Jul 2022 14:09:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=h9ErBV4OFrVGhHEbqfSz1GOPGdxbbtobEcRjIwKUpL8=;
 b=wl6C1YS+MWYrN0L3ZTlC2jVaFe9t4jwgMM3mO2+SaWhOlUchIFlIZEBJuGvHO20W7dtC
 I4PPJouhnI4AgxXoJwi54hrJZLka24TYzGjDZRZ9wqvnPG9IazPlT6yuJV0uIgqBVHj4
 u1sfp9opuvyvgHbGPeBGRREaI4YTJiVVPkE0GdazdGc4Of860jCd4fG4+j43lF+XQgqG
 JR5wPOyIcneqr1Rdfs9yRSJ/CeX8tugaWqjaKnmeQ0hGd7mp45mRKijhSOWXH5Neq97Q
 aUhCrnCYHzAIG8njhjXLofP+Efl77MpjROfu5ae+Qyh4uJAhSTbQn5X/UJsH/DzSJUuF hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h93cwh8wg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 14:09:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D182110003B;
        Wed, 13 Jul 2022 14:09:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD2AD21ED53;
        Wed, 13 Jul 2022 14:09:03 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 14:09:02 +0200
From:   Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To:     <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC:     <christophe.jaillet@wanadoo.fr>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <amelie.delaunay@foss.st.com>, <alexandre.torgue@foss.st.com>,
        <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 2/3] usb: typec: ucsi: stm32g0: add support for stm32g0 controller
Date:   Wed, 13 Jul 2022 14:08:41 +0200
Message-ID: <20220713120842.560902-3-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713120842.560902-1-fabrice.gasnier@foss.st.com>
References: <20220713120842.560902-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

STM32G0 provides an integrated USB Type-C and power delivery interface.
It can be programmed with a firmware to handle UCSI protocol over I2C
interface. A GPIO is used as an interrupt line.

Type-C connector can be used as a wakeup source (typically to detect
changes on the port, like attach or detach). PM suspend / resume routines
are used to enable wake irqs, and signal a wakeup event in case the IRQ
has fired while in suspend. The i2c core is doing the necessary
initialization when the "wakeup-source" flag is provided.
Note: the interrupt handler shouldn't be called before the i2c bus resumes.
So, the interrupts are disabled during suspend period, and re-enabled
upon resume, to avoid i2c transfer while suspended, from the irq handler.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v3:
- PM support squashed from v2 series as suggested by Heikki

Changes in v2:
Christophe's remarks:
- use kmalloc instead of kzalloc
- Use-after-free of buf: directly print the offset
---
 drivers/usb/typec/ucsi/Kconfig        |  10 +
 drivers/usb/typec/ucsi/Makefile       |   1 +
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 264 ++++++++++++++++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/ucsi_stm32g0.c

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 5e9b37b3f25e1..8f9c4b9f31f79 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -48,4 +48,14 @@ config UCSI_ACPI
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_acpi
 
+config UCSI_STM32G0
+	tristate "UCSI Interface Driver for STM32G0"
+	depends on I2C
+	help
+	  This driver enables UCSI support on platforms that expose a STM32G0
+	  Type-C controller over I2C interface.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called ucsi_stm32g0.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index 8a8eb5cb8e0f0..480d533d762fe 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -17,3 +17,4 @@ endif
 
 obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
+obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
new file mode 100644
index 0000000000000..e3965cbff058e
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * UCSI driver for STMicroelectronics STM32G0 Type-C PD controller
+ *
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ * Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>.
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "ucsi.h"
+
+struct ucsi_stm32g0 {
+	struct i2c_client *client;
+	struct completion complete;
+	struct device *dev;
+	unsigned long flags;
+	struct ucsi *ucsi;
+	bool suspended;
+	bool wakeup_event;
+};
+
+static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	struct i2c_client *client = g0->client;
+	u8 reg = offset;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.flags  = 0,
+			.len	= 1,
+			.buf	= &reg,
+		},
+		{
+			.addr	= client->addr,
+			.flags  = I2C_M_RD,
+			.len	= len,
+			.buf	= val,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(g0->dev, "i2c read %02x, %02x error: %d\n", client->addr, reg, ret);
+
+		return ret < 0 ? ret : -EIO;
+	}
+
+	return 0;
+}
+
+static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, const void *val,
+				    size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	struct i2c_client *client = g0->client;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.flags  = 0,
+		}
+	};
+	unsigned char *buf;
+	int ret;
+
+	buf = kmalloc(len + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = offset;
+	memcpy(&buf[1], val, len);
+	msg[0].len = len + 1;
+	msg[0].buf = buf;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	kfree(buf);
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, offset, ret);
+
+		return ret < 0 ? ret : -EIO;
+	}
+
+	return 0;
+}
+
+static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const void *val,
+				   size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	set_bit(COMMAND_PENDING, &g0->flags);
+
+	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
+		ret = -ETIMEDOUT;
+
+out_clear_bit:
+	clear_bit(COMMAND_PENDING, &g0->flags);
+
+	return ret;
+}
+
+static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
+{
+	struct ucsi_stm32g0 *g0 = data;
+	u32 cci;
+	int ret;
+
+	if (g0->suspended)
+		g0->wakeup_event = true;
+
+	ret = ucsi_stm32g0_read(g0->ucsi, UCSI_CCI, &cci, sizeof(cci));
+	if (ret)
+		return IRQ_NONE;
+
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (test_bit(COMMAND_PENDING, &g0->flags) &&
+	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
+		complete(&g0->complete);
+
+	return IRQ_HANDLED;
+}
+
+static const struct ucsi_operations ucsi_stm32g0_ops = {
+	.read = ucsi_stm32g0_read,
+	.sync_write = ucsi_stm32g0_sync_write,
+	.async_write = ucsi_stm32g0_async_write,
+};
+
+static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct ucsi_stm32g0 *g0;
+	int ret;
+
+	g0 = devm_kzalloc(dev, sizeof(*g0), GFP_KERNEL);
+	if (!g0)
+		return -ENOMEM;
+
+	g0->dev = dev;
+	g0->client = client;
+	init_completion(&g0->complete);
+	i2c_set_clientdata(client, g0);
+
+	g0->ucsi = ucsi_create(dev, &ucsi_stm32g0_ops);
+	if (IS_ERR(g0->ucsi))
+		return PTR_ERR(g0->ucsi);
+
+	ucsi_set_drvdata(g0->ucsi, g0);
+
+	/* Request alert interrupt */
+	ret = request_threaded_irq(client->irq, NULL, ucsi_stm32g0_irq_handler, IRQF_ONESHOT,
+				   dev_name(&client->dev), g0);
+	if (ret) {
+		dev_err_probe(dev, ret, "request IRQ failed\n");
+		goto destroy;
+	}
+
+	ret = ucsi_register(g0->ucsi);
+	if (ret) {
+		dev_err_probe(dev, ret, "ucsi_register failed\n");
+		goto freeirq;
+	}
+
+	return 0;
+
+freeirq:
+	free_irq(client->irq, g0);
+destroy:
+	ucsi_destroy(g0->ucsi);
+
+	return ret;
+}
+
+static int ucsi_stm32g0_remove(struct i2c_client *client)
+{
+	struct ucsi_stm32g0 *g0 = i2c_get_clientdata(client);
+
+	ucsi_unregister(g0->ucsi);
+	free_irq(client->irq, g0);
+	ucsi_destroy(g0->ucsi);
+
+	return 0;
+}
+
+static int ucsi_stm32g0_suspend(struct device *dev)
+{
+	struct ucsi_stm32g0 *g0 = dev_get_drvdata(dev);
+	struct i2c_client *client = g0->client;
+
+	/* Keep the interrupt disabled until the i2c bus has been resumed */
+	disable_irq(client->irq);
+
+	g0->suspended = true;
+	g0->wakeup_event = false;
+
+	if (device_may_wakeup(dev) || device_wakeup_path(dev))
+		enable_irq_wake(client->irq);
+
+	return 0;
+}
+
+static int ucsi_stm32g0_resume(struct device *dev)
+{
+	struct ucsi_stm32g0 *g0 = dev_get_drvdata(dev);
+	struct i2c_client *client = g0->client;
+
+	if (device_may_wakeup(dev) || device_wakeup_path(dev))
+		disable_irq_wake(client->irq);
+
+	enable_irq(client->irq);
+
+	/* Enforce any pending handler gets called to signal a wakeup_event */
+	synchronize_irq(client->irq);
+
+	if (g0->wakeup_event)
+		pm_wakeup_event(g0->dev, 0);
+
+	g0->suspended = false;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_stm32g0_pm_ops, ucsi_stm32g0_suspend, ucsi_stm32g0_resume);
+
+static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] = {
+	{ .compatible = "st,stm32g0-typec" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ucsi_stm32g0_typec_of_match);
+
+static const struct i2c_device_id ucsi_stm32g0_typec_i2c_devid[] = {
+	{"stm32g0-typec", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ucsi_stm32g0_typec_i2c_devid);
+
+static struct i2c_driver ucsi_stm32g0_i2c_driver = {
+	.driver = {
+		.name = "ucsi-stm32g0-i2c",
+		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
+		.pm = pm_sleep_ptr(&ucsi_stm32g0_pm_ops),
+	},
+	.probe = ucsi_stm32g0_probe,
+	.remove = ucsi_stm32g0_remove,
+	.id_table = ucsi_stm32g0_typec_i2c_devid
+};
+module_i2c_driver(ucsi_stm32g0_i2c_driver);
+
+MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32G0 Type-C controller");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:ucsi-stm32g0");
-- 
2.25.1


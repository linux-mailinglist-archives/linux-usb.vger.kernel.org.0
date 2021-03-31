Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B6534D9A0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 23:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbhC2Vem (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 17:34:42 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46767 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhC2Ve1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 17:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617053667; x=1648589667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ouuKmK1tT5f/XSKQEwLkolpYHk5kYVEvIHKQrcf4+0A=;
  b=JnzzrWdA0TvXDp/gRBT75oA9NH+aDVVdP/WyWZ5FtGUdczalgpLlNq4I
   RsmNd9nSg44tSFuBLCjo4RboZ1YHZ1ujY3wuBdY7oFf7V6UJDFw9o+y3a
   5j7rkZzHFtchCjbqeo64s2d69Ovb8YqDgvCaUTGk0kgfiX+1nVhPZBrar
   sAYHD1n5BwjOMHOdm+wGWApu+nHTYbqhWFPhANb0RCIwOx2Z8K4o0OTAU
   B7Yit3i2kNb8dY12s6qmfvB/oO4F/bkOhkG5k03eCZxPXIdYCLnp6sw+T
   /fmy1C6BUsgq0KzaDXgM8EMe3BCmhVdXhUHck85noolabLeQJE9wic5ig
   g==;
IronPort-SDR: Ky5ev9pBVpZ7doQ26qCNJpFy4+cwfihrRABWK8vltLeI9PtbD6rbo8YTHskiYAn8AgMsYzuoTy
 vvzEkBWZ13VgaHc1pCpErqJ0iLCGjk0BzC/nnfX8GfUvHA3Y25JBFOePfqu8tu8pMlW8znX9At
 Z5XYJ2AUZ7wOs92sAps0UT++AXrVyz9yM7xF3r+yFGNjcbwVTMcsQiw/ecqov8gfpCtxyptGsJ
 1gcS8qDGrRbMAZHCGE/nZZmIUXdU0BHQdWYVhpzEaiod7h/wrmxElxqXTe2wPbbroWR0pWtYJu
 wTs=
X-IronPort-AV: E=Sophos;i="5.81,288,1610434800"; 
   d="scan'208";a="120956204"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2021 14:34:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 29 Mar 2021 14:34:26 -0700
Received: from cristi-P53.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 29 Mar 2021 14:34:24 -0700
From:   <cristian.birsan@microchip.com>
To:     <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Cristian Birsan <cristian.birsan@microchip.com>
Subject: [RFC PATCH 2/2] usb: typec: sama7g5_tcpc: add driver for Microchip sama7g5 tcpc
Date:   Tue, 30 Mar 2021 00:33:57 +0300
Message-ID: <20210329213357.431083-3-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329213357.431083-1-cristian.birsan@microchip.com>
References: <20210329213357.431083-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Cristian Birsan <cristian.birsan@microchip.com>

This patch adds initial driver support for the new Microchip USB
Type-C Port Controller (TCPC) embedded in sama7g5 SoC.

Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
---
 drivers/usb/typec/tcpm/Kconfig        |   8 +
 drivers/usb/typec/tcpm/Makefile       |   1 +
 drivers/usb/typec/tcpm/sama7g5_tcpc.c | 602 ++++++++++++++++++++++++++
 3 files changed, 611 insertions(+)
 create mode 100644 drivers/usb/typec/tcpm/sama7g5_tcpc.c

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 557f392fe24d..8ba0fd85741f 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -52,6 +52,14 @@ config TYPEC_FUSB302
 	  Type-C Port Controller Manager to provide USB PD and USB
 	  Type-C functionalities.
 
+config TYPEC_SAMA7G5
+	tristate "Microchip SAMA7G5 Type-C Port Controller driver"
+	select REGMAP_MMIO
+	help
+	  Say Y or M here if your system has SAMA7G5 TCPC controller.
+	  It works with Type-C Port Controller Manager to provide USB
+	  Type-C functionalities.
+
 config TYPEC_WCOVE
 	tristate "Intel WhiskeyCove PMIC USB Type-C PHY driver"
 	depends on ACPI
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7d499f3569fd..9abe8a7ae1cc 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC_TCPM)		+= tcpm.o
 obj-$(CONFIG_TYPEC_FUSB302)		+= fusb302.o
+obj-$(CONFIG_TYPEC_SAMA7G5)		+= sama7g5_tcpc.o
 obj-$(CONFIG_TYPEC_WCOVE)		+= typec_wcove.o
 typec_wcove-y				:= wcove.o
 obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
diff --git a/drivers/usb/typec/tcpm/sama7g5_tcpc.c b/drivers/usb/typec/tcpm/sama7g5_tcpc.c
new file mode 100644
index 000000000000..d1a912976418
--- /dev/null
+++ b/drivers/usb/typec/tcpm/sama7g5_tcpc.c
@@ -0,0 +1,602 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Microchip SAMA7G5 Type-C Port Controller Driver
+ *
+ * Copyright (C) 2021 Microchip Technology, Inc. and its subsidiaries
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/tcpm.h>
+#include <linux/usb/typec.h>
+
+#define SAMA7G5_TCPC_GCLK				32000
+
+/* TCPC registers offsets */
+#define TCPC_CR			0x80		/* TCPC Control Register */
+#define TCPC_UPC		0xA0		/* TCPC PHY Control Register */
+#define TCPC_UPS		0xA4		/* TCPC PHY Status Register */
+
+#define TCPC_CR_RESET		0x54434301	/* Magic value */
+
+/* TCPC PHY Control Register */
+#define TCPC_UPC_BCDETE		BIT(29)
+#define TCPC_UPC_BCVSRCE	BIT(28)
+#define	TCPC_UPC_BCDETSEL	BIT(27)
+#define	TCPC_UPC_BCIDPSRCE	BIT(26)
+#define TCPC_UPC_DMPDFE		BIT(25)
+#define TCPC_UPC_DMPDFD		BIT(24)
+#define TCPC_UPC_IP_OFF		(0 << 12)
+#define TCPC_UPC_IP_0P5		(1 << 12)
+#define TCPC_UPC_IP_1P5		(2 << 12)
+#define TCPC_UPC_IP_3P0		(3 << 12)
+#define TCPC_UPC_THRESHOLD0	(0 << 8)
+#define TCPC_UPC_THRESHOLD2	(2 << 8)
+#define TCPC_UPC_THRESHOLD4	(4 << 8)
+#define TCPC_UPC_THRESHOLD6	(6 << 8)
+
+/* TCPC PHY  Status Register */
+#define TCPC_UPS_CC2RDT		BIT(4)
+#define TCPC_UPS_CC1ID		BIT(3)
+#define TCPC_UPS_CC_MASK	GENMASK(4, 3)
+#define TCPC_UPS_CHGDCP		BIT(2)
+#define TCPC_UPS_DM		BIT(1)
+#define TCPC_UPS_DP		BIT(0)
+
+#define TCPC_VERSION		0xFC
+
+/* USB Type-C measurement timings */
+#define T_CC_MEASURE		100 /* 100 ms */
+
+#define SAMA7G5_TCPC_VBUS_IRQFLAGS (IRQF_ONESHOT \
+			   | IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING)
+
+struct sama7g5_tcpc {
+	struct device *dev;
+
+	struct workqueue_struct *wq;
+	struct delayed_work measure_work;
+
+	struct regmap *regmap;
+	void __iomem *base;
+
+	struct clk *pclk;
+	struct clk *gclk;
+
+	struct gpio_desc *vbus_pin;
+	struct regulator *vbus;
+
+	/* lock for sharing states */
+	struct mutex lock;
+
+	/* port status */
+	enum typec_cc_polarity cc_polarity;
+	enum typec_cc_status cc1_status;
+	enum typec_cc_status cc2_status;
+	enum typec_cc_status cc1_status_prev;
+	enum typec_cc_status cc2_status_prev;
+
+	/* mutex used for VBUS detection */
+	struct mutex vbus_mutex;
+	int vbus_present;
+	int vbus_present_prev;
+
+	unsigned int phy_status;
+	unsigned int phy_status_old;
+
+	struct tcpc_dev tcpc;
+	struct tcpm_port *tcpm;
+};
+
+#define tcpc_to_sama7g5_tcpc(_tcpc_) \
+		container_of(_tcpc_, struct sama7g5_tcpc, tcpc)
+
+static bool sama7g5_tcpc_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TCPC_CR:
+	case TCPC_UPC:
+	case TCPC_UPS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool sama7g5_tcpc_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TCPC_CR:
+	case TCPC_UPC:
+	case TCPC_UPS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config sama7g5_tcpc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = TCPC_VERSION,
+	.readable_reg = sama7g5_tcpc_readable_reg,
+	.writeable_reg = sama7g5_tcpc_writeable_reg,
+};
+
+static int sama7g5_tcpc_get_vbus(struct tcpc_dev *tcpc)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc = tcpc_to_sama7g5_tcpc(tcpc);
+	int ret;
+
+	mutex_lock(&sama7g5_tcpc->vbus_mutex);
+	ret = sama7g5_tcpc->vbus_present ? 1 : 0;
+	mutex_unlock(&sama7g5_tcpc->vbus_mutex);
+
+	return ret;
+}
+
+static int sama7g5_tcpc_set_vbus(struct tcpc_dev *tcpc, bool on, bool sink)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc = tcpc_to_sama7g5_tcpc(tcpc);
+	int ret;
+
+	mutex_lock(&sama7g5_tcpc->vbus_mutex);
+	if (on)
+		ret = regulator_enable(sama7g5_tcpc->vbus);
+	else
+		ret = regulator_disable(sama7g5_tcpc->vbus);
+	mutex_unlock(&sama7g5_tcpc->vbus_mutex);
+
+	return ret;
+}
+
+static int sama7g5_tcpc_set_vconn(struct tcpc_dev *tcpc, bool on)
+{
+	/* VCONN is not supported */
+	return -EPERM;
+}
+
+static int sama7g5_tcpc_get_cc(struct tcpc_dev *tcpc, enum typec_cc_status *cc1,
+			       enum typec_cc_status *cc2)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc = tcpc_to_sama7g5_tcpc(tcpc);
+
+	mutex_lock(&sama7g5_tcpc->lock);
+	*cc1 = sama7g5_tcpc->cc1_status;
+	*cc2 = sama7g5_tcpc->cc2_status;
+	mutex_unlock(&sama7g5_tcpc->lock);
+
+	return 0;
+}
+
+static int sama7g5_tcpc_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc = tcpc_to_sama7g5_tcpc(tcpc);
+	unsigned int ctrl;
+	int ret = 0;
+
+	mutex_lock(&sama7g5_tcpc->lock);
+	switch (cc) {
+	case TYPEC_CC_RD:
+		ctrl = TCPC_UPC_IP_OFF;
+		break;
+	case TYPEC_CC_RP_DEF:
+		ctrl = TCPC_UPC_IP_0P5;
+		break;
+	default:
+		ret =  -EINVAL;
+		goto done;
+	}
+	ret = regmap_write(sama7g5_tcpc->regmap, TCPC_UPC, ctrl);
+done:
+	mutex_unlock(&sama7g5_tcpc->lock);
+	return ret;
+}
+
+static int sama7g5_tcpc_set_polarity(struct tcpc_dev *tcpc,
+				     enum typec_cc_polarity pol)
+{
+	return 0;
+}
+
+static int sama7g5_tcpc_set_roles(struct tcpc_dev *tcpc, bool attached,
+			   enum typec_role role, enum typec_data_role data)
+{
+	return 0;
+}
+
+static int sama7g5_tcpc_set_pd_rx(struct tcpc_dev *tcpc, bool on)
+{
+	return -EPERM;
+}
+
+static int sama7g5_tcpc_pd_transmit(struct tcpc_dev *tcpc,
+				    enum tcpm_transmit_type type,
+				    const struct pd_message *msg)
+{
+	return -EPERM;
+}
+
+static int sama7g5_tcpc_start_toggling(struct tcpc_dev *tcpc,
+				       enum typec_port_type port_type,
+				       enum typec_cc_status cc)
+{
+	return -EOPNOTSUPP;
+}
+
+static void _sama7g5_tcpc_measure_snk(struct sama7g5_tcpc *sama7g5_tcpc)
+{
+	int ret;
+
+	/* Save previous CC1/CC2 state */
+	sama7g5_tcpc->cc1_status_prev = sama7g5_tcpc->cc1_status;
+	sama7g5_tcpc->cc2_status_prev = sama7g5_tcpc->cc2_status;
+
+	/* Comparator Threshold 2 */
+	ret = regmap_write(sama7g5_tcpc->regmap, TCPC_UPC, TCPC_UPC_IP_OFF |
+			   TCPC_UPC_THRESHOLD2);
+	if (ret)
+		dev_err(sama7g5_tcpc->dev, "failed to wite register: %d\n",
+			ret);
+
+	usleep_range(560, 1000);
+
+	ret = regmap_read(sama7g5_tcpc->regmap, TCPC_UPS,
+			  &sama7g5_tcpc->phy_status);
+	if (ret)
+		dev_err(sama7g5_tcpc->dev, "failed to read register: %d\n",
+			ret);
+
+	if (!(sama7g5_tcpc->phy_status & TCPC_UPS_CC_MASK)) {
+		/* VRa*/
+		sama7g5_tcpc->cc1_status = TYPEC_CC_OPEN;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_OPEN;
+		return;
+	}
+
+	/* CC1 or CC2 is connected wait for PD messages to end ~ 30ms */
+	usleep_range(30000, 35000);
+
+	/* Comparator Threshold 4 */
+	sama7g5_tcpc->phy_status_old = sama7g5_tcpc->phy_status;
+
+	ret = regmap_write(sama7g5_tcpc->regmap, TCPC_UPC, TCPC_UPC_IP_OFF |
+			   TCPC_UPC_THRESHOLD4);
+	if (ret)
+		dev_err(sama7g5_tcpc->dev, "failed to wite register: %d\n",
+			ret);
+
+	usleep_range(560, 1000);
+	ret = regmap_read(sama7g5_tcpc->regmap, TCPC_UPS,
+			  &sama7g5_tcpc->phy_status);
+	if (ret)
+		dev_err(sama7g5_tcpc->dev, "failed to read register: %d\n",
+			ret);
+
+	if ((sama7g5_tcpc->phy_status_old & TCPC_UPS_CC1ID) &&
+	    (!(sama7g5_tcpc->phy_status & TCPC_UPS_CC1ID))) {
+		sama7g5_tcpc->cc1_status = TYPEC_CC_RP_DEF;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_OPEN;
+		return;
+	}
+
+	if ((sama7g5_tcpc->phy_status_old & TCPC_UPS_CC2RDT) &&
+	    (!(sama7g5_tcpc->phy_status & TCPC_UPS_CC2RDT))) {
+		sama7g5_tcpc->cc1_status = TYPEC_CC_OPEN;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_RP_DEF;
+		return;
+	}
+
+	/* Comparator Threshold 6 */
+	sama7g5_tcpc->phy_status_old = sama7g5_tcpc->phy_status;
+
+	ret = regmap_write(sama7g5_tcpc->regmap, TCPC_UPC, TCPC_UPC_IP_OFF |
+			   TCPC_UPC_THRESHOLD6);
+	if (ret)
+		dev_err(sama7g5_tcpc->dev, "failed to wite register: %d\n",
+			ret);
+
+	usleep_range(560, 1000);
+	ret = regmap_read(sama7g5_tcpc->regmap, TCPC_UPS,
+			  &sama7g5_tcpc->phy_status);
+	if (ret)
+		dev_err(sama7g5_tcpc->dev, "failed to read register: %d\n",
+			ret);
+
+	if ((sama7g5_tcpc->phy_status_old & TCPC_UPS_CC1ID) &&
+	    (!(sama7g5_tcpc->phy_status & TCPC_UPS_CC1ID))) {
+		sama7g5_tcpc->cc1_status = TYPEC_CC_RP_1_5;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_OPEN;
+		return;
+	}
+
+	if ((sama7g5_tcpc->phy_status_old & TCPC_UPS_CC1ID) &&
+	    ((sama7g5_tcpc->phy_status & TCPC_UPS_CC1ID))) {
+		sama7g5_tcpc->cc1_status = TYPEC_CC_RP_3_0;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_OPEN;
+		return;
+	}
+
+	if ((sama7g5_tcpc->phy_status_old & TCPC_UPS_CC2RDT) &&
+	    (!(sama7g5_tcpc->phy_status & TCPC_UPS_CC2RDT))) {
+		sama7g5_tcpc->cc1_status = TYPEC_CC_OPEN;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_RP_1_5;
+		return;
+	}
+
+	if ((sama7g5_tcpc->phy_status_old & TCPC_UPS_CC2RDT) &&
+	    ((sama7g5_tcpc->phy_status & TCPC_UPS_CC2RDT))) {
+		sama7g5_tcpc->cc1_status = TYPEC_CC_OPEN;
+		sama7g5_tcpc->cc2_status = TYPEC_CC_RP_3_0;
+		return;
+	}
+}
+
+static void sama7g5_tcpc_measure_work(struct work_struct *work)
+{
+	struct sama7g5_tcpc *port = container_of(work, struct sama7g5_tcpc,
+						 measure_work.work);
+
+	mutex_lock(&port->lock);
+
+	_sama7g5_tcpc_measure_snk(port);
+
+	/* Check if the state has changed and notify TCPM */
+	if (port->cc1_status != port->cc1_status_prev ||
+	    port->cc2_status != port->cc2_status_prev)
+		tcpm_cc_change(port->tcpm);
+
+	mod_delayed_work(port->wq, &port->measure_work,
+			 msecs_to_jiffies(T_CC_MEASURE));
+
+	mutex_unlock(&port->lock);
+}
+
+static int sama7g5_tcpc_init(struct tcpc_dev *tcpc)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc = tcpc_to_sama7g5_tcpc(tcpc);
+	int ret;
+
+	ret = regmap_write(sama7g5_tcpc->regmap, TCPC_CR, TCPC_CR_RESET);
+	if (ret)
+		return ret;
+
+	sama7g5_tcpc->wq =
+		create_singlethread_workqueue(dev_name(sama7g5_tcpc->dev));
+	if (!sama7g5_tcpc->wq)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&sama7g5_tcpc->measure_work,
+			  sama7g5_tcpc_measure_work);
+
+	sama7g5_tcpc->cc1_status = TYPEC_CC_OPEN;
+	sama7g5_tcpc->cc2_status = TYPEC_CC_OPEN;
+	sama7g5_tcpc->cc1_status_prev = TYPEC_CC_OPEN;
+	sama7g5_tcpc->cc2_status_prev = TYPEC_CC_OPEN;
+	sama7g5_tcpc->cc_polarity = TYPEC_POLARITY_CC1;
+
+	/* We do not have an interrupt so polling only */
+	mod_delayed_work(sama7g5_tcpc->wq, &sama7g5_tcpc->measure_work,
+			 msecs_to_jiffies(T_CC_MEASURE));
+
+	/* Enable VBUS detection */
+	if (sama7g5_tcpc->vbus_pin)
+		enable_irq(gpiod_to_irq(sama7g5_tcpc->vbus_pin));
+
+	return 0;
+}
+
+static int vbus_is_present(struct sama7g5_tcpc *sama7g5_tcpc)
+{
+	if (sama7g5_tcpc->vbus_pin)
+		return gpiod_get_value(sama7g5_tcpc->vbus_pin);
+
+	/* No Vbus detection: Assume always present */
+	return 1;
+}
+
+static irqreturn_t sama7g5_vbus_irq_thread(int irq, void *devid)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc = devid;
+
+	/* debounce */
+	udelay(10);
+
+	mutex_lock(&sama7g5_tcpc->vbus_mutex);
+
+	sama7g5_tcpc->vbus_present = vbus_is_present(sama7g5_tcpc);
+	if (sama7g5_tcpc->vbus_present != sama7g5_tcpc->vbus_present_prev) {
+		/* VBUS changed, notify TCPM */
+		tcpm_vbus_change(sama7g5_tcpc->tcpm);
+		sama7g5_tcpc->vbus_present_prev = sama7g5_tcpc->vbus_present;
+	}
+
+	mutex_unlock(&sama7g5_tcpc->vbus_mutex);
+	return IRQ_HANDLED;
+}
+
+static int sama7g5_tcpc_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct sama7g5_tcpc *sama7g5_tcpc;
+
+	struct resource *mem;
+	void __iomem *base;
+
+	sama7g5_tcpc = devm_kzalloc(&pdev->dev, sizeof(*sama7g5_tcpc),
+				    GFP_KERNEL);
+	if (!sama7g5_tcpc)
+		return -ENOMEM;
+
+	mem =  platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+	sama7g5_tcpc->base = base;
+
+	sama7g5_tcpc->regmap =  devm_regmap_init_mmio(&pdev->dev, base,
+						&sama7g5_tcpc_regmap_config);
+	if (IS_ERR(sama7g5_tcpc->regmap)) {
+		dev_err(&pdev->dev, "Regmap init failed\n");
+		return PTR_ERR(sama7g5_tcpc->regmap);
+	}
+
+	/* Get the peripheral clock */
+	sama7g5_tcpc->pclk = devm_clk_get(&pdev->dev, "pclk");
+	if (IS_ERR(sama7g5_tcpc->pclk)) {
+		ret = PTR_ERR(sama7g5_tcpc->pclk);
+		dev_err(&pdev->dev,
+			"failed to get the peripheral clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(sama7g5_tcpc->pclk);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"failed to enable the peripheral clock: %d\n", ret);
+		return ret;
+	}
+
+	/* Get the generic clock */
+	sama7g5_tcpc->gclk = devm_clk_get(&pdev->dev, "gclk");
+	if (IS_ERR(sama7g5_tcpc->gclk)) {
+		ret = PTR_ERR(sama7g5_tcpc->gclk);
+		dev_err(&pdev->dev,
+			"failed to get the PMC generic clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_rate(sama7g5_tcpc->gclk, SAMA7G5_TCPC_GCLK);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"unable to change gclk rate to: %u\n",
+			SAMA7G5_TCPC_GCLK);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(sama7g5_tcpc->gclk);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"failed to enable the generic clock: %d\n", ret);
+		return ret;
+	}
+
+	mutex_init(&sama7g5_tcpc->lock);
+	mutex_init(&sama7g5_tcpc->vbus_mutex);
+
+	sama7g5_tcpc->vbus_pin = devm_gpiod_get_optional(&pdev->dev,
+				"microchip,vbus", GPIOD_IN);
+
+	if (IS_ERR(sama7g5_tcpc->vbus_pin)) {
+		ret = PTR_ERR(sama7g5_tcpc->vbus_pin);
+		dev_err(&pdev->dev, "unable to claim vbus-gpio: %d\n", ret);
+	}
+
+	sama7g5_tcpc->vbus = devm_regulator_get_optional(&pdev->dev, "vbus");
+
+	if (IS_ERR(sama7g5_tcpc->vbus)) {
+		ret = PTR_ERR(sama7g5_tcpc->vbus);
+		dev_err(&pdev->dev, "unable to claim vbus-supply: %d\n", ret);
+	}
+
+	if (sama7g5_tcpc->vbus_pin) {
+		irq_set_status_flags(gpiod_to_irq(sama7g5_tcpc->vbus_pin),
+				     IRQ_NOAUTOEN);
+		ret = devm_request_threaded_irq(&pdev->dev,
+				gpiod_to_irq(sama7g5_tcpc->vbus_pin), NULL,
+				sama7g5_vbus_irq_thread,
+				SAMA7G5_TCPC_VBUS_IRQFLAGS,
+				"sama7g5_tcpc", sama7g5_tcpc);
+		if (ret) {
+			sama7g5_tcpc->vbus_pin = NULL;
+			dev_warn(&pdev->dev,
+				 "failed to request vbus irq; "
+				 "assuming always on\n");
+		}
+	}
+
+	sama7g5_tcpc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, sama7g5_tcpc);
+
+	sama7g5_tcpc->tcpc.init = sama7g5_tcpc_init;
+	sama7g5_tcpc->tcpc.get_vbus = sama7g5_tcpc_get_vbus;
+	sama7g5_tcpc->tcpc.set_vbus = sama7g5_tcpc_set_vbus;
+	sama7g5_tcpc->tcpc.set_cc = sama7g5_tcpc_set_cc;
+	sama7g5_tcpc->tcpc.get_cc = sama7g5_tcpc_get_cc;
+	sama7g5_tcpc->tcpc.set_polarity = sama7g5_tcpc_set_polarity;
+	sama7g5_tcpc->tcpc.set_vconn = sama7g5_tcpc_set_vconn;
+	sama7g5_tcpc->tcpc.start_toggling = sama7g5_tcpc_start_toggling;
+	sama7g5_tcpc->tcpc.set_pd_rx = sama7g5_tcpc_set_pd_rx;
+	sama7g5_tcpc->tcpc.set_roles = sama7g5_tcpc_set_roles;
+	sama7g5_tcpc->tcpc.pd_transmit = sama7g5_tcpc_pd_transmit;
+
+	sama7g5_tcpc->tcpc.fwnode = device_get_named_child_node(&pdev->dev,
+								"connector");
+	if (!sama7g5_tcpc->tcpc.fwnode) {
+		dev_err(&pdev->dev, "Can't find connector node.\n");
+		return -EINVAL;
+	}
+
+	sama7g5_tcpc->tcpm = tcpm_register_port(sama7g5_tcpc->dev,
+						&sama7g5_tcpc->tcpc);
+	if (IS_ERR(sama7g5_tcpc->tcpm)) {
+		fwnode_remove_software_node(sama7g5_tcpc->tcpc.fwnode);
+		return PTR_ERR(sama7g5_tcpc->tcpm);
+	}
+
+	return 0;
+}
+
+static int sama7g5_tcpc_remove(struct platform_device *pdev)
+{
+	struct sama7g5_tcpc *sama7g5_tcpc;
+
+	sama7g5_tcpc = platform_get_drvdata(pdev);
+
+	/* Mask everything */
+	if (sama7g5_tcpc->vbus_pin)
+		disable_irq(gpiod_to_irq(sama7g5_tcpc->vbus_pin));
+
+
+	if (!IS_ERR_OR_NULL(sama7g5_tcpc->tcpm))
+		tcpm_unregister_port(sama7g5_tcpc->tcpm);
+
+	destroy_workqueue(sama7g5_tcpc->wq);
+
+	clk_disable_unprepare(sama7g5_tcpc->gclk);
+	clk_disable_unprepare(sama7g5_tcpc->pclk);
+
+	return 0;
+}
+
+static const struct of_device_id sama7g5_tcpc_dt_ids[] = {
+	{
+		.compatible = "microchip,sama7g5-tcpc",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sama7g5_tcpc_dt_ids);
+
+static struct platform_driver sama7g5_tcpc_driver = {
+	.probe	= sama7g5_tcpc_probe,
+	.remove = sama7g5_tcpc_remove,
+	.driver = {
+		.name	= "microchip,sama7g5-tcpc",
+		.of_match_table	= sama7g5_tcpc_dt_ids,
+	},
+};
+module_platform_driver(sama7g5_tcpc_driver);
+
+MODULE_AUTHOR("Cristian Birsan <cristian.birsan@microchip.com>");
+MODULE_DESCRIPTION("Microchip SAMA7G5 Type-C Port Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


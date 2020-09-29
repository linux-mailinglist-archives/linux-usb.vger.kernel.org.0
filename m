Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AE227BAEE
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgI2CkZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgI2CkS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:18 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C2CC061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:18 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id k17so1965373pgb.7
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=MQt23mwW+jHpRe+5MPAemrlti0Kst1XYhH+Yan/jInE=;
        b=VcjUCQivmJidW0FSVDXrWjin/xou/+aAMEDf0zZ5oIR8u5Unlp1leTAoAUU02gAktc
         QabmTrKrMIlw67AYnjTnKexVJi3q+n1AdpWe7Z2DK0vrA82JQ70GhOuMpQyF8AzecNOD
         AhO/tmyZKkJORrFg7DkMcm15IpQB+CSk3ODmyGvkXv7hADXrJ2ue5RNO+HqrowQlSz9J
         47jC1S6JmO3ukwRMsnDajkzIcTS0TidiONNxF1yejOXrJw5YA17H08VmvIK5qTv7NGwp
         pZ/i5eEJwaVRJOADD97CDTq6+2Icvqd11b/CKrIjD8uXAUEnzeC31EZwPKfkX1WFijx3
         hHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MQt23mwW+jHpRe+5MPAemrlti0Kst1XYhH+Yan/jInE=;
        b=GJ2/nuFUJD16AVlqg4j72HPKotQsgSmbmoBDDAqrWBxgAQ23AvSdvcB0xGcqwQDlSN
         7NX9lQM0LHwFi+v8P5dyuLvFOooZobTwINUbQkdcuMRVHDSOm2aQw5Ptoxn6FavuYwNL
         xGLT9fr64DeCwot90mFAnL06VmglTQWHhY4QwN9AlcE8ROTukmeyurIxVs4kZLNLs7io
         zgVYxE5VIAYB+z3e4HPqHVeKVKjYnWWRbdx+OHaYJxBdMPeez0ZspDkpF7WYWZkVmIv2
         AixD7JRNHkkjriUNW8lG/0kd0KRKgUQYdd6ptEahDCUMgxwSL7k97naaCAOP2oOVU/lB
         mnng==
X-Gm-Message-State: AOAM531VTazEnO+1svbo43fXfW/uOZxfvEuxqX84j1pKZTt5cown+Lde
        lHCtW/ZLRutrkJSm1VpjAK+QzW8wNrQ=
X-Google-Smtp-Source: ABdhPJzZtAAKMPvR0CUMTHkRxUKEzE7QHDyS7RoRMtEN0JtfG7qcE11hku095SqFe3enwdBTlIERNCdia50=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a62:ac18:0:b029:142:2501:34ef with SMTP id
 v24-20020a62ac180000b0290142250134efmr1961478pfe.72.1601347218065; Mon, 28
 Sep 2020 19:40:18 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:53 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-5-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 04/15] usb: typec: tcpci_maxim: Chip level TCPC driver
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Chip level TCPC driver for Maxim's TCPCI implementation.
This TCPC implementation does not support the following
commands: COMMAND.SinkVbus, COMMAND.SourceVbusDefaultVoltage,
COMMAND.SourceVbusHighVoltage. Instead the sinking and sourcing
from vbus is supported by writes to custom registers.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.
- Removed setting USB_PSY and terminating description with period as
  suggested by Randy.

Changes since v6:
- Addressed Heikki comments:
  - Removed TX discarded message
  - Removed the redundant TCPC_POWER_STATUS_UNINIT check
- Cleaned up irq setup routine

Changes since v7:
- Added reviewed-by: Heikki

Changes since v8:
- None
---
 drivers/usb/typec/tcpm/Kconfig       |   6 +
 drivers/usb/typec/tcpm/Makefile      |  15 +-
 drivers/usb/typec/tcpm/tcpci.h       |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim.c | 461 +++++++++++++++++++++++++++
 4 files changed, 476 insertions(+), 7 deletions(-)
 create mode 100644 drivers/usb/typec/tcpm/tcpci_maxim.c

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 58a64e1bf627..557f392fe24d 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -35,6 +35,12 @@ config TYPEC_MT6360
 	  USB Type-C. It works with Type-C Port Controller Manager
 	  to provide USB PD and USB Type-C functionalities.
 
+config TYPEC_TCPCI_MAXIM
+	tristate "Maxim TCPCI based Type-C chip driver"
+	help
+	  MAXIM TCPCI based Type-C/PD chip driver. Works with
+	  with Type-C Port Controller Manager.
+
 endif # TYPEC_TCPCI
 
 config TYPEC_FUSB302
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7592ccb8c526..7d499f3569fd 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_TYPEC_TCPM)	+= tcpm.o
-obj-$(CONFIG_TYPEC_FUSB302)	+= fusb302.o
-obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
-typec_wcove-y			:= wcove.o
-obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
-obj-$(CONFIG_TYPEC_RT1711H)	+= tcpci_rt1711h.o
-obj-$(CONFIG_TYPEC_MT6360)	+= tcpci_mt6360.o
+obj-$(CONFIG_TYPEC_TCPM)		+= tcpm.o
+obj-$(CONFIG_TYPEC_FUSB302)		+= fusb302.o
+obj-$(CONFIG_TYPEC_WCOVE)		+= typec_wcove.o
+typec_wcove-y				:= wcove.o
+obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
+obj-$(CONFIG_TYPEC_RT1711H)		+= tcpci_rt1711h.o
+obj-$(CONFIG_TYPEC_MT6360)		+= tcpci_mt6360.o
+obj-$(CONFIG_TYPEC_TCPCI_MAXIM)		+= tcpci_maxim.o
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 4d441bdf24d5..82f021a82456 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -109,6 +109,7 @@
 
 #define TCPC_RX_BYTE_CNT		0x30
 #define TCPC_RX_BUF_FRAME_TYPE		0x31
+#define TCPC_RX_BUF_FRAME_TYPE_SOP	0
 #define TCPC_RX_HDR			0x32
 #define TCPC_RX_DATA			0x34 /* through 0x4f */
 
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
new file mode 100644
index 000000000000..91337ddb4962
--- /dev/null
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020, Google LLC
+ *
+ * MAXIM TCPCI based TCPC driver
+ */
+
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/tcpm.h>
+#include <linux/usb/typec.h>
+
+#include "tcpci.h"
+
+#define PD_ACTIVITY_TIMEOUT_MS				10000
+
+#define TCPC_VENDOR_ALERT				0x80
+
+#define TCPC_RECEIVE_BUFFER_COUNT_OFFSET		0
+#define TCPC_RECEIVE_BUFFER_FRAME_TYPE_OFFSET		1
+#define TCPC_RECEIVE_BUFFER_RX_BYTE_BUF_OFFSET		2
+
+/*
+ * LongMessage not supported, hence 32 bytes for buf to be read from RECEIVE_BUFFER.
+ * DEVICE_CAPABILITIES_2.LongMessage = 0, the value in READABLE_BYTE_COUNT reg shall be
+ * less than or equal to 31. Since, RECEIVE_BUFFER len = 31 + 1(READABLE_BYTE_COUNT).
+ */
+#define TCPC_RECEIVE_BUFFER_LEN				32
+
+#define MAX_BUCK_BOOST_SID				0x69
+#define MAX_BUCK_BOOST_OP				0xb9
+#define MAX_BUCK_BOOST_OFF				0
+#define MAX_BUCK_BOOST_SOURCE				0xa
+#define MAX_BUCK_BOOST_SINK				0x5
+
+struct max_tcpci_chip {
+	struct tcpci_data data;
+	struct tcpci *tcpci;
+	struct device *dev;
+	struct i2c_client *client;
+	struct tcpm_port *port;
+};
+
+static const struct regmap_range max_tcpci_tcpci_range[] = {
+	regmap_reg_range(0x00, 0x95)
+};
+
+const struct regmap_access_table max_tcpci_tcpci_write_table = {
+	.yes_ranges = max_tcpci_tcpci_range,
+	.n_yes_ranges = ARRAY_SIZE(max_tcpci_tcpci_range),
+};
+
+static const struct regmap_config max_tcpci_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x95,
+	.wr_table = &max_tcpci_tcpci_write_table,
+};
+
+static struct max_tcpci_chip *tdata_to_max_tcpci(struct tcpci_data *tdata)
+{
+	return container_of(tdata, struct max_tcpci_chip, data);
+}
+
+static int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
+{
+	return regmap_raw_read(chip->data.regmap, reg, val, sizeof(u16));
+}
+
+static int max_tcpci_write16(struct max_tcpci_chip *chip, unsigned int reg, u16 val)
+{
+	return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u16));
+}
+
+static int max_tcpci_read8(struct max_tcpci_chip *chip, unsigned int reg, u8 *val)
+{
+	return regmap_raw_read(chip->data.regmap, reg, val, sizeof(u8));
+}
+
+static int max_tcpci_write8(struct max_tcpci_chip *chip, unsigned int reg, u8 val)
+{
+	return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u8));
+}
+
+static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
+{
+	u16 alert_mask = 0;
+	int ret;
+
+	ret = max_tcpci_write16(chip, TCPC_ALERT, 0xffff);
+	if (ret < 0) {
+		dev_err(chip->dev, "Error writing to TCPC_ALERT ret:%d\n", ret);
+		return;
+	}
+
+	ret = max_tcpci_write16(chip, TCPC_VENDOR_ALERT, 0xffff);
+	if (ret < 0) {
+		dev_err(chip->dev, "Error writing to TCPC_VENDOR_ALERT ret:%d\n", ret);
+		return;
+	}
+
+	alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
+		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
+		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS;
+
+	ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
+	if (ret < 0) {
+		dev_err(chip->dev, "Error writing to TCPC_ALERT_MASK ret:%d\n", ret);
+		return;
+	}
+
+	/* Enable vbus voltage monitoring and voltage alerts */
+	ret = max_tcpci_write8(chip, TCPC_POWER_CTRL, 0);
+	if (ret < 0) {
+		dev_err(chip->dev, "Error writing to TCPC_POWER_CTRL ret:%d\n", ret);
+		return;
+	}
+}
+
+static void process_rx(struct max_tcpci_chip *chip, u16 status)
+{
+	struct pd_message msg;
+	u8 count, frame_type, rx_buf[TCPC_RECEIVE_BUFFER_LEN];
+	int ret, payload_index;
+	u8 *rx_buf_ptr;
+
+	/*
+	 * READABLE_BYTE_COUNT: Indicates the number of bytes in the RX_BUF_BYTE_x registers
+	 * plus one (for the RX_BUF_FRAME_TYPE) Table 4-36.
+	 * Read the count and frame type.
+	 */
+	ret = regmap_raw_read(chip->data.regmap, TCPC_RX_BYTE_CNT, rx_buf, 2);
+	if (ret < 0) {
+		dev_err(chip->dev, "TCPC_RX_BYTE_CNT read failed ret:%d", ret);
+		return;
+	}
+
+	count = rx_buf[TCPC_RECEIVE_BUFFER_COUNT_OFFSET];
+	frame_type = rx_buf[TCPC_RECEIVE_BUFFER_FRAME_TYPE_OFFSET];
+
+	if (count == 0 || frame_type != TCPC_RX_BUF_FRAME_TYPE_SOP) {
+		max_tcpci_write16(chip, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
+		dev_err(chip->dev, "%s", count ==  0 ? "error: count is 0" :
+			"error frame_type is not SOP");
+		return;
+	}
+
+	if (count > sizeof(struct pd_message) || count + 1 > TCPC_RECEIVE_BUFFER_LEN) {
+		dev_err(chip->dev, "Invalid TCPC_RX_BYTE_CNT %d", count);
+		return;
+	}
+
+	/*
+	 * Read count + 1 as RX_BUF_BYTE_x is hidden and can only be read through
+	 * TCPC_RX_BYTE_CNT
+	 */
+	count += 1;
+	ret = regmap_raw_read(chip->data.regmap, TCPC_RX_BYTE_CNT, rx_buf, count);
+	if (ret < 0) {
+		dev_err(chip->dev, "Error: TCPC_RX_BYTE_CNT read failed: %d", ret);
+		return;
+	}
+
+	rx_buf_ptr = rx_buf + TCPC_RECEIVE_BUFFER_RX_BYTE_BUF_OFFSET;
+	msg.header = cpu_to_le16(*(u16 *)rx_buf_ptr);
+	rx_buf_ptr = rx_buf_ptr + sizeof(msg.header);
+	for (payload_index = 0; payload_index < pd_header_cnt_le(msg.header); payload_index++,
+	     rx_buf_ptr += sizeof(msg.payload[0]))
+		msg.payload[payload_index] = cpu_to_le32(*(u32 *)rx_buf_ptr);
+
+	/*
+	 * Read complete, clear RX status alert bit.
+	 * Clear overflow as well if set.
+	 */
+	ret = max_tcpci_write16(chip, TCPC_ALERT, status & TCPC_ALERT_RX_BUF_OVF ?
+				TCPC_ALERT_RX_STATUS | TCPC_ALERT_RX_BUF_OVF :
+				TCPC_ALERT_RX_STATUS);
+	if (ret < 0)
+		return;
+
+	tcpm_pd_receive(chip->port, &msg);
+}
+
+static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, bool source, bool sink)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
+	u8 buffer_source[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
+	u8 buffer_sink[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
+	u8 buffer_none[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};
+	struct i2c_client *i2c = chip->client;
+	int ret;
+
+	struct i2c_msg msgs[] = {
+		{
+			.addr = MAX_BUCK_BOOST_SID,
+			.flags = i2c->flags & I2C_M_TEN,
+			.len = 2,
+			.buf = source ? buffer_source : sink ? buffer_sink : buffer_none,
+		},
+	};
+
+	if (source && sink) {
+		dev_err(chip->dev, "Both source and sink set\n");
+		return -EINVAL;
+	}
+
+	ret = i2c_transfer(i2c->adapter, msgs, 1);
+
+	return  ret < 0 ? ret : 1;
+}
+
+static void process_power_status(struct max_tcpci_chip *chip)
+{
+	u8 pwr_status;
+	int ret;
+
+	ret = max_tcpci_read8(chip, TCPC_POWER_STATUS, &pwr_status);
+	if (ret < 0)
+		return;
+
+	if (pwr_status == 0xff)
+		max_tcpci_init_regs(chip);
+	else
+		tcpm_vbus_change(chip->port);
+}
+
+static void process_tx(struct max_tcpci_chip *chip, u16 status)
+{
+	if (status & TCPC_ALERT_TX_SUCCESS)
+		tcpm_pd_transmit_complete(chip->port, TCPC_TX_SUCCESS);
+	else if (status & TCPC_ALERT_TX_DISCARDED)
+		tcpm_pd_transmit_complete(chip->port, TCPC_TX_DISCARDED);
+	else if (status & TCPC_ALERT_TX_FAILED)
+		tcpm_pd_transmit_complete(chip->port, TCPC_TX_FAILED);
+
+	/* Reinit regs as Hard reset sets them to default value */
+	if ((status & TCPC_ALERT_TX_SUCCESS) && (status & TCPC_ALERT_TX_FAILED))
+		max_tcpci_init_regs(chip);
+}
+
+static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
+{
+	u16 mask;
+	int ret;
+
+	/*
+	 * Clear alert status for everything except RX_STATUS, which shouldn't
+	 * be cleared until we have successfully retrieved message.
+	 */
+	if (status & ~TCPC_ALERT_RX_STATUS) {
+		mask = status & TCPC_ALERT_RX_BUF_OVF ?
+			status & ~(TCPC_ALERT_RX_STATUS | TCPC_ALERT_RX_BUF_OVF) :
+			status & ~TCPC_ALERT_RX_STATUS;
+		ret = max_tcpci_write16(chip, TCPC_ALERT, mask);
+		if (ret < 0) {
+			dev_err(chip->dev, "ALERT clear failed\n");
+			return ret;
+		}
+	}
+
+	if (status & TCPC_ALERT_RX_BUF_OVF && !(status & TCPC_ALERT_RX_STATUS)) {
+		ret = max_tcpci_write16(chip, TCPC_ALERT, (TCPC_ALERT_RX_STATUS |
+							  TCPC_ALERT_RX_BUF_OVF));
+		if (ret < 0) {
+			dev_err(chip->dev, "ALERT clear failed\n");
+			return ret;
+		}
+	}
+
+	if (status & TCPC_ALERT_RX_STATUS)
+		process_rx(chip, status);
+
+	if (status & TCPC_ALERT_VBUS_DISCNCT)
+		tcpm_vbus_change(chip->port);
+
+	if (status & TCPC_ALERT_CC_STATUS)
+		tcpm_cc_change(chip->port);
+
+	if (status & TCPC_ALERT_POWER_STATUS)
+		process_power_status(chip);
+
+	if (status & TCPC_ALERT_RX_HARD_RST) {
+		tcpm_pd_hard_reset(chip->port);
+		max_tcpci_init_regs(chip);
+	}
+
+	if (status & TCPC_ALERT_TX_SUCCESS || status & TCPC_ALERT_TX_DISCARDED || status &
+	    TCPC_ALERT_TX_FAILED)
+		process_tx(chip, status);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t max_tcpci_irq(int irq, void *dev_id)
+{
+	struct max_tcpci_chip *chip = dev_id;
+	u16 status;
+	irqreturn_t irq_return;
+	int ret;
+
+	if (!chip->port)
+		return IRQ_HANDLED;
+
+	ret = max_tcpci_read16(chip, TCPC_ALERT, &status);
+	if (ret < 0) {
+		dev_err(chip->dev, "ALERT read failed\n");
+		return ret;
+	}
+	while (status) {
+		irq_return = _max_tcpci_irq(chip, status);
+		/* Do not return if the ALERT is already set. */
+		ret = max_tcpci_read16(chip, TCPC_ALERT, &status);
+		if (ret < 0)
+			break;
+	}
+
+	return irq_return;
+}
+
+static irqreturn_t max_tcpci_isr(int irq, void *dev_id)
+{
+	struct max_tcpci_chip *chip = dev_id;
+
+	pm_wakeup_event(chip->dev, PD_ACTIVITY_TIMEOUT_MS);
+
+	if (!chip->port)
+		return IRQ_HANDLED;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2c_client *client)
+{
+	int ret;
+
+	ret = devm_request_threaded_irq(chip->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
+					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
+					chip);
+
+	if (ret < 0)
+		return ret;
+
+	enable_irq_wake(client->irq);
+	return 0;
+}
+
+static int max_tcpci_start_toggling(struct tcpci *tcpci, struct tcpci_data *tdata,
+				    enum typec_cc_status cc)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
+
+	max_tcpci_init_regs(chip);
+
+	return 0;
+}
+
+static int tcpci_init(struct tcpci *tcpci, struct tcpci_data *data)
+{
+	/*
+	 * Generic TCPCI overwrites the regs once this driver initializes
+	 * them. Prevent this by returning -1.
+	 */
+	return -1;
+}
+
+static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id *i2c_id)
+{
+	int ret;
+	struct max_tcpci_chip *chip;
+	u8 power_status;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->client = client;
+	chip->data.regmap = devm_regmap_init_i2c(client, &max_tcpci_regmap_config);
+	if (IS_ERR(chip->data.regmap)) {
+		dev_err(&client->dev, "Regmap init failed\n");
+		return PTR_ERR(chip->data.regmap);
+	}
+
+	chip->dev = &client->dev;
+	i2c_set_clientdata(client, chip);
+
+	ret = max_tcpci_read8(chip, TCPC_POWER_STATUS, &power_status);
+	if (ret < 0)
+		return ret;
+
+	/* Chip level tcpci callbacks */
+	chip->data.set_vbus = max_tcpci_set_vbus;
+	chip->data.start_drp_toggling = max_tcpci_start_toggling;
+	chip->data.TX_BUF_BYTE_x_hidden = true;
+	chip->data.init = tcpci_init;
+
+	max_tcpci_init_regs(chip);
+	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
+	if (IS_ERR_OR_NULL(chip->tcpci)) {
+		dev_err(&client->dev, "TCPCI port registration failed");
+		ret = PTR_ERR(chip->tcpci);
+		return PTR_ERR(chip->tcpci);
+	}
+	chip->port = tcpci_get_tcpm_port(chip->tcpci);
+	ret = max_tcpci_init_alert(chip, client);
+	if (ret < 0)
+		goto unreg_port;
+
+	device_init_wakeup(chip->dev, true);
+	return 0;
+
+unreg_port:
+	tcpci_unregister_port(chip->tcpci);
+
+	return ret;
+}
+
+static int max_tcpci_remove(struct i2c_client *client)
+{
+	struct max_tcpci_chip *chip = i2c_get_clientdata(client);
+
+	if (!IS_ERR_OR_NULL(chip->tcpci))
+		tcpci_unregister_port(chip->tcpci);
+
+	return 0;
+}
+
+static const struct i2c_device_id max_tcpci_id[] = {
+	{ "maxtcpc", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id max_tcpci_of_match[] = {
+	{ .compatible = "maxim,tcpc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
+#endif
+
+static struct i2c_driver max_tcpci_i2c_driver = {
+	.driver = {
+		.name = "maxtcpc",
+		.of_match_table = of_match_ptr(max_tcpci_of_match),
+	},
+	.probe = max_tcpci_probe,
+	.remove = max_tcpci_remove,
+	.id_table = max_tcpci_id,
+};
+module_i2c_driver(max_tcpci_i2c_driver);
+
+MODULE_AUTHOR("Badhri Jagan Sridharan <badhri@google.com>");
+MODULE_DESCRIPTION("Maxim TCPCI based USB Type-C Port Controller Interface Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0.709.gb0816b6eb0-goog


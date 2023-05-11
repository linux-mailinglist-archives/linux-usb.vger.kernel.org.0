Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FBC6FF92D
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 20:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbjEKSCD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 May 2023 14:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238796AbjEKSBy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 May 2023 14:01:54 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B7A526A;
        Thu, 11 May 2023 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683828111; x=1715364111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VSSS0rmVMhoBErYV4M0OJ7dFwB5W+F4MsH/wn7PY6yg=;
  b=Sx65tCmRIYM3PCfwOLGKOnxg/oXpPyK7iVNVXbvSxIjPNIguYSp+Vyn0
   mZ8YjkI4ikbP/fsYR+b5e9h0RSsq13WeQ/Qccf0g4wfwFdoj20dHzuzOb
   yx1p10hAlFYDlj2xfqcqIAMU5kPgIu25h8GJjR6xvfb0ZVUD4T7un1F6s
   YZ+4qT1txiGPLNOcKJaDdVe56SosIZ8X3YgmfZmlpyo1vCUUxX+YhUV7l
   Dx/IR+7EWeYCfjLV+VCeVAa5AOgg9TCuSOuv7JCZaaMBBLU4cKAex6ev5
   W2p8gXvYdGrmQ4yWOsGYkiefRhMhiMMyyuy9Q56P4eMsWUFUTvRJiBSCs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413942809"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="413942809"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 11:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874061720"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="874061720"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.153.70])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2023 11:01:08 -0700
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
Date:   Fri, 12 May 2023 01:58:42 +0800
Message-Id: <20230511175844.185070-5-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511175844.185070-1-xiang.ye@intel.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
device named "La Jolla Cove Adapter" (LJCA). It communicate with
LJCA GPIO module with specific protocol through interfaces exported
by LJCA USB driver.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
---
 drivers/gpio/Kconfig     |  12 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-ljca.c | 479 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 492 insertions(+)
 create mode 100644 drivers/gpio/gpio-ljca.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 13be729710f2..bbf00e157dcd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1658,6 +1658,18 @@ config GPIO_VIPERBOARD
 	  River Tech's viperboard.h for detailed meaning
 	  of the module parameters.
 
+config GPIO_LJCA
+	tristate "INTEL La Jolla Cove Adapter GPIO support"
+	depends on USB_LJCA
+	select GPIOLIB_IRQCHIP
+	default USB_LJCA
+	help
+	  Select this option to enable GPIO driver for the INTEL
+	  La Jolla Cove Adapter (LJCA) board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-ljca.
+
 endmenu
 
 menu "Virtual GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c048ba003367..eb59524d18c0 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
 obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
+obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
 obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
new file mode 100644
index 000000000000..81835a21e8c0
--- /dev/null
+++ b/drivers/gpio/gpio-ljca.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB-GPIO driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/dev_printk.h>
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/usb/ljca.h>
+
+/* GPIO commands */
+#define LJCA_GPIO_CONFIG		1
+#define LJCA_GPIO_READ			2
+#define LJCA_GPIO_WRITE			3
+#define LJCA_GPIO_INT_EVENT		4
+#define LJCA_GPIO_INT_MASK		5
+#define LJCA_GPIO_INT_UNMASK		6
+
+#define LJCA_GPIO_CONF_DISABLE		BIT(0)
+#define LJCA_GPIO_CONF_INPUT		BIT(1)
+#define LJCA_GPIO_CONF_OUTPUT		BIT(2)
+#define LJCA_GPIO_CONF_PULLUP		BIT(3)
+#define LJCA_GPIO_CONF_PULLDOWN		BIT(4)
+#define LJCA_GPIO_CONF_DEFAULT		BIT(5)
+#define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
+#define LJCA_GPIO_INT_TYPE		BIT(7)
+
+#define LJCA_GPIO_CONF_EDGE		FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
+#define LJCA_GPIO_CONF_LEVEL		FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
+
+/* Intentional overlap with PULLUP / PULLDOWN */
+#define LJCA_GPIO_CONF_SET		BIT(3)
+#define LJCA_GPIO_CONF_CLR		BIT(4)
+
+struct gpio_op {
+	u8 index;
+	u8 value;
+} __packed;
+
+struct gpio_packet {
+	u8 num;
+	struct gpio_op item[];
+} __packed;
+
+#define LJCA_GPIO_BUF_SIZE 60
+struct ljca_gpio_dev {
+	struct ljca *ljca;
+	struct gpio_chip gc;
+	struct ljca_gpio_info *gpio_info;
+	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
+	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
+	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
+	DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
+	u8 *connect_mode;
+	/* mutex to protect irq bus */
+	struct mutex irq_lock;
+	struct work_struct work;
+	/* lock to protect package transfer to Hardware */
+	struct mutex trans_lock;
+
+	u8 obuf[LJCA_GPIO_BUF_SIZE];
+	u8 ibuf[LJCA_GPIO_BUF_SIZE];
+};
+
+static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 config)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->item[0].index = gpio_id;
+	packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
+	packet->num = 1;
+
+	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, packet,
+			    struct_size(packet, item, packet->num), NULL, NULL);
+	mutex_unlock(&ljca_gpio->trans_lock);
+
+	return ret;
+}
+
+static int ljca_gpio_read(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	struct gpio_packet *ack_packet = (struct gpio_packet *)ljca_gpio->ibuf;
+	unsigned int ibuf_len = LJCA_GPIO_BUF_SIZE;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
+	packet->item[0].index = gpio_id;
+	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_READ, packet,
+			    struct_size(packet, item, packet->num), ljca_gpio->ibuf, &ibuf_len);
+	if (ret)
+		goto out_unlock;
+
+	if (!ibuf_len || ack_packet->num != packet->num) {
+		dev_err(&ljca_gpio->ljca->auxdev.dev,
+			"read package error, gpio_id:%u num:%u ibuf_len:%d\n", gpio_id,
+			ack_packet->num, ibuf_len);
+		ret = -EIO;
+	}
+
+out_unlock:
+	mutex_unlock(&ljca_gpio->trans_lock);
+	if (ret)
+		return ret;
+
+	return ack_packet->item[0].value > 0;
+}
+
+static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, int value)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
+	packet->item[0].index = gpio_id;
+	packet->item[0].value = value & 1;
+
+	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_WRITE, packet,
+			    struct_size(packet, item, packet->num), NULL, NULL);
+	mutex_unlock(&ljca_gpio->trans_lock);
+
+	return ret;
+}
+
+static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	return ljca_gpio_read(ljca_gpio, offset);
+}
+
+static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = ljca_gpio_write(ljca_gpio, offset, val);
+	if (ret)
+		dev_err(chip->parent, "set value failed offset:%u val:%d  ret:%d\n", offset, val,
+			ret);
+}
+
+static int ljca_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+	u8 config = LJCA_GPIO_CONF_INPUT | LJCA_GPIO_CONF_CLR;
+	int ret;
+
+	ret = gpio_config(ljca_gpio, offset, config);
+	if (ret)
+		return ret;
+
+	clear_bit(offset, ljca_gpio->output_enabled);
+
+	return 0;
+}
+
+static int ljca_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+	u8 config = LJCA_GPIO_CONF_OUTPUT | LJCA_GPIO_CONF_CLR;
+	int ret;
+
+	ret = gpio_config(ljca_gpio, offset, config);
+	if (ret)
+		return ret;
+
+	ljca_gpio_set_value(chip, offset, val);
+	set_bit(offset, ljca_gpio->output_enabled);
+
+	return 0;
+}
+
+static int ljca_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	if (test_bit(offset, ljca_gpio->output_enabled))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int ljca_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				unsigned long config)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	ljca_gpio->connect_mode[offset] = 0;
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		ljca_gpio->connect_mode[offset] |= LJCA_GPIO_CONF_PULLUP;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ljca_gpio->connect_mode[offset] |= LJCA_GPIO_CONF_PULLDOWN;
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_PERSIST_STATE:
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int ljca_gpio_init_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+				     unsigned int ngpios)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	WARN_ON_ONCE(ngpios != ljca_gpio->gpio_info->num);
+	bitmap_copy(valid_mask, ljca_gpio->gpio_info->valid_pin_map, ngpios);
+
+	return 0;
+}
+
+static void ljca_gpio_irq_init_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+					  unsigned int ngpios)
+{
+	ljca_gpio_init_valid_mask(chip, valid_mask, ngpios);
+}
+
+static int ljca_enable_irq(struct ljca_gpio_dev *ljca_gpio, int gpio_id, bool enable)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
+	packet->item[0].index = gpio_id;
+	packet->item[0].value = 0;
+
+	ret = ljca_transfer(ljca_gpio->ljca, enable ? LJCA_GPIO_INT_UNMASK : LJCA_GPIO_INT_MASK,
+			    packet, struct_size(packet, item, packet->num), NULL, NULL);
+	mutex_unlock(&ljca_gpio->trans_lock);
+
+	return ret;
+}
+
+static void ljca_gpio_async(struct work_struct *work)
+{
+	struct ljca_gpio_dev *ljca_gpio = container_of(work, struct ljca_gpio_dev, work);
+	int gpio_id;
+	int unmasked;
+
+	for_each_set_bit(gpio_id, ljca_gpio->reenable_irqs, ljca_gpio->gc.ngpio) {
+		clear_bit(gpio_id, ljca_gpio->reenable_irqs);
+		unmasked = test_bit(gpio_id, ljca_gpio->unmasked_irqs);
+		if (unmasked)
+			ljca_enable_irq(ljca_gpio, gpio_id, true);
+	}
+}
+
+static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data, int len)
+{
+	const struct gpio_packet *packet = evt_data;
+	struct ljca_gpio_dev *ljca_gpio = context;
+	int i;
+	int irq;
+
+	if (cmd != LJCA_GPIO_INT_EVENT)
+		return;
+
+	for (i = 0; i < packet->num; i++) {
+		irq = irq_find_mapping(ljca_gpio->gc.irq.domain, packet->item[i].index);
+		if (!irq) {
+			dev_err(ljca_gpio->gc.parent, "gpio_id %u does not mapped to IRQ yet\n",
+				packet->item[i].index);
+			return;
+		}
+
+		generic_handle_domain_irq(ljca_gpio->gc.irq.domain, irq);
+		set_bit(packet->item[i].index, ljca_gpio->reenable_irqs);
+	}
+
+	schedule_work(&ljca_gpio->work);
+}
+
+static void ljca_irq_unmask(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+
+	gpiochip_enable_irq(gc, gpio_id);
+	set_bit(gpio_id, ljca_gpio->unmasked_irqs);
+}
+
+static void ljca_irq_mask(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+
+	clear_bit(gpio_id, ljca_gpio->unmasked_irqs);
+	gpiochip_disable_irq(gc, gpio_id);
+}
+
+static int ljca_irq_set_type(struct irq_data *irqd, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+
+	ljca_gpio->connect_mode[gpio_id] = LJCA_GPIO_CONF_INTERRUPT;
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLUP);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLDOWN);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLUP);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLDOWN);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void ljca_irq_bus_lock(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+
+	mutex_lock(&ljca_gpio->irq_lock);
+}
+
+static void ljca_irq_bus_unlock(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+	int enabled;
+	int unmasked;
+
+	enabled = test_bit(gpio_id, ljca_gpio->enabled_irqs);
+	unmasked = test_bit(gpio_id, ljca_gpio->unmasked_irqs);
+
+	if (enabled != unmasked) {
+		if (unmasked) {
+			gpio_config(ljca_gpio, gpio_id, 0);
+			ljca_enable_irq(ljca_gpio, gpio_id, true);
+			set_bit(gpio_id, ljca_gpio->enabled_irqs);
+		} else {
+			ljca_enable_irq(ljca_gpio, gpio_id, false);
+			clear_bit(gpio_id, ljca_gpio->enabled_irqs);
+		}
+	}
+
+	mutex_unlock(&ljca_gpio->irq_lock);
+}
+
+static const struct irq_chip ljca_gpio_irqchip = {
+	.name = "ljca-irq",
+	.irq_mask = ljca_irq_mask,
+	.irq_unmask = ljca_irq_unmask,
+	.irq_set_type = ljca_irq_set_type,
+	.irq_bus_lock = ljca_irq_bus_lock,
+	.irq_bus_sync_unlock = ljca_irq_bus_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int ljca_gpio_probe(struct auxiliary_device *auxdev,
+			   const struct auxiliary_device_id *aux_dev_id)
+{
+	struct ljca *ljca = auxiliary_dev_to_ljca(auxdev);
+	struct ljca_gpio_dev *ljca_gpio;
+	struct gpio_irq_chip *girq;
+	int ret;
+
+	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
+	if (!ljca_gpio)
+		return -ENOMEM;
+
+	ljca_gpio->ljca = ljca;
+	ljca_gpio->gpio_info = dev_get_platdata(&auxdev->dev);
+	ljca_gpio->connect_mode = devm_kcalloc(&auxdev->dev, ljca_gpio->gpio_info->num,
+					       sizeof(*ljca_gpio->connect_mode), GFP_KERNEL);
+	if (!ljca_gpio->connect_mode)
+		return -ENOMEM;
+
+	mutex_init(&ljca_gpio->irq_lock);
+	mutex_init(&ljca_gpio->trans_lock);
+	ljca_gpio->gc.direction_input = ljca_gpio_direction_input;
+	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
+	ljca_gpio->gc.get_direction = ljca_gpio_get_direction;
+	ljca_gpio->gc.get = ljca_gpio_get_value;
+	ljca_gpio->gc.set = ljca_gpio_set_value;
+	ljca_gpio->gc.set_config = ljca_gpio_set_config;
+	ljca_gpio->gc.init_valid_mask = ljca_gpio_init_valid_mask;
+	ljca_gpio->gc.can_sleep = true;
+	ljca_gpio->gc.parent = &auxdev->dev;
+
+	ljca_gpio->gc.base = -1;
+	ljca_gpio->gc.ngpio = ljca_gpio->gpio_info->num;
+	ljca_gpio->gc.label = ACPI_COMPANION(&auxdev->dev) ?
+			      acpi_dev_name(ACPI_COMPANION(&auxdev->dev)) :
+			      dev_name(&auxdev->dev);
+	ljca_gpio->gc.owner = THIS_MODULE;
+
+	auxiliary_set_drvdata(auxdev, ljca_gpio);
+	ljca_register_event_cb(ljca, ljca_gpio_event_cb, ljca_gpio);
+
+	girq = &ljca_gpio->gc.irq;
+	gpio_irq_chip_set_chip(girq, &ljca_gpio_irqchip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->init_valid_mask = ljca_gpio_irq_init_valid_mask;
+
+	INIT_WORK(&ljca_gpio->work, ljca_gpio_async);
+	ret = gpiochip_add_data(&ljca_gpio->gc, ljca_gpio);
+	if (ret) {
+		ljca_unregister_event_cb(ljca);
+		mutex_destroy(&ljca_gpio->irq_lock);
+		mutex_destroy(&ljca_gpio->trans_lock);
+	}
+
+	return ret;
+}
+
+static void ljca_gpio_remove(struct auxiliary_device *auxdev)
+{
+	struct ljca_gpio_dev *ljca_gpio = auxiliary_get_drvdata(auxdev);
+
+	gpiochip_remove(&ljca_gpio->gc);
+	ljca_unregister_event_cb(ljca_gpio->ljca);
+	cancel_work_sync(&ljca_gpio->work);
+	mutex_destroy(&ljca_gpio->irq_lock);
+	mutex_destroy(&ljca_gpio->trans_lock);
+}
+
+#define LJCA_GPIO_DRV_NAME "ljca.ljca-gpio"
+static const struct auxiliary_device_id ljca_gpio_id_table[] = {
+	{ LJCA_GPIO_DRV_NAME, 0 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
+
+static struct auxiliary_driver ljca_gpio_driver = {
+	.probe = ljca_gpio_probe,
+	.remove = ljca_gpio_remove,
+	.id_table = ljca_gpio_id_table,
+};
+module_auxiliary_driver(ljca_gpio_driver);
+
+MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
+MODULE_AUTHOR("Wang Zhifeng <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Zhang Lixu <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(LJCA);
-- 
2.34.1


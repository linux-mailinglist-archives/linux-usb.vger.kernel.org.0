Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301EF1604FF
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgBPR1M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:12 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50782 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgBPR1L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:11 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 297EC200E8;
        Sun, 16 Feb 2020 18:21:40 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 4/9] pinctrl: Add Multifunction USB Device pinctrl driver
Date:   Sun, 16 Feb 2020 18:21:12 +0100
Message-Id: <20200216172117.49832-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10
        a=SJz97ENfAAAA:8 a=zA0JEd7Wm40yEy5wBp4A:9 a=mvnLadNLvkWAnLlj:21
        a=mjYpQo1dwepDeJSL:21 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Multifunction USB Device has optional support for gpio and pin
configuration. Interrupts are supported if the device supports it.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/pinctrl/Kconfig       |   9 +
 drivers/pinctrl/Makefile      |   1 +
 drivers/pinctrl/pinctrl-mud.c | 657 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-mud.h |  89 +++++
 4 files changed, 756 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-mud.c
 create mode 100644 drivers/pinctrl/pinctrl-mud.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index df0ef69dd474..ee3532c64411 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -384,6 +384,15 @@ config PINCTRL_OCELOT
 	select OF_GPIO
 	select REGMAP_MMIO
 
+config PINCTRL_MUD
+	tristate "Multifunction USB Device pinctrl driver"
+	depends on MFD_MUD
+	select GENERIC_PINCONF
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	help
+	  Support for GPIOs on Multifunction USB Devices.
+
 source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 879f312bfb75..782cc7f286b7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
+obj-$(CONFIG_PINCTRL_MUD)	+= pinctrl-mud.o
 
 obj-y				+= actions/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
diff --git a/drivers/pinctrl/pinctrl-mud.c b/drivers/pinctrl/pinctrl-mud.c
new file mode 100644
index 000000000000..f890c8e68755
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mud.c
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/bitmap.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mfd/mud.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinmux.h"
+#include "pinctrl-utils.h"
+
+#include "pinctrl-mud.h"
+
+/* Temporary debugging aid */
+static unsigned int debug = 8;
+
+#define pdebug(level, fmt, ...)				\
+do {							\
+	if ((level) <= debug)				\
+		printk(KERN_DEBUG fmt, ##__VA_ARGS__);	\
+} while (0)
+
+struct mud_pinctrl_pin {
+	unsigned int irq_types;
+	unsigned int irq_type;
+	bool irq_enabled;
+};
+
+struct mud_pinctrl {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mud_pinctrl_pin *pins;
+	struct pinctrl_dev *pctl_dev;
+	struct pinctrl_desc pctl_desc;
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+	struct mutex irqlock; /* IRQ bus lock */
+};
+
+static unsigned int mud_pinctrl_pin_reg(unsigned int pin, unsigned int offset)
+{
+	return MUD_PINCTRL_REG_PIN_BASE + (pin * MUD_PINCTRL_PIN_BLOCK_SIZE) + offset;
+}
+
+static int mud_pinctrl_pin_read_reg(struct mud_pinctrl *pctl, unsigned int pin,
+				    unsigned int offset, unsigned int *val)
+{
+	return regmap_read(pctl->regmap, mud_pinctrl_pin_reg(pin, offset), val);
+}
+
+static int mud_pinctrl_pin_write_reg(struct mud_pinctrl *pctl, unsigned int pin,
+				     unsigned int offset, unsigned int val)
+{
+	return regmap_write(pctl->regmap, mud_pinctrl_pin_reg(pin, offset), val);
+}
+
+static int mud_pinctrl_read_bitmap(struct mud_pinctrl *pctl, unsigned int reg,
+				   unsigned long *bitmap, unsigned int nbits)
+{
+	unsigned int nregs = DIV_ROUND_UP(nbits, 32);
+	u32 *vals;
+	int ret;
+
+	vals = kmalloc_array(nregs, sizeof(*vals), GFP_KERNEL);
+	if (!vals)
+		return -ENOMEM;
+
+	ret = regmap_bulk_read(pctl->regmap, reg, vals, nregs);
+	if (ret)
+		goto free;
+
+	bitmap_from_arr32(bitmap, vals, nbits);
+free:
+	kfree(vals);
+
+	return ret;
+}
+
+static int mud_pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	int ret;
+
+	pdebug(1, "%s: offset=%u\n", __func__, offset);
+
+	ret = mud_pinctrl_pin_write_reg(pctl, offset, MUD_PIN_GPIO_REQUEST, 1);
+	if (ret == -EBUSY) {
+		dev_err(pctl->dev,
+			"pin %u is claimed by another function on the USB device\n",
+			offset);
+		ret = -EINVAL; /* follow pinmux.c:pin_request() */
+	}
+
+	return ret;
+}
+
+static void mud_pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+
+	pdebug(1, "%s: offset=%u\n", __func__, offset);
+
+	mud_pinctrl_pin_write_reg(pctl, offset, MUD_PIN_GPIO_FREE, 1);
+}
+
+static int mud_pinctrl_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int value;
+	int ret;
+
+	ret = mud_pinctrl_pin_read_reg(pctl, offset, MUD_PIN_LEVEL, &value);
+
+	return ret ? ret : value;
+}
+
+static void mud_pinctrl_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	int ret;
+
+	ret = mud_pinctrl_pin_write_reg(pctl, offset, MUD_PIN_LEVEL, value);
+	if (ret)
+		dev_err_once(pctl->dev, "Failed to set gpio output, error=%d\n", ret);
+}
+
+/* FIXME: Remove this comment when settled: .get_direction returns 0=out, 1=in */
+static int mud_pinctrl_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = mud_pinctrl_pin_read_reg(pctl, offset, MUD_PIN_DIRECTION, &val);
+
+	return ret ? ret : val;
+}
+
+static int mud_pinctrl_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	int ret;
+
+	ret = mud_pinctrl_pin_write_reg(pctl, offset, MUD_PIN_DIRECTION,
+					MUD_PIN_DIRECTION_INPUT);
+	if (ret == -ENOTSUPP) {
+		dev_err(pctl->dev, "pin %u can't be used as an input\n", offset);
+		ret = -EIO; /* gpiolib uses this error code */
+	}
+
+	return ret;
+}
+
+static int mud_pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int regval;
+	int ret;
+
+	regval = value ? MUD_PIN_DIRECTION_OUTPUT_HIGH : MUD_PIN_DIRECTION_OUTPUT_LOW;
+
+	ret = mud_pinctrl_pin_write_reg(pctl, offset, MUD_PIN_DIRECTION, regval);
+	if (ret == -ENOTSUPP) {
+		dev_err(pctl->dev, "pin %u can't be used as an output\n", offset);
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+/* The pinctrl pin number space and the gpio hwpin (offset) numberspace are identical. */
+static int mud_pinctrl_gpio_add_pin_ranges(struct gpio_chip *gc)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+
+	return gpiochip_add_pin_range(&pctl->gpio_chip, dev_name(pctl->dev),
+				      pctl->pctl_desc.pins->number,
+				      pctl->pctl_desc.pins->number,
+				      pctl->pctl_desc.npins);
+}
+
+static const struct gpio_chip mud_pinctrl_gpio_chip = {
+	.label			= "mud-pins",
+	.request		= mud_pinctrl_gpio_request,
+	.free			= mud_pinctrl_gpio_free,
+	.get_direction		= mud_pinctrl_gpio_get_direction,
+	.direction_input	= mud_pinctrl_gpio_direction_input,
+	.direction_output	= mud_pinctrl_gpio_direction_output,
+	.get			= mud_pinctrl_gpio_get,
+	.set			= mud_pinctrl_gpio_set,
+	.set_config		= gpiochip_generic_config,
+	.add_pin_ranges		= mud_pinctrl_gpio_add_pin_ranges,
+	.base			= -1,
+	.can_sleep		= true,
+};
+
+/* enum pin_config_param is not ABI so: */
+static const u8 mud_pin_config_param_table[] = {
+	[PIN_CONFIG_BIAS_BUS_HOLD] = MUD_PIN_CONFIG_BIAS_BUS_HOLD,
+	[PIN_CONFIG_BIAS_DISABLE] = MUD_PIN_CONFIG_BIAS_DISABLE,
+	[PIN_CONFIG_BIAS_HIGH_IMPEDANCE] = MUD_PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
+	[PIN_CONFIG_BIAS_PULL_DOWN] = MUD_PIN_CONFIG_BIAS_PULL_DOWN,
+	[PIN_CONFIG_BIAS_PULL_PIN_DEFAULT] = MUD_PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
+	[PIN_CONFIG_BIAS_PULL_UP] = MUD_PIN_CONFIG_BIAS_PULL_UP,
+	[PIN_CONFIG_DRIVE_OPEN_DRAIN] = MUD_PIN_CONFIG_DRIVE_OPEN_DRAIN,
+	[PIN_CONFIG_DRIVE_OPEN_SOURCE] = MUD_PIN_CONFIG_DRIVE_OPEN_SOURCE,
+	[PIN_CONFIG_DRIVE_PUSH_PULL] = MUD_PIN_CONFIG_DRIVE_PUSH_PULL,
+	[PIN_CONFIG_DRIVE_STRENGTH] = MUD_PIN_CONFIG_DRIVE_STRENGTH,
+	[PIN_CONFIG_DRIVE_STRENGTH_UA] = MUD_PIN_CONFIG_DRIVE_STRENGTH_UA,
+	[PIN_CONFIG_INPUT_DEBOUNCE] = MUD_PIN_CONFIG_INPUT_DEBOUNCE,
+	[PIN_CONFIG_INPUT_ENABLE] = MUD_PIN_CONFIG_INPUT_ENABLE,
+	[PIN_CONFIG_INPUT_SCHMITT] = MUD_PIN_CONFIG_INPUT_SCHMITT,
+	[PIN_CONFIG_INPUT_SCHMITT_ENABLE] = MUD_PIN_CONFIG_INPUT_SCHMITT_ENABLE,
+	[PIN_CONFIG_LOW_POWER_MODE] = MUD_PIN_CONFIG_LOW_POWER_MODE,
+	[PIN_CONFIG_OUTPUT_ENABLE] = MUD_PIN_CONFIG_OUTPUT_ENABLE,
+	[PIN_CONFIG_OUTPUT] = MUD_PIN_CONFIG_OUTPUT,
+	[PIN_CONFIG_POWER_SOURCE] = MUD_PIN_CONFIG_POWER_SOURCE,
+	[PIN_CONFIG_SLEEP_HARDWARE_STATE] = MUD_PIN_CONFIG_SLEEP_HARDWARE_STATE,
+	[PIN_CONFIG_SLEW_RATE] = MUD_PIN_CONFIG_SLEW_RATE,
+	[PIN_CONFIG_SKEW_DELAY] = MUD_PIN_CONFIG_SKEW_DELAY,
+	[PIN_CONFIG_PERSIST_STATE] = MUD_PIN_CONFIG_PERSIST_STATE,
+};
+
+static int mud_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
+				   unsigned int pin, unsigned long *config)
+{
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	struct mud_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int arg, offset = mud_pin_config_param_table[param];
+	int ret;
+
+	ret = mud_pinctrl_pin_read_reg(pctl, pin, offset, &arg);
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int mud_pinctrl_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+				   unsigned long *configs, unsigned int num_configs)
+{
+	struct mud_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	unsigned int i, offset, arg;
+	int ret;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+		offset = mud_pin_config_param_table[param];
+
+		ret = mud_pinctrl_pin_write_reg(pctl, pin, offset, arg);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops mud_pinconf_ops = {
+	.is_generic			= true,
+	.pin_config_get			= mud_pinctrl_pinconf_get,
+	.pin_config_set			= mud_pinctrl_pinconf_set,
+	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
+};
+
+static int mud_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return 0;
+}
+
+static const char *mud_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+					      unsigned int selector)
+{
+	return NULL;
+}
+
+static int mud_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+				      unsigned int selector,
+				      const unsigned int **pins,
+				      unsigned int *num_pins)
+{
+	return -ENOTSUPP;
+}
+
+static void mud_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
+				     struct seq_file *s, unsigned int offset)
+{
+	struct mud_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct pinctrl_gpio_range *range;
+	int dir, val;
+
+	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, offset);
+	if (!range)
+		return;
+
+	dir = mud_pinctrl_gpio_get_direction(&pctl->gpio_chip, offset);
+	if (dir < 0)
+		return;
+
+	val = mud_pinctrl_gpio_get(&pctl->gpio_chip, offset);
+	if (val < 0)
+		return;
+
+	seq_printf(s, "function gpio_%s %s", dir ? "in" : "out", val ? "hi" : "lo");
+}
+
+static const struct pinctrl_ops mud_pinctrl_ops = {
+	.get_groups_count	= mud_pinctrl_get_groups_count,
+	.get_group_name		= mud_pinctrl_get_group_name,
+	.get_group_pins		= mud_pinctrl_get_group_pins,
+	.pin_dbg_show		= mud_pinctrl_pin_dbg_show,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+};
+
+static const struct pinctrl_desc mud_pinctrl_pinctrl_desc = {
+	.owner		= THIS_MODULE,
+	.name		= "mud-pins",
+	.pctlops	= &mud_pinctrl_ops,
+	.confops	= &mud_pinconf_ops,
+};
+
+static void mud_pinctrl_irq_init_valid_mask(struct gpio_chip *gc,
+					    unsigned long *valid_mask,
+					    unsigned int ngpios)
+{
+	struct mud_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int i;
+
+	pdebug(1, "%s: valid_mask: %*pb\n", __func__, ngpios, valid_mask);
+
+	for (i = 0; i < ngpios; i++) {
+		if (!pctl->pins[i].irq_types)
+			clear_bit(i, valid_mask);
+	}
+
+	pdebug(1, "%s: valid_mask: %*pb\n", __func__, ngpios, valid_mask);
+}
+
+static void mud_pinctrl_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	struct mud_pinctrl *pctl = gpiochip_get_data(gpio_chip);
+
+	pdebug(2, "%s: hwirq=%lu\n", __func__, data->hwirq);
+
+	pctl->pins[data->hwirq].irq_enabled = true;
+}
+
+static void mud_pinctrl_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	struct mud_pinctrl *pctl = gpiochip_get_data(gpio_chip);
+
+	pdebug(2, "%s: hwirq=%lu\n", __func__, data->hwirq);
+
+	pctl->pins[data->hwirq].irq_enabled = false;
+}
+
+static int mud_pinctrl_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	struct mud_pinctrl *pctl = gpiochip_get_data(gpio_chip);
+
+	pdebug(1, "%s: hwirq=%lu, type=%u\n", __func__, data->hwirq, type);
+
+	if (type == IRQ_TYPE_NONE)
+		return -EINVAL;
+
+	if ((pctl->pins[data->hwirq].irq_types & type) == type)
+		pctl->pins[data->hwirq].irq_type = type;
+
+	return 0;
+}
+
+static void mud_pinctrl_irq_bus_lock(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	struct mud_pinctrl *pctl = gpiochip_get_data(gpio_chip);
+
+	pdebug(3, "%s: hwirq=%lu\n", __func__, data->hwirq);
+
+	mutex_lock(&pctl->irqlock);
+}
+
+static void mud_pinctrl_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	struct mud_pinctrl *pctl = gpiochip_get_data(gpio_chip);
+	unsigned int reg;
+	u32 vals[2];
+	int ret;
+
+	pdebug(3, "%s: hwirq=%lu: irq_enabled=%u irq_type=%u\n", __func__,
+	       data->hwirq, pctl->pins[data->hwirq].irq_enabled,
+	       pctl->pins[data->hwirq].irq_type);
+
+	switch (pctl->pins[data->hwirq].irq_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		vals[0] = MUD_PIN_IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		vals[0] = MUD_PIN_IRQ_TYPE_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		vals[0] = MUD_PIN_IRQ_TYPE_EDGE_BOTH;
+		break;
+	default:
+		vals[0] = MUD_PIN_IRQ_TYPE_NONE;
+		break;
+	};
+
+	vals[1] = pctl->pins[data->hwirq].irq_enabled;
+	reg = mud_pinctrl_pin_reg(data->hwirq, MUD_PIN_IRQ_TYPE);
+
+	/* It's safe to use a stack allocated array because bulk_write does kmemdup */
+	ret = regmap_bulk_write(pctl->regmap, reg, vals, 2);
+	if (ret)
+		dev_err_once(pctl->dev, "Failed to sync irq data, error=%d\n", ret);
+
+	mutex_unlock(&pctl->irqlock);
+}
+
+static const struct irq_chip mud_pinctrl_irq_chip = {
+	.name			= "mud-pins",
+	.irq_enable		= mud_pinctrl_irq_enable,
+	.irq_disable		= mud_pinctrl_irq_disable,
+	.irq_set_type		= mud_pinctrl_irq_set_type,
+	.irq_bus_lock		= mud_pinctrl_irq_bus_lock,
+	.irq_bus_sync_unlock	= mud_pinctrl_irq_bus_sync_unlock,
+};
+
+static irqreturn_t mud_pinctrl_irq_thread_fn(int irq, void *dev_id)
+{
+	struct mud_pinctrl *pctl = (struct mud_pinctrl *)dev_id;
+	DECLARE_BITMAP(status, MUD_PINCTRL_MAX_NUM_PINS);
+	struct gpio_chip *gc = &pctl->gpio_chip;
+	unsigned long n;
+	int ret;
+
+	ret = mud_pinctrl_read_bitmap(pctl, MUD_PINCTRL_REG_IRQ_STATUS,
+				      status, gc->ngpio);
+	if (ret)
+		return IRQ_NONE;
+
+	pdebug(3, "%s: STATUS: %*pb\n", __func__, gc->ngpio, status);
+
+	for_each_set_bit(n, status, gc->ngpio) {
+		unsigned int irq = irq_find_mapping(gc->irq.domain, n);
+
+		pdebug(2, "%s: IRQ on pin %lu irq=%u enabled=%u\n", __func__,
+		       n, irq, pctl->pins[n].irq_enabled);
+
+		if (irq && pctl->pins[n].irq_enabled)
+			handle_nested_irq(irq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_config mud_pinctrl_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	/* FIXME: Setup caching? */
+	.cache_type = REGCACHE_NONE,
+};
+
+static int mud_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mud_cell_pdata *pdata = dev_get_platdata(dev);
+	struct pinctrl_pin_desc *pdesc;
+	struct mud_pinctrl *pctl;
+	struct regmap *regmap;
+	unsigned int i, reg, npins;
+	const char **names;
+	int ret, irq;
+
+	pdebug(1, "%s: dev->of_node=%px\n", __func__, dev->of_node);
+
+	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+
+	pctl->dev = dev;
+
+	mutex_init(&pctl->irqlock);
+
+	regmap = devm_regmap_init_usb(dev, pdata->interface, pdata->index,
+				      &mud_pinctrl_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	pctl->regmap = regmap;
+
+	ret = regmap_read(regmap, MUD_PINCTRL_REG_NUM_PINS, &npins);
+	if (ret) {
+		dev_err(pctl->dev, "Failed to read from device\n");
+		return ret;
+	}
+	if (!npins || npins > MUD_PINCTRL_MAX_NUM_PINS)
+		return -EINVAL;
+
+	pctl->pins = devm_kcalloc(dev, npins, sizeof(*pctl->pins), GFP_KERNEL);
+	if (!pctl->pins)
+		return -ENOMEM;
+
+	pdesc = devm_kcalloc(dev, npins, sizeof(*pdesc), GFP_KERNEL);
+	if (!pdesc)
+		return -ENOMEM;
+
+	pctl->pctl_desc = mud_pinctrl_pinctrl_desc;
+	pctl->pctl_desc.pins = pdesc;
+	pctl->pctl_desc.npins = npins;
+
+	for (i = 0; i < npins; i++, pdesc++) {
+		char *name;
+
+		name = devm_kmalloc(dev, MUD_PIN_NAME_LEN, GFP_KERNEL);
+		if (!name)
+			return -ENOMEM;
+
+		pdesc->number = i;
+		pdesc->name = name;
+		reg = mud_pinctrl_pin_reg(i, MUD_PIN_NAME);
+		ret = regmap_raw_read(regmap, reg, name, MUD_PIN_NAME_LEN);
+		if (ret) {
+			dev_err(pctl->dev, "Failed to read name for pin %u\n", i);
+			return ret;
+		}
+		if (!name[0] || name[MUD_PIN_NAME_LEN - 1]) {
+			dev_err(pctl->dev, "Illegal name for pin %u\n", i);
+			return -EINVAL;
+		}
+	}
+
+	ret = devm_pinctrl_register_and_init(dev, &pctl->pctl_desc,
+					     pctl, &pctl->pctl_dev);
+	if (ret) {
+		dev_err(pctl->dev, "pinctrl registration failed\n");
+		return ret;
+	}
+
+	ret = pinctrl_enable(pctl->pctl_dev);
+	if (ret) {
+		dev_err(pctl->dev, "pinctrl enable failed\n");
+		return ret;
+	}
+
+	irq = platform_get_irq_optional(pdev, 0);
+	pdebug(1, "%s: irq=%d\n", __func__, irq);
+	if (irq > 0) {
+		bool use_irq = false;
+
+		for (i = 0; i < npins; i++) {
+			reg = mud_pinctrl_pin_reg(i, MUD_PIN_IRQ_TYPES);
+			ret = regmap_read(regmap, reg, &pctl->pins[i].irq_types);
+			if (ret) {
+				dev_err(dev, "Failed to read irq type for pin %u\n", i);
+				return ret;
+			}
+			pdebug(1, "%s: pctl->pins[%u].irq_types=%u\n", __func__,
+			       i, pctl->pins[i].irq_types);
+			if (pctl->pins[i].irq_types)
+				use_irq = true;
+		}
+
+		if (!use_irq)
+			irq = 0;
+	} else {
+		irq = 0;
+	}
+
+	pctl->gpio_chip = mud_pinctrl_gpio_chip;
+	pctl->gpio_chip.parent = dev;
+	pctl->gpio_chip.ngpio = npins;
+	if (irq)
+		pctl->gpio_chip.irq.init_valid_mask = mud_pinctrl_irq_init_valid_mask;
+
+	names = devm_kcalloc(dev, npins, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	pctl->gpio_chip.names = names;
+
+	for (i = 0; i < npins; i++)
+		names[i] = pctl->pctl_desc.pins[i].name;
+
+	ret = devm_gpiochip_add_data(dev, &pctl->gpio_chip, pctl);
+	if (ret) {
+		dev_err(dev, "Could not register gpiochip, %d\n", ret);
+		return ret;
+	}
+
+	if (irq) {
+		pctl->irq_chip = mud_pinctrl_irq_chip;
+		ret = gpiochip_irqchip_add_nested(&pctl->gpio_chip, &pctl->irq_chip,
+						  0, handle_bad_irq, IRQ_TYPE_NONE);
+		if (ret) {
+			dev_err(dev, "Cannot add irqchip to gpiochip\n");
+			return ret;
+		}
+
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						mud_pinctrl_irq_thread_fn,
+						IRQF_ONESHOT, "mud-pins", pctl);
+		if (ret) {
+			dev_err(dev, "Cannot request irq%d\n", irq);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mud_pinctrl_of_match[] = {
+	{ .compatible = "mud-pins", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mud_pinctrl_of_match);
+
+static const struct platform_device_id mud_pinctrl_id_table[] = {
+	{ "mud-pins", },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, mud_pinctrl_id_table);
+
+static struct platform_driver mud_pinctrl_driver = {
+	.driver = {
+		.name = "mud-pins",
+		.of_match_table = mud_pinctrl_of_match,
+	},
+	.probe = mud_pinctrl_probe,
+	.id_table = mud_pinctrl_id_table,
+};
+
+module_platform_driver(mud_pinctrl_driver);
+
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_DESCRIPTION("Pin control interface for Multifunction USB Device");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-mud.h b/drivers/pinctrl/pinctrl-mud.h
new file mode 100644
index 000000000000..f4839da46bda
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mud.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#ifndef __LINUX_PINCTRL_MUD_H
+#define __LINUX_PINCTRL_MUD_H
+
+#define MUD_PINCTRL_MAX_NUM_PINS		512
+
+#define MUD_PINCTRL_REG_NUM_PINS		0x0000
+
+#define MUD_PINCTRL_REG_IRQ_STATUS		0x0020
+#define MUD_PINCTRL_REG_IRQ_STATUS_END		0x002f
+
+#define MUD_PINCTRL_REG_PIN_BASE		0x0100
+#define MUD_PINCTRL_PIN_BLOCK_SIZE		256
+
+  /*
+   * The following are offsets into the pin register block.
+   *
+   * The first part is identical to enum pin_config_param except for:
+   * - No room for custom configurations.
+   *
+   * See the enum declaration docs in include/linux/pinctrl/pinconf-generic.h
+   * for details about behaviour and arguments.
+   *
+   * Device should return -ENOTSUPP if the config is not supported.
+   */
+  #define MUD_PIN_CONFIG_BIAS_BUS_HOLD		0x00
+  #define MUD_PIN_CONFIG_BIAS_DISABLE		0x01
+  #define MUD_PIN_CONFIG_BIAS_HIGH_IMPEDANCE	0x02
+  #define MUD_PIN_CONFIG_BIAS_PULL_DOWN		0x03
+  #define MUD_PIN_CONFIG_BIAS_PULL_PIN_DEFAULT	0x04
+  #define MUD_PIN_CONFIG_BIAS_PULL_UP		0x05
+  #define MUD_PIN_CONFIG_DRIVE_OPEN_DRAIN	0x06
+  #define MUD_PIN_CONFIG_DRIVE_OPEN_SOURCE	0x07
+  #define MUD_PIN_CONFIG_DRIVE_PUSH_PULL	0x08
+  #define MUD_PIN_CONFIG_DRIVE_STRENGTH		0x09
+  #define MUD_PIN_CONFIG_DRIVE_STRENGTH_UA	0x0a
+  #define MUD_PIN_CONFIG_INPUT_DEBOUNCE		0x0b
+  #define MUD_PIN_CONFIG_INPUT_ENABLE		0x0c
+  #define MUD_PIN_CONFIG_INPUT_SCHMITT		0x0d
+  #define MUD_PIN_CONFIG_INPUT_SCHMITT_ENABLE	0x0e
+  #define MUD_PIN_CONFIG_LOW_POWER_MODE		0x0f
+  #define MUD_PIN_CONFIG_OUTPUT_ENABLE		0x10
+  #define MUD_PIN_CONFIG_OUTPUT			0x11
+  #define MUD_PIN_CONFIG_POWER_SOURCE		0x12
+  #define MUD_PIN_CONFIG_SLEEP_HARDWARE_STATE	0x13
+  #define MUD_PIN_CONFIG_SLEW_RATE		0x14
+  #define MUD_PIN_CONFIG_SKEW_DELAY		0x15
+  #define MUD_PIN_CONFIG_PERSIST_STATE		0x16
+  #define MUD_PIN_CONFIG_END			0x7f
+
+  /* Must be NUL terminated */
+  #define MUD_PIN_NAME				0x80
+    #define MUD_PIN_NAME_LEN			16
+  #define MUD_PIN_NAME_END			0x83
+
+  /*
+   * Device should return:
+   *   -EBUSY if pin is in use by another function (i2c, spi, ...)
+   *   -ENOENT if there is no gpio function on the pin.
+   */
+  #define MUD_PIN_GPIO_REQUEST			0x84
+  #define MUD_PIN_GPIO_FREE			0x85
+
+  /* Device should return -ENOTSUPP if the direction is not supported */
+  #define MUD_PIN_DIRECTION			0x86
+    #define MUD_PIN_DIRECTION_OUTPUT		0x0
+      #define MUD_PIN_DIRECTION_OUTPUT_LOW	0x0
+      #define MUD_PIN_DIRECTION_OUTPUT_HIGH	0x2
+    #define MUD_PIN_DIRECTION_INPUT		0x1
+
+  #define MUD_PIN_LEVEL				0x87
+
+  /*
+   * Set _TYPES to _NONE is the pin doesn't have interrupt support.
+   * If all pins are _NONE, then interrupts are disabled in the host driver.
+   */
+  #define MUD_PIN_IRQ_TYPES			0x90
+    #define MUD_PIN_IRQ_TYPE_NONE		0x00
+    #define MUD_PIN_IRQ_TYPE_EDGE_RISING	0x01
+    #define MUD_PIN_IRQ_TYPE_EDGE_FALLING	0x02
+    #define MUD_PIN_IRQ_TYPE_EDGE_BOTH		0x03
+  #define MUD_PIN_IRQ_TYPE			0x91
+  #define MUD_PIN_IRQ_ENABLED			0x92
+
+#endif
-- 
2.23.0


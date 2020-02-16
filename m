Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1D9A1604FA
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgBPR1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:06 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50660 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgBPR1G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:06 -0500
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 Feb 2020 12:26:59 EST
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 83324200ED;
        Sun, 16 Feb 2020 18:21:40 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 5/9] usb: gadget: function: mud: Add gpio support
Date:   Sun, 16 Feb 2020 18:21:13 +0100
Message-Id: <20200216172117.49832-6-noralf@tronnes.org>
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
        a=SJz97ENfAAAA:8 a=OVWlCPoClyRDxbRKtg8A:9 a=ENd6JL4-XTPeTk_z:21
        a=YaaFWRjS8iQpcXM6:21 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add optional gpio functionality to the Multifunction USB Device.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/usb/gadget/Kconfig               |  14 +
 drivers/usb/gadget/function/Makefile     |   2 +
 drivers/usb/gadget/function/f_mud_pins.c | 962 +++++++++++++++++++++++
 3 files changed, 978 insertions(+)
 create mode 100644 drivers/usb/gadget/function/f_mud_pins.c

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 9551876ffe08..d6285146ec76 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -219,6 +219,9 @@ config USB_F_TCM
 config USB_F_MUD
 	tristate
 
+config USB_F_MUD_PINS
+	tristate
+
 # this first set of drivers all depend on bulk-capable hardware.
 
 config USB_CONFIGFS
@@ -493,6 +496,17 @@ menuconfig USB_CONFIGFS_F_MUD
 	help
 	  Core support for the Multifunction USB Device.
 
+if USB_F_MUD
+
+config USB_CONFIGFS_F_MUD_PINS
+	bool "Multifunction USB Device GPIO"
+	depends on PINCTRL
+	select USB_F_MUD_PINS
+	help
+	  GPIO support for the Multifunction USB Device.
+
+endif # USB_F_MUD
+
 choice
 	tristate "USB Gadget precomposed configurations"
 	default USB_ETH
diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index b6e31b511521..2e24227fcc12 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -52,3 +52,5 @@ usb_f_tcm-y			:= f_tcm.o
 obj-$(CONFIG_USB_F_TCM)		+= usb_f_tcm.o
 usb_f_mud-y			:= f_mud.o mud_regmap.o
 obj-$(CONFIG_USB_F_MUD)		+= usb_f_mud.o
+usb_f_mud_pins-y		:= f_mud_pins.o
+obj-$(CONFIG_USB_F_MUD_PINS)	+= usb_f_mud_pins.o
diff --git a/drivers/usb/gadget/function/f_mud_pins.c b/drivers/usb/gadget/function/f_mud_pins.c
new file mode 100644
index 000000000000..b3466804ad5e
--- /dev/null
+++ b/drivers/usb/gadget/function/f_mud_pins.c
@@ -0,0 +1,962 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Noralf Trønnes
+ */
+
+#include <linux/bitmap.h>
+#include <linux/configfs.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "f_mud.h"
+#include "../../../pinctrl/pinctrl-mud.h"
+
+/*
+ * Even though the host side is a pinctrl driver, the device side is a gpio consumer.
+ * That's because not all boards have a pin controller.
+ */
+
+/* Temporary debugging aid */
+#define fmdebug(fmt, ...)				\
+do {							\
+	if (1)						\
+		printk(KERN_DEBUG fmt, ##__VA_ARGS__);	\
+} while (0)
+
+static DEFINE_IDA(f_mud_pins_ida);
+
+struct f_mud_pins_cell_item {
+	struct list_head node;
+	unsigned int index;
+	struct config_group group;
+
+	struct mutex lock; /* Protect the values below */
+	int refcnt;
+
+	const char *name;
+	const char *chip;
+	int offset;
+};
+
+static inline struct f_mud_pins_cell_item *ci_to_f_mud_pins_cell_item(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_mud_pins_cell_item, group);
+}
+
+struct f_mud_pins_lookup_device {
+	struct device dev;
+	int id;
+	struct f_mud_cell *cell;
+	struct gpiod_lookup_table *lookup;
+	const char **names;
+	unsigned int count;
+};
+
+struct f_mud_pins_pin {
+	struct f_mud_pins_cell *parent;
+	unsigned int index;
+	struct gpio_desc *gpio;
+	unsigned long dflags;
+	unsigned int debounce;
+#define DEBOUNCE_NOT_SET UINT_MAX
+	bool config_requested;
+	int irq;
+	int irqflags;
+};
+
+struct f_mud_pins_cell {
+	struct f_mud_cell cell;
+
+	struct mutex lock; /* Protect refcnt and items */
+	int refcnt;
+	struct list_head items;
+
+	struct f_mud_pins_lookup_device *ldev;
+	struct f_mud_pins_pin *pins;
+	unsigned int count;
+	spinlock_t irq_status_lock;
+	unsigned long *irq_status;
+};
+
+static inline struct f_mud_pins_cell *ci_to_f_mud_pins_cell(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_mud_pins_cell, cell.group);
+}
+
+static inline struct f_mud_pins_cell *cell_to_pcell(struct f_mud_cell *cell)
+{
+	return container_of(cell, struct f_mud_pins_cell, cell);
+}
+
+static irqreturn_t f_mud_pins_gpio_irq_thread(int irq, void *p)
+{
+	struct f_mud_pins_pin *pin = p;
+	struct f_mud_pins_cell *pcell = pin->parent;
+
+	spin_lock(&pcell->irq_status_lock);
+	set_bit(pin->index, pcell->irq_status);
+	spin_unlock(&pcell->irq_status_lock);
+
+	fmdebug("%s(index=%u): irq_status=%*pb\n", __func__, pin->index,
+		pcell->count, pcell->irq_status);
+
+	f_mud_irq(pcell->ldev->cell);
+
+	return IRQ_HANDLED;
+}
+
+static int f_mud_pins_gpio_irq_request(struct f_mud_pins_cell *pcell, unsigned int index)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+	int ret, irq;
+
+	fmdebug("%s(index=%u)\n", __func__, index);
+
+	if (pin->irq)
+		return 0;
+
+	if (!pin->gpio || !pin->irqflags)
+		return -EINVAL;
+
+	ret = gpiod_get_direction(pin->gpio);
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EINVAL;
+
+	irq = gpiod_to_irq(pin->gpio);
+	fmdebug("    irq=%d\n", irq);
+	if (irq <= 0)
+		return -ENODEV;
+
+	ret = request_threaded_irq(irq, NULL, f_mud_pins_gpio_irq_thread,
+				   pin->irqflags | IRQF_ONESHOT,
+				   dev_name(&pcell->ldev->dev), pin);
+	if (ret)
+		return ret;
+
+	pin->irq = irq;
+
+	return 0;
+}
+
+static void f_mud_pins_gpio_irq_free(struct f_mud_pins_cell *pcell, unsigned int index)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+
+	fmdebug("%s(index=%u): irq=%d\n", __func__, index, pin->irq);
+
+	if (pin->irq) {
+		free_irq(pin->irq, pin);
+		pin->irq = 0;
+	}
+}
+
+static void f_mud_pins_gpio_irq_free_all(struct f_mud_pins_cell *pcell)
+{
+	unsigned int i;
+
+	for (i = 0; i < pcell->count; i++)
+		f_mud_pins_gpio_irq_free(pcell, i);
+}
+
+static int f_mud_pins_gpio_irq_type(struct f_mud_pins_cell *pcell, unsigned int index,
+				    unsigned int val)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+
+	fmdebug("%s(index=%u, val=%u)\n", __func__, index, val);
+
+	switch (val) {
+	case MUD_PIN_IRQ_TYPE_EDGE_RISING:
+		pin->irqflags = IRQF_TRIGGER_RISING;
+		break;
+	case MUD_PIN_IRQ_TYPE_EDGE_FALLING:
+		pin->irqflags = IRQF_TRIGGER_FALLING;
+		break;
+	case MUD_PIN_IRQ_TYPE_EDGE_BOTH:
+		pin->irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+		break;
+	case MUD_PIN_IRQ_TYPE_NONE:
+		pin->irqflags = IRQF_TRIGGER_NONE;
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	return 0;
+}
+
+static void f_mud_pins_gpio_free(struct f_mud_pins_cell *pcell, unsigned int index)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+
+	fmdebug("%s(index=%u): gpio=%d, config_requested=%u\n", __func__, index,
+		pin->gpio ? desc_to_gpio(pin->gpio) : -1, pin->config_requested);
+
+	if (pin->config_requested)
+		return;
+
+	if (pin->gpio)
+		gpiod_put(pin->gpio);
+	pin->gpio = NULL;
+}
+
+/* When flags change re-request the gpio to enable the settings */
+static int f_mud_pins_gpio_request_do(struct f_mud_pins_cell *pcell, unsigned int index,
+				      bool config, unsigned int debounce)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+	struct gpio_desc *gpio;
+	int ret;
+
+	fmdebug("%s(index=%u): lflags=%lu dflags=%lu\n", __func__, index,
+		pcell->ldev->lookup->table[index].flags, pin->dflags);
+
+	if (!pcell->pins[index].gpio && config)
+		pin->config_requested = true;
+
+	if (pcell->pins[index].gpio) {
+		gpiod_put(pcell->pins[index].gpio);
+		pcell->pins[index].gpio = NULL;
+	}
+
+	gpio = gpiod_get_index(&pcell->ldev->dev, NULL, index, pin->dflags);
+	if (IS_ERR(gpio)) {
+		ret = PTR_ERR(gpio);
+		fmdebug("failed to get gpio %u: ret=%d\n", index, ret);
+		return ret;
+	}
+	pin->gpio = gpio;
+	fmdebug("    gpios[%u]: gpionr %d\n", index, desc_to_gpio(gpio));
+
+	/* Debounce can be set through pinconf so it must be stored */
+	if (debounce == DEBOUNCE_NOT_SET)
+		debounce = pin->debounce;
+
+	if (debounce != DEBOUNCE_NOT_SET) {
+		ret = gpiod_set_debounce(pin->gpio, debounce);
+		if (ret)
+			return ret;
+
+		pin->debounce = debounce ? debounce : DEBOUNCE_NOT_SET;
+	}
+
+	return 0;
+}
+
+static int f_mud_pins_gpio_request_debounce(struct f_mud_pins_cell *pcell,
+					    unsigned int index, unsigned int debounce)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+
+	if (pin->debounce == debounce)
+		return 0;
+
+	return f_mud_pins_gpio_request_do(pcell, index, true, debounce);
+}
+
+static int f_mud_pins_gpio_request_dflag(struct f_mud_pins_cell *pcell, unsigned int index,
+					 enum gpiod_flags dflag, bool dval, bool config)
+{
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+	bool curr_dflag = pin->dflags & dflag;
+	bool changed = false;
+
+	fmdebug("%s(index=%u): dflag=%u dval=%u\n", __func__, index, dflag, dval);
+
+	if (curr_dflag != dval) {
+		if (dval)
+			pin->dflags |= dflag;
+		else
+			pin->dflags &= ~dflag;
+		changed = true;
+	}
+
+	if (pin->gpio && !changed)
+		return 0;
+
+	return f_mud_pins_gpio_request_do(pcell, index, config, DEBOUNCE_NOT_SET);
+}
+
+static int f_mud_pins_gpio_request_lflag(struct f_mud_pins_cell *pcell, unsigned int index,
+					 enum gpio_lookup_flags lflag, bool lval,
+					 bool config)
+{
+	struct gpiod_lookup *lentry = &pcell->ldev->lookup->table[index];
+	struct f_mud_pins_pin *pin = &pcell->pins[index];
+	bool curr_lflag = lentry->flags & lflag;
+	bool changed = false;
+
+	fmdebug("%s(index=%u): lflag=%u lval=%u\n", __func__, index, lflag, lval);
+
+	if (curr_lflag != lval) {
+		if (lval)
+			lentry->flags |= lflag;
+		else
+			lentry->flags &= ~lflag;
+		changed = true;
+	}
+
+	if (pin->gpio && !changed)
+		return 0;
+
+	return f_mud_pins_gpio_request_do(pcell, index, config, DEBOUNCE_NOT_SET);
+}
+
+static int f_mud_pins_write_gpio_config(struct f_mud_pins_cell *pcell, unsigned int index,
+					unsigned int offset, unsigned int val)
+{
+	struct f_mud_pins_pin *pin;
+	int ret = -ENOTSUPP;
+
+	fmdebug("%s(index=%u, offset=0x%02x, val=%u)\n", __func__, index, offset, val);
+
+	pin = &pcell->pins[index];
+
+	switch (offset) {
+	case MUD_PIN_CONFIG_BIAS_PULL_DOWN:
+		if (!val)
+			return -ENOTSUPP;
+		ret = f_mud_pins_gpio_request_lflag(pcell, index, GPIO_PULL_DOWN, val, true);
+		break;
+	case MUD_PIN_CONFIG_BIAS_PULL_UP:
+		if (!val)
+			return -ENOTSUPP;
+		ret = f_mud_pins_gpio_request_lflag(pcell, index, GPIO_PULL_UP, val, true);
+		break;
+	case MUD_PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		ret = f_mud_pins_gpio_request_lflag(pcell, index, GPIO_OPEN_DRAIN, 1, true);
+		break;
+	case MUD_PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		ret = f_mud_pins_gpio_request_lflag(pcell, index, GPIO_OPEN_SOURCE, 1, true);
+		break;
+	case MUD_PIN_CONFIG_DRIVE_PUSH_PULL:
+		ret = f_mud_pins_gpio_request_dflag(pcell, index, GPIOD_IN, 0, true);
+		break;
+	case MUD_PIN_CONFIG_INPUT_DEBOUNCE:
+		ret = f_mud_pins_gpio_request_debounce(pcell, index, val);
+		break;
+	case MUD_PIN_CONFIG_INPUT_ENABLE:
+		ret = f_mud_pins_gpio_request_dflag(pcell, index, GPIOD_IN, val, true);
+		break;
+	case MUD_PIN_CONFIG_OUTPUT:
+		val = val ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+		ret = f_mud_pins_gpio_request_dflag(pcell, index, val, 1, true);
+		break;
+	case MUD_PIN_CONFIG_PERSIST_STATE:
+		ret = f_mud_pins_gpio_request_lflag(pcell, index, GPIO_TRANSITORY, val, true);
+		break;
+	}
+
+	return ret;
+}
+
+static int f_mud_pins_write_gpio(struct f_mud_pins_cell *pcell, unsigned int regnr,
+				 const void *buf, size_t len)
+{
+	unsigned int regbase = regnr - MUD_PINCTRL_REG_PIN_BASE;
+	unsigned int offset = regbase % MUD_PINCTRL_PIN_BLOCK_SIZE;
+	unsigned int index = regbase / MUD_PINCTRL_PIN_BLOCK_SIZE;
+	size_t count = len / sizeof(u32);
+	struct f_mud_pins_pin *pin;
+	const __le32 *buf32 = buf;
+	u32 val;
+	int ret;
+
+	fmdebug("%s(len=%zu): offset=0x%02x index=%u\n", __func__, len, offset, index);
+
+	if (index >= pcell->count) {
+		fmdebug("%s: gpio index out of bounds: %u\n", __func__, index);
+		return -EINVAL;
+	}
+
+	while (count--) {
+		pin = &pcell->pins[index];
+		val = le32_to_cpup(buf32++);
+		ret = 0;
+
+		switch (offset++) {
+		case MUD_PIN_CONFIG_BIAS_BUS_HOLD ... MUD_PIN_CONFIG_END:
+			return f_mud_pins_write_gpio_config(pcell, index, offset - 1, val);
+
+		case MUD_PIN_GPIO_REQUEST:
+			if (val != 1)
+				return -EINVAL;
+			/* Persistence is the default so set it from the start */
+			ret = f_mud_pins_gpio_request_lflag(pcell, index, GPIO_TRANSITORY,
+							    0, false);
+			break;
+		case MUD_PIN_GPIO_FREE:
+			if (val != 1)
+				return -EINVAL;
+			f_mud_pins_gpio_free(pcell, index);
+			break;
+
+		case MUD_PIN_DIRECTION:
+			if (!pin)
+				return -EINVAL;
+
+			if (val == MUD_PIN_DIRECTION_INPUT) {
+				ret = gpiod_direction_input(pin->gpio);
+			} else {
+				int value = !!(val & MUD_PIN_DIRECTION_OUTPUT_HIGH);
+
+				ret = gpiod_direction_output(pin->gpio, value);
+			}
+			break;
+		case MUD_PIN_LEVEL:
+			if (pin)
+				gpiod_set_value_cansleep(pin->gpio, val);
+			break;
+		case MUD_PIN_IRQ_TYPE:
+			ret = f_mud_pins_gpio_irq_type(pcell, index, val);
+			break;
+		case MUD_PIN_IRQ_ENABLED:
+			if (val)
+				ret = f_mud_pins_gpio_irq_request(pcell, index);
+			else
+				f_mud_pins_gpio_irq_free(pcell, index);
+			break;
+		default:
+			pr_err("%s: unknown register: 0x%x\n", __func__, regnr);
+			return -EINVAL;
+		}
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int f_mud_pins_writereg(struct f_mud_cell *cell, unsigned int regnr,
+			       const void *buf, size_t len, u8 compression)
+{
+	struct f_mud_pins_cell *pcell = cell_to_pcell(cell);
+
+	fmdebug("%s(regnr=0x%02x, len=%zu)\n", __func__, regnr, len);
+
+	if (regnr >= MUD_PINCTRL_REG_PIN_BASE)
+		return f_mud_pins_write_gpio(pcell, regnr, buf, len);
+
+	return -EINVAL;
+}
+
+static int f_mud_pins_read_gpio(struct f_mud_pins_cell *pcell, unsigned int regnr,
+				void *buf, size_t len)
+{
+	unsigned int regbase = regnr - MUD_PINCTRL_REG_PIN_BASE;
+	unsigned int offset = regbase % MUD_PINCTRL_PIN_BLOCK_SIZE;
+	unsigned int index = regbase / MUD_PINCTRL_PIN_BLOCK_SIZE;
+	size_t count = len / sizeof(u32);
+	struct f_mud_pins_pin *pin;
+	struct gpio_desc *gpio;
+	__le32 *buf32 = buf;
+	u32 val;
+	int ret;
+
+	fmdebug("%s(len=%zu): offset=0x%02x index=%u\n", __func__, len, offset, index);
+
+	if (index >= pcell->count) {
+		fmdebug("%s: gpio index out of bounds: %u\n", __func__, index);
+		return -EINVAL;
+	}
+
+	if (offset >= MUD_PIN_NAME && (offset + count - 1) <= MUD_PIN_NAME_END) {
+		size_t start = (offset - MUD_PIN_NAME) * sizeof(u32);
+		char name[MUD_PIN_NAME_LEN];
+
+		strscpy_pad(name, pcell->ldev->names[index], MUD_PIN_NAME_LEN);
+		fmdebug("    name=%*ph\n", MUD_PIN_NAME_LEN, name);
+		memcpy(buf, name + start, len);
+
+		return 0;
+	}
+
+	pin = &pcell->pins[index];
+
+	while (count--) {
+		switch (offset++) {
+		case MUD_PIN_DIRECTION:
+			/*
+			 * Host side gpiochip_add_data_with_key() calls ->get_direction
+			 * without requesting the gpio first.
+			 */
+			gpio = pin->gpio;
+			if (!gpio) {
+				/* non gpio pins will fail here, but that's fine */
+				ret = f_mud_pins_gpio_request_lflag(pcell, index,
+								    0, 0, false);
+				if (ret)
+					return ret;
+			}
+			ret = gpiod_get_direction(pin->gpio);
+			if (!gpio)
+				f_mud_pins_gpio_free(pcell, index);
+			if (ret < 0)
+				return ret;
+			val = ret ? MUD_PIN_DIRECTION_INPUT : MUD_PIN_DIRECTION_OUTPUT;
+			break;
+		case MUD_PIN_LEVEL:
+			if (!pin->gpio)
+				return -EINVAL;
+			ret = gpiod_get_value_cansleep(pin->gpio);
+			if (ret < 0)
+				return ret;
+			val = ret;
+			break;
+		case MUD_PIN_IRQ_TYPES:
+			/* FIXME: Is it possible to get this info somewhere? */
+			val = MUD_PIN_IRQ_TYPE_EDGE_BOTH;
+			break;
+		default:
+			pr_err("%s: unknown register: 0x%x\n", __func__, regnr);
+			return -EINVAL;
+		}
+
+		*(buf32++) = cpu_to_le32(val);
+	}
+
+	return 0;
+}
+
+static int f_mud_pins_readreg(struct f_mud_cell *cell, unsigned int regnr,
+			      void *buf, size_t *len, u8 compression)
+{
+	struct f_mud_pins_cell *pcell = cell_to_pcell(cell);
+	size_t count = *len / sizeof(u32);
+	__le32 *buf32 = buf;
+
+	fmdebug("%s(regnr=0x%02x, len=%zu)\n", __func__, regnr, *len);
+
+	if (regnr >= MUD_PINCTRL_REG_PIN_BASE)
+		return f_mud_pins_read_gpio(pcell, regnr, buf, *len);
+
+	if (regnr >= MUD_PINCTRL_REG_IRQ_STATUS &&
+	    regnr <= MUD_PINCTRL_REG_IRQ_STATUS_END) {
+		unsigned int nregs = DIV_ROUND_UP(pcell->count, sizeof(u32));
+		unsigned int offset = regnr - MUD_PINCTRL_REG_IRQ_STATUS;
+		unsigned int i, end = min_t(unsigned int, count, nregs);
+		u32 irqvals[MUD_PINCTRL_MAX_NUM_PINS / sizeof(u32)];
+
+		if (count > (nregs - offset))
+			return -EINVAL;
+
+		bitmap_to_arr32(irqvals, pcell->irq_status, pcell->count);
+
+		fmdebug("    irq_status=%*pb  irqvals=%*ph\n", pcell->count,
+			pcell->irq_status, nregs, irqvals);
+
+		for (i = offset; i < end; i++)
+			*buf32++ = cpu_to_le32(irqvals[i]);
+
+		return 0;
+	}
+
+	if (regnr == MUD_PINCTRL_REG_NUM_PINS && count == 1) {
+		*buf32 = cpu_to_le32(pcell->count);
+		return 0;
+	}
+
+	fmdebug("%s: unknown register 0x%x\n", __func__, regnr);
+
+	return -EINVAL;
+}
+
+static void f_mud_pins_disable(struct f_mud_cell *cell)
+{
+	struct f_mud_pins_cell *pcell = cell_to_pcell(cell);
+
+	f_mud_pins_gpio_irq_free_all(pcell);
+	/*
+	 * FIXME: Free requested gpios as well?
+	 *        Or should they survive on unplug on a powered board?
+	 */
+}
+
+static void f_mud_pins_lookup_device_release(struct device *dev)
+{
+	struct f_mud_pins_lookup_device *ldev =
+				container_of(dev, struct f_mud_pins_lookup_device, dev);
+
+	fmdebug("%s: ldev=%px\n", __func__, ldev);
+
+	if (ldev->lookup) {
+		struct gpiod_lookup *p;
+
+		if (ldev->lookup->dev_id)
+			gpiod_remove_lookup_table(ldev->lookup);
+
+		for (p = &ldev->lookup->table[0]; p->chip_label; p++)
+			kfree(p->chip_label);
+		kfree(ldev->lookup);
+	}
+
+	if (ldev->names) {
+		unsigned int i;
+
+		for (i = 0; i < ldev->count; i++)
+			kfree(ldev->names[i]);
+		kfree(ldev->names);
+	}
+
+	ida_free(&f_mud_pins_ida, ldev->id);
+	kfree(ldev);
+}
+
+static int f_mud_pins_looup_device_create(struct f_mud_pins_cell *pcell)
+{
+	struct f_mud_pins_lookup_device *ldev;
+	struct f_mud_pins_cell_item *fitem;
+	unsigned int max_index = 0;
+	int ret;
+
+	fmdebug("%s: %px\n", __func__, pcell);
+
+	ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
+	if (!ldev)
+		return -ENOMEM;
+
+	fmdebug("%s: ldev=%px\n", __func__, ldev);
+
+	ldev->id = ida_alloc(&f_mud_pins_ida, GFP_KERNEL);
+	if (ldev->id < 0) {
+		kfree(ldev);
+		return ldev->id;
+	}
+
+	ldev->cell = &pcell->cell;
+	ldev->dev.release = f_mud_pins_lookup_device_release;
+	dev_set_name(&ldev->dev, "f_mud_pins-%d", ldev->id);
+
+	ret = device_register(&ldev->dev);
+	if (ret) {
+		put_device(&ldev->dev);
+		return ret;
+	}
+
+	mutex_lock(&pcell->lock);
+
+	list_for_each_entry(fitem, &pcell->items, node) {
+		max_index = max(max_index, fitem->index);
+		ldev->count++;
+	}
+
+	if (!ldev->count) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	if (ldev->count != max_index + 1) {
+		pr_err("Pin indices are not continuous\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ldev->names = kcalloc(ldev->count, sizeof(*ldev->names), GFP_KERNEL);
+	ldev->lookup = kzalloc(struct_size(ldev->lookup, table, ldev->count + 1),
+			       GFP_KERNEL);
+	if (!ldev->lookup || !ldev->names) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	ret = 0;
+	list_for_each_entry(fitem, &pcell->items, node) {
+		struct gpiod_lookup *entry = &ldev->lookup->table[fitem->index];
+
+		mutex_lock(&fitem->lock);
+
+		if (!fitem->name) {
+			pr_err("Missing name for pin %u\n", fitem->index);
+			ret = -EINVAL;
+			goto out_unlock_pin;
+		}
+
+		ldev->names[fitem->index] = kstrdup(fitem->name, GFP_KERNEL);
+		if (!ldev->names[fitem->index]) {
+			ret = -ENOMEM;
+			goto out_unlock_pin;
+		}
+
+		/* Skip adding to lookup if the pin has no gpio function */
+		if (!fitem->chip)
+			goto out_unlock_pin;
+
+		entry->idx = fitem->index;
+		entry->chip_hwnum = fitem->offset;
+
+		entry->chip_label = kstrdup(fitem->chip, GFP_KERNEL);
+		if (!entry->chip_label) {
+			ret = -ENOMEM;
+			goto out_unlock_pin;
+		}
+
+		fmdebug("    %u: chip=%s hwnum=%u name=%s\n", entry->idx,
+			entry->chip_label, entry->chip_hwnum, ldev->names[fitem->index]);
+out_unlock_pin:
+		mutex_unlock(&fitem->lock);
+		if (ret)
+			goto out_unlock;
+	}
+
+	ldev->lookup->dev_id = dev_name(&ldev->dev);
+	gpiod_add_lookup_table(ldev->lookup);
+
+	pcell->ldev = ldev;
+	pcell->count = ldev->count;
+
+out_unlock:
+	mutex_unlock(&pcell->lock);
+
+	if (ret)
+		device_unregister(&ldev->dev);
+
+	return ret;
+}
+
+static void f_mud_pins_lookup_device_destroy(struct f_mud_pins_cell *pcell)
+{
+	if (pcell->ldev) {
+		device_unregister(&pcell->ldev->dev);
+		pcell->ldev = NULL;
+	}
+}
+
+static int f_mud_pins_bind(struct f_mud_cell *cell)
+{
+	struct f_mud_pins_cell *pcell = cell_to_pcell(cell);
+	unsigned int i;
+	int ret;
+
+	fmdebug("%s: %px\n", __func__, pcell);
+
+	ret = f_mud_pins_looup_device_create(pcell);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&pcell->irq_status_lock);
+	pcell->irq_status = bitmap_zalloc(pcell->count, GFP_KERNEL);
+	if (!pcell->irq_status) {
+		ret = -ENOMEM;
+		goto error_free;
+	}
+
+	pcell->pins = kcalloc(pcell->count, sizeof(*pcell->pins), GFP_KERNEL);
+	if (!pcell->pins) {
+		ret = -ENOMEM;
+		goto error_free;
+	}
+
+	for (i = 0; i < pcell->count; i++) {
+		struct f_mud_pins_pin *pin = &pcell->pins[i];
+
+		pin->parent = pcell;
+		pin->index = i;
+		pin->debounce = DEBOUNCE_NOT_SET;
+	}
+
+	return 0;
+
+error_free:
+	kfree(pcell->pins);
+	f_mud_pins_lookup_device_destroy(pcell);
+
+	return ret;
+}
+
+static void f_mud_pins_unbind(struct f_mud_cell *cell)
+{
+	struct f_mud_pins_cell *pcell = cell_to_pcell(cell);
+	unsigned int i;
+
+	fmdebug("%s:\n", __func__);
+
+	if (pcell->pins) {
+		for (i = 0; i < pcell->count; i++) {
+			if (pcell->pins[i].gpio) {
+				fmdebug("    gpiod_put: %u\n", i);
+				gpiod_put(pcell->pins[i].gpio);
+			}
+		}
+
+		kfree(pcell->pins);
+	}
+
+	bitmap_free(pcell->irq_status);
+
+	f_mud_pins_lookup_device_destroy(pcell);
+}
+
+static void f_mud_pins_cell_item_item_release(struct config_item *item)
+{
+	struct f_mud_pins_cell_item *fitem = ci_to_f_mud_pins_cell_item(item);
+
+	fmdebug("%s: fitem=%px\n", __func__, fitem);
+
+	kfree(fitem->name);
+	kfree(fitem->chip);
+	kfree(fitem);
+}
+
+F_MUD_OPT_STR(f_mud_pins_cell_item, name);
+F_MUD_OPT_STR(f_mud_pins_cell_item, chip);
+F_MUD_OPT_INT(f_mud_pins_cell_item, offset, 0, INT_MAX);
+
+static struct configfs_attribute *f_mud_pins_cell_item_attrs[] = {
+	&f_mud_pins_cell_item_attr_name,
+	&f_mud_pins_cell_item_attr_chip,
+	&f_mud_pins_cell_item_attr_offset,
+	NULL,
+};
+
+static struct configfs_item_operations f_mud_pins_cell_item_item_ops = {
+	.release = f_mud_pins_cell_item_item_release,
+};
+
+static const struct config_item_type f_mud_pins_cell_item_func_type = {
+	.ct_item_ops	= &f_mud_pins_cell_item_item_ops,
+	.ct_attrs	= f_mud_pins_cell_item_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *f_mud_pins_make_group(struct config_group *group,
+						  const char *name)
+{
+	struct f_mud_pins_cell *pcell = ci_to_f_mud_pins_cell(&group->cg_item);
+	struct f_mud_pins_cell_item *fitem;
+	const char *prefix = "pin.";
+	struct config_group *grp;
+	int ret, index;
+
+	fmdebug("%s: name=%s\n", __func__, name);
+
+	mutex_lock(&pcell->lock);
+	fmdebug("%s: pcell=%px pcell->refcnt=%d\n", __func__, pcell, pcell->refcnt);
+	if (pcell->refcnt) {
+		grp = ERR_PTR(-EBUSY);
+		goto out_unlock;
+	}
+
+	if (strstr(name, prefix) != name) {
+		pr_err("Missing prefix '%s' in name: '%s'\n", prefix, name);
+		grp = ERR_PTR(-EINVAL);
+		goto out_unlock;
+	}
+
+	ret = kstrtoint(name + strlen(prefix), 10, &index);
+	if (ret) {
+		pr_err("Failed to parse index in name: '%s'\n", name);
+		grp = ERR_PTR(ret);
+		goto out_unlock;
+	}
+
+	fitem = kzalloc(sizeof(*fitem), GFP_KERNEL);
+	fmdebug("    pin=%px\n", fitem);
+	if (!fitem) {
+		grp = ERR_PTR(-ENOMEM);
+		goto out_unlock;
+	}
+
+	fitem->index = index;
+	grp = &fitem->group;
+
+	config_group_init_type_name(grp, "", &f_mud_pins_cell_item_func_type);
+
+	list_add(&fitem->node, &pcell->items);
+out_unlock:
+	mutex_unlock(&pcell->lock);
+
+	return grp;
+}
+
+static void f_mud_pins_drop_item(struct config_group *group, struct config_item *item)
+{
+	struct f_mud_pins_cell *pcell = ci_to_f_mud_pins_cell(&group->cg_item);
+	struct f_mud_pins_cell_item *fitem = ci_to_f_mud_pins_cell_item(item);
+
+	fmdebug("%s: pcell=%px fitem=%px\n", __func__, pcell, fitem);
+
+	mutex_lock(&pcell->lock);
+	list_del(&fitem->node);
+	mutex_unlock(&pcell->lock);
+
+	config_item_put(item);
+}
+
+static struct configfs_group_operations f_mud_pins_group_ops = {
+	.make_group	= f_mud_pins_make_group,
+	.drop_item	= f_mud_pins_drop_item,
+};
+
+static struct configfs_item_operations f_mud_pins_item_ops = {
+	.release = f_mud_cell_item_release,
+};
+
+static const struct config_item_type f_mud_pins_func_type = {
+	.ct_item_ops	= &f_mud_pins_item_ops,
+	.ct_group_ops	= &f_mud_pins_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void f_mud_pins_free(struct f_mud_cell *cell)
+{
+	struct f_mud_pins_cell *pcell = container_of(cell, struct f_mud_pins_cell, cell);
+
+	fmdebug("%s: pcell=%px\n", __func__, pcell);
+
+	mutex_destroy(&pcell->lock);
+	kfree(pcell);
+}
+
+static struct f_mud_cell *f_mud_pins_alloc(void)
+{
+	struct f_mud_pins_cell *pcell;
+
+	pcell = kzalloc(sizeof(*pcell), GFP_KERNEL);
+	fmdebug("%s: pcell=%px\n", __func__, pcell);
+	if (!pcell)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&pcell->lock);
+	INIT_LIST_HEAD(&pcell->items);
+	config_group_init_type_name(&pcell->cell.group, "", &f_mud_pins_func_type);
+
+	fmdebug("%s: cell=%px\n", __func__, &pcell->cell);
+
+	return &pcell->cell;
+}
+
+static const struct f_mud_cell_ops f_mud_pins_ops = {
+	.name = "mud-pins",
+	.owner = THIS_MODULE,
+
+	.interrupt_interval_ms = 100,
+
+	.alloc = f_mud_pins_alloc,
+	.free = f_mud_pins_free,
+	.bind = f_mud_pins_bind,
+	.unbind = f_mud_pins_unbind,
+
+	.regval_bytes = 4,
+	.max_transfer_size = 64,
+
+	.disable = f_mud_pins_disable,
+	.readreg = f_mud_pins_readreg,
+	.writereg = f_mud_pins_writereg,
+};
+
+DECLARE_F_MUD_CELL_INIT(f_mud_pins_ops);
+
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("GPL");
-- 
2.23.0


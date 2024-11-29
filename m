Return-Path: <linux-usb+bounces-17863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354F9D941D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1BA16898F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D7B1BD507;
	Tue, 26 Nov 2024 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WpmWgXyr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D718018E362
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612873; cv=none; b=KQeLo1RRKN8Gk+N1peMSZni3f49M6x4g3ymOXhuUgS3To/kMLpehBbdEQQ+jEw/Q/J7f6/CdvfR46j0PxGXwjjfGzA5P+gRrkZqDUfxoVW+oqHEWC2oMn+yois2A2DVTqee1tYtM5trSE7gKDd/waa/M6vA8vDJUgsNKtfqvJ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612873; c=relaxed/simple;
	bh=EqyCCrGqEJwg3+iLhcuJrpOwueTe8BY2KShqIIlG8ZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8HmXr6mAT1vYhop+IQibB/vgjZK45fzwTB9iAsUxovKzbgjaAfgTdiFEkfwzttBuiH/IwnVq18VYNIIVnC7LJjZJUWO16lpoDYKw9OFiCAWHMEm6daCbP245e8X2QWD2D2dvl8jbN+5xNxIGr9iaWHE8UlO2y/056aBFkXtNzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WpmWgXyr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a752140eso2727615e9.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612869; x=1733217669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vCamtieJ1Any0nEDdOYudZWF6ph91xcO8/i+h+/3r0=;
        b=WpmWgXyrfuIkNdGBirDiL0o9+2F5c/OS9QxGPfWXRN14eKKiLmwatebdp8nz/Nq1hk
         OyohD5xO9pkHRT7odfi4tx+HukktcrVdtHGQQAdH3HQP3SaeSy2B3ynG/nH/1CXe6IG7
         WNgEHOhQzJn/cDHa7kS8zUo+PHqz05tblKrdgTJFguG/Xn4Bf4PfUo7KzLHmDhdQ87Yg
         1ckjGVQmD+DniYnpUUUeBd8Rj6DmQaXRmc+MteZ4bKIuM0KWYgCfaPoDikTp75gZIF0/
         6bgHXEZ8WK/3KNo5mVKDpQLD2r8/9UYw1GE6grw07hpOb8pq1cqFIjC0OAAXnWTStyeC
         HxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612869; x=1733217669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vCamtieJ1Any0nEDdOYudZWF6ph91xcO8/i+h+/3r0=;
        b=Tp4c7E12LLn19TNA6BSIhsvCnG2LpIEDZgX9KFKelbeuWNoWuYXLuHA757edehI3i0
         MPHRj/cy662MZBd3eE+CYdo1zdzye2C/OF0eOKclJ2nWIvZHC8HtvLDdhS5XBbaeQO4R
         nqwRcjdZda7Bc7PlKSbKzHebsZCRrYt89GJq6bIAGBRvTcKYQ8rfRo3EZ74uga3kBE6g
         XRrEmkOZESeHP6nb7coK9Iufx/Fl8QMw2WnFyjQckYfnf+cvXd1XXaw5AF9bd+8C3/cd
         eB4m0A8EMM+jQIuHAOY6GuV+Gzkr+mTrXooOcceAqwaLWaGho8KKjccKfCzqx7TBCSt4
         20sw==
X-Forwarded-Encrypted: i=1; AJvYcCWoFVGS7jq8Ajoj8CB5mNNVZXr8cnMlujO5NJS9HfFidmLxNXlB/Mx4H8+PJpvyBzKBvUggBRya3l4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw21MqTgjd3TiQrAtWu81NlF89l9KkL8jwnDuaunJA7OD6RHkaN
	4Pi2YLg2cNdlTxvNSYx0jopEW2Jo0kAeTARY65gL8Um0RKSj6R8VSGfs88MylDs=
X-Gm-Gg: ASbGncv5M80R0e/VQDosAqU8QBSYj+sopx1D7Qp6GbFqiAnWeJHpmBX3Fr2p1pI8HyC
	wjhursNZECVml60FTarsOgC8C9GwCaTnKF8A+JR6+gIHSLLrel8vRE1lJ9lyDyCU/blAROD7OrM
	TMkL1sj/qgsiShiTQOvFPefpM/uNVfUtstq1lR+aXfL935QceBogXUM2xbuDGYY5xhCQw/Ww1JE
	op6Ncx370xgrqIp6DtjjC3aTkO3i9CYh2OAca0hKGjX9mNIOQUWSBZCwz7UxEpDL877R61ZyHH3
	EZY=
X-Google-Smtp-Source: AGHT+IHaYOnIDbCpLmYeLO1a6tWYrQIEozAksJelkAeI7VXpQtyjiqqF3I9/uKkLk0h0PGHL3GFAQQ==
X-Received: by 2002:a05:6000:2ad:b0:382:4a4e:25bb with SMTP id ffacd0b85a97d-38260bcc4fdmr15091977f8f.46.1732612868973;
        Tue, 26 Nov 2024 01:21:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:08 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ family
Date: Tue, 26 Nov 2024 11:20:37 +0200
Message-Id: <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S system controller (SYSC) has various registers that control
signals specific to individual IPs. IP drivers must control these signals
at different configuration phases.

Add SYSC driver that allows individual SYSC consumers to control these
signals. The SYSC driver exports a syscon regmap enabling IP drivers to
use a specific SYSC offset and mask from the device tree, which can then be
accessed through regmap_update_bits().

Currently, the SYSC driver provides control to the USB PWRRDY signal, which
is routed to the USB PHY. This signal needs to be managed before or after
powering the USB PHY off or on.

Other SYSC signals candidates (as exposed in the the hardware manual of the
RZ/G3S SoC) include:

* PCIe:
- ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
- PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
  register
- MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register

* SPI:
- SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
  register

* I2C/I3C:
- af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
  (x=0..3)
- af_bypass I3C signal controlled through SYS_I3C_CFG register

* Ethernet:
- FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
  registers (x=0..1)

As different Renesas RZ SoC shares most of the SYSC functionalities
available on the RZ/G3S SoC, the driver if formed of a SYSC core
part and a SoC specific part allowing individual SYSC SoC to provide
functionalities to the SYSC core.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Change in v2:
- this was patch 04/16 in v1
- dropped the initial approach proposed in v1 where a with a reset
  controller driver was proposed to handle the USB PWRRDY signal
- implemented it with syscon regmap and the SYSC signal concept
  (introduced in this patch)

 drivers/soc/renesas/Kconfig          |   7 +
 drivers/soc/renesas/Makefile         |   2 +
 drivers/soc/renesas/r9a08g045-sysc.c |  31 +++
 drivers/soc/renesas/rz-sysc.c        | 286 +++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  52 +++++
 5 files changed, 378 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.h

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 9f7fe02310b9..0686c3ad9e27 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -378,4 +378,11 @@ config PWC_RZV2M
 config RST_RCAR
 	bool "Reset Controller support for R-Car" if COMPILE_TEST
 
+config SYSC_RZ
+	bool "System controller for RZ SoCs" if COMPILE_TEST
+
+config SYSC_R9A08G045
+	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 734f8f8cefa4..8cd139b3dd0a 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -6,7 +6,9 @@ obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o
 ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
+obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
 
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
+obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
new file mode 100644
index 000000000000..ceea738aee72
--- /dev/null
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3S System controller driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/init.h>
+
+#include "rz-sysc.h"
+
+#define SYS_USB_PWRRDY		0xd70
+#define SYS_USB_PWRRDY_PWRRDY_N	BIT(0)
+#define SYS_MAX_REG		0xe20
+
+static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_data[] __initconst = {
+	{
+		.name = "usb-pwrrdy",
+		.offset = SYS_USB_PWRRDY,
+		.mask = SYS_USB_PWRRDY_PWRRDY_N,
+		.refcnt_incr_val = 0
+	}
+};
+
+const struct rz_sysc_init_data rzg3s_sysc_init_data = {
+	.signals_init_data = rzg3s_sysc_signals_init_data,
+	.num_signals = ARRAY_SIZE(rzg3s_sysc_signals_init_data),
+	.max_register_offset = SYS_MAX_REG,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
new file mode 100644
index 000000000000..dc0edacd7170
--- /dev/null
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ System controller driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/refcount.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+
+#include "rz-sysc.h"
+
+/**
+ * struct rz_sysc - RZ SYSC private data structure
+ * @base: SYSC base address
+ * @dev: SYSC device pointer
+ * @signals: SYSC signals
+ * @num_signals: number of SYSC signals
+ */
+struct rz_sysc {
+	void __iomem *base;
+	struct device *dev;
+	struct rz_sysc_signal *signals;
+	u8 num_signals;
+};
+
+static int rz_sysc_reg_read(void *context, unsigned int off, unsigned int *val)
+{
+	struct rz_sysc *sysc = context;
+
+	*val = readl(sysc->base + off);
+
+	return 0;
+}
+
+static struct rz_sysc_signal *rz_sysc_off_to_signal(struct rz_sysc *sysc, unsigned int offset,
+						    unsigned int mask)
+{
+	struct rz_sysc_signal *signals = sysc->signals;
+
+	for (u32 i = 0; i < sysc->num_signals; i++) {
+		if (signals[i].init_data->offset != offset)
+			continue;
+
+		/*
+		 * In case mask == 0 we just return the signal data w/o checking the mask.
+		 * This is useful when calling through rz_sysc_reg_write() to check
+		 * if the requested setting is for a mapped signal or not.
+		 */
+		if (mask) {
+			if (signals[i].init_data->mask == mask)
+				return &signals[i];
+		} else {
+			return &signals[i];
+		}
+	}
+
+	return NULL;
+}
+
+static int rz_sysc_reg_update_bits(void *context, unsigned int off,
+				   unsigned int mask, unsigned int val)
+{
+	struct rz_sysc *sysc = context;
+	struct rz_sysc_signal *signal;
+	bool update = false;
+
+	signal = rz_sysc_off_to_signal(sysc, off, mask);
+	if (signal) {
+		if (signal->init_data->refcnt_incr_val == val) {
+			if (!refcount_read(&signal->refcnt)) {
+				refcount_set(&signal->refcnt, 1);
+				update = true;
+			} else {
+				refcount_inc(&signal->refcnt);
+			}
+		} else {
+			update = refcount_dec_and_test(&signal->refcnt);
+		}
+	} else {
+		update = true;
+	}
+
+	if (update) {
+		u32 tmp;
+
+		tmp = readl(sysc->base + off);
+		tmp &= ~mask;
+		tmp |= val & mask;
+		writel(tmp, sysc->base + off);
+	}
+
+	return 0;
+}
+
+static int rz_sysc_reg_write(void *context, unsigned int off, unsigned int val)
+{
+	struct rz_sysc *sysc = context;
+	struct rz_sysc_signal *signal;
+
+	/*
+	 * Force using regmap_update_bits() for signals to have reference counter
+	 * per individual signal in case there are multiple signals controlled
+	 * through the same register.
+	 */
+	signal = rz_sysc_off_to_signal(sysc, off, 0);
+	if (signal) {
+		dev_err(sysc->dev,
+			"regmap_write() not allowed on register controlling a signal. Use regmap_update_bits()!");
+		return -EOPNOTSUPP;
+	}
+
+	writel(val, sysc->base + off);
+
+	return 0;
+}
+
+static bool rz_sysc_writeable_reg(struct device *dev, unsigned int off)
+{
+	struct rz_sysc *sysc = dev_get_drvdata(dev);
+	struct rz_sysc_signal *signal;
+
+	/* Any register containing a signal is writeable. */
+	signal = rz_sysc_off_to_signal(sysc, off, 0);
+	if (signal)
+		return true;
+
+	return false;
+}
+
+static bool rz_sysc_readable_reg(struct device *dev, unsigned int off)
+{
+	struct rz_sysc *sysc = dev_get_drvdata(dev);
+	struct rz_sysc_signal *signal;
+
+	/* Any register containing a signal is readable. */
+	signal = rz_sysc_off_to_signal(sysc, off, 0);
+	if (signal)
+		return true;
+
+	return false;
+}
+
+static int rz_sysc_signals_show(struct seq_file *s, void *what)
+{
+	struct rz_sysc *sysc = s->private;
+
+	seq_printf(s, "%-20s Enable count\n", "Signal");
+	seq_printf(s, "%-20s ------------\n", "--------------------");
+
+	for (u8 i = 0; i < sysc->num_signals; i++) {
+		seq_printf(s, "%-20s %d\n", sysc->signals[i].init_data->name,
+			   refcount_read(&sysc->signals[i].refcnt));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(rz_sysc_signals);
+
+static void rz_sysc_debugfs_remove(void *data)
+{
+	debugfs_remove_recursive(data);
+}
+
+static int rz_sysc_signals_init(struct rz_sysc *sysc,
+				const struct rz_sysc_signal_init_data *init_data,
+				u32 num_signals)
+{
+	struct dentry *root;
+	int ret;
+
+	sysc->signals = devm_kcalloc(sysc->dev, num_signals, sizeof(*sysc->signals),
+				     GFP_KERNEL);
+	if (!sysc->signals)
+		return -ENOMEM;
+
+	for (u32 i = 0; i < num_signals; i++) {
+		struct rz_sysc_signal_init_data *id;
+
+		id = devm_kzalloc(sysc->dev, sizeof(*id), GFP_KERNEL);
+		if (!id)
+			return -ENOMEM;
+
+		id->name = devm_kstrdup(sysc->dev, init_data->name, GFP_KERNEL);
+		if (!id->name)
+			return -ENOMEM;
+
+		id->offset = init_data->offset;
+		id->mask = init_data->mask;
+		id->refcnt_incr_val = init_data->refcnt_incr_val;
+
+		sysc->signals[i].init_data = id;
+		refcount_set(&sysc->signals[i].refcnt, 0);
+	}
+
+	sysc->num_signals = num_signals;
+
+	root = debugfs_create_dir("renesas-rz-sysc", NULL);
+	ret = devm_add_action_or_reset(sysc->dev, rz_sysc_debugfs_remove, root);
+	if (ret)
+		return ret;
+	debugfs_create_file("signals", 0444, root, sysc, &rz_sysc_signals_fops);
+
+	return 0;
+}
+
+static struct regmap_config rz_sysc_regmap = {
+	.name = "rz_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.reg_read = rz_sysc_reg_read,
+	.reg_write = rz_sysc_reg_write,
+	.reg_update_bits = rz_sysc_reg_update_bits,
+	.writeable_reg = rz_sysc_writeable_reg,
+	.readable_reg = rz_sysc_readable_reg,
+};
+
+static const struct of_device_id rz_sysc_match[] = {
+#ifdef CONFIG_SYSC_R9A08G045
+	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
+#endif
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rz_sysc_match);
+
+static int rz_sysc_probe(struct platform_device *pdev)
+{
+	const struct rz_sysc_init_data *data;
+	struct device *dev = &pdev->dev;
+	struct rz_sysc *sysc;
+	struct regmap *regmap;
+	int ret;
+
+	data = device_get_match_data(dev);
+	if (!data || !data->max_register_offset)
+		return -EINVAL;
+
+	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
+	if (!sysc)
+		return -ENOMEM;
+
+	sysc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sysc->base))
+		return PTR_ERR(sysc->base);
+
+	sysc->dev = dev;
+
+	ret = rz_sysc_signals_init(sysc, data->signals_init_data, data->num_signals);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, sysc);
+	rz_sysc_regmap.max_register = data->max_register_offset;
+	regmap = devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return of_syscon_register_regmap(dev->of_node, regmap);
+}
+
+static struct platform_driver rz_sysc_driver = {
+	.driver = {
+		.name = "renesas-rz-sysc",
+		.of_match_table = rz_sysc_match
+	},
+	.probe = rz_sysc_probe
+};
+
+static int __init rz_sysc_init(void)
+{
+	return platform_driver_register(&rz_sysc_driver);
+}
+subsys_initcall(rz_sysc_init);
+
+MODULE_DESCRIPTION("Renesas RZ System Controller Driver");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
new file mode 100644
index 000000000000..bb850310c931
--- /dev/null
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ System Controller
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#ifndef __SOC_RENESAS_RZ_SYSC_H__
+#define __SOC_RENESAS_RZ_SYSC_H__
+
+#include <linux/refcount.h>
+#include <linux/types.h>
+
+/**
+ * struct rz_sysc_signal_init_data - RZ SYSC signals init data
+ * @name: signal name
+ * @offset: register offset controling this signal
+ * @mask: bitmask in register specific to this signal
+ * @refcnt_incr_val: increment refcnt when setting this value
+ */
+struct rz_sysc_signal_init_data {
+	const char *name;
+	u32 offset;
+	u32 mask;
+	u32 refcnt_incr_val;
+};
+
+/**
+ * struct rz_sysc_signal - RZ SYSC signals
+ * @init_data: signals initialization data
+ * @refcnt: reference counter
+ */
+struct rz_sysc_signal {
+	const struct rz_sysc_signal_init_data *init_data;
+	refcount_t refcnt;
+};
+
+/**
+ * struct rz_sysc_init_data - RZ SYSC initialization data
+ * @signals_init_data: RZ SYSC signals initialization data
+ * @num_signals: number of SYSC signals
+ * @max_register_offset: Maximum SYSC register offset to be used by the regmap config
+ */
+struct rz_sysc_init_data {
+	const struct rz_sysc_signal_init_data *signals_init_data;
+	u32 num_signals;
+	u32 max_register_offset;
+};
+
+extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
+
+#endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.39.2



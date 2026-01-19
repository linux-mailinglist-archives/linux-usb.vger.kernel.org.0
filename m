Return-Path: <linux-usb+bounces-32495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BDD3A371
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 10:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 992AB30D2F04
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 09:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC1E356A1B;
	Mon, 19 Jan 2026 09:39:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931A3570DE;
	Mon, 19 Jan 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815550; cv=none; b=GfPVUfIkQe+OcqN71QTQF7ktR6UMhq9VxHuKZjjKKb+uihA/U820ceDlLd/HlvQCnpQiZRyKcRkia4D+o/V6v+UxKYDwbHGfDNBF7gaxy7iJdSJI+ltFo4r3K3IXcEXWWLiKNtdB5HggpBAvQy8VJr9o0QlZQ7F5sz4KLKElo0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815550; c=relaxed/simple;
	bh=gCQ7MhAXe5K3/6BtdNCIDcXwDaaGbQ28r1FhSNwR+Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMjuCS04YkJ5OP8dty17GGqpsl5+gLH5Um/c8xERsr4N2QosBDjvmZpxAJ1tsRrdY5YEiSjqw84Dzmbu9/Lhe/4eObv08oaBbPdHAFtoDX6Cmu7JS6Df2Xws/+xBi5P8w8c/2V9hVbMd/zSImrW/2gbfjeukn5eHsTdZnpjfhmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.206.18])
	by APP-01 (Coremail) with SMTP id qwCowAA3o26d+21pCk5LBQ--.13995S5;
	Mon, 19 Jan 2026 17:38:46 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	conor@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Date: Mon, 19 Jan 2026 17:38:34 +0800
Message-ID: <20260119093836.316007-4-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3o26d+21pCk5LBQ--.13995S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Kw47tw4xuw15trWktFWkZwb_yoWkWryfpF
	WrA34fKrn7KF4fuw4xGFWDKFyaqwnFyry7tw1I93s8XFyIgr1UZasaqryrZr1YyFn8GFW3
	t3Z8Jay29FsrCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
initialization and power management.

Add Kconfig/Makefile under drivers/phy/canaan/.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 drivers/phy/Kconfig               |   1 +
 drivers/phy/Makefile              |   1 +
 drivers/phy/canaan/Kconfig        |  14 ++
 drivers/phy/canaan/Makefile       |   2 +
 drivers/phy/canaan/phy-k230-usb.c | 283 ++++++++++++++++++++++++++++++
 5 files changed, 301 insertions(+)
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2ef..e37bcceef65a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -150,6 +150,7 @@ source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
+source "drivers/phy/canaan/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/ingenic/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index dcbb060c8207..8cef0a447986 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -22,6 +22,7 @@ obj-y					+= allwinner/	\
 					   apple/	\
 					   broadcom/	\
 					   cadence/	\
+					   canaan/	\
 					   freescale/	\
 					   hisilicon/	\
 					   ingenic/	\
diff --git a/drivers/phy/canaan/Kconfig b/drivers/phy/canaan/Kconfig
new file mode 100644
index 000000000000..1ff8831846d5
--- /dev/null
+++ b/drivers/phy/canaan/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Canaan platforms
+#
+config PHY_CANAAN_USB
+	tristate "Canaan USB2 PHY Driver"
+	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
+	select GENERIC_PHY
+	help
+	Enable this driver to support the USB 2.0 PHY controller
+	on Canaan K230 RISC-V SoCs. This PHY controller
+	provides physical layer functionality for USB 2.0 devices.
+	If you have a Canaan K230 board and need USB 2.0 support,
+	say Y or M here.
diff --git a/drivers/phy/canaan/Makefile b/drivers/phy/canaan/Makefile
new file mode 100644
index 000000000000..d73857ba284e
--- /dev/null
+++ b/drivers/phy/canaan/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_CANAAN_USB)		+= phy-k230-usb.o
diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
new file mode 100644
index 000000000000..350950563f60
--- /dev/null
+++ b/drivers/phy/canaan/phy-k230-usb.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Canaan usb PHY driver
+ *
+ * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#define MAX_PHYS		2
+
+/* Register offsets within the HiSysConfig system controller */
+#define K230_USB0_TEST_REG_BASE     0x70
+#define K230_USB0_CTL_REG_BASE      0xb0
+#define K230_USB1_TEST_REG_BASE     0x90
+#define K230_USB1_CTL_REG_BASE      0xb8
+
+/* Relative offsets within each PHY's control/test block */
+#define CTL0_OFFSET		0x00
+#define CTL1_OFFSET		0x04
+#define TEST_CTL3_OFFSET	0x0c
+
+/* Bit definitions for TEST_CTL3 */
+#define USB_IDPULLUP0		BIT(4)
+#define USB_DMPULLDOWN0		BIT(8)
+#define USB_DPPULLDOWN0		BIT(9)
+
+/* USB control register 0 in HiSysConfig system controller */
+/* PLL Integral Path Tune */
+#define USB_CTL0_PLLITUNE_MASK		GENMASK(23, 22)
+
+/* PLL Proportional Path Tune */
+#define USB_CTL0_PLLPTUNE_MASK		GENMASK(21, 18)
+
+/* PLL Bandwidth Adjustment */
+#define USB_CTL0_PLLBTUNE_MASK		GENMASK(17, 17)
+
+/* VReg18 Bypass Control */
+#define USB_CTL0_VREGBYPASS_MASK	GENMASK(16, 16)
+
+/* Retention Mode Enable */
+#define USB_CTL0_RETENABLEN_MASK	GENMASK(15, 15)
+
+/* Reserved Request Input */
+#define USB_CTL0_RESREQIN_MASK		GENMASK(14, 14)
+
+/* External VBUS Valid Select */
+#define USB_CTL0_VBUSVLDEXTSEL0_MASK	GENMASK(13, 13)
+
+/* OTG Block Disable Control */
+#define USB_CTL0_OTGDISABLE0_MASK	GENMASK(12, 12)
+
+/* Drive VBUS Enable */
+#define USB_CTL0_DRVVBUS0_MASK		GENMASK(11, 11)
+
+/* Autoresume Mode Enable */
+#define USB_CTL0_AUTORSMENB0_MASK	GENMASK(10, 10)
+
+/* HS Transceiver Asynchronous Control */
+#define USB_CTL0_HSXCVREXTCTL0_MASK	GENMASK(9, 9)
+
+/* USB 1.1 Transmit Data */
+#define USB_CTL0_FSDATAEXT0_MASK	GENMASK(8, 8)
+
+/* USB 1.1 SE0 Generation */
+#define USB_CTL0_FSSE0EXT0_MASK		GENMASK(7, 7)
+
+/* USB 1.1 Data Enable */
+#define USB_CTL0_TXENABLEN0_MASK	GENMASK(6, 6)
+
+/* Disconnect Threshold */
+#define USB_CTL0_COMPDISTUNE0_MASK	GENMASK(5, 3)
+
+/* Squelch Threshold */
+#define USB_CTL0_SQRXTUNE0_MASK		GENMASK(2, 0)
+
+/* USB control register 1 in HiSysConfig system controller */
+/* Data Detect Voltage */
+#define USB_CTL1_VDATREFTUNE0_MASK	GENMASK(23, 22)
+
+/* VBUS Valid Threshold */
+#define USB_CTL1_OTGTUNE0_MASK		GENMASK(21, 19)
+
+/* Transmitter High-Speed Crossover */
+#define USB_CTL1_TXHSXVTUNE0_MASK	GENMASK(18, 17)
+
+/* FS/LS Source Impedance */
+#define USB_CTL1_TXFSLSTUNE0_MASK	GENMASK(16, 13)
+
+/* HS DC Voltage Level */
+#define USB_CTL1_TXVREFTUNE0_MASK	GENMASK(12, 9)
+
+/* HS Transmitter Rise/Fall Time */
+#define USB_CTL1_TXRISETUNE0_MASK	GENMASK(8, 7)
+
+/* USB Source Impedance */
+#define USB_CTL1_TXRESTUNE0_MASK	GENMASK(6, 5)
+
+/* HS Transmitter Pre-Emphasis Current Control */
+#define USB_CTL1_TXPREEMPAMPTUNE0_MASK	GENMASK(4, 3)
+
+/* HS Transmitter Pre-Emphasis Duration Control */
+#define USB_CTL1_TXPREEMPPULSETUNE0_MASK	GENMASK(2, 2)
+
+/* charging detection */
+#define USB_CTL1_CHRGSRCPUENB0_MASK	GENMASK(1, 0)
+
+#define K230_PHY_CTL0_VAL \
+( \
+	FIELD_PREP(USB_CTL0_PLLITUNE_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xc) | \
+	FIELD_PREP(USB_CTL0_PLLBTUNE_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_VREGBYPASS_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_RETENABLEN_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_RESREQIN_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_VBUSVLDEXTSEL0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_OTGDISABLE0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_DRVVBUS0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_AUTORSMENB0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_HSXCVREXTCTL0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_FSDATAEXT0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_FSSE0EXT0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_TXENABLEN0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_COMPDISTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL0_SQRXTUNE0_MASK, 0x3) \
+)
+
+#define K230_PHY_CTL1_VAL \
+( \
+	FIELD_PREP(USB_CTL1_VDATREFTUNE0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL1_OTGTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXHSXVTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXFSLSTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXVREFTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXRISETUNE0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL1_TXRESTUNE0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL1_TXPREEMPAMPTUNE0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL1_TXPREEMPPULSETUNE0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL1_CHRGSRCPUENB0_MASK, 0x0) \
+)
+
+struct k230_usb_phy_instance {
+	struct k230_usb_phy_global *global;
+	struct phy *phy;
+	u32 test_offset;
+	u32 ctl_offset;
+	int index;
+};
+
+struct k230_usb_phy_global {
+	struct k230_usb_phy_instance phys[MAX_PHYS];
+	void __iomem *base;
+};
+
+static int k230_usb_phy_power_on(struct phy *phy)
+{
+	struct k230_usb_phy_instance *inst = phy_get_drvdata(phy);
+	struct k230_usb_phy_global *global = inst->global;
+	void __iomem *base = global->base;
+	u32 val;
+	/* Apply recommended settings */
+	writel(K230_PHY_CTL0_VAL, base + inst->ctl_offset + CTL0_OFFSET);
+	writel(K230_PHY_CTL1_VAL, base + inst->ctl_offset + CTL1_OFFSET);
+
+    /* Configure test register (pull-ups/pull-downs) */
+	val = readl(base + inst->test_offset + TEST_CTL3_OFFSET);
+	val |= USB_IDPULLUP0;
+
+	if (inst->index == 1)
+		val |= (USB_DMPULLDOWN0 | USB_DPPULLDOWN0);
+	else
+		val &= ~(USB_DMPULLDOWN0 | USB_DPPULLDOWN0);
+
+	writel(val, base + inst->test_offset + TEST_CTL3_OFFSET);
+
+	return 0;
+}
+
+static int k230_usb_phy_power_off(struct phy *phy)
+{
+	struct k230_usb_phy_instance *inst = phy_get_drvdata(phy);
+	struct k230_usb_phy_global *global = inst->global;
+	void __iomem *base = global->base;
+	u32 val;
+
+	val = readl(base + inst->test_offset + TEST_CTL3_OFFSET);
+	val &= ~(USB_DMPULLDOWN0 | USB_DPPULLDOWN0);
+	writel(val, base + inst->test_offset + TEST_CTL3_OFFSET);
+
+	return 0;
+}
+
+static const struct phy_ops k230_usb_phy_ops = {
+	.power_on = k230_usb_phy_power_on,
+	.power_off = k230_usb_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static struct phy *k230_usb_phy_xlate(struct device *dev,
+				      const struct of_phandle_args *args)
+{
+	struct k230_usb_phy_global *global = dev_get_drvdata(dev);
+	unsigned int idx = args->args[0];
+
+	if (idx >= MAX_PHYS)
+		return ERR_PTR(-EINVAL);
+
+	return global->phys[idx].phy;
+}
+
+static int k230_usb_phy_probe(struct platform_device *pdev)
+{
+	struct k230_usb_phy_global *global;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	int i;
+
+	global = devm_kzalloc(dev, sizeof(*global), GFP_KERNEL);
+	if (!global)
+		return -ENOMEM;
+	dev_set_drvdata(dev, global);
+
+	global->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(global->base))
+		return dev_err_probe(dev, PTR_ERR(global->base),
+				     "failed to map registers\n");
+
+	static const struct {
+		u32 test_offset;
+		u32 ctl_offset;
+	} phy_reg_info[MAX_PHYS] = {
+		[0] = { K230_USB0_TEST_REG_BASE, K230_USB0_CTL_REG_BASE },
+		[1] = { K230_USB1_TEST_REG_BASE, K230_USB1_CTL_REG_BASE },
+	};
+
+	for (i = 0; i < MAX_PHYS; i++) {
+		struct k230_usb_phy_instance *inst = &global->phys[i];
+		struct phy *phy;
+
+		inst->global = global;
+		inst->index = i;
+		inst->test_offset = phy_reg_info[i].test_offset;
+		inst->ctl_offset  = phy_reg_info[i].ctl_offset;
+
+		phy = devm_phy_create(dev, NULL, &k230_usb_phy_ops);
+		if (IS_ERR(phy)) {
+			dev_err(dev, "failed to create phy%d\n", i);
+			return PTR_ERR(phy);
+		}
+
+		phy_set_drvdata(phy, inst);
+		inst->phy = phy;
+	}
+
+	provider = devm_of_phy_provider_register(dev, k230_usb_phy_xlate);
+	if (IS_ERR(provider))
+		return PTR_ERR(provider);
+
+	return 0;
+}
+
+static const struct of_device_id k230_usb_phy_of_match[] = {
+	{ .compatible = "canaan,k230-usb-phy" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, k230_usb_phy_of_match);
+
+static struct platform_driver k230_usb_phy_driver = {
+	.probe = k230_usb_phy_probe,
+	.driver = {
+		.name = "k230-usb-phy",
+		.of_match_table = k230_usb_phy_of_match,
+	},
+};
+module_platform_driver(k230_usb_phy_driver);
+
+MODULE_DESCRIPTION("Canaan Kendryte K230 USB 2.0 PHY driver");
+MODULE_AUTHOR("Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>");
+MODULE_LICENSE("GPL");
-- 
2.52.0



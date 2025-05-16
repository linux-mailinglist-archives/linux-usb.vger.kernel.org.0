Return-Path: <linux-usb+bounces-24031-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A7BAB997C
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 11:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F81D502E58
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 09:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C222231A3B;
	Fri, 16 May 2025 09:54:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFC0231823;
	Fri, 16 May 2025 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389266; cv=none; b=SqDtIGVvIZLdfXqtJOR2SvETDn6lBESJZhFzC7gOCDFOlt3nO6zC+INPiAGLxYo7aBwMPcJMFXZU38OT0mRbrL00pH1ZkpgtZ2NeWTlsZ8jlE8pKPR52MuL7g+4kvQOgAC5Kx13LqxXvvtWpssgheBhUH8GI3zY/E+OthBEsgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389266; c=relaxed/simple;
	bh=l5c5bPsRD2g01RtQjiPtI5mb8o06M0JVe1xuq30B52c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0Arox8qb7Z2+1di2HDUm8V0Z7tjF3kd/9Nigu2m+dDMt6e0nP47XYcatUOfd4jZIOmdcJ9WX9ztDeJlqSxpAAT6QUUAMUt42ZvvQkutVD/uXzxrAS8qOW9BjL8KmrrUQxDrp9SlRGicseWszWKtEagzR4BtpfcRIHqZD4joA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0004758DT.eswin.cn (unknown [10.12.96.83])
	by app2 (Coremail) with SMTP id TQJkCgCHJpVCCydoptV8AA--.27135S2;
	Fri, 16 May 2025 17:54:11 +0800 (CST)
From: zhangsenchuan@eswincomputing.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	yangwei1@eswincomputing.com,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Subject: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
Date: Fri, 16 May 2025 17:54:07 +0800
Message-ID: <20250516095408.704-1-zhangsenchuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
References: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgCHJpVCCydoptV8AA--.27135S2
X-Coremail-Antispam: 1UD129KBjvAXoWfJFy3tw4fWF17Cw4DJw15CFg_yoW8AFykCo
	Z7Xrs3Xw4Fkr4jkrWkCF1xKa4xW3ykJrW7Gr4fCwsrZFW8Awn0yrnrGr43X342qF4Yvr13
	XrWxXrs3XFn7Jw4rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYN7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjEksPUUUUU==
X-CM-SenderInfo: x2kd0wpvhquxxxdqqvxvzl0uprps33xlqjhudrp/

From: Senchuan Zhang <zhangsenchuan@eswincomputing.com>

Add the eic7700 usb driver, which is responsible for
identifying,configuring and connecting usb devices,and
provides interfaces for accessing these devices.

Co-developed-by: Wei Yang <yangwei1@eswincomputing.com>
Signed-off-by: Wei Yang <yangwei1@eswincomputing.com>
Signed-off-by: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
---
 drivers/usb/dwc3/Kconfig        |  11 +
 drivers/usb/dwc3/Makefile       |   1 +
 drivers/usb/dwc3/dwc3-eic7700.c | 605 ++++++++++++++++++++++++++++++++
 3 files changed, 617 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-eic7700.c

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b5..19657cfb5d08 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -189,4 +189,15 @@ config USB_DWC3_RTK
 	  or dual-role mode.
 	  Say 'Y' or 'M' if you have such device.
 
+config USB_DWC3_EIC7700
+	tristate "Eswin Platforms"
+	depends on OF
+	depends on USB=y || USB=USB_DWC3
+	default USB_DWC3
+	help
+	  The usb controller on eic7700 SoC.
+	  support of USB2/3 functionality
+	  in Eswin platforms.
+	  say 'Y' or 'M' if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 124eda2522d9..b1fc066dd92e 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
+obj-$(CONFIG_USB_DWC3_EIC7700)	+= dwc3-eic7700.o
diff --git a/drivers/usb/dwc3/dwc3-eic7700.c b/drivers/usb/dwc3/dwc3-eic7700.c
new file mode 100644
index 000000000000..872c0374be0f
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-eic7700.c
@@ -0,0 +1,605 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Eswin Specific Glue layer
+ *
+ * Copyright 2024, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * Authors: Wei Yang <yangwei1@eswincomputing.com>
+ *          Senchuan Zhang <zhangsenchuan@eswincomputing.com>
+ */
+
+#include <linux/async.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/extcon.h>
+#include <linux/freezer.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+#include <linux/usb.h>
+#include <linux/pm.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/ch9.h>
+#include <linux/extcon-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/bitfield.h>
+#include <linux/regmap.h>
+#include <linux/gpio/consumer.h>
+#include "core.h"
+#include "io.h"
+
+#define HSP_USB_VBUS_FSEL 0x2a
+#define HSP_USB_MPLL_DEFAULT 0x0
+
+#define HSP_USB_BUS_FILTER_EN (0x1 << 0)
+#define HSP_USB_BUS_CLKEN_GM (0x1 << 9)
+#define HSP_USB_BUS_CLKEN_GS (0x1 << 16)
+#define HSP_USB_BUS_SW_RST (0x1 << 24)
+#define HSP_USB_BUS_CLK_EN (0x1 << 28)
+
+#define HSP_USB_AXI_LP_XM_CSYSREQ (0x1 << 0)
+#define HSP_USB_AXI_LP_XS_CSYSREQ (0x1 << 16)
+
+struct dwc3_eswin {
+	int num_clocks;
+	bool connected;
+	bool suspended;
+	bool force_mode;
+	bool is_phy_on;
+	struct device *dev;
+	struct clk **clks;
+	struct dwc3 *dwc;
+	struct extcon_dev *edev;
+	struct usb_hcd *hcd;
+	struct notifier_block device_nb;
+	struct notifier_block host_nb;
+	struct work_struct otg_work;
+	struct mutex lock;
+	struct reset_control *vaux_rst;
+	struct device *child_dev;
+	enum usb_role new_usb_role;
+	struct gpio_desc *hub_gpio;
+};
+
+static ssize_t dwc3_mode_show(struct device *device,
+			      struct device_attribute *attr, char *buf)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(device);
+	struct dwc3 *dwc = eswin->dwc;
+	int ret;
+
+	switch (dwc->current_dr_role) {
+	case USB_DR_MODE_HOST:
+		ret = sprintf(buf, "host\n");
+		break;
+	case USB_DR_MODE_PERIPHERAL:
+		ret = sprintf(buf, "peripheral\n");
+		break;
+	case USB_DR_MODE_OTG:
+		ret = sprintf(buf, "otg\n");
+		break;
+	default:
+		ret = sprintf(buf, "UNKNOWN\n");
+	}
+
+	return ret;
+}
+
+static ssize_t dwc3_mode_store(struct device *device,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(device);
+	struct dwc3 *dwc = eswin->dwc;
+	enum usb_role new_role;
+	struct usb_role_switch *role_sw = dwc->role_sw;
+
+	if (!strncmp(buf, "1", 1) || !strncmp(buf, "host", 4)) {
+		new_role = USB_ROLE_HOST;
+	} else if (!strncmp(buf, "0", 1) || !strncmp(buf, "peripheral", 10)) {
+		new_role = USB_ROLE_DEVICE;
+	} else {
+		dev_info(eswin->dev, "illegal dr_mode\n");
+		return count;
+	}
+	eswin->force_mode = true;
+
+	mutex_lock(&eswin->lock);
+	usb_role_switch_set_role(role_sw, new_role);
+	mutex_unlock(&eswin->lock);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dwc3_mode);
+
+static ssize_t dwc3_hub_rst_show(struct device *device,
+				 struct device_attribute *attr, char *buf)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(device);
+
+	if (!IS_ERR(eswin->hub_gpio))
+		return sprintf(buf, "%d", gpiod_get_raw_value(eswin->hub_gpio));
+
+	return sprintf(buf, "UNKONWN");
+}
+
+static ssize_t dwc3_hub_rst_store(struct device *device,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(device);
+
+	if (!IS_ERR(eswin->hub_gpio)) {
+		if (!strncmp(buf, "0", 1))
+			gpiod_set_raw_value(eswin->hub_gpio, 0);
+		else
+			gpiod_set_raw_value(eswin->hub_gpio, 1);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dwc3_hub_rst);
+
+static struct attribute *dwc3_eswin_attrs[] = {
+	&dev_attr_dwc3_mode.attr,
+	&dev_attr_dwc3_hub_rst.attr,
+	NULL,
+};
+
+static struct attribute_group dwc3_eswin_attr_group = {
+	.name = NULL, /* we want them in the same directory */
+	.attrs = dwc3_eswin_attrs,
+};
+
+static int dwc3_eswin_device_notifier(struct notifier_block *nb,
+				      unsigned long event, void *ptr)
+{
+	struct dwc3_eswin *eswin =
+		container_of(nb, struct dwc3_eswin, device_nb);
+
+	mutex_lock(&eswin->lock);
+	eswin->new_usb_role = USB_ROLE_DEVICE;
+	mutex_unlock(&eswin->lock);
+	if (!eswin->suspended)
+		schedule_work(&eswin->otg_work);
+
+	return NOTIFY_DONE;
+}
+
+static int dwc3_eswin_host_notifier(struct notifier_block *nb,
+				    unsigned long event, void *ptr)
+{
+	struct dwc3_eswin *eswin = container_of(nb, struct dwc3_eswin, host_nb);
+
+	mutex_lock(&eswin->lock);
+	eswin->new_usb_role = USB_ROLE_HOST;
+	mutex_unlock(&eswin->lock);
+	if (!eswin->suspended)
+		schedule_work(&eswin->otg_work);
+
+	return NOTIFY_DONE;
+}
+
+static void dwc3_eswin_otg_extcon_evt_work(struct work_struct *work)
+{
+	struct dwc3_eswin *eswin =
+		container_of(work, struct dwc3_eswin, otg_work);
+	struct usb_role_switch *role_sw = eswin->dwc->role_sw;
+
+	if (true == eswin->force_mode)
+		return;
+	mutex_lock(&eswin->lock);
+	usb_role_switch_set_role(role_sw, eswin->new_usb_role);
+	mutex_unlock(&eswin->lock);
+}
+
+static int dwc3_eswin_get_extcon_dev(struct dwc3_eswin *eswin)
+{
+	struct device *dev = eswin->dev;
+	struct extcon_dev *edev;
+	s32 ret = 0;
+
+	if (device_property_read_bool(dev, "extcon")) {
+		edev = extcon_get_edev_by_phandle(dev, 0);
+		if (IS_ERR(edev)) {
+			if (PTR_ERR(edev) != -EPROBE_DEFER)
+				dev_err(dev, "couldn't get extcon device\n");
+			return PTR_ERR(edev);
+		}
+		eswin->edev = edev;
+		eswin->device_nb.notifier_call = dwc3_eswin_device_notifier;
+		ret = devm_extcon_register_notifier(dev, edev, EXTCON_USB,
+						    &eswin->device_nb);
+		if (ret < 0)
+			dev_err(dev, "failed to register notifier for USB\n");
+
+		eswin->host_nb.notifier_call = dwc3_eswin_host_notifier;
+		ret = devm_extcon_register_notifier(dev, edev, EXTCON_USB_HOST,
+						    &eswin->host_nb);
+		if (ret < 0)
+			dev_err(dev,
+				"failed to register notifier for USB-HOST\n");
+	}
+
+	return 0;
+}
+
+static int __init dwc3_eswin_deassert(struct dwc3_eswin *eswin)
+{
+	int rc;
+
+	if (eswin->vaux_rst) {
+		rc = reset_control_deassert(eswin->vaux_rst);
+		WARN_ON(rc != 0);
+	}
+
+	return 0;
+}
+
+static int dwc3_eswin_assert(struct dwc3_eswin *eswin)
+{
+	int rc = 0;
+
+	if (eswin->vaux_rst) {
+		rc = reset_control_assert(eswin->vaux_rst);
+		WARN_ON(rc != 0);
+	}
+
+	return 0;
+}
+
+static int dwc_usb_clk_init(struct device *dev)
+{
+	struct regmap *regmap;
+	u32 hsp_usb_bus;
+	u32 hsp_usb_axi_lp;
+	u32 hsp_usb_vbus_freq;
+	u32 hsp_usb_mpll;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+						 "eswin,hsp_sp_csr");
+	if (IS_ERR(regmap)) {
+		dev_dbg(dev, "No hsp_sp_csr phandle specified\n");
+		return -1;
+	}
+	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 1,
+					 &hsp_usb_bus);
+	if (ret) {
+		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
+		return ret;
+	}
+	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 2,
+					 &hsp_usb_axi_lp);
+	if (ret) {
+		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
+		return ret;
+	}
+	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 3,
+					 &hsp_usb_vbus_freq);
+	if (ret) {
+		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
+		return ret;
+	}
+	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 4,
+					 &hsp_usb_mpll);
+	if (ret) {
+		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
+		return ret;
+	}
+
+	/*
+	 * usb1 clock init
+	 * ref clock is 24M, below need to be set to satisfy usb phy requirement(125M)
+	 */
+	regmap_write(regmap, hsp_usb_vbus_freq, HSP_USB_VBUS_FSEL);
+	regmap_write(regmap, hsp_usb_mpll, HSP_USB_MPLL_DEFAULT);
+	/*
+	 * reset usb core and usb phy
+	 */
+	regmap_write(regmap, hsp_usb_bus,
+		     HSP_USB_BUS_FILTER_EN | HSP_USB_BUS_CLKEN_GM |
+			     HSP_USB_BUS_CLKEN_GS | HSP_USB_BUS_SW_RST |
+			     HSP_USB_BUS_CLK_EN);
+	regmap_write(regmap, hsp_usb_axi_lp,
+		     HSP_USB_AXI_LP_XM_CSYSREQ | HSP_USB_AXI_LP_XS_CSYSREQ);
+
+	return 0;
+}
+
+static int dwc3_eswin_probe(struct platform_device *pdev)
+{
+	struct dwc3_eswin *eswin;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node, *child;
+	struct platform_device *child_pdev;
+	unsigned int count;
+	int ret;
+	int i;
+	int err_desc = 0;
+
+	eswin = devm_kzalloc(dev, sizeof(*eswin), GFP_KERNEL);
+	if (!eswin)
+		return -ENOMEM;
+	eswin->hub_gpio = devm_gpiod_get(dev, "hub-rst", GPIOD_OUT_HIGH);
+	err_desc = IS_ERR(eswin->hub_gpio);
+
+	if (!err_desc)
+		gpiod_set_raw_value(eswin->hub_gpio, 1);
+
+	count = of_clk_get_parent_count(np);
+	if (!count)
+		return -ENOENT;
+
+	eswin->num_clocks = count;
+	eswin->force_mode = false;
+	eswin->clks = devm_kcalloc(dev, eswin->num_clocks, sizeof(struct clk *),
+				   GFP_KERNEL);
+	if (!eswin->clks)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, eswin);
+
+	mutex_init(&eswin->lock);
+
+	eswin->dev = dev;
+
+	mutex_lock(&eswin->lock);
+
+	for (i = 0; i < eswin->num_clocks; i++) {
+		struct clk *clk;
+
+		clk = of_clk_get(np, i);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			goto err0;
+		}
+		ret = clk_prepare_enable(clk);
+		if (ret < 0) {
+			clk_put(clk);
+			goto err0;
+		}
+
+		eswin->clks[i] = clk;
+	}
+
+	eswin->vaux_rst = devm_reset_control_get(dev, "vaux");
+	if (IS_ERR_OR_NULL(eswin->vaux_rst)) {
+		dev_err(dev, "Failed to asic0_rst handle\n");
+		return -EFAULT;
+	}
+
+	dwc3_eswin_deassert(eswin);
+	dwc_usb_clk_init(dev);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "get_sync failed with err %d\n", ret);
+		goto err1;
+	}
+
+	child = of_get_child_by_name(np, "dwc3");
+	if (!child) {
+		dev_err(dev, "failed to find dwc3 core node\n");
+		ret = -ENODEV;
+		goto err1;
+	}
+	/* Allocate and initialize the core */
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed to create dwc3 core\n");
+		goto err1;
+	}
+
+	INIT_WORK(&eswin->otg_work, dwc3_eswin_otg_extcon_evt_work);
+	child_pdev = of_find_device_by_node(child);
+	if (!child_pdev) {
+		dev_err(dev, "failed to find dwc3 core device\n");
+		ret = -ENODEV;
+		goto err2;
+	}
+	eswin->dwc = platform_get_drvdata(child_pdev);
+	if (!eswin->dwc) {
+		dev_err(dev, "failed to get drvdata dwc3\n");
+		ret = -EPROBE_DEFER;
+		goto err2;
+	}
+	eswin->child_dev = &child_pdev->dev;
+	ret = dwc3_eswin_get_extcon_dev(eswin);
+	if (ret < 0)
+		dev_err(dev, "couldn't get extcon device: %d\n", ret);
+
+	mutex_unlock(&eswin->lock);
+	ret = sysfs_create_group(&dev->kobj, &dwc3_eswin_attr_group);
+	if (ret)
+		dev_err(dev, "failed to create sysfs group: %d\n", ret);
+
+	return ret;
+err2:
+	cancel_work_sync(&eswin->otg_work);
+	of_platform_depopulate(dev);
+
+err1:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	dwc3_eswin_assert(eswin);
+err0:
+	for (i = 0; i < eswin->num_clocks && eswin->clks[i]; i++) {
+		if (!pm_runtime_status_suspended(dev))
+			clk_disable(eswin->clks[i]);
+		clk_unprepare(eswin->clks[i]);
+		clk_put(eswin->clks[i]);
+	}
+
+	mutex_unlock(&eswin->lock);
+
+	return ret;
+}
+
+static void dwc3_eswin_remove(struct platform_device *pdev)
+{
+	struct dwc3_eswin *eswin = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int i = 0;
+
+	cancel_work_sync(&eswin->otg_work);
+
+	sysfs_remove_group(&dev->kobj, &dwc3_eswin_attr_group);
+
+	/* Restore hcd state before unregistering xhci */
+	if (eswin->edev && !eswin->connected) {
+		struct usb_hcd *hcd = dev_get_drvdata(&eswin->dwc->xhci->dev);
+
+		pm_runtime_get_sync(dev);
+
+		/*
+		 * The xhci code does not expect that HCDs have been removed.
+		 * It will unconditionally call usb_remove_hcd() when the xhci
+		 * driver is unloaded in of_platform_depopulate(). This results
+		 * in a crash if the HCDs were already removed. To avoid this
+		 * crash, add the HCDs here as dummy operation.
+		 * This code should be removed after pm runtime support
+		 * has been added to xhci.
+		 */
+		if (hcd->state == HC_STATE_HALT) {
+			usb_add_hcd(hcd, hcd->irq, IRQF_SHARED);
+			usb_add_hcd(hcd->shared_hcd, hcd->irq, IRQF_SHARED);
+		}
+	}
+
+	of_platform_depopulate(dev);
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	dwc3_eswin_assert(eswin);
+	for (i = 0; i < eswin->num_clocks; i++) {
+		if (!pm_runtime_status_suspended(dev))
+			clk_disable(eswin->clks[i]);
+		clk_unprepare(eswin->clks[i]);
+		clk_put(eswin->clks[i]);
+	}
+}
+
+#ifdef CONFIG_PM
+static int dwc3_eswin_runtime_suspend(struct device *dev)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < eswin->num_clocks; i++)
+		clk_disable(eswin->clks[i]);
+
+	device_init_wakeup(dev, false);
+
+	return 0;
+}
+
+static int dwc3_eswin_runtime_resume(struct device *dev)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < eswin->num_clocks; i++)
+		clk_enable(eswin->clks[i]);
+
+	device_init_wakeup(dev, true);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_eswin_suspend(struct device *dev)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
+	struct dwc3 *dwc = eswin->dwc;
+
+	eswin->suspended = true;
+	cancel_work_sync(&eswin->otg_work);
+
+	/*
+	 * The flag of is_phy_on is only true if
+	 * the DWC3 is in Host mode.
+	 */
+	if (eswin->is_phy_on) {
+		phy_power_off(dwc->usb2_generic_phy[0]);
+
+		/*
+		 * If link state is Rx.Detect, it means that
+		 * no usb device is connecting with the DWC3
+		 * Host, and need to power off the USB3 PHY.
+		 */
+		dwc->link_state = dwc3_gadget_get_link_state(dwc);
+		if (dwc->link_state == DWC3_LINK_STATE_RX_DET)
+			phy_power_off(dwc->usb3_generic_phy[0]);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_eswin_resume(struct device *dev)
+{
+	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
+	struct dwc3 *dwc = eswin->dwc;
+
+	eswin->suspended = false;
+
+	if (eswin->is_phy_on) {
+		phy_power_on(dwc->usb2_generic_phy[0]);
+
+		if (dwc->link_state == DWC3_LINK_STATE_RX_DET)
+			phy_power_on(dwc->usb3_generic_phy[0]);
+	}
+
+	if (eswin->edev)
+		schedule_work(&eswin->otg_work);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dwc3_eswin_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_eswin_suspend, dwc3_eswin_resume)
+		SET_RUNTIME_PM_OPS(dwc3_eswin_runtime_suspend,
+				   dwc3_eswin_runtime_resume, NULL)
+};
+
+#define DEV_PM_OPS (&dwc3_eswin_dev_pm_ops)
+#else
+#define DEV_PM_OPS NULL
+#endif /* CONFIG_PM */
+
+static const struct of_device_id eswin_dwc3_match[] = {
+	{ .compatible = "eswin,eic7700-dwc3" },
+	{ /* Sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, eswin_dwc3_match);
+
+static struct platform_driver dwc3_eswin_driver = {
+	.probe = dwc3_eswin_probe,
+	.remove = dwc3_eswin_remove,
+	.driver = {
+		.name = "eic7700-dwc3",
+		.pm = DEV_PM_OPS,
+		.of_match_table = eswin_dwc3_match,
+	},
+};
+
+module_platform_driver(dwc3_eswin_driver);
+
+MODULE_ALIAS("platform:eic7700-dwc3");
+MODULE_AUTHOR("Wei Yang <yangwei1@eswincomputing.com");
+MODULE_AUTHOR("Senchuan Zhang <zhangsenchuan@eswincomputing.com");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 ESWIN Glue Layer");
-- 
2.25.1



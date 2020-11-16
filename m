Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8FB2B48FD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 16:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730179AbgKPPTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 10:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgKPPTV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 10:19:21 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2422C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:21 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id d28so17037850qka.11
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SfOqpctSUu1pHCgTELS9Ubj4JB3rNrdpFdF+X6duIF8=;
        b=FRek7/5tdw8CTF72ZdVn0iR4CAI19MTuZpreaUm1RgUId/Arhe5QFaScdSim0GGNjq
         X+wxhkNoQVTBTW+fxWDZyTCFpe0NLKwGrYmv4A7uBd+r5QA7TH8SErfToSjp8Suw123U
         8z/BeYPhSFQhh6nJ0zY4l3KcsKZmQCv2i9AIr5JwTMApKXZXyUr20Gd+DihIFiMiu33V
         /cByBQGynOsGnS2+bZpVDOKvULKbsZnyXSuagL6gx8ngXtkg2L5x2kkWkOcwwuWN1IqZ
         lEeed/XfZPLogMtYTZ2AR0RmM1qh/u0pEuFP4UctMXSbbHyUpl1Ut5oQDM/0ZM63yCg7
         aGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SfOqpctSUu1pHCgTELS9Ubj4JB3rNrdpFdF+X6duIF8=;
        b=r7eMOszD//QRvk66+NVoORM7Juw53pbHg+tHrNntCo6CNYiI6gui0XvazX+fb5CNj2
         PrVjuX2dBcgVaDap92MQxPjz6wigNahMra7aRYGDi3GUydtjd2CDCx/WAgaE7jP/sQRI
         nj5N/vPsdX0ZasVqcj+y/j0iEqsoT3Ia4AKtR9v4Ny1ooiyODWzXn+fgGieEHDff4R5/
         EHh1XvX94YdeepWCABhmIw1qBTNCu81w8Q5XiAUgWn+Y7pVqyWDWrhVW2MkrnFZDwXNM
         ld5QVvAi9/Aip3IOWJ0cvhUguMrWFzYyRpkQDsmCFkEXzNmeH5bOCelKyjLZMHUmwREk
         AQGQ==
X-Gm-Message-State: AOAM532MW8Pc8BzNnGX0YgvD1FDdyPRj6+6gnBnzK53SW263qSjFrAog
        /vStFWInVMqTmxmlzRCGfWw=
X-Google-Smtp-Source: ABdhPJzEGY2K4o1wLh29Ket56r5s/duEPeDCz0Cl0ieWJYFQqjiIvdBnJQ0a/DI27ZX8Y4Ps6YrkHg==
X-Received: by 2002:a37:9c84:: with SMTP id f126mr14511584qke.484.1605539960676;
        Mon, 16 Nov 2020 07:19:20 -0800 (PST)
Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:19:20 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, wulf@rock-chips.com,
        frank.wang@rock-chips.com, william.wu@rock-chips.com,
        zyw@rock-chips.com, kever.yang@rock-chips.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 1/4] phy: rockchip: add rockchip usb3 innosilicon phy driver
Date:   Mon, 16 Nov 2020 15:17:33 +0000
Message-Id: <20201116151735.178737-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
References: <20201116151735.178737-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The innosilicon based usb3 phy used in rockchip devices such as the rk3328 is bugged, requiring special handling.
The following erata have been observed:
 - usb3 device disconnect events are not detected by the controller
 - usb2 hubs with no devices attached do not trigger disconnect events when removed
 - interrupts are not reliable

To work around these issue we implement polling of the usb2 and usb3 status.
On usb3 disconnection we reset the usb3 phy which triggers the disconnect event.
On usb2 disconnection we have to force reset the whole controller.
This requires a handoff to a special dwc3 device driver.

This has been tested on the rk3328-roc-cc board with the following devices:
 - usb2 only device
 - usb3 only device
 - usb2 only hub without devices
 - usb3 hub without devices
 - usb2 hub with devices
 - usb3 hub with devices

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/phy/rockchip/Kconfig                  |   9 +
 drivers/phy/rockchip/Makefile                 |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 425 ++++++++++++++++++
 3 files changed, 435 insertions(+)
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index c2f22f90736c..ce16e0877354 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -47,6 +47,15 @@ config PHY_ROCKCHIP_INNO_USB2
 	help
 	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
 
+config PHY_ROCKCHIP_INNO_USB3
+	tristate "Rockchip INNO USB3PHY Driver"
+	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
+	depends on COMMON_CLK
+	depends on USB_SUPPORT
+	select USB_COMMON
+	help
+	  Support for Rockchip USB3.0 PHY with Innosilicon IP block.
+
 config PHY_ROCKCHIP_INNO_DSIDPHY
 	tristate "Rockchip Innosilicon MIPI/LVDS/TTL PHY driver"
 	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makefile
index c3cfc7f0af5c..738e3574a722 100644
--- a/drivers/phy/rockchip/Makefile
+++ b/drivers/phy/rockchip/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_ROCKCHIP_EMMC)		+= phy-rockchip-emmc.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY)	+= phy-rockchip-inno-dsidphy.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI)	+= phy-rockchip-inno-hdmi.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2)	+= phy-rockchip-inno-usb2.o
+obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB3)	+= phy-rockchip-inno-usb3.o
 obj-$(CONFIG_PHY_ROCKCHIP_PCIE)		+= phy-rockchip-pcie.o
 obj-$(CONFIG_PHY_ROCKCHIP_TYPEC)	+= phy-rockchip-typec.o
 obj-$(CONFIG_PHY_ROCKCHIP_USB)		+= phy-rockchip-usb.o
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb3.c b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
new file mode 100644
index 000000000000..6e4aa2f0ba46
--- /dev/null
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/extcon-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/workqueue.h>
+#include <linux/mfd/syscon.h>
+#include <linux/usb/phy.h>
+
+#define USB3_STATUS_REG 0x284
+#define USB2_STATUS_REG 0x30
+#define USB3_CONN_BIT BIT(0)
+#define USB2_CONN_BIT BIT(7)
+#define USB2_STATE_SHIFT 6
+#define REG_WRITE_MASK GENMASK(31, 16)
+
+struct rockchip_usb3phy_port{
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct usb_phy		phy;
+	struct rockchip_usb3phy	*parent;
+	unsigned char 		type;
+};
+
+enum usb3phy_mode {
+	PHY_IDLE = 0,
+	PHY_USB3,
+	PHY_USB2,
+	PHY_COMBO
+};
+
+struct rockchip_usb3phy {
+	struct device			*dev;
+	struct regmap			*regmap;
+	struct clk			*clk_pipe;
+	struct clk			*clk_otg;
+	struct reset_control		*u3por_rst;
+	struct reset_control		*u2por_rst;
+	struct reset_control		*pipe_rst;
+	struct reset_control		*utmi_rst;
+	struct reset_control		*pipe_apb_rst;
+	struct reset_control		*utmi_apb_rst;
+	struct rockchip_usb3phy_port	port_pipe;
+	struct rockchip_usb3phy_port	port_utmi;
+	struct work_struct		usb_phy_work;
+	struct notifier_block		nb;
+	enum usb3phy_mode		mode;
+	struct mutex			lock;
+};
+
+static int rockchip_usb3phy_reset(struct rockchip_usb3phy *usb3phy, bool reset, enum usb3phy_mode mode)
+{
+	if (reset == true) {
+		if ((mode == PHY_USB2) | (mode == PHY_COMBO)){
+			clk_disable_unprepare(usb3phy->clk_otg);
+			reset_control_assert(usb3phy->utmi_rst);
+			reset_control_assert(usb3phy->u2por_rst);
+		}
+		if ((mode == PHY_USB3) | (mode == PHY_COMBO)){
+			clk_disable_unprepare(usb3phy->clk_pipe);
+			reset_control_assert(usb3phy->pipe_rst);
+			reset_control_assert(usb3phy->u3por_rst);
+		}
+	}
+
+	if (reset == false) {
+		if ((mode == PHY_USB2) | (mode == PHY_COMBO)){
+			reset_control_deassert(usb3phy->u2por_rst);
+			udelay(1000);
+			clk_prepare_enable(usb3phy->clk_otg);
+			udelay(500);
+			reset_control_deassert(usb3phy->utmi_rst);
+		}
+		if ((mode == PHY_USB3) | (mode == PHY_COMBO)){
+			reset_control_deassert(usb3phy->u3por_rst);
+			udelay(500);
+			clk_prepare_enable(usb3phy->clk_pipe);
+			udelay(1000);
+			reset_control_deassert(usb3phy->pipe_rst);
+		}
+	}
+
+	return 0;
+}
+
+static void rockchip_usb3phy_work(struct work_struct *work)
+{
+	struct rockchip_usb3phy *usb3phy = container_of(work, struct rockchip_usb3phy, usb_phy_work);
+	struct rockchip_usb3phy_port *port_pipe = &usb3phy->port_pipe;
+	struct rockchip_usb3phy_port *port_utmi = &usb3phy->port_utmi;
+	int usb2, usb3, tmp, state;
+
+	mutex_lock(&usb3phy->lock);
+
+	regmap_read(port_pipe->regmap, USB3_STATUS_REG, &tmp);
+	usb3 = tmp & USB3_CONN_BIT;
+	regmap_read(usb3phy->regmap, USB2_STATUS_REG, &tmp);
+	usb2 = ((tmp & USB2_CONN_BIT) ^ USB2_CONN_BIT ) >> USB2_STATE_SHIFT;
+	state = (usb3 | usb2);
+	dev_dbg(usb3phy->dev, "mode %i, state %i\n", usb3phy->mode, state);
+
+	if (usb3phy->mode == state)
+		/* not our device */
+		goto out;
+
+	if (usb2) {
+		usb3phy->mode = PHY_USB2;
+		dev_dbg(usb3phy->dev, "usb3phy utmi polling started\n");
+		regmap_read_poll_timeout(usb3phy->regmap, USB2_STATUS_REG, tmp, (tmp & USB2_CONN_BIT), 2000, 0);
+		state = ((tmp & USB2_CONN_BIT) ^ USB2_CONN_BIT ) >> USB2_STATE_SHIFT;
+		dev_dbg(usb3phy->dev, "usb3phy utmi polling completed\n");
+
+		atomic_notifier_call_chain(&port_utmi->phy.notifier, 0, NULL);
+		goto out;
+	}
+
+	if (usb3) {
+		dev_dbg(usb3phy->dev, "usb3phy pipe polling started\n");
+		regmap_read_poll_timeout(port_pipe->regmap, USB3_STATUS_REG, tmp, !(tmp & USB3_CONN_BIT), 2000, 0);
+		dev_dbg(usb3phy->dev, "usb3phy pipe polling completed\n");
+
+		rockchip_usb3phy_reset(usb3phy, true, PHY_USB3);
+		udelay(500);
+		rockchip_usb3phy_reset(usb3phy, false, PHY_USB3);
+		udelay(500);
+
+		goto out;
+	}
+
+out:
+	usb3phy->mode = PHY_IDLE;
+	mutex_unlock(&usb3phy->lock);
+	return;
+}
+
+static int rockchip_usb3phy_parse_dt(struct rockchip_usb3phy *usb3phy, struct device *dev)
+{
+	usb3phy->clk_pipe = devm_clk_get(dev, "usb3phy-pipe");
+	if (IS_ERR(usb3phy->clk_pipe)) {
+		dev_err(dev, "could not get usb3phy pipe clock\n");
+		return PTR_ERR(usb3phy->clk_pipe);
+	}
+
+	usb3phy->clk_otg = devm_clk_get(dev, "usb3phy-otg");
+	if (IS_ERR(usb3phy->clk_otg)) {
+		dev_err(dev, "could not get usb3phy otg clock\n");
+		return PTR_ERR(usb3phy->clk_otg);
+	}
+
+	usb3phy->u2por_rst = devm_reset_control_get(dev, "usb3phy-u2-por");
+	if (IS_ERR(usb3phy->u2por_rst)) {
+		dev_err(dev, "no usb3phy-u2-por reset control found\n");
+		return PTR_ERR(usb3phy->u2por_rst);
+	}
+
+	usb3phy->u3por_rst = devm_reset_control_get(dev, "usb3phy-u3-por");
+	if (IS_ERR(usb3phy->u3por_rst)) {
+		dev_err(dev, "no usb3phy-u3-por reset control found\n");
+		return PTR_ERR(usb3phy->u3por_rst);
+	}
+
+	usb3phy->pipe_rst = devm_reset_control_get(dev, "usb3phy-pipe-mac");
+	if (IS_ERR(usb3phy->pipe_rst)) {
+		dev_err(dev, "no usb3phy_pipe_mac reset control found\n");
+		return PTR_ERR(usb3phy->pipe_rst);
+	}
+
+	usb3phy->utmi_rst = devm_reset_control_get(dev, "usb3phy-utmi-mac");
+	if (IS_ERR(usb3phy->utmi_rst)) {
+		dev_err(dev, "no usb3phy-utmi-mac reset control found\n");
+		return PTR_ERR(usb3phy->utmi_rst);
+	}
+
+	usb3phy->pipe_apb_rst = devm_reset_control_get(dev, "usb3phy-pipe-apb");
+	if (IS_ERR(usb3phy->pipe_apb_rst)) {
+		dev_err(dev, "no usb3phy-pipe-apb reset control found\n");
+		return PTR_ERR(usb3phy->pipe_apb_rst);
+	}
+
+	usb3phy->utmi_apb_rst = devm_reset_control_get(dev, "usb3phy-utmi-apb");
+	if (IS_ERR(usb3phy->utmi_apb_rst)) {
+		dev_err(dev, "no usb3phy-utmi-apb reset control found\n");
+		return PTR_ERR(usb3phy->utmi_apb_rst);
+	}
+
+	return 0;
+}
+
+static int rockchip_usb3phy_notify(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct rockchip_usb3phy *usb3phy = container_of(nb, struct rockchip_usb3phy, nb);
+	switch (action) {
+	case USB_DEVICE_ADD:
+		dev_dbg(usb3phy->dev, "notified of device add\n");
+		if (!(mutex_is_locked(&usb3phy->lock)))
+			schedule_work(&usb3phy->usb_phy_work);
+		return NOTIFY_OK;
+	}
+	return NOTIFY_DONE;
+}
+
+static int rockchip_usb3phy_init(struct usb_phy *phy)
+{
+	struct rockchip_usb3phy_port *usb3phy_port = container_of(phy, struct rockchip_usb3phy_port, phy);
+	struct rockchip_usb3phy *usb3phy = usb3phy_port->parent;
+
+	dev_warn(usb3phy->dev, "usb3phy_init %s\n", phy->label);
+	if (phy->type == USB_PHY_TYPE_USB3){
+		rockchip_usb3phy_reset(usb3phy, false, PHY_USB3);
+		udelay(100); /* let it stabilize */
+		usb3phy->nb.notifier_call = rockchip_usb3phy_notify;
+		usb_register_notify(&usb3phy->nb);
+	}
+	if (phy->type == USB_PHY_TYPE_USB2){
+		rockchip_usb3phy_reset(usb3phy, false, PHY_USB2);
+		udelay(100); /* let it stabilize */
+	}
+
+	return 0;
+}
+
+static void rockchip_usb3phy_shutdown(struct usb_phy *phy)
+{
+	struct rockchip_usb3phy_port *usb3phy_port = container_of(phy, struct rockchip_usb3phy_port, phy);
+	struct rockchip_usb3phy *usb3phy = usb3phy_port->parent;
+
+	dev_dbg(usb3phy->dev, "usb3phy_shutdown\n");
+	if (phy->type == USB_PHY_TYPE_USB3){
+		rockchip_usb3phy_reset(usb3phy, false, PHY_USB3);
+		usb_unregister_notify(&usb3phy->nb);
+	}
+	if (phy->type == USB_PHY_TYPE_USB2){
+		rockchip_usb3phy_reset(usb3phy, false, PHY_USB2);
+	}
+}
+
+static const struct regmap_config rockchip_usb3phy_port_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x1000,
+};
+
+static const struct regmap_config rockchip_usb3phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x1000,
+	.write_flag_mask = REG_WRITE_MASK,
+};
+
+static int rockchip_usb3phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct rockchip_usb3phy *usb3phy;
+	struct rockchip_usb3phy_port *usb3phy_port;
+	struct regmap_config regmap_config = rockchip_usb3phy_regmap_config;
+	struct regmap_config regmap_port_config = rockchip_usb3phy_port_regmap_config;
+	const struct of_device_id *match;
+	void __iomem *base;
+	int ret;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match) {
+		dev_err(dev, "phy node not assigned\n");
+		return -EINVAL;
+	}
+
+	if (of_node_name_eq(np, "usb3-phy")) {
+		dev_dbg(dev, "Probe usb3phy main block\n");
+
+		usb3phy = devm_kzalloc(dev, sizeof(*usb3phy), GFP_KERNEL);
+		if (!usb3phy)
+			return -ENOMEM;
+
+		ret = rockchip_usb3phy_parse_dt(usb3phy, dev);
+		if (ret) {
+			dev_err(dev, "parse dt failed %i\n", ret);
+			return ret;
+		}
+
+		base = devm_of_iomap(dev, np, 0, NULL);
+		if (IS_ERR(base)) {
+			dev_err(dev, "failed port ioremap\n");
+			return PTR_ERR(base);
+		}
+
+		regmap_config.name = np->name;
+
+		usb3phy->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+		if (IS_ERR(usb3phy->regmap)) {
+			dev_err(dev, "regmap init failed\n");
+			return PTR_ERR(usb3phy->regmap);
+		}
+
+		usb3phy->dev = dev;
+		platform_set_drvdata(pdev, usb3phy);
+
+		/* place block in reset */
+		reset_control_assert(usb3phy->pipe_rst);
+		reset_control_assert(usb3phy->utmi_rst);
+		reset_control_assert(usb3phy->u3por_rst);
+		reset_control_assert(usb3phy->u2por_rst);
+		reset_control_assert(usb3phy->pipe_apb_rst);
+		reset_control_assert(usb3phy->utmi_apb_rst);
+
+		udelay(20);
+
+		/* take apb interface out of reset */
+		reset_control_deassert(usb3phy->utmi_apb_rst);
+		reset_control_deassert(usb3phy->pipe_apb_rst);
+
+		usb3phy->mode = PHY_IDLE;
+		INIT_WORK(&usb3phy->usb_phy_work, rockchip_usb3phy_work);
+		dev_dbg(dev, "Completed usb3phy core probe \n");
+
+		return devm_of_platform_populate(&pdev->dev);
+	}
+
+	/* probe the actual ports */
+	usb3phy = platform_get_drvdata(of_find_device_by_node(np->parent));
+
+	if (of_node_name_eq(np, "utmi")) {
+		usb3phy_port = &usb3phy->port_utmi;
+		usb3phy_port->phy.label	= "usb2-phy";
+		usb3phy_port->phy.type	= USB_PHY_TYPE_USB2;
+	}
+	else if (of_node_name_eq(np, "pipe")) {
+		usb3phy_port = &usb3phy->port_pipe;
+		usb3phy_port->phy.label	= "usb3-phy";
+		usb3phy_port->phy.type	= USB_PHY_TYPE_USB3;
+	}
+	else {
+		dev_err(dev, "unknown child node port type %s\n", np->name);
+		return -EINVAL;
+	}
+
+	usb3phy_port->dev = dev;
+
+	base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(base)) {
+		dev_err(dev, "failed port ioremap\n");
+		return PTR_ERR(base);
+	}
+
+	regmap_port_config.name = np->name;
+
+	usb3phy_port->regmap = devm_regmap_init_mmio(dev, base, &regmap_port_config);
+	if (IS_ERR(usb3phy_port->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(usb3phy_port->regmap);
+	}
+
+	usb3phy_port->phy.dev = dev;
+	usb3phy_port->phy.init = rockchip_usb3phy_init;
+	usb3phy_port->phy.shutdown = rockchip_usb3phy_shutdown;
+	usb3phy_port->parent = usb3phy;
+
+	ret = usb_add_phy_dev(&usb3phy_port->phy);
+	if (ret) {
+		dev_err(dev, "add usb phy failed %i\n", ret);
+		return ret;
+	}
+
+	mutex_init(&usb3phy->lock);
+
+	dev_info(dev, "Completed usb3phy %s port init\n", usb3phy_port->phy.label);
+	return 0;
+}
+
+
+static int rockchip_usb3phy_remove(struct platform_device *pdev)
+{
+	struct rockchip_usb3phy *usb3phy = platform_get_drvdata(pdev);
+	struct rockchip_usb3phy_port *port_pipe = &usb3phy->port_pipe;
+	struct rockchip_usb3phy_port *port_utmi = &usb3phy->port_utmi;
+
+	if (&port_pipe->phy.head)
+		usb_remove_phy(&port_pipe->phy);
+	if (&port_utmi->phy.head)
+		usb_remove_phy(&port_utmi->phy);
+
+	reset_control_assert(usb3phy->pipe_apb_rst);
+	reset_control_assert(usb3phy->utmi_apb_rst);
+
+	return 0;
+}
+
+static const struct of_device_id rockchip_usb3phy_dt_ids[] = {
+	{ .compatible = "rockchip,rk3328-usb3phy", },
+	{ .compatible = "rockchip,rk3328-usb3phy-utmi", },
+	{ .compatible = "rockchip,rk3328-usb3phy-pipe", },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, rockchip_usb3phy_dt_ids);
+
+static struct platform_driver rockchip_usb3phy_driver = {
+	.probe		= rockchip_usb3phy_probe,
+	.remove		= rockchip_usb3phy_remove,
+	.driver		= {
+		.name	= "rockchip-usb3-phy",
+		.of_match_table = rockchip_usb3phy_dt_ids,
+	},
+};
+
+module_platform_driver(rockchip_usb3phy_driver);
+
+MODULE_AUTHOR("Peter Geis <pgwipeout@gmail.com>");
+MODULE_DESCRIPTION("Rockchip USB 3 PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E456F2DB517
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 21:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgLOUXp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 15:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgLOUXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 15:23:12 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB57C0611CC;
        Tue, 15 Dec 2020 12:21:51 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id w13so42720507lfd.5;
        Tue, 15 Dec 2020 12:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oYny46ZIhzI4t/cgtJv6HsUK4BcOIb5AH9lGNL/RXcE=;
        b=ExkulYVjGe7uQLx1kTHYX5wIqeX6D/Pxn9blAXXu5xJ7maWVWXYrwpJBTLO+xnRUd7
         IR2NJ2lsxYrRB1G+A7qEO8yEJitmLQI7hyn7Sva6WPhxh0CjQ5VKUOteplPq0Tg60sFH
         AJ/8UXoD8qJob2wr5RO7GJlSkqOjUmwpYmvHVdojqISUWPW7TTKhkPJHj5r2lalah7VP
         ZmhW4Gmyk63E3r5YBq9I/zwXnc5kpreHYQn84z2XeFMpVMzVwObeCPgg+HHpSst4Lj5O
         jFNpfyZeObT6p+s+Y4J81Qj6iVXgI1Zl+ePF+84VNERGbCc+OvAHqJSlp0pDW4G3TNbg
         Dtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oYny46ZIhzI4t/cgtJv6HsUK4BcOIb5AH9lGNL/RXcE=;
        b=S+mNVHzsXoc/vKixNaKqxGJspNQkBfYrhav+Y75faP6GMoKPVdr2Ocj3UvDvI6Koz0
         AshuYXxMV/9OKQNZ/3cv6cORGuE4n62sfSpfW38tbp16bEMB/oSaaddsZda3aMGphbjM
         EL+TgOUN2/+F9xpiUwFFc6Nemqp0Pdn8P3i0+A8DbYyRXXvIQ901l6I50FiFuUDx2+3L
         TtGdbyehJgqeih36WnqlCsQTb6j7NiFvqROZzQ8qhKTZlQ810SrXGtJZmwYCjX8z/qi+
         1kJiJc267zXUbhvx9maAHWZWJccVHFKKy5Bsghp8jTiNvX1ZWEVtEdWNmang5EAPyWwC
         NbVQ==
X-Gm-Message-State: AOAM53266styQLp3XBRbOwGnh9emCVanoh+fw3uxG8+aHAf6Bfv2IJpw
        CSwATv8Zf/7rWvtZuTeneyM=
X-Google-Smtp-Source: ABdhPJxT2pUyWrnqIUbpN3vPCUj1YxAgA+D0uvbMjfVW3KAqiugMBmek74MMeqLUHpjCdVhYLhSUiA==
X-Received: by 2002:a2e:6e09:: with SMTP id j9mr12879201ljc.43.1608063709694;
        Tue, 15 Dec 2020 12:21:49 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f3sm2873711ljp.114.2020.12.15.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:21:49 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
Date:   Tue, 15 Dec 2020 23:21:10 +0300
Message-Id: <20201215202113.30394-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215202113.30394-1-digetx@gmail.com>
References: <20201215202113.30394-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Geis <pgwipeout@gmail.com>

Add USB host mode to the Tegra HDRC driver. This allows us to benefit from
support provided by the generic ChipIdea driver instead of duplicating the
effort in a separate ehci-terga driver.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/Kconfig         |   1 -
 drivers/usb/chipidea/ci_hdrc_tegra.c | 243 ++++++++++++++++++++++++++-
 drivers/usb/chipidea/core.c          |  10 +-
 drivers/usb/chipidea/host.c          | 103 +++++++++++-
 include/linux/usb/chipidea.h         |   6 +
 5 files changed, 355 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index 8685ead6ccc7..661818e8fed6 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -55,7 +55,6 @@ config USB_CHIPIDEA_GENERIC
 config USB_CHIPIDEA_TEGRA
 	tristate "Enable Tegra USB glue driver" if EMBEDDED
 	depends on OF
-	depends on USB_CHIPIDEA_UDC
 	default USB_CHIPIDEA
 
 endif
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index d8efa80aa1c2..fff130f08996 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -4,11 +4,18 @@
  */
 
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
 
+#include <linux/usb.h>
 #include <linux/usb/chipidea.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
+#include <linux/usb/phy.h>
+
+#include "../host/ehci.h"
 
 #include "ci.h"
 
@@ -16,20 +23,47 @@ struct tegra_usb {
 	struct ci_hdrc_platform_data data;
 	struct platform_device *dev;
 
+	const struct tegra_usb_soc_info *soc;
 	struct usb_phy *phy;
 	struct clk *clk;
+
+	bool needs_double_reset;
 };
 
 struct tegra_usb_soc_info {
 	unsigned long flags;
+	unsigned int txfifothresh;
+	enum usb_dr_mode dr_mode;
+};
+
+static const struct tegra_usb_soc_info tegra20_ehci_soc_info = {
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
+		 CI_HDRC_OVERRIDE_PHY_CONTROL,
+	.dr_mode = USB_DR_MODE_HOST,
+	.txfifothresh = 10,
+};
+
+static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
+		 CI_HDRC_OVERRIDE_PHY_CONTROL
+	.dr_mode = USB_DR_MODE_HOST,
+	.txfifothresh = 16,
 };
 
 static const struct tegra_usb_soc_info tegra_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
+		 CI_HDRC_OVERRIDE_PHY_CONTROL,
+	.dr_mode = USB_DR_MODE_UNKNOWN,
 };
 
 static const struct of_device_id tegra_usb_of_match[] = {
 	{
+		.compatible = "nvidia,tegra20-ehci",
+		.data = &tegra20_ehci_soc_info,
+	}, {
+		.compatible = "nvidia,tegra30-ehci",
+		.data = &tegra30_ehci_soc_info,
+	}, {
 		.compatible = "nvidia,tegra20-udc",
 		.data = &tegra_udc_soc_info,
 	}, {
@@ -47,6 +81,181 @@ static const struct of_device_id tegra_usb_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_usb_of_match);
 
+static int tegra_usb_reset_controller(struct device *dev)
+{
+	struct reset_control *rst, *rst_utmi;
+	struct device_node *phy_np;
+	int err;
+
+	rst = devm_reset_control_get_shared(dev, "usb");
+	if (IS_ERR(rst)) {
+		dev_err(dev, "can't get ehci reset: %pe\n", rst);
+		return PTR_ERR(rst);
+	}
+
+	phy_np = of_parse_phandle(dev->of_node, "nvidia,phy", 0);
+	if (!phy_np)
+		return -ENOENT;
+
+	/*
+	 * The 1st USB controller contains some UTMI pad registers that are
+	 * global for all the controllers on the chip. Those registers are
+	 * also cleared when reset is asserted to the 1st controller.
+	 */
+	rst_utmi = of_reset_control_get_shared(phy_np, "utmi-pads");
+	if (IS_ERR(rst_utmi)) {
+		dev_warn(dev, "can't get utmi-pads reset from the PHY\n");
+		dev_warn(dev, "continuing, but please update your DT\n");
+	} else {
+		/*
+		 * PHY driver performs UTMI-pads reset in a case of a
+		 * non-legacy DT.
+		 */
+		reset_control_put(rst_utmi);
+	}
+
+	of_node_put(phy_np);
+
+	/* reset control is shared, hence initialize it first */
+	err = reset_control_deassert(rst);
+	if (err)
+		return err;
+
+	err = reset_control_assert(rst);
+	if (err)
+		return err;
+
+	udelay(1);
+
+	err = reset_control_deassert(rst);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra_usb_notify_event(struct ci_hdrc *ci, unsigned int event)
+{
+	struct tegra_usb *usb = dev_get_drvdata(ci->dev->parent);
+	struct ehci_hcd *ehci;
+
+	switch (event) {
+	case CI_HDRC_CONTROLLER_RESET_EVENT:
+		if (ci->hcd) {
+			ehci = hcd_to_ehci(ci->hcd);
+			ehci->has_tdi_phy_lpm = false;
+			ehci_writel(ehci, usb->soc->txfifothresh << 16,
+				    &ehci->regs->txfill_tuning);
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int tegra_usb_internal_port_reset(struct ehci_hcd *ehci,
+					 u32 __iomem *portsc_reg,
+					 unsigned long *flags)
+{
+	u32 saved_usbintr, temp;
+	unsigned int i, tries;
+	int retval = 0;
+
+	saved_usbintr = ehci_readl(ehci, &ehci->regs->intr_enable);
+	/* disable USB interrupt */
+	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
+	spin_unlock_irqrestore(&ehci->lock, *flags);
+
+	/*
+	 * Here we have to do Port Reset at most twice for
+	 * Port Enable bit to be set.
+	 */
+	for (i = 0; i < 2; i++) {
+		temp = ehci_readl(ehci, portsc_reg);
+		temp |= PORT_RESET;
+		ehci_writel(ehci, temp, portsc_reg);
+		mdelay(10);
+		temp &= ~PORT_RESET;
+		ehci_writel(ehci, temp, portsc_reg);
+		mdelay(1);
+		tries = 100;
+		do {
+			mdelay(1);
+			/*
+			 * Up to this point, Port Enable bit is
+			 * expected to be set after 2 ms waiting.
+			 * USB1 usually takes extra 45 ms, for safety,
+			 * we take 100 ms as timeout.
+			 */
+			temp = ehci_readl(ehci, portsc_reg);
+		} while (!(temp & PORT_PE) && tries--);
+		if (temp & PORT_PE)
+			break;
+	}
+	if (i == 2)
+		retval = -ETIMEDOUT;
+
+	/*
+	 * Clear Connect Status Change bit if it's set.
+	 * We can't clear PORT_PEC. It will also cause PORT_PE to be cleared.
+	 */
+	if (temp & PORT_CSC)
+		ehci_writel(ehci, PORT_CSC, portsc_reg);
+
+	/*
+	 * Write to clear any interrupt status bits that might be set
+	 * during port reset.
+	 */
+	temp = ehci_readl(ehci, &ehci->regs->status);
+	ehci_writel(ehci, temp, &ehci->regs->status);
+
+	/* restore original interrupt-enable bits */
+	spin_lock_irqsave(&ehci->lock, *flags);
+	ehci_writel(ehci, saved_usbintr, &ehci->regs->intr_enable);
+
+	return retval;
+}
+
+static int tegra_ehci_hub_control(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
+				  u16 wIndex, char *buf, u16 wLength,
+				  bool *done, unsigned long *flags)
+{
+	struct tegra_usb *usb = dev_get_drvdata(ci->dev->parent);
+	struct ehci_hcd *ehci = hcd_to_ehci(ci->hcd);
+	u32 __iomem *status_reg;
+	int retval = 0;
+
+	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+
+	switch (typeReq) {
+	case SetPortFeature:
+		if (wValue != USB_PORT_FEAT_RESET || !usb->needs_double_reset)
+			break;
+
+		/* for USB1 port we need to issue Port Reset twice internally */
+		retval = tegra_usb_internal_port_reset(ehci, status_reg, flags);
+		*done  = true;
+		break;
+	}
+
+	return retval;
+}
+
+static void tegra_usb_enter_lpm(struct ci_hdrc *ci, bool enable)
+{
+	/*
+	 * Touching any register which belongs to AHB clock domain will
+	 * hang CPU if USB controller is put into low power mode because
+	 * AHB USB clock is gated on Tegra in the LPM.
+	 *
+	 * Tegra PHY has a separate register for checking the clock status
+	 * and usb_phy_set_suspend() takes care of gating/ungating the clocks
+	 * and restoring the PHY state on Tegra. Hence DEVLC/PORTSC registers
+	 * shouldn't be touched directly by the CI driver.
+	 */
+	usb_phy_set_suspend(ci->usb_phy, enable);
+}
+
 static int tegra_usb_probe(struct platform_device *pdev)
 {
 	const struct tegra_usb_soc_info *soc;
@@ -83,24 +292,49 @@ static int tegra_usb_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
+		usb->needs_double_reset = true;
+
+	err = tegra_usb_reset_controller(&pdev->dev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to reset controller: %d\n", err);
+		goto fail_power_off;
+	}
+
+	/*
+	 * USB controller registers shan't be touched before PHY is
+	 * initialized, otherwise CPU will hang because clocks are gated.
+	 * PHY driver controls gating of internal USB clocks on Tegra.
+	 */
+	err = usb_phy_init(usb->phy);
+	if (err)
+		goto fail_power_off;
+
+	platform_set_drvdata(pdev, usb);
+
 	/* setup and register ChipIdea HDRC device */
+	usb->soc = soc;
 	usb->data.name = "tegra-usb";
 	usb->data.flags = soc->flags;
 	usb->data.usb_phy = usb->phy;
+	usb->data.dr_mode = soc->dr_mode;
 	usb->data.capoffset = DEF_CAPOFFSET;
+	usb->data.enter_lpm = tegra_usb_enter_lpm;
+	usb->data.hub_control = tegra_ehci_hub_control;
+	usb->data.notify_event = tegra_usb_notify_event;
 
 	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &usb->data);
 	if (IS_ERR(usb->dev)) {
 		err = PTR_ERR(usb->dev);
 		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
-		goto fail_power_off;
+		goto phy_shutdown;
 	}
 
-	platform_set_drvdata(pdev, usb);
-
 	return 0;
 
+phy_shutdown:
+	usb_phy_shutdown(usb->phy);
 fail_power_off:
 	clk_disable_unprepare(usb->clk);
 	return err;
@@ -111,6 +345,7 @@ static int tegra_usb_remove(struct platform_device *pdev)
 	struct tegra_usb *usb = platform_get_drvdata(pdev);
 
 	ci_hdrc_remove_device(usb->dev);
+	usb_phy_shutdown(usb->phy);
 	clk_disable_unprepare(usb->clk);
 
 	return 0;
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index aa40e510b806..3f6c21406dbd 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -195,7 +195,7 @@ static void hw_wait_phy_stable(void)
 }
 
 /* The PHY enters/leaves low power mode */
-static void ci_hdrc_enter_lpm(struct ci_hdrc *ci, bool enable)
+static void ci_hdrc_enter_lpm_common(struct ci_hdrc *ci, bool enable)
 {
 	enum ci_hw_regs reg = ci->hw_bank.lpm ? OP_DEVLC : OP_PORTSC;
 	bool lpm = !!(hw_read(ci, reg, PORTSC_PHCD(ci->hw_bank.lpm)));
@@ -208,6 +208,11 @@ static void ci_hdrc_enter_lpm(struct ci_hdrc *ci, bool enable)
 				0);
 }
 
+static void ci_hdrc_enter_lpm(struct ci_hdrc *ci, bool enable)
+{
+	return ci->platdata->enter_lpm(ci, enable);
+}
+
 static int hw_device_init(struct ci_hdrc *ci, void __iomem *base)
 {
 	u32 reg;
@@ -790,6 +795,9 @@ static int ci_get_platdata(struct device *dev,
 			platdata->pins_device = p;
 	}
 
+	if (!platdata->enter_lpm)
+		platdata->enter_lpm = ci_hdrc_enter_lpm_common;
+
 	return 0;
 }
 
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 48e4a5ca1835..b8a4c44ab580 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -29,6 +29,12 @@ struct ehci_ci_priv {
 	bool enabled;
 };
 
+struct ci_hdrc_dma_aligned_buffer {
+	void *kmalloc_ptr;
+	void *old_xfer_buffer;
+	u8 data[0];
+};
+
 static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
 {
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
@@ -160,14 +166,14 @@ static int host_start(struct ci_hdrc *ci)
 		pinctrl_select_state(ci->platdata->pctl,
 				     ci->platdata->pins_host);
 
+	ci->hcd = hcd;
+
 	ret = usb_add_hcd(hcd, 0, 0);
 	if (ret) {
 		goto disable_reg;
 	} else {
 		struct usb_otg *otg = &ci->otg;
 
-		ci->hcd = hcd;
-
 		if (ci_otg_is_fsm_mode(ci)) {
 			otg->host = &hcd->self;
 			hcd->self.otg_port = 1;
@@ -237,6 +243,7 @@ static int ci_ehci_hub_control(
 	u32		temp;
 	unsigned long	flags;
 	int		retval = 0;
+	bool		done = false;
 	struct device *dev = hcd->self.controller;
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
@@ -244,6 +251,13 @@ static int ci_ehci_hub_control(
 
 	spin_lock_irqsave(&ehci->lock, flags);
 
+	if (ci->platdata->hub_control) {
+		retval = ci->platdata->hub_control(ci, typeReq, wValue, wIndex,
+						   buf, wLength, &done, &flags);
+		if (done)
+			goto done;
+	}
+
 	if (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_SUSPEND) {
 		temp = ehci_readl(ehci, status_reg);
 		if ((temp & PORT_PE) == 0 || (temp & PORT_RESET) != 0) {
@@ -349,6 +363,86 @@ static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 	return 0;
 }
 
+static void ci_hdrc_free_dma_aligned_buffer(struct urb *urb)
+{
+	struct ci_hdrc_dma_aligned_buffer *temp;
+	size_t length;
+
+	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
+		return;
+
+	temp = container_of(urb->transfer_buffer,
+			    struct ci_hdrc_dma_aligned_buffer, data);
+
+	if (usb_urb_dir_in(urb)) {
+		if (usb_pipeisoc(urb->pipe))
+			length = urb->transfer_buffer_length;
+		else
+			length = urb->actual_length;
+
+		memcpy(temp->old_xfer_buffer, temp->data, length);
+	}
+	urb->transfer_buffer = temp->old_xfer_buffer;
+	kfree(temp->kmalloc_ptr);
+
+	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
+}
+
+static int ci_hdrc_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
+{
+	struct ci_hdrc_dma_aligned_buffer *temp, *kmalloc_ptr;
+	const unsigned int ci_hdrc_usb_dma_align = 32;
+	size_t kmalloc_size;
+
+	if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0 ||
+	    !((uintptr_t)urb->transfer_buffer & (ci_hdrc_usb_dma_align - 1)))
+		return 0;
+
+	/* Allocate a buffer with enough padding for alignment */
+	kmalloc_size = urb->transfer_buffer_length +
+		       sizeof(struct ci_hdrc_dma_aligned_buffer) +
+		       ci_hdrc_usb_dma_align - 1;
+
+	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
+	if (!kmalloc_ptr)
+		return -ENOMEM;
+
+	/* Position our struct dma_aligned_buffer such that data is aligned */
+	temp = PTR_ALIGN(kmalloc_ptr + 1, ci_hdrc_usb_dma_align) - 1;
+	temp->kmalloc_ptr = kmalloc_ptr;
+	temp->old_xfer_buffer = urb->transfer_buffer;
+	if (usb_urb_dir_out(urb))
+		memcpy(temp->data, urb->transfer_buffer,
+		       urb->transfer_buffer_length);
+	urb->transfer_buffer = temp->data;
+
+	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
+
+	return 0;
+}
+
+static int ci_hdrc_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
+				   gfp_t mem_flags)
+{
+	int ret;
+
+	ret = ci_hdrc_alloc_dma_aligned_buffer(urb, mem_flags);
+	if (ret)
+		return ret;
+
+	ret = usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
+	if (ret)
+		ci_hdrc_free_dma_aligned_buffer(urb);
+
+	return ret;
+}
+
+static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
+{
+	usb_hcd_unmap_urb_for_dma(hcd, urb);
+	ci_hdrc_free_dma_aligned_buffer(urb);
+}
+
 int ci_hdrc_host_init(struct ci_hdrc *ci)
 {
 	struct ci_role_driver *rdrv;
@@ -366,6 +460,11 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
 	rdrv->name	= "host";
 	ci->roles[CI_ROLE_HOST] = rdrv;
 
+	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA) {
+		ci_ehci_hc_driver.map_urb_for_dma = ci_hdrc_map_urb_for_dma;
+		ci_ehci_hc_driver.unmap_urb_for_dma = ci_hdrc_unmap_urb_for_dma;
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 025b41687ce9..edf3342507f1 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -88,6 +88,12 @@ struct ci_hdrc_platform_data {
 	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_host;
 	struct pinctrl_state *pins_device;
+
+	/* platform-specific hooks */
+	int (*hub_control)(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
+			   u16 wIndex, char *buf, u16 wLength,
+			   bool *done, unsigned long *flags);
+	void (*enter_lpm)(struct ci_hdrc *ci, bool enable);
 };
 
 /* Default offset of capability registers */
-- 
2.29.2


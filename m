Return-Path: <linux-usb+bounces-19840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE8A21B65
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECD0E1888946
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 10:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1940D1DDC3F;
	Wed, 29 Jan 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i0M5As/R"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B61B85DF;
	Wed, 29 Jan 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148188; cv=none; b=RJgWiMOQSAy48RWPanU7iZuXtT26stpftMcJpFLx44Hc4HkztSiZd66mq+cccArXZMUcm24oNqYBcCgzQ7s6maBaNDWM6rlnBglyhb34P9Igo9IZNtUlVko5GX8jCD3fJTDvOlm7QDwWfb7B1Xjj6Y9rI+/CPFGlIBcH20eJd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148188; c=relaxed/simple;
	bh=9XGUKvg1fAU/b/KY137j5fnFRhZjWZ6U99qPmAdtb/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbYUNtRGZtjhgtedO30k4rCebwgbZFWMOt7vpntn5ta7pthS00eTPvMiUi/lc7n6/5d/joQ7KIF0ZKQP+OSh69W+GoTD8z+ZbXaYOF6xET5IxO07VetLbyLanNlf22YcX8nW8LjjUXELhiyM1K5wobNJVTm2oC4mXgQk3jI1XIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i0M5As/R; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DD45FF80D;
	Wed, 29 Jan 2025 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738148178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLjMpIBrYYqfaDFpRRkZcmwmehpVp7jUah3fTA/7BeQ=;
	b=i0M5As/RQwXZtv+NIf3AtV8xJCS+Z7qguwS1hXr0Cviqo/7hf5y0s9Fku0O2RbMiQwX9e3
	83j52FSfD0/3iIqEzzoRX2544mOgmOQzY9F5a3FmXCotApJPHwRcxk/IbfuZzBxvpTUuVO
	vsEyKy2Amp1vh5qi98FS6LEHm06jtoibTWuJDFpvR3h6u0xLO2pNgyoiHWpjyO8qBINJ+l
	WXNslKi3FG4vmvNiVbRhi1rptJVfZ2/4GHgK3T5Je6CskuZR+l21+CLavIVgqW8lanym1D
	CLWdCq+h8lUMV1DnUVSPGt0VGVEhQeQBqh5LhvOfUrlyEu9n+xtPc+OZZvhLwA==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com,
	mathias.nyman@linux.intel.com
Cc: rogerq@kernel.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] usb: xhci: change xhci_resume() parameters to explicit the desired info
Date: Wed, 29 Jan 2025 11:56:11 +0100
Message-ID: <20250129105613.403923-7-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
References: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: theo.lebrun@bootlin.com

Previous signature was:

        int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);

Internally, it extracted two information out of the message:
 - whether we are after hibernation: msg.event == PM_EVENT_RESTORE,
 - whether this is an auto resume: msg.event == PM_EVENT_AUTO_RESUME.

First bulletpoint is somewhat wrong: driver wants to know if the device
did lose power, it doesn't care about hibernation per se. Knowing that,
refactor to ask upper layers the right questions: (1) "did we lose
power?" and, (2) "is this an auto resume?". Change the signature to:

        int xhci_resume(struct xhci_hcd *xhci, bool power_lost,
                        bool is_auto_resume);

The goal is to allow some upper layers (cdns3-plat) to tell us when
power was lost after system-wise suspend.

Note that lost_power is ORed at the start of xhci_resume() to
xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend. It is
simpler to keep those checks inside of xhci_resume() instead of doing
them at each caller of xhci_resume().

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/host/xhci-histb.c |  2 +-
 drivers/usb/host/xhci-pci.c   |  8 +++++---
 drivers/usb/host/xhci-plat.c  | 10 +++++-----
 drivers/usb/host/xhci-tegra.c |  2 +-
 drivers/usb/host/xhci.c       | 19 ++++++++-----------
 drivers/usb/host/xhci.h       |  2 +-
 6 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index f9a4a4b0eb57..dde2ae0e9a0f 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -355,7 +355,7 @@ static int __maybe_unused xhci_histb_resume(struct device *dev)
 	if (!device_may_wakeup(dev))
 		xhci_histb_host_enable(histb);
 
-	return xhci_resume(xhci, PMSG_RESUME);
+	return xhci_resume(xhci, false, false);
 }
 
 static const struct dev_pm_ops xhci_histb_pm_ops = {
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index cb07cee9ed0c..6362a8d9a74d 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -807,8 +807,10 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 
 static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 {
-	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
-	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	bool power_lost = msg.event == PM_EVENT_RESTORE;
+	bool is_auto_resume = msg.event == PM_EVENT_AUTO_RESUME;
 
 	reset_control_reset(xhci->reset);
 
@@ -839,7 +841,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	return xhci_resume(xhci, msg);
+	return xhci_resume(xhci, power_lost, is_auto_resume);
 }
 
 static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 49cc24e3ce23..831af518a6ec 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -476,7 +476,7 @@ static int xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
-static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
+static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -498,7 +498,7 @@ static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 	if (ret)
 		goto disable_clks;
 
-	ret = xhci_resume(xhci, pmsg);
+	ret = xhci_resume(xhci, power_lost, false);
 	if (ret)
 		goto disable_clks;
 
@@ -519,12 +519,12 @@ static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 
 static int xhci_plat_resume(struct device *dev)
 {
-	return xhci_plat_resume_common(dev, PMSG_RESUME);
+	return xhci_plat_resume_common(dev, false);
 }
 
 static int xhci_plat_restore(struct device *dev)
 {
-	return xhci_plat_resume_common(dev, PMSG_RESTORE);
+	return xhci_plat_resume_common(dev, true);
 }
 
 static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
@@ -545,7 +545,7 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 	struct usb_hcd  *hcd = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
-	return xhci_resume(xhci, PMSG_AUTO_RESUME);
+	return xhci_resume(xhci, false, true);
 }
 
 const struct dev_pm_ops xhci_plat_pm_ops = {
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 94dd32f1a0da..74a4a2719e4f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2286,7 +2286,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 	if (wakeup)
 		tegra_xhci_disable_phy_sleepwalk(tegra);
 
-	err = xhci_resume(xhci, is_auto_resume ? PMSG_AUTO_RESUME : PMSG_RESUME);
+	err = xhci_resume(xhci, false, is_auto_resume);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 899c0effb5d3..ccdc74b24d3f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1001,16 +1001,14 @@ EXPORT_SYMBOL_GPL(xhci_suspend);
  * This is called when the machine transition from S3/S4 mode.
  *
  */
-int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
+int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 {
-	bool			hibernated = (msg.event == PM_EVENT_RESTORE);
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	int			retval = 0;
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
-	bool			reinit_xhc = false;
 
 	if (!hcd->state)
 		return 0;
@@ -1029,10 +1027,10 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 
 	spin_lock_irq(&xhci->lock);
 
-	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
-		reinit_xhc = true;
+	if (xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
+		power_lost = true;
 
-	if (!reinit_xhc) {
+	if (!power_lost) {
 		/*
 		 * Some controllers might lose power during suspend, so wait
 		 * for controller not ready bit to clear, just as in xHC init.
@@ -1072,12 +1070,12 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 	/* re-initialize the HC on Restore Error, or Host Controller Error */
 	if ((temp & (STS_SRE | STS_HCE)) &&
 	    !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
-		reinit_xhc = true;
-		if (!xhci->broken_suspend)
+		if (!power_lost)
 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
+		power_lost = true;
 	}
 
-	if (reinit_xhc) {
+	if (power_lost) {
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
 			del_timer_sync(&xhci->comp_mode_recovery_timer);
@@ -1175,8 +1173,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 
 		pending_portevent = xhci_pending_portevent(xhci);
 
-		if (suspended_usb3_devs && !pending_portevent &&
-		    msg.event == PM_EVENT_AUTO_RESUME) {
+		if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
 			msleep(120);
 			pending_portevent = xhci_pending_portevent(xhci);
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f0fb696d5619..4f045a864ac1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1859,7 +1859,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
 int xhci_ext_cap_init(struct xhci_hcd *xhci);
 
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
-int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);
+int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
-- 
2.48.1



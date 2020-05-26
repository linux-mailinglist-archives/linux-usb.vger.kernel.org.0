Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD0F1DF48D
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 06:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387621AbgEWEMb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 00:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387615AbgEWEMb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 00:12:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8A4C061A0E
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 21:12:31 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so5928482pgn.5
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 21:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bLR6ZIRylvFFIxKdJ83iv09lWseVsvasJ0E1PrljIIA=;
        b=aplJuZmlLgHFVE2F12xlgenwp9VxB9NxBbFUKdNnmQzvgT2LDo7s5UCmQ+qrtoboaf
         zn5CIKnSME8rq5enWZ8nz5dIFTSqP3idH9HSp0N6WKayRMMfuf3TzYFSLkuqoib0kvgV
         Qhs9mcQej9SI9eTbqbiHkNxg0eRC3Kg7MVrA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bLR6ZIRylvFFIxKdJ83iv09lWseVsvasJ0E1PrljIIA=;
        b=uXzFLKoSSDKD7iECsEaTJmvrjosxLX3Frp72XiX3GWmtZzuwEK4MsYM3cSrmKirb8B
         dsZynaRGtT39N8Bnm1YdoAky0BlULwOUzR+HmmonZCRhem0I6o7CIBtukIQMA5h8iuSf
         7dxDShPuiYi5KhAYOQjeakOh1IeBB4FIJOJSQTKsySj/BOyEPEJiHRBbKzr5a9YsJ/pe
         TqJo3bQ1Vubh9xScd8hvHTXN7JdEHQv48g4BcKx06qcSSUGyKYQ9T15yUNv8yiqgJxSL
         uxJ2U6ToirXIaVVvxeZCrinqVB9vKKCXsBHglArx9Q5+76U32A7CPO5GMwVdw/rsvSlO
         1Lzw==
X-Gm-Message-State: AOAM5338+5Lh/B0jExUwGjtkmx/QnNERfAR1qiZBPyScsP86VvPId8ke
        xQicIGS5vNqf69i3TXXMlmn9+A==
X-Google-Smtp-Source: ABdhPJyWhs3gIjSkezupuRAPz5rdIyxCk9/Qc1FlGjEqN7gxG/Bcg8Fg9+IvMTjHmsTFL3oMxffkPg==
X-Received: by 2002:a62:cd8d:: with SMTP id o135mr6937224pfg.26.1590207150526;
        Fri, 22 May 2020 21:12:30 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id h7sm7075741pgn.60.2020.05.22.21.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 21:12:30 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     enric.balletbo@collabora.com, bleung@chromium.org,
        groeck@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:DESIGNWARE USB3 DRD IP DRIVER)
Subject: [RFC PATCH 1/1] usb: dwc3: of-simple: Add extcon support
Date:   Fri, 22 May 2020 21:12:02 -0700
Message-Id: <20200523041201.75217-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
In-Reply-To: <20200523041201.75217-1-pmalani@chromium.org>
References: <20200523041201.75217-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add optional extcon notifier support to enable the hotplug / unplug of
the underlying PHY layer devices.

If supported, the Device Tree (DT) node for the device should include an
"extcon" property which is a phandle to an extcon DT node.

This patch is an effort to incorporate the equivalent support from the
Rockchip dwc3 driver implementation from Chrome OS [1] to the mainline.

[1] : https://chromium.googlesource.com/chromiumos/third_party/kernel/
+/refs/heads/chromeos-4.4/drivers/usb/dwc3/dwc3-rockchip.c

Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 149 +++++++++++++++++++++++++++++-
 1 file changed, 146 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index e64754be47b4..28bde27cd1f9 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -11,6 +11,7 @@
  * by Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
  */
 
+#include <linux/extcon.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -29,8 +30,117 @@ struct dwc3_of_simple {
 	struct reset_control	*resets;
 	bool			pulse_resets;
 	bool			need_reset;
+	struct extcon_dev	*edev;
+	struct notifier_block	nb;
+	struct work_struct	work;
+	/* Denotes whether child devices have been populated. */
+	bool			populated;
+	bool			suspended;
+	spinlock_t		suspend_lock;
 };
 
+static int dwc3_of_simple_populate(struct dwc3_of_simple *simple)
+{
+	struct device *dev = simple->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate dwc3 devices.\n");
+		return ret;
+	}
+	simple->populated = true;
+	return 0;
+}
+
+static void dwc3_of_simple_depopulate(struct dwc3_of_simple *simple)
+{
+	if (simple->populated) {
+		of_platform_depopulate(simple->dev);
+		simple->populated = false;
+	}
+}
+
+static void dwc3_of_simple_work(struct work_struct *work)
+{
+	struct dwc3_of_simple *simple = container_of(work,
+					struct dwc3_of_simple, work);
+	struct extcon_dev *edev = simple->edev;
+
+	if (extcon_get_state(edev, EXTCON_USB_HOST) > 0) {
+		if (simple->populated)
+			return;
+
+		dwc3_of_simple_populate(simple);
+	} else {
+		if (!simple->populated)
+			return;
+
+		dwc3_of_simple_depopulate(simple);
+	}
+}
+
+static int dwc3_of_simple_notifier(struct notifier_block *nb,
+			      unsigned long event, void *ptr)
+{
+	struct dwc3_of_simple *simple = container_of(nb, struct dwc3_of_simple,
+						nb);
+	unsigned long flags;
+
+	spin_lock_irqsave(&simple->suspend_lock, flags);
+	if (!simple->suspended)
+		schedule_work(&simple->work);
+	spin_unlock_irqrestore(&simple->suspend_lock, flags);
+
+	return NOTIFY_OK;
+}
+
+static int dwc3_of_simple_extcon_register(struct dwc3_of_simple *simple)
+{
+	struct device		*dev = simple->dev;
+	struct extcon_dev	*edev;
+	int			ret;
+
+	edev = extcon_get_edev_by_phandle(dev, 0);
+	if (IS_ERR(edev)) {
+		/* The extcon property is optional. */
+		if (PTR_ERR(edev) == -ENODEV)
+			return 0;
+		if (PTR_ERR(edev) != -EPROBE_DEFER)
+			dev_err(dev, "Couldn't get extcon device.\n");
+		return PTR_ERR(edev);
+	}
+
+	INIT_WORK(&simple->work, dwc3_of_simple_work);
+
+	simple->nb.notifier_call = dwc3_of_simple_notifier;
+	ret = devm_extcon_register_notifier(dev, edev, EXTCON_USB_HOST,
+					&simple->nb);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register notifier.\n");
+		return ret;
+	}
+
+	simple->edev = edev;
+
+	return 0;
+}
+
+static void dwc3_of_simple_extcon_unregister(struct dwc3_of_simple *simple)
+{
+	if (!simple->edev)
+		return;
+
+	/*
+	 * We explicitly unregister the notifier to prevent races with
+	 * the of_depopulate() call in remove().
+	 */
+	devm_extcon_unregister_notifier(simple->dev, simple->edev,
+					EXTCON_USB_HOST, &simple->nb);
+	cancel_work_sync(&simple->work);
+}
+
 static int dwc3_of_simple_probe(struct platform_device *pdev)
 {
 	struct dwc3_of_simple	*simple;
@@ -47,6 +157,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
 
+	spin_lock_init(&simple->suspend_lock);
+
 	/*
 	 * Some controllers need to toggle the usb3-otg reset before trying to
 	 * initialize the PHY, otherwise the PHY times out.
@@ -87,9 +199,24 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_resetc_assert;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret)
+	ret = dwc3_of_simple_extcon_register(simple);
+	if (ret < 0) {
+		dev_warn(dev, "No extcon device found, err: %d\n", ret);
 		goto err_clk_put;
+	}
+
+	if (!simple->edev) {
+		ret = dwc3_of_simple_populate(simple);
+		if (ret)
+			goto err_clk_put;
+	} else {
+		/*
+		 * Populate through worker to avoid race conditions against
+		 * action scheduled through notifier.
+		 */
+		if (extcon_get_state(simple->edev, EXTCON_USB_HOST) > 0)
+			schedule_work(&simple->work);
+	}
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -112,7 +239,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 
 static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
 {
-	of_platform_depopulate(simple->dev);
+	dwc3_of_simple_extcon_unregister(simple);
+	dwc3_of_simple_depopulate(simple);
 
 	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
 	clk_bulk_put_all(simple->num_clocks, simple->clks);
@@ -163,6 +291,13 @@ static int __maybe_unused dwc3_of_simple_runtime_resume(struct device *dev)
 static int __maybe_unused dwc3_of_simple_suspend(struct device *dev)
 {
 	struct dwc3_of_simple *simple = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&simple->suspend_lock, flags);
+	simple->suspended = true;
+	spin_unlock_irqrestore(&simple->suspend_lock, flags);
+
+	cancel_work_sync(&simple->work);
 
 	if (simple->need_reset)
 		reset_control_assert(simple->resets);
@@ -173,10 +308,18 @@ static int __maybe_unused dwc3_of_simple_suspend(struct device *dev)
 static int __maybe_unused dwc3_of_simple_resume(struct device *dev)
 {
 	struct dwc3_of_simple *simple = dev_get_drvdata(dev);
+	unsigned long flags;
 
 	if (simple->need_reset)
 		reset_control_deassert(simple->resets);
 
+	spin_lock_irqsave(&simple->suspend_lock, flags);
+	simple->suspended = false;
+	spin_unlock_irqrestore(&simple->suspend_lock, flags);
+
+	if (simple->edev)
+		schedule_work(&simple->work);
+
 	return 0;
 }
 
-- 
2.27.0.rc0.183.gde8f92d652-goog


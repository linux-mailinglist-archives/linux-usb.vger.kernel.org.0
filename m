Return-Path: <linux-usb+bounces-17169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFD9BE120
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 09:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D116B24987
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 08:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057271D6DBE;
	Wed,  6 Nov 2024 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYssTKMN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1571D6DB6
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882148; cv=none; b=XIaw3KQPplbMWypybqIKmCCA+V4mnR3J1AU1OGc4FWCKOQB/x6XtFBjCHDc4nggZ1mmdHOgGm4QHtc8hOHJP2QWn169Wq/YTXkva/awYLJBXcSxg0ADOImg8v4dEJMzmzPYyXPDfTVw8xfDVju0T/uwBmrVOGiHRHj+IgOwSNag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882148; c=relaxed/simple;
	bh=Dq6sxgb2vTpQq5C2pUSyC8DgdGfKfTQVCyb6mHAbBig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kp28X3vYXfUtpRaybxKLJ3VZZXzVcGdgcZETkyBsFfjLKeFOMCK1LUF1MS1toTSliLC50yBSqKh04idfLxV1y4wTf6KWyft+pvohbYH4uWNxMvOI0VjoKIONc8VAtC2BHl5UWZGXroITYiXw+v+GvGZXWZvFNpi38161bBQot2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYssTKMN; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e29205f6063so10546903276.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 00:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730882146; x=1731486946; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXtRDw3t0JMnNxciD95IZs4DcdHE8C5XutldebSzr3s=;
        b=dYssTKMNa02wtFSdSD8tddczP7nznbTpgcchp2EqNRcoW5Z+PPSaEVhFmjCiQ7vQ0A
         gBXCPi1YubAy3EuK+XsfhwTY9If2OmJ39+kZsvXl3eTcU4r0DuxFIhVZGMdiRdK9fp7W
         xNuGVSToxmSojnHX917rrqUYWkXwPocTMhFPFb2Eu7+U/9labhSPp1u3efxMbNGyhwaA
         Ztpbb1xnrSl1QyU2zxAsxgygewrIwtvV64jcQrqvqCUHTDtTTQi0KybcqGqLaXGo4vTf
         xQv1qFgj+nVJ04yC7WUIL/JTns0dZg8KcIUZC2MZPhG2QhlR2olKS7x1rUZkpsvRa67X
         WokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882146; x=1731486946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cXtRDw3t0JMnNxciD95IZs4DcdHE8C5XutldebSzr3s=;
        b=uI3e1fVw5kidhzD8fMXieHzkKg5f5Lxu7FWDf73pm9ps8QzAz0FqfqvOiBJoJgnZ5s
         LlXivVmNSRnSQbUzX5PspOIdBH8w+tesB5d61ZCTFoMKHNJpYzVYlZps2Lm/PV+ntYZV
         aFV2RshAXNMwZpvFql+rQDpsOxYRQIEx5o3jvbXkAATzm2P8qClOdwidDD5JDLB9dScx
         /cqtsneCunHeobaYAVlH8CjYzbA08Xs45OR6jrG1hwc+dCx38lmmTvfuB+JXUauJg9Dc
         6B//DAKVKp0sm8mDc0Kyb+jz4g/FiiM+1a4jxk07yvIdD1MGu1QGS/vhNQPiEfmq8LmS
         4Z/Q==
X-Gm-Message-State: AOJu0Yy+anwYIYffa8PYckHlIXJFWoDhPNEshgTZNXdbFvRJuHVHj6Yv
	6PKutBR5AoIRr6UWSV9Y5uWQLr/X9d40poKZl7dBcAQMj6hTpJdTx/fmsISKeH7q4gwHk2bOjrY
	MncU0infe/5bR1A==
X-Google-Smtp-Source: AGHT+IHcYTNQDnMOVwc6fZUnOUACET0zvNk3Da5TLzwhaqVFvPYd+NCLi84JDB/wEYzN4ScXaao6SLAgk0EZhb0=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a5b:308:0:b0:e33:2432:8b75 with SMTP id
 3f1490d57ef6-e3324328dedmr19783276.7.1730882145927; Wed, 06 Nov 2024 00:35:45
 -0800 (PST)
Date: Wed,  6 Nov 2024 08:32:59 +0000
In-Reply-To: <20241106083501.408074-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241106083501.408074-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241106083501.408074-6-guanyulin@google.com>
Subject: [PATCH v6 5/5] usb: host: enable sideband transfer during system sleep
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@linaro.org, 
	dianders@chromium.org, kekrby@gmail.com, oneukum@suse.com, 
	yajun.deng@linux.dev, niko.mauno@vaisala.com, christophe.jaillet@wanadoo.fr, 
	tj@kernel.org, stanley_chang@realtek.com, andreyknvl@gmail.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Sharing a USB controller with another entity via xhci-sideband driver
creates power management complexities. To prevent the USB controller
from being inadvertently deactivated while in use by the other entity, a
usage-count based mechanism is implemented. This allows the system to
manage power effectively, ensuring the controller remains available
whenever needed.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/core/driver.c    | 10 ++++++++++
 drivers/usb/dwc3/core.c      | 20 ++++++++++++++++++++
 drivers/usb/dwc3/core.h      |  1 +
 drivers/usb/host/xhci-plat.c | 10 ++++++++++
 include/linux/usb/hcd.h      |  7 +++++++
 5 files changed, 48 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index e53cb4c267b3..e5bb26e6c71a 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1583,6 +1583,11 @@ int usb_suspend(struct device *dev, pm_message_t msg)
 	struct usb_device	*udev = to_usb_device(dev);
 	int r;
 
+	if (msg.event == PM_EVENT_SUSPEND && usb_sideband_check(udev)) {
+		dev_dbg(dev, "device accessed via sideband\n");
+		return 0;
+	}
+
 	unbind_no_pm_drivers_interfaces(udev);
 
 	/* From now on we are sure all drivers support suspend/resume
@@ -1619,6 +1624,11 @@ int usb_resume(struct device *dev, pm_message_t msg)
 	struct usb_device	*udev = to_usb_device(dev);
 	int			status;
 
+	if (msg.event == PM_EVENT_RESUME && usb_sideband_check(udev)) {
+		dev_dbg(dev, "device accessed via sideband\n");
+		return 0;
+	}
+
 	/* For all calls, take the device back to full power and
 	 * tell the PM core in case it was autosuspended previously.
 	 * Unbind the interfaces that will need rebinding later,
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2fdafbcbe44c..d85c68d5eba4 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2550,8 +2550,18 @@ static int dwc3_runtime_idle(struct device *dev)
 static int dwc3_suspend(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct platform_device *xhci = dwc->xhci;
+	struct usb_hcd  *hcd;
 	int		ret;
 
+	if (xhci) {
+		hcd = dev_get_drvdata(&xhci->dev);
+		if (xhci_sideband_check(hcd)) {
+			dev_dbg(dev, "device accessed via sideband\n");
+			return 0;
+		}
+	}
+
 	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
 	if (ret)
 		return ret;
@@ -2564,8 +2574,18 @@ static int dwc3_suspend(struct device *dev)
 static int dwc3_resume(struct device *dev)
 {
 	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct platform_device *xhci = dwc->xhci;
+	struct usb_hcd  *hcd;
 	int		ret;
 
+	if (xhci) {
+		hcd = dev_get_drvdata(&xhci->dev);
+		if (xhci_sideband_check(hcd)) {
+			dev_dbg(dev, "device accessed via sideband\n");
+			return 0;
+		}
+	}
+
 	pinctrl_pm_select_default_state(dev);
 
 	pm_runtime_disable(dev);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 80047d0df179..a585e9d80e59 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -26,6 +26,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/hcd.h>
 #include <linux/usb/role.h>
 #include <linux/ulpi/interface.h>
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6e49ef1908eb..5fdbdf0c7f1a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -456,6 +456,11 @@ static int xhci_plat_suspend_common(struct device *dev, struct pm_message pmsg)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
+	if (pmsg.event == PM_EVENT_SUSPEND && xhci_sideband_check(hcd)) {
+		dev_dbg(dev, "device accessed via sideband\n");
+		return 0;
+	}
+
 	if (pm_runtime_suspended(dev))
 		pm_runtime_resume(dev);
 
@@ -499,6 +504,11 @@ static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
+	if (pmsg.event == PM_EVENT_RESUME && xhci_sideband_check(hcd)) {
+		dev_dbg(dev, "device accessed via sideband\n");
+		return 0;
+	}
+
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
 		ret = clk_prepare_enable(xhci->clk);
 		if (ret)
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 9867c178d188..b22d25ccdf7c 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -772,6 +772,13 @@ extern struct rw_semaphore ehci_cf_port_reset_rwsem;
 #define USB_EHCI_LOADED		2
 extern unsigned long usb_hcds_loaded;
 
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND)
+extern bool xhci_sideband_check(struct usb_hcd *hcd);
+#else
+static inline bool xhci_sideband_check(struct usb_hcd *hcd)
+{ return false; }
+#endif
+
 #endif /* __KERNEL__ */
 
 #endif /* __USB_CORE_HCD_H */
-- 
2.47.0.199.ga7371fff76-goog



Return-Path: <linux-usb+bounces-21298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED1A4CFA2
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 01:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19DD170596
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 00:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E120D28F4;
	Tue,  4 Mar 2025 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z1X+5p5O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD61B63B9
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 00:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046705; cv=none; b=WwVkxs+u+lJ1eA0/6znI2CC6VNHtpKLvUfRt/R5QSYB+NE4Tr2Aq0IiH3fiUVmsL7hitEhSON20qiDQPE7k3PnVhwe1plMB+DaP/WWb4izTX639XMOQp0R9UNMf3XSfkZuGHvlig88ZavJKtpKJ423zQQ6slsCeOWzVTxwupr5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046705; c=relaxed/simple;
	bh=jrC10qjkH8DT2wANGDY+mEx4fm8/tfCpXVn/cKOLfGk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=dPHW8LalqHGQO0L5Kxg1QdyDccBQ+cf5tUnjBNzHCIcoEv7omvmzESlW43vgr+t95va7JFnpxX0C4Q6PB4od4oGEka8AZvuOZ4H23FKWTy8K4KT7uOgi1m5xiCMRfJakORl+VKqAsA1tWETVedBdgX5Q64w0t1vO64jUZLazuSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z1X+5p5O; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-523914bc6efso561328e0c.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Mar 2025 16:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741046702; x=1741651502; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DjrHk4lexT8lBoN+vGHL5mmXE6TVHzh6JA5Gb5ioUpc=;
        b=z1X+5p5O/bCa0UR3Sd4MN9L6eD3J+ZrbKc51Zm/doscHQ1TaBAaM+9X17mBgInmeaN
         oIBFVcecj0AGfrtJOEFireVSYBHSGhk1iWg5bT9QizayLPZxzmYmVTmCnlBVaPksxAMO
         2BDspxsbZyMdpYd7kc+sFZxcujZMwOyKh7aWoG7od1SRuWV7OBGk9ovPSvw7Sqnd8d3k
         z/T8xurJNFvTui/SY1JGjk3uUSNsZZJPFHpHDnKz2fNceCnNd+Jxf03b+eL51VO3aA+N
         USu4Ofz/1LsWDeRY8OGxtFJjmsrC23B9XWNmw8uLEvb5O4naNxShsFpZly8MrRpNRyZS
         H5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046702; x=1741651502;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjrHk4lexT8lBoN+vGHL5mmXE6TVHzh6JA5Gb5ioUpc=;
        b=mss5QCwfWF6olyncKyCq4ma91op2WdpQjKkP+fyoo+IeYH+KoWJIT/fbYd/7GR/3XL
         PySbEVv3NmvyHiWDpISf+CV0yuFquWbuef5nigTLyRG8tVU1n92eK1gUj6NP6D+wZ/E4
         9qbty0Ke7pA6mHbTf64SWC/o9Wchf7JVy2coegPnyzFJSUK6UL3uUkMXOpk7CEobRjD8
         CtJGlftZQ/r9TX9VvQ18rQyJJAOunbZzOD0QlXRKOyM47joGyb03BGufpP1dVre8mTpy
         drzwnbChrkl07a+bkcozHk7z+oDOKB8p3ddYN/ZJeD9pytK8c4NY6YI+04NAs+BuDEc8
         Pfkw==
X-Forwarded-Encrypted: i=1; AJvYcCXws9gh4EKnDMwFzCb6rGX/LlRiyv2e2Lmo6ZPnjUhMvLk0H0y7nbeM3ODztrbMif90+Foj2+bPx9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEQ18Q7Ol6rK/o+bOs4qLb8dApzL5rYAx6hfLlNmLOkQg9gKUY
	mtl7mAtBCKh5GxliyeqqOfWA3PG7Xh6cceByOmTJdv5JCbyynGeqUXYCGvRcWXnEU2jeWJuOXzQ
	1xQ==
X-Google-Smtp-Source: AGHT+IESJh97E8EkLa4HZNA4JrJLSlx6Ihykb5XeprBWtV7RG+YRwiIvp26i2x9NXR+WLA7ztV1pN5pxW6M=
X-Received: from vkbca27.prod.google.com ([2002:a05:6122:401b:b0:521:9cd4:caa1])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6122:4704:b0:520:3914:e6bb
 with SMTP id 71dfb90a1353d-5235bd4ea28mr9018233e0c.7.1741046702573; Mon, 03
 Mar 2025 16:05:02 -0800 (PST)
Date: Tue,  4 Mar 2025 00:04:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304000458.1826450-1-royluo@google.com>
Subject: [PATCH v1] usb: dwc3: core: Avoid redundant system suspend/resume callbacks
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dwc3 device suspend/resume callbacks were being triggered during system
suspend and resume even if the device was already runtime-suspended.
This is redundant for device mode because the suspend and resume routines
are essentially identical for system PM and runtime PM. The minor
difference in pinctrl state changes has been moved to the common section
in this patch.
To prevent these unnecessary callbacks, indicate to the PM core that it
can safely leave the device in runtime suspend if it's already
runtime-suspended in device mode by returning a positive value in
prepare() callback.

Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/core.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..b83f094ff1c5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2398,10 +2398,12 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_suspend(dwc);
 		synchronize_irq(dwc->irq_gadget);
 		dwc3_core_exit(dwc);
+		pinctrl_pm_select_sleep_state(dwc->dev);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
 		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
 			dwc3_core_exit(dwc);
+			pinctrl_pm_select_sleep_state(dwc->dev);
 			break;
 		}
 
@@ -2436,6 +2438,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 
 		dwc3_otg_exit(dwc);
 		dwc3_core_exit(dwc);
+		pinctrl_pm_select_sleep_state(dwc->dev);
 		break;
 	default:
 		/* do nothing */
@@ -2453,6 +2456,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
+		pinctrl_pm_select_default_state(dwc->dev);
 		ret = dwc3_core_init_for_resume(dwc);
 		if (ret)
 			return ret;
@@ -2462,6 +2466,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
 		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+			pinctrl_pm_select_default_state(dwc->dev);
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
@@ -2490,6 +2495,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		if (PMSG_IS_AUTO(msg))
 			break;
 
+		pinctrl_pm_select_default_state(dwc->dev);
 		ret = dwc3_core_init_for_resume(dwc);
 		if (ret)
 			return ret;
@@ -2608,8 +2614,6 @@ static int dwc3_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	pinctrl_pm_select_sleep_state(dev);
-
 	return 0;
 }
 
@@ -2618,8 +2622,6 @@ static int dwc3_resume(struct device *dev)
 	struct dwc3	*dwc = dev_get_drvdata(dev);
 	int		ret = 0;
 
-	pinctrl_pm_select_default_state(dev);
-
 	pm_runtime_disable(dev);
 	ret = pm_runtime_set_active(dev);
 	if (ret)
@@ -2647,14 +2649,29 @@ static void dwc3_complete(struct device *dev)
 		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
 	}
 }
+
+static int dwc3_prepare(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+
+	/*
+	 * Indicate to the PM core that it may safely leave the device in
+	 * runtime suspend if runtime-suspended already in device mode.
+	 */
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		return 1;
+
+	return 0;
+}
 #else
 #define dwc3_complete NULL
+#define dwc3_prepare NULL
 #endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops dwc3_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
 	.complete = dwc3_complete,
-
+	.prepare = dwc3_prepare,
 	/*
 	 * Runtime suspend halts the controller on disconnection. It relies on
 	 * platforms with custom connection notification to start the controller

base-commit: 99fa936e8e4f117d62f229003c9799686f74cebc
-- 
2.48.1.711.g2feabab25a-goog



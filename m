Return-Path: <linux-usb+bounces-22029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1AA6D34A
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 04:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F3C188DFAA
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 03:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0433316EB42;
	Mon, 24 Mar 2025 03:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEguNFdE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15D41C69
	for <linux-usb@vger.kernel.org>; Mon, 24 Mar 2025 03:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742786306; cv=none; b=Ltp1LZEtWnVgvavsKg/Db60CKxyfDoD7cB0vyY3PjH/pQjrOifhNkUo33IprvncAhguzJWwORI1dpdRCaSI0tPkpFrIvoxLo8ro6A/9oNgJBptnXYUJyIc6/tGZKmAEieTfsw8nTOV8jcAkt4ix7Ol4ZeDkoUzZy6Poq88gNfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742786306; c=relaxed/simple;
	bh=Wak54F/vr91IxJjinDwC+gT6AdviO8lFTuJQezzpbpw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=F6akYjuPcZbZsyTStdU2t5Lt7rg1HGhSjqspWD2HRuSBH/RzSvYoVQwXm79Z/DD53i13N4DStpfTPzaMTkrNp1mvC2iCJQ9+J3p9TjUqnzJH3O2U3qRefCxZvtJGJBLa8cm2Ef7liQhGBu4PV/vfQ5K5/ae6BfnS5nyxm++Bbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEguNFdE; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-54994e431dcso1725881e87.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Mar 2025 20:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742786303; x=1743391103; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yPMwIFcmWdWH+2N5+wa/HilB8GnYwF/rA8OVOjhz1mM=;
        b=OEguNFdEKyGIG1oIKfAK41qqfbN2BHMKwzA7wYgfwfGTTy3G6LgWJvD7Mj0PJWTJ9S
         xhASG/BCOTNViwr7QpTTfbys1k2Bx5CrH6FSMFr4YtCLRfmzSR9m8oxWGF2tLh4hfjaH
         fo1vmgM8URwwJCyi/czsurAH8/+eWV9BY8xVJU6MM8CTK+DysR72dtmo5m4YkXXvt91y
         TytuT7I+9/k+Z9pwkHeBVEK+lm+YiBjndYFeEZXDcxZaOOb1bNxNpcHNN/FBwjNdZaXr
         IcXVGGrcn7PkgoGeLAqtfT5McolkklZlvWVrAYFn425deXKh9XKwzRL6Ld/D9JgSag0U
         xzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742786303; x=1743391103;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPMwIFcmWdWH+2N5+wa/HilB8GnYwF/rA8OVOjhz1mM=;
        b=rwmauGiIfJb17eK24TywqcVAYw4cYQTLxdsog5K0OH3TJgu+y8yxQxub1n5ViITYzd
         y/Hgd8JLe2j5+GWW6xU9BD3h5qj1pWE+Lt4CPa7BNLO7yU25X4E36isrPmtEP+fmBOpb
         3waHlrqeYWrDlahUKw4u/BrZHDGEeCIlb9xNVcjcmrHV4YBY9TwPVlSFYuNnibT0rAUC
         go7fd36AgTeMe0gDu5GAYfthzAOU1Uiia7U79/s07m5VFylYnR4ZPaF7nBM7hPxpcddK
         h7sJqE8aLsvIWlZXcgw1WnJr2HdXx8fVUvrjdJPOqsQ+aTUD11oEKxe9BZnuNwrmECPj
         KlrQ==
X-Gm-Message-State: AOJu0Yzx1dygKSlIbH8rBbcOdOCvpgbWV9K0nZbqy4PHwIOGdRs5WJtA
	wF67DY7H8pVEm9HyopCqD63xoWkEzBJP5CcEs8MzUMkjvRkalTK+mCJzJyYXnupLCCS/VD9+cW2
	5dw==
X-Google-Smtp-Source: AGHT+IFVBIo3hBwaqiSfIPqOyS5XIqnkkWOBgZN9Jqb/h5R6ho24QC1eiCstyMxgJM3CIWML7FoKCo6ccJs=
X-Received: from lfbfg6.prod.google.com ([2002:a05:6512:4206:b0:549:9807:4c2a])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:130c:b0:549:8fd0:b44c
 with SMTP id 2adb3069b0e04-54ad6502d89mr4272066e87.49.1742786302744; Sun, 23
 Mar 2025 20:18:22 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:17:55 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250324031758.865242-1-khtsai@google.com>
Subject: [PATCH v2] usb: dwc3: Abort suspend on soft disconnect failure
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() keeps
going with the suspend, resulting in a period where the power domain is
off, but the gadget driver remains connected.  Within this time frame,
invoking vbus_event_work() will cause an error as it attempts to access
DWC3 registers for endpoint disabling after the power domain has been
completely shut down.

Abort the suspend sequence when dwc3_gadget_suspend() cannot halt the
controller and proceeds with a soft connect.

Fixes: c8540870af4c ("usb: dwc3: gadget: Improve dwc3_gadget_suspend()
and dwc3_gadget_resume()")
CC: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---

Kernel panic - not syncing: Asynchronous SError Interrupt
Workqueue: events vbus_event_work
Call trace:
 dump_backtrace+0xf4/0x118
 show_stack+0x18/0x24
 dump_stack_lvl+0x60/0x7c
 dump_stack+0x18/0x3c
 panic+0x16c/0x390
 nmi_panic+0xa4/0xa8
 arm64_serror_panic+0x6c/0x94
 do_serror+0xc4/0xd0
 el1h_64_error_handler+0x34/0x48
 el1h_64_error+0x68/0x6c
 readl+0x4c/0x8c
 __dwc3_gadget_ep_disable+0x48/0x230
 dwc3_gadget_ep_disable+0x50/0xc0
 usb_ep_disable+0x44/0xe4
 ffs_func_eps_disable+0x64/0xc8
 ffs_func_set_alt+0x74/0x368
 ffs_func_disable+0x18/0x28
 composite_disconnect+0x90/0xec
 configfs_composite_disconnect+0x64/0x88
 usb_gadget_disconnect_locked+0xc0/0x168
 vbus_event_work+0x3c/0x58
 process_one_work+0x1e4/0x43c
 worker_thread+0x25c/0x430
 kthread+0x104/0x1d4
 ret_from_fork+0x10/0x20

---
Changelog:

v2:
- move declarations in separate lines
- add the Fixes tag

 drivers/usb/dwc3/core.c   |  9 +++++++--
 drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 66a08b527165..1cf1996ae1fb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2388,6 +2388,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	u32 reg;
 	int i;
+	int ret;

 	if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
 		dwc->susphy_state = (dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0)) &
@@ -2406,7 +2407,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 	case DWC3_GCTL_PRTCAP_DEVICE:
 		if (pm_runtime_suspended(dwc->dev))
 			break;
-		dwc3_gadget_suspend(dwc);
+		ret = dwc3_gadget_suspend(dwc);
+		if (ret)
+			return ret
 		synchronize_irq(dwc->irq_gadget);
 		dwc3_core_exit(dwc);
 		break;
@@ -2441,7 +2444,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 			break;

 		if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
-			dwc3_gadget_suspend(dwc);
+			ret = dwc3_gadget_suspend(dwc);
+			if (ret)
+				return ret;
 			synchronize_irq(dwc->irq_gadget);
 		}

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..316c1589618e 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4776,26 +4776,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
 	int ret;

 	ret = dwc3_gadget_soft_disconnect(dwc);
-	if (ret)
-		goto err;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	if (dwc->gadget_driver)
-		dwc3_disconnect_gadget(dwc);
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	return 0;
-
-err:
 	/*
 	 * Attempt to reset the controller's state. Likely no
 	 * communication can be established until the host
 	 * performs a port reset.
 	 */
-	if (dwc->softconnect)
+	if (ret && dwc->softconnect) {
 		dwc3_gadget_soft_connect(dwc);
+		return ret;
+	}

-	return ret;
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (dwc->gadget_driver)
+		dwc3_disconnect_gadget(dwc);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return 0;
 }

 int dwc3_gadget_resume(struct dwc3 *dwc)
--
2.49.0.395.g12beb8f557-goog



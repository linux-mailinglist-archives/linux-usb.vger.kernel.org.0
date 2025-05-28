Return-Path: <linux-usb+bounces-24358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2560AC6697
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 12:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63BD416A1A2
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088C12798E5;
	Wed, 28 May 2025 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4rmJsxYh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8018DB03
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426605; cv=none; b=C43/MraoSYQKOx1R/IrC8xByPV5wP4uRxszJaq7EsSV6Bmi+9xipQtuhBAyOANC0FU6GszsTwMplmFux4VCDEmIXo5CM3MsNk77ZvX1XboNEhBuLhwXD/GcoS0Y8fqImZJbAJaY19rJQBx3rs6mXH5XCk9aKM4/cyHtzdsF8QRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426605; c=relaxed/simple;
	bh=+GUMx5EH0FP3Oa5MBwWMhXUxhpvPBze1VwK216GenuQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AdmPHYVRK//Mg1rEosf5vKoERAT4fTubXhNQZ1ToNdTyw3ao/1VE4o5wI616nmjgvGwSCJEuoQ7Z4YBz+j//aVmmScojqGRvEH8siLU+8Gyhq9w1uTfb1oFvbtMMDe6GW3B+77LhNkQBP8Az/nqspFRJHjGGFiCUc1HmlrhT1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4rmJsxYh; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-32a7009e242so7243721fa.0
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748426601; x=1749031401; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O+jQScou4QoSDFiztXLbagVwGDmym8ydVy8Mf+yatAw=;
        b=4rmJsxYhDZ8Fl0tkWNJIe5l5nxu3PqdgBCgSZWgSErjJ4aI9BwpZODqUwL5dLkPVZN
         RRnUB0m9VAYSwajS2BbcBhzGHJi01CM+U6kf8JaC3r2le4hNP17A+rQvS4YKZ6Cj7am6
         gHuA8YDimwxZfN5844748p49jeFHw0WlZ8wbpVDtRCdG+Yy0ZctKybv6aecyroXhhp4J
         +swri9fSmVAjBMZcOroctx7VcTSMC1hojvE4r5rAIlIgye7cBJ9B4+7u2Ezi7soBce+5
         YtVi17I4Z0Bj1/+dl7j/OFXS5qUW0gGmRQxU1MBjo1lBO6ASfS+PszrWEoGVFfAHowjn
         WfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748426601; x=1749031401;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+jQScou4QoSDFiztXLbagVwGDmym8ydVy8Mf+yatAw=;
        b=cCxM3FKt5OjGdRaTCXKplSDdsRgZuYOtzqCkcRQ03m7wOa3jEEIIPD8Rpq9RsXroDq
         Q4xgExEdPNw0rm2iIrPW/Iw2cj8ZxR5NnWNI+pQtkbh6jDcjKA1AIkotHMfpKgTpCQTo
         /+MQoIu4BkhAq515JNbxes14wu2YSylD4qcxJWR5BAd9QUynBsHt4sHkdVSPwz6NtISi
         0hmiYtW/yUH5+k7vQ7bUghCBUfJ9VD9QiSJ/iL/uTsIaR5aNbtnPov2QwQRxvVLw6MJd
         pEX2cMEaDIq+kNrJ1nd1tlSFACW104cFZt9FFhZ8h5BhaRd7x+sd6vm+fI0JICVAQFk4
         FeYA==
X-Gm-Message-State: AOJu0Yw+llBvu0coIzuFdJgTNuJOSXOIP6fS9LUxAGv8cW+thqddVuAZ
	pFIGwZvILauMSx4exYBWWDK3cTI/Zq2W1tz1qaKa+/TfL+/R1ccQUaaHLpTm4zYhAXtutjG8yzA
	t748ICA==
X-Google-Smtp-Source: AGHT+IHq5/nELfCM5MZE1DSjOc09AXh+XweMFraNemMFKFZy2W1gmuaXI1LIh+dh9Dhld1zHCS4D2SQH5u0=
X-Received: from ljpn10.prod.google.com ([2002:a2e:a5ca:0:b0:326:ca2b:4494])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:be04:0:b0:32a:78f7:9bef
 with SMTP id 38308e7fff4ca-32a78f79d23mr5981261fa.8.1748426600775; Wed, 28
 May 2025 03:03:20 -0700 (PDT)
Date: Wed, 28 May 2025 18:03:11 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528100315.2162699-1-khtsai@google.com>
Subject: [PATCH v5] usb: dwc3: Abort suspend on soft disconnect failure
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

Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")
CC: stable@vger.kernel.org
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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

v5:
- add the Acked-by tag

v4:
- correct the mistake where semicolon was forgotten
- return -EAGAIN upon dwc3_gadget_suspend() failure

v3:
- change the Fixes tag

v2:
- move declarations in separate lines
- add the Fixes tag

---
 drivers/usb/dwc3/core.c   |  9 +++++++--
 drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 66a08b527165..f36bc933c55b 100644
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
+			return ret;
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
index 321361288935..b6b63b530148 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4821,26 +4821,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
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
+		return -EAGAIN;
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
2.49.0.1164.gab81da1b16-goog



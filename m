Return-Path: <linux-usb+bounces-21969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B4A6A804
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 15:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA7A1B60037
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 13:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E51221F26;
	Thu, 20 Mar 2025 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0jfo4yuH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02111EB1B7
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479075; cv=none; b=oHedpkzP5+RMwEZ4Yl00YWUH7CWqR9C3DxRNhzcOb6sYl60FIhE0Z4JNgjwItzlUujpsteU8Gp6DzoR74I2lAxwBGVSDd+u0Op0gOL/ydmWlhykySh+S0jTJmmnYLqUqoUkR4OEdzKtMqwpNq7gi5d45nzYuiXWysdJwIUiBbFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479075; c=relaxed/simple;
	bh=I2M38mDEaD7fFB1pTVGpHa9sMKUIjfO1Rqrct2uiK7g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=vBC88WAcO8f7i9FWuyPCXXPa07mhXPUHnMnjP5/Nzv9J3vsOjkJ21kdz3TqXeoy5UfkQPwwSW96YV7i8h/1UUTfr+8CXcq6QW5qtxQ54FglZj72aqqhF4fxgCL/3qu0RycB1NIbhudsBAIST1TZmHtXWVW9hgOO2fUTSpUw1fZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0jfo4yuH; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-30bf9ed6da1so4394651fa.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742479072; x=1743083872; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5hJSwNW0zETo4WJV8ChD3jYeVfuUrGHCvGqpwI/MqoU=;
        b=0jfo4yuH8kDdxpopUQCEZAJgtGyWiuYJLfRLRUbFbMYZUnjizpcO9UsYZX3sbe0w1G
         rn+q6qWSPiW7UGaISkOGb4PlkD/xvqdVK3t/fixbdHMUvJO8t//3lSIvz7M7EEIUjtBV
         OX0rmD4LC4cP0xAj5EiDISzOeprhFf0yESYlX/O2PEoM5tEh4JhoKzbnxy8CVsA8QSuc
         DEvkmyGDXKTsAd9vSsMvs6ENRHQ6OM22Dq+SDPgkxN/2qtvy+u9DolTrkIsUGSI3WUXj
         i8KqvJlsZfH7tllJ/H3KC3XS+xUSl8EINbIp9KeCDVaoZ8vLV10hdxsX1VnhUZpFnns9
         1fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479072; x=1743083872;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5hJSwNW0zETo4WJV8ChD3jYeVfuUrGHCvGqpwI/MqoU=;
        b=thLmx5H1ncEzYmsgR7S8I0cu8/2q0SlT+m4hMASs0vy/jXGUzC0SuCRz86CZpdwReY
         bVI09BLoZvPKPjh2qJyUW9GOPTjee4ndoVQZ+86CbwWhUuh7ntCuNl7A2j/p88smdVCu
         8S/hcIfYVgq+KtKK4EozLkhHuRJNeJW4eSimvgJbZosmLwSAwdDiOz6EDapIPsX0fVkV
         qblbJw+pUenbY2wEkWbQ3/1mOdQlhF81k68jx5R7XGcI1RvWrwqH7ZGuBsoNmnEZweKQ
         iKAVbkOGz0/nrT55aChmArejfr4uZOz+T2AhPQMIbSbxZaxw5I8G05/VLqFeRjcip1CO
         jZmQ==
X-Gm-Message-State: AOJu0YyNkDOTxxESNBdfFIGlLfdgXhxi0uorxnlbZzqmfNVszecEayqG
	Ku8EjR2t6loFeXvpLx3lCxj45poFud5/N/3XwkHJmnGQ0gfgmOO/Ed+4bFj/mv8DtmxoWcrItXu
	/LQ==
X-Google-Smtp-Source: AGHT+IFKWkXFYCtsDNlC1lSUYZcFS4L/ZyXFKpgR/0gphodOCR8RHnpSkShdya5Rvhf5IlDP8DnPwCenPjU=
X-Received: from ljha3.prod.google.com ([2002:a2e:8303:0:b0:30b:accc:1be0])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:bc0d:0:b0:30b:b9e4:13c5
 with SMTP id 38308e7fff4ca-30d6a3ce2a7mr31947181fa.4.1742479071760; Thu, 20
 Mar 2025 06:57:51 -0700 (PDT)
Date: Thu, 20 Mar 2025 21:56:48 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320135734.3778611-1-khtsai@google.com>
Subject: [PATCH] usb: dwc3: Abort suspend on soft disconnect failure
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
 drivers/usb/dwc3/core.c   | 10 +++++++---
 drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 66a08b527165..d64d17677bdb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2387,7 +2387,7 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	u32 reg;
-	int i;
+	int i, ret;

 	if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
 		dwc->susphy_state = (dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0)) &
@@ -2406,7 +2406,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
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
@@ -2441,7 +2443,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
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



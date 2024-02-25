Return-Path: <linux-usb+bounces-7032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE48862C7A
	for <lists+linux-usb@lfdr.de>; Sun, 25 Feb 2024 19:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD145281975
	for <lists+linux-usb@lfdr.de>; Sun, 25 Feb 2024 18:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF661AACE;
	Sun, 25 Feb 2024 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ECSsKNDS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905618B1A
	for <linux-usb@vger.kernel.org>; Sun, 25 Feb 2024 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708884796; cv=none; b=N7J3x0pdqm8zrH+DQSczYlxSGVeNY4R+pnskQXPWFLaHb13WrTTwTAqToGRpii812IsHHJSFIIaupmfoE5+RqpLbesHNn8ghhCm7jFaUmcbaCkXlMGfyLwoVHjs+CPmkof4K2EKE5wdB4XWmK8IXR/BrOadq+gLdvr1/Y7bn3nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708884796; c=relaxed/simple;
	bh=Vh/CCaRyGoVzBt8clr515fZpIzk3Wk/SMQ6DWcaoulk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Db2N5I6IL+ciiaOsG+VE/DUbxwZVs9e+YkaaaLq2hL8J7R33PwkR/4uhiwHwvYCPg/YZGqJwdDch0F2R8rAF/huJ9tfEv8VwLl/n34z+HOk8m0B1nArmg7zQ4pSYi5ce13Wq0UFA5fZwCxH74NaPyy3zhkuGR1rxkpV/Ul1Rn3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ECSsKNDS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so4254167a12.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Feb 2024 10:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1708884793; x=1709489593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiHwGtdHmtBh1QzKH7jFf3O1j9+JB7o6S8MM1T8u71w=;
        b=ECSsKNDS5ROUMH0BybIVXH5s1377dHyMzhdLnl4pX6W81nNE2Tf9+u0os4E4vg6mXc
         AFnShYgt55PS7ot3IukVPNPvPMnDEgzgWszKg33bQcEGeIvo845pBK8QqA6PmdgxZDKg
         scYTMH51FP7cpyPIoI7XdeP4PzvmiE9tkO1yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708884793; x=1709489593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiHwGtdHmtBh1QzKH7jFf3O1j9+JB7o6S8MM1T8u71w=;
        b=CA44o+Z+X7N0IIyOWd/j6szqY4FE/VjUeZKTTu95W0w3w0bPgHLvTkD/Cbx4GAyjlZ
         NdVpQCtppdpFBkZuiS+i2KUTcRTuAlzXL0FYnmcmYxk6DnW4CI98vQkCFCM+cd8yV8gR
         0PGpgyglEzsLEvBzYe6FYywVeF6gZpzE+7AxDxVKfMjyhaCNzQAyDIG0K6GPpULO5dty
         Et2jHfvzV3o3cQoA7z6PBHb93Mc4k9SQPpjMnx7M3KXfboWI5Ac2nsLnjOErWMzWjqdM
         37SxZTKheSHZ/1e4Bx5N8NRIJPxskAh0xxuU99D0EoWbscCIrcRDE07oYmhCUZRGRvop
         dY3Q==
X-Gm-Message-State: AOJu0Yy1CvApQ3L5blJtoC0luFOFpsbEn9AOYoaGNLEmhm0fVWT9PdoH
	xtsyA2U+8TXaTJsPmDkULl6eAd9uGx/uHK5XH2HSeT9og42bBsstWu6EME7ZxO0=
X-Google-Smtp-Source: AGHT+IHM++M8krnqdhGQhz6JRblFAu7i6LJ2frRhsjiStpFDrRbL2WD6cTTAfL452ya0F1aeOVZKrQ==
X-Received: by 2002:aa7:cb4f:0:b0:565:7ce5:abdf with SMTP id w15-20020aa7cb4f000000b005657ce5abdfmr4035738edt.9.1708884792857;
        Sun, 25 Feb 2024 10:13:12 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:7ba6:d425:45e9:5878])
        by smtp.gmail.com with ESMTPSA id t1-20020a056402020100b00565ebf2ce1fsm300370edv.64.2024.02.25.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 10:13:12 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH] usb: dwc3: gadget: Fix suspend/resume warning when no-gadget is connected
Date: Sun, 25 Feb 2024 19:13:09 +0100
Message-Id: <20240225181309.1697245-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch restore the logic but protects the variable using a spinlock
without moving the code

[   45.597274] dwc3 31000000.usb: wait for SETUP phase timed out
[   45.599140] dwc3 31000000.usb: failed to set STALL on ep0out
[   45.601069] ------------[ cut here ]------------
[   45.601073] WARNING: CPU: 0 PID: 150 at drivers/usb/dwc3/ep0.c:289 dwc3_ep0_out_start+0xcc/0xd4
[   45.601102] Modules linked in: cfg80211 rfkill ipv6 rpmsg_ctrl rpmsg_char crct10dif_ce rti_wdt k3_j72xx_bandgap rtc_ti_k3 omap_mailbox sa2ul authenc [last unloaded: ti_k3_r5_remoteproc]
[   45.601151] CPU: 0 PID: 150 Comm: sh Not tainted 6.8.0-rc5 #1
[   45.601159] Hardware name: BSH - CCM-M3 (DT)
[   45.601164] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   45.601172] pc : dwc3_ep0_out_start+0xcc/0xd4
[   45.601179] lr : dwc3_ep0_out_start+0x50/0xd4
[   45.601186] sp : ffff8000832739e0
[   45.601189] x29: ffff8000832739e0 x28: ffff800082a21000 x27: ffff8000808dc630
[   45.601200] x26: 0000000000000002 x25: ffff800082530a44 x24: 0000000000000000
[   45.601210] x23: ffff000000e079a0 x22: ffff000000e07a68 x21: 0000000000000001
[   45.601219] x20: ffff000000e07880 x19: ffff000000e07880 x18: 0000000000000040
[   45.601229] x17: ffff7fff8e1ce000 x16: ffff800080000000 x15: fffffffffffe5260
[   45.601239] x14: 0000000000000000 x13: 206e6f204c4c4154 x12: 5320746573206f74
[   45.601249] x11: 0000000000000001 x10: 000000000000000a x9 : ffff800083273930
[   45.601259] x8 : 000000000000000a x7 : ffffffffffff3f0c x6 : ffffffffffff3f00
[   45.601268] x5 : ffffffffffff3f0c x4 : 0000000000000000 x3 : 0000000000000000
[   45.601278] x2 : 0000000000000000 x1 : ffff000004e7e600 x0 : 00000000ffffff92
[   45.601289] Call trace:
[   45.601293]  dwc3_ep0_out_start+0xcc/0xd4
[   45.601301]  dwc3_ep0_stall_and_restart+0x98/0xbc
[   45.601309]  dwc3_ep0_reset_state+0x5c/0x88
[   45.601315]  dwc3_gadget_soft_disconnect+0x144/0x160
[   45.601323]  dwc3_gadget_suspend+0x18/0xb0
[   45.601329]  dwc3_suspend_common+0x5c/0x18c
[   45.601341]  dwc3_suspend+0x20/0x44
[   45.601350]  platform_pm_suspend+0x2c/0x6c
[   45.601360]  __device_suspend+0x10c/0x34c
[   45.601372]  dpm_suspend+0x1a8/0x240
[   45.601382]  dpm_suspend_start+0x80/0x9c
[   45.601391]  suspend_devices_and_enter+0x1c4/0x584
[   45.601402]  pm_suspend+0x1b0/0x264
[   45.601408]  state_store+0x80/0xec
[   45.601415]  kobj_attr_store+0x18/0x2c
[   45.601426]  sysfs_kf_write+0x44/0x54
[   45.601434]  kernfs_fop_write_iter+0x120/0x1ec
[   45.601445]  vfs_write+0x23c/0x358
[   45.601458]  ksys_write+0x70/0x104
[   45.601467]  __arm64_sys_write+0x1c/0x28
[   45.601477]  invoke_syscall+0x48/0x114
[   45.601488]  el0_svc_common.constprop.0+0x40/0xe0
[   45.601498]  do_el0_svc+0x1c/0x28
[   45.601506]  el0_svc+0x34/0xb8
[   45.601516]  el0t_64_sync_handler+0x100/0x12c
[   45.601522]  el0t_64_sync+0x190/0x194
[   45.601531] ---[ end trace 0000000000000000 ]---
[   45.608794] Disabling non-boot CPUs ...
[   45.611029] psci: CPU1 killed (polled 0 ms)
[   45.611837] Enabling non-boot CPUs ...
[   45.612247] Detected VIPT I-cache on CPU1

Tested on a am62x board

Fixes: 61a348857e86 ("usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend)
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 drivers/usb/dwc3/gadget.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4c8dd6724678..4c88e44127b5 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4703,13 +4703,19 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
 	unsigned long flags;
 	int ret;
 
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (!dwc->gadget_driver) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return 0;
+	}
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
 	ret = dwc3_gadget_soft_disconnect(dwc);
 	if (ret)
 		goto err;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	if (dwc->gadget_driver)
-		dwc3_disconnect_gadget(dwc);
+	dwc3_disconnect_gadget(dwc);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return 0;
-- 
2.40.1



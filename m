Return-Path: <linux-usb+bounces-7042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE54866A69
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 08:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7AA1C21479
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CFE1BDE2;
	Mon, 26 Feb 2024 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rxT2SNsF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6221BC4A
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708931044; cv=none; b=tB5jLgMLLu9r3YJyKAUeAIQavcw+WHf5btUuQZDuM8mb+1R+8g6MUEi+cJPPbMaoNTTWrsORBrA/0wyHzfzngAY16g7gYFtI1n5SDAPWi5pDWJC1Gc15NMsSTww7jN9CHFC7OjOZGRSRlL36nkarvuA6zg2PwDgmmXhtSGZt+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708931044; c=relaxed/simple;
	bh=Unv7g8gDlUHz8759iS1KZ216R5awBoIqH88AQPH0qWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1np1cyHcMJGydhIhGwRnU28fDqaaS7dUsVOCrmyQJLXRHU+HvBqORpRH6BalSvxjmAF/whQCK4uSo2U9zGJRLmqGxz51TGVcO4ZWfP4MZE3s1uQv4ojMu49xI96n18w6Eum/ApyVax1FDszgw96hkeEG3sKNTHQ7PuJ9G6tv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rxT2SNsF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3e8c1e4aa7so244650566b.2
        for <linux-usb@vger.kernel.org>; Sun, 25 Feb 2024 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1708931039; x=1709535839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSE72hosePwIODA3ma0iMUICuvRTZJycGm7fYD6dWx8=;
        b=rxT2SNsFWMsUJdUEaIFPHlj8CE8S8GJX1XG1CsTtN/0L8l0Wqf3+i7D1L3iarg4yyg
         DrXnfiqU1n9xFMBt9FBXlP36ZRPuwLDPUqe4LIs/KKWYGbd86feKH+yYnufN/Z+I1Bu1
         xKt8/4Ykb6pgko1SvoXMXsLl2AlD55xTnSCxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708931039; x=1709535839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSE72hosePwIODA3ma0iMUICuvRTZJycGm7fYD6dWx8=;
        b=HBB/XMwDYayJRBuX7QeUv5bvbmxjeeO9H5qY3SLLQgh9inFdRP/760XbO+Ivte8w4t
         +BeVt/5db0SNoTV17DP0atACMW0aDeuLpyut96N6bR7XatTjJ9mYhfSMYyv1F2yGrBvj
         6BnHg1KhYZHWF/tdS5P9RETiE6E44k6lRVoaGSHehesan0Yt+Yplyx3yXcHb2o/n04np
         pQOEaXm5fsGhm2+nbfakdIQeVkL8U4SjcRLnwwIWAGisRkI49uniq1ofibHYYy1i1jB8
         OWwxFrsL+DWmluE9LGmZ0GeR+QAy0zg7XcTNs4nUzzZD7I3f8bEWLQnbo4FBp2448wWQ
         BoBg==
X-Gm-Message-State: AOJu0YwYKhqjhitiVqMHqhdcFt7hKpHd+N3iByPADfTo+Kf3XciI2JoH
	j8WtqJ+hC8Lto4Sb2vf13EpbYEUaksI8u+GehcTGx516pbCeaI0fa4Ehow6YCNQ=
X-Google-Smtp-Source: AGHT+IF0tf8TA8Sl5Nl/qYildNTJgdAq2UpltQw3tw1J+UJCK04bNIPL8KO8N1aNX2PJCWLmm7Ha9A==
X-Received: by 2002:a17:906:1715:b0:a3e:d835:5685 with SMTP id c21-20020a170906171500b00a3ed8355685mr3620666eje.67.1708931039608;
        Sun, 25 Feb 2024 23:03:59 -0800 (PST)
Received: from panicking.. (host-188-15-122-229.business.telecomitalia.it. [188.15.122.229])
        by smtp.gmail.com with ESMTPSA id qo3-20020a170907874300b00a3fcbd4eb2esm2125331ejc.1.2024.02.25.23.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 23:03:59 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	stable@vger.kernel.org
Subject: [PATCH V2] usb: dwc3: gadget: Fix suspend/resume warning when no-gadget is connected
Date: Mon, 26 Feb 2024 08:03:48 +0100
Message-Id: <20240226070348.1703879-1-michael@amarulasolutions.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
V1->V2:
	Add cc to stable
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



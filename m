Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FE33D3D0A
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 18:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbhGWPTw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 11:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbhGWPTv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 11:19:51 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29AFC061575
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:00:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m9so2266994ljp.7
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7OlcANZzieKaNWcpL+GOyiCkkPUEzYhjmL+cajXF5A=;
        b=n9xjpUGaha17k8QVaPITfi0VUVS/H0pkyMCI1PN44doBoG8WrgKbOojBGXTXhjQEw4
         w+bY6uk7GtK1KtGonU7+zH+cm23UfAgQ74Oqb0oAilXowKY6b6y2hU+1APfTfBnAxCAR
         /bbApyzWWXVCPclcXjMGQmV125S4MgEhgy3SUOmuhVra/K4leOISqGcgUa1PFm4YhDBf
         8lbKKtFjcFoiZ5//gwB3caQRCVmzA3tpol99jVM4cMTugvR31cetxgqI8hyYZIkclZ26
         RPhlSi6WdbPKF1JCOEM4mVE6iOIg+8COUIr5K55Wlq+7jAvIeVLsw9s6y6mFTSkGJGUD
         UMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7OlcANZzieKaNWcpL+GOyiCkkPUEzYhjmL+cajXF5A=;
        b=VmKX5rkIWg0YSevSVS1iP1EW3T2DwV3iYXI01rusQU5MV43NpFwtMxJ6qAg0cgDRvy
         VbrdKFFpDIvs4KgDqywpD3WjhloIC+XKlPffcKYC1j6WWI1KuiXXlHfF/Q56O540uiPG
         Ohbc6Aqvm7DbfJIItPjlUTgT7pU/+tRyO6RZyvj1V2trQPmkImTbn1uU5VaJZP7Jdp3F
         4bRd2HlgPbAXzEnXOymp+oDiKK6cvURA1n1CQ9+0DxYqqpe6Ingsdib0RwHH5s2JKgnv
         VOczmhSlXRBiVXpYKakpsBzO2nS8hNeDGwZdk6oU3hfaHsVrOwile+ZKmqcCnu9ErxEm
         4zIw==
X-Gm-Message-State: AOAM530BfeFYmfN55h27CZ7/hrfPK3x6zJkvgR5QAB3xMCGMjb8O/aXF
        x5RSz9DhqaRWw5khOPCrFuY=
X-Google-Smtp-Source: ABdhPJy2pTJpwx6m7DHP3tCmX4uNEjwPLIVmYhAaBrHNVUsZuuAh5XeVdr8886mwFsuaWqXQE43duA==
X-Received: by 2002:a2e:95cc:: with SMTP id y12mr3634365ljh.387.1627056023159;
        Fri, 23 Jul 2021 09:00:23 -0700 (PDT)
Received: from localhost.localdomain (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id n24sm450025lfb.54.2021.07.23.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 09:00:22 -0700 (PDT)
From:   Maxim Devaev <mdevaev@gmail.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, sandeen@redhat.com,
        linux-usb@vger.kernel.org, mdevaev@gmail.com,
        Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH v2] usb: gadget: f_hid: fixed NULL pointer dereference
Date:   Fri, 23 Jul 2021 18:59:30 +0300
Message-Id: <20210723155928.210019-1-mdevaev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.com>

Disconnecting and reconnecting the USB cable can lead to crashes
and a variety of kernel log spam.

The problem was found and reproduced on the Raspberry Pi [1]
and the original fix was created in Raspberry's own fork [2].

Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Link: https://github.com/raspberrypi/linux/issues/3870 [1]
Link: https://github.com/raspberrypi/linux/commit/a6e47d5f4efbd2ea6a0b6565cd2f9b7bb217ded5 [2]
---
 drivers/usb/gadget/function/f_hid.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 02683ac07..08e73e812 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -338,6 +338,11 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 
+	if (!hidg->req) {
+		spin_unlock_irqrestore(&hidg->write_spinlock, flags);
+		return -ESHUTDOWN;
+	}
+
 #define WRITE_COND (!hidg->write_pending)
 try_again:
 	/* write queue */
@@ -358,8 +363,14 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 	count  = min_t(unsigned, count, hidg->report_length);
 
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
-	status = copy_from_user(req->buf, buffer, count);
 
+	if (!req) {
+		ERROR(hidg->func.config->cdev, "hidg->req is NULL\n");
+		status = -ESHUTDOWN;
+		goto release_write_pending;
+	}
+
+	status = copy_from_user(req->buf, buffer, count);
 	if (status != 0) {
 		ERROR(hidg->func.config->cdev,
 			"copy_from_user error\n");
@@ -387,14 +398,17 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
 
+	if (!hidg->in_ep->enabled) {
+		ERROR(hidg->func.config->cdev, "in_ep is disabled\n");
+		status = -ESHUTDOWN;
+		goto release_write_pending;
+	}
+
 	status = usb_ep_queue(hidg->in_ep, req, GFP_ATOMIC);
-	if (status < 0) {
-		ERROR(hidg->func.config->cdev,
-			"usb_ep_queue error on int endpoint %zd\n", status);
+	if (status < 0)
 		goto release_write_pending;
-	} else {
+	else
 		status = count;
-	}
 
 	return status;
 release_write_pending:
-- 
2.32.0


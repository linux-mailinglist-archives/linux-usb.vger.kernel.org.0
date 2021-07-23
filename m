Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943D13D3817
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 11:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhGWJM7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 05:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbhGWJM6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 05:12:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC91C061575
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 02:53:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a26so1085367lfr.11
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 02:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwHze6I3Ey4b1Jn0QrbVzBu4CTx99NH6gFMfPNBbf1k=;
        b=HNjUMNb5tvAlvMSbrvIZ4X2f6TBW6Jq2aJaVN2u+qxZL9vVpAyaosIbWC+V95ofH5w
         lmgkSNIwQ0Xiu0+2dG49sOL19cTeh6fvD/KFOXOsNrygfQ8jRf/uPEioFzWp1yvmY2IT
         36C+LwdVmp91157jkVsHdvnUgJNpFOCNhY/r0GkwuzGJ114Lb6aP4LKyFi50ig9AvXPa
         Cnunsbx3U3ezr6GBLuQ5eHuOtEUkZMsIbWiCCO4NyCj9sIz1krImcuzrs2nDaoegi1pU
         Qa+ebPrBzFiTee/tVv3FNMEqaWM4OhEe/ycI9w6KSx1O5ET1421TsvVMr1r7WtTU3NfO
         94nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwHze6I3Ey4b1Jn0QrbVzBu4CTx99NH6gFMfPNBbf1k=;
        b=KLUxsLecKMtyyH4IsntDh5MlNfy3aAVwvAes/SICozMum7MM+7tebuTN6WEVXLg5f1
         begOm2JAwNDDEqzRyV/E/twWrqow7w+JslVkYkm+fQCHQCDr7k6VXL+gkG97YsEjQGiU
         Xp29j7/JUBRhbJQHXLP3q7iiftUwdoyXX6wvtfxBe9GDCx4QCfcjjgLPD0mhozrhE797
         G7cXAALyU7Eszsy+1HizXsKb95KHznRoC3ZgD8l6odX5x3vtBPco4k2kVUvW9pIoTeBd
         gaqZs/rJ1ktgEY7LLm8pkRtqVeyu2U9scO3NFfR709AHSx+5374Nr32+Zu1zBQeaySsq
         wQ1A==
X-Gm-Message-State: AOAM531FKfmhL/WCFZ1tp0SdJgfy6/pa5iPBQLdx/nw2Iq3ADQgGvMe8
        4HOjclMDrI2pkdGDnYHuEMG3NxiGbA5Wwg==
X-Google-Smtp-Source: ABdhPJxxvpe+Yzstdsu6V+xJFOafOIQCi1LIFPx3jovrM0bgIHUimfHQXGvtzjMz3HU6x9XYVMDEeQ==
X-Received: by 2002:a05:6512:36d2:: with SMTP id e18mr2439927lfs.161.1627034010771;
        Fri, 23 Jul 2021 02:53:30 -0700 (PDT)
Received: from localhost.localdomain (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id l11sm43525ljc.71.2021.07.23.02.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:53:30 -0700 (PDT)
From:   Maxim Devaev <mdevaev@gmail.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, sandeen@redhat.com,
        linux-usb@vger.kernel.org, mdevaev@gmail.com,
        Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference
Date:   Fri, 23 Jul 2021 12:53:23 +0300
Message-Id: <20210723095323.205593-1-mdevaev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Disconnecting and reconnecting the USB cable can lead to crashes
and a variety of kernel log spam.

The problem was found and reproduced on the Raspberry Pi. The patch
was created in Raspberry's own fork [1]. Since I was one of those
who discovered and diagnosed the problem [2], I propose this patch
for adoption to the kernel upstream with the consent of the author.
It has been tested since January 2021 and is guaranteed to fix
the described problem without breaking anything.

Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Link: https://github.com/raspberrypi/linux/commit/a6e47d5f4efbd2ea6a0b6565cd2f9b7bb217ded5 [1]
Link: https://github.com/raspberrypi/linux/issues/3870 [2]
---
 drivers/usb/gadget/function/f_hid.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 02683ac07..4975bbf02 100644
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
@@ -358,7 +363,13 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 	count  = min_t(unsigned, count, hidg->report_length);
 
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
-	status = copy_from_user(req->buf, buffer, count);
+	if (req) {
+		status = copy_from_user(req->buf, buffer, count);
+	} else {
+		ERROR(hidg->func.config->cdev, "hidg->req is NULL\n");
+		status = -ESHUTDOWN;
+		goto release_write_pending;
+	}
 
 	if (status != 0) {
 		ERROR(hidg->func.config->cdev,
@@ -387,10 +398,13 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
 
+	if (!hidg->in_ep->enabled) {
+		ERROR(hidg->func.config->cdev, "in_ep is disabled\n");
+		status = -ESHUTDOWN;
+		goto release_write_pending;
+	}
 	status = usb_ep_queue(hidg->in_ep, req, GFP_ATOMIC);
 	if (status < 0) {
-		ERROR(hidg->func.config->cdev,
-			"usb_ep_queue error on int endpoint %zd\n", status);
 		goto release_write_pending;
 	} else {
 		status = count;
-- 
2.32.0


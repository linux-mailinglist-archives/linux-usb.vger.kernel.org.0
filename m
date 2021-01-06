Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12CB2EC0A2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 16:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbhAFPrO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 10:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbhAFPrO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jan 2021 10:47:14 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8576C06134C
        for <linux-usb@vger.kernel.org>; Wed,  6 Jan 2021 07:46:33 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id x64so4614698yba.23
        for <linux-usb@vger.kernel.org>; Wed, 06 Jan 2021 07:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=ziQwa7wCj7KA1Ne9/yzgwO+ZeGArNIONb0ArdC36cPA=;
        b=rw07ByT1RYVjqRyMFRH4hCztc4ExRyGxF16iOqE3Am2KOmj3k70axlyYfRnG2UT9Ik
         kuGKK9jgm6Fw/7xs3j650V3h17oLJC1VQMvkjmLK5e2kaxlRTGdRuImAI2vnk4nlxdtd
         8a4FY9jEGZocpamqcAwtraLtAQ2o0iVFkRuWSK18ksgDJ8EUQOXxOxC0inksxpwga/cM
         LfaoiQPdDxc0NUdWtJEVg6SNdjlN7FyE1mj62VGZ7FpUPfmoEcwQgxHBZ29zisP7k2wF
         k63uArg3Sh2IkbNlbemFmJyR/7ri3ZSc8MWaBGN+oFVnzaBy1Jg/udXWJdjYrEPC8OMk
         Whsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=ziQwa7wCj7KA1Ne9/yzgwO+ZeGArNIONb0ArdC36cPA=;
        b=q3P9P5/xifbQIvLGP4ewFaU+E1XiF8lDEwAepm1p9vA2Mss0z00BWhJUUmd8X2uGpn
         G4W9DwNIt3b79U2lGC0tKCLLTzosafgr4RLimH4IfKd2wnJb551jPbhhtjmpq4h0YN2v
         ewXg4LN+0r9p/CcA40z0ONxyda49xLBQu3q/VRTangCTuz8xIymHJnoYYbKJKrhNuGc5
         UBtWXijZPdLGtwkt0UUqXgIoB7y8b5vhP66nutdv8tJXMWMgiyqM1gu9xaEQaGmYeVbn
         zVYDMq1Aq+prXzhCzUE3sxOMcO9ZC10D6JiYoHL9Z4rWiyn96VmBIy+7thphuBSqh/GZ
         Jnlg==
X-Gm-Message-State: AOAM53175AVxkv3D1/of4kauAPJ2G0OH0Z2xH/Ijbt5MeOKQvWc8+OOx
        abVssZ+iRWnV6/p4NEIHVkfBYQYxY3WYw4ueGMkbVJkZ4DwQhE8yEXEkOfEd+1Hm11aLmRMzgab
        yhmHJHOUZOoVOkk/xSArQ2GnmZiNvmI+jT9mAZkSkWQYfb7kbnqXsNL2Oe8CI0eqU76Ph
X-Google-Smtp-Source: ABdhPJwKyD0WZKAd9BQa6i3bTs/40HqnFmuffQ5XnQtx/+h82h/6PkokEMODOXHzNxifXTGFdBhxvjBQv/2J
Sender: "lorenzo via sendgmr" <lorenzo@drone.tok.corp.google.com>
X-Received: from drone.tok.corp.google.com ([2401:fa00:8f:2:a6ae:11ff:fe18:6f64])
 (user=lorenzo job=sendgmr) by 2002:a25:d1c4:: with SMTP id
 i187mr7293182ybg.106.1609947992944; Wed, 06 Jan 2021 07:46:32 -0800 (PST)
Date:   Thu,  7 Jan 2021 00:46:25 +0900
Message-Id: <20210106154625.2801030-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH] usb: gadget: enable super speed plus
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     taehyun.cho@samsung.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "taehyun.cho" <taehyun.cho@samsung.com>

Enable Super speed plus in configfs to support USB3.1 Gen2.
This ensures that when a USB gadget is plugged in, it is
enumerated as Gen 2 and connected at 10 Gbps if the host and
cable are capable of it.

Many in-tree gadget functions (fs, midi, acm, ncm, mass_storage,
etc.) already have SuperSpeed Plus support.

Tested: plugged gadget into Linux host and saw:
[284907.385986] usb 8-2: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd

Signed-off-by: taehyun.cho <taehyun.cho@samsung.com>
Tested-by: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 56051bb97349..976d3e6c3554 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1536,7 +1536,7 @@ static const struct usb_gadget_driver configfs_driver_template = {
 	.suspend	= configfs_composite_suspend,
 	.resume		= configfs_composite_resume,
 
-	.max_speed	= USB_SPEED_SUPER,
+	.max_speed	= USB_SPEED_SUPER_PLUS,
 	.driver = {
 		.owner          = THIS_MODULE,
 		.name		= "configfs-gadget",
@@ -1576,7 +1576,7 @@ static struct config_group *gadgets_make(
 	gi->composite.unbind = configfs_do_nothing;
 	gi->composite.suspend = NULL;
 	gi->composite.resume = NULL;
-	gi->composite.max_speed = USB_SPEED_SUPER;
+	gi->composite.max_speed = USB_SPEED_SUPER_PLUS;
 
 	spin_lock_init(&gi->spinlock);
 	mutex_init(&gi->lock);
-- 
2.29.2.729.g45daf8777d-goog


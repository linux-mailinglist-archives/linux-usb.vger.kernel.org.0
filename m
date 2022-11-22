Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77CAA633EA6
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 15:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbiKVOQO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 09:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiKVOQN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 09:16:13 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273DA4732E
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 06:16:12 -0800 (PST)
Received: from localhost.localdomain (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 73D1B6602AD3;
        Tue, 22 Nov 2022 14:16:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669126570;
        bh=KwzzNqheU18qO1hBNDRHPtgb3wjFODi4vNaMVJTHk5M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eRGlt35gpDjqIiXk1zn8Yvi7xJSwT7/NRgdgQG9nYK9LL6CeaRB4eePaWjdjua3ot
         yTIsN57uQQd9OXrYL6CdVDHOFQpiKNg8L7Ctl/pls4sjosHWb6K99hLkpGuf8BkG28
         DyenqjWtM6xrATJOofCVpxGvxOofrinmMiQY/1DT6DP2VUlWXskO8QYH7phvP2gumu
         XCc3jr80kDctY5yrLT0MQg0dTLvtQql3Tm3Y+JZvJnNbpsxRFDCLE7LUyPmG1bFukD
         kUXUaZVREgOV7Sc7U8ojxP0BcjbA7JemEMOVhEK5HLqt26NhqrFCmeOZjS6tZPfSKJ
         E1fiKCkowx2EA==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com
Subject: [PATCH] usb: gadget: function: Simplify error messaging in printer open/close
Date:   Tue, 22 Nov 2022 15:16:03 +0100
Message-Id: <20221122141603.70242-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1894a272-4816-c44c-61d5-bfcfe478d7e5@collabora.com>
References: <1894a272-4816-c44c-61d5-bfcfe478d7e5@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't issue any messages if printer_open() is successful.
Also don't issue them if unsuccessful - the error code is propagated
to the calling layers and should be acted on appropriately there. Just as
it is with the -ENODEV case.

For those who really want this message leave an option to compile-in
with composite framework's VDBG() by uncommenting #define VERBOSE_DEBUG.

While at it, visually detach the "return ret;" statement.

Use __func__ instead of explicitly hardcoding the function name. This, in
turn makes checkpatch issue this for the message in printer_close():

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
54: FILE: drivers/usb/gadget/function/f_printer.c:387:
+	VDBG(dev, "%s\n", __func__);

which lets us eliminate the debug message from printer_close() altogether.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
Attention

This patch depends on a recent patch from Dan Carpenter:

usb: gadget: function: use after free in printer_close()

 drivers/usb/gadget/function/f_printer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 01e842e1ba2f..d686c7be4fb5 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -11,6 +11,8 @@
  * Copyright (C) 2006 Craig W. Nadler
  */
 
+/* #define VERBOSE_DEBUG */
+
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
@@ -364,7 +366,8 @@ printer_open(struct inode *inode, struct file *fd)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	kref_get(&dev->kref);
-	DBG(dev, "printer_open returned %x\n", ret);
+	VDBG(dev, "%s returned %x\n", __func__, ret);
+
 	return ret;
 }
 
@@ -381,7 +384,6 @@ printer_close(struct inode *inode, struct file *fd)
 	dev->printer_status &= ~PRINTER_SELECTED;
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	DBG(dev, "printer_close\n");
 	kref_put(&dev->kref, printer_dev_free);
 
 	return 0;
-- 
2.25.1


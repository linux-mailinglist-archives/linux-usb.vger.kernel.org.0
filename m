Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88420635B3A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 12:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237681AbiKWLIk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 06:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236820AbiKWLIX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 06:08:23 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7C2238
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 03:07:55 -0800 (PST)
Received: from localhost.localdomain (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 036626602A1D;
        Wed, 23 Nov 2022 11:07:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669201673;
        bh=u92UKbS1g+pZVil1a6HTVJl7R5yKWOJnUeGqSrbNhu0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T8cadWpV3/V4vqnooztg63ttMJcFYGCNcakHYaNLdlS0AnksXODa0cWl9XyR/5wgy
         diZZ4A9Lt2q0YwKVwNvPEjyHj6KyAwODGGGpMR8c+sFfyrqfgEmfq0sXUYpMaPOr4d
         xT7oDiiIZuCi0MnzryYreyoiSAfy+2AK7JW9DZMhVVtJIgp38Vt3s8EwgGhnPMO+if
         wvMKuysQXPv8fd7Ih1xdVfvzn+XbYBoT0bN9cNXKt6UaM5nL/QVf9qBcCST8/kR049
         rf9jGCBEo9NtcURwB3/xQW8AOWlpoQNVRMW+2cjIWr7+v4PYIQA4NyHaO7lbjvcWuo
         RiqFMZaGdBJig==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com
Subject: [PATCH] usb: gadget: function: Simplify diagnostic messaging in printer
Date:   Wed, 23 Nov 2022 12:07:46 +0100
Message-Id: <20221123110746.59611-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y3zwm70hEmH7RQP3@kroah.com>
References: <Y3zwm70hEmH7RQP3@kroah.com>
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

Don't issue messages which can be easily achieved with ftrace.
In case of printer_open() the return code is propagated to other layers
so the user will know about -EBUSY anyway.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
Attention

This patch depends on a recent patch from Dan Carpenter:

usb: gadget: function: use after free in printer_close()

 drivers/usb/gadget/function/f_printer.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 01e842e1ba2f..4903d761a872 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -364,7 +364,7 @@ printer_open(struct inode *inode, struct file *fd)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	kref_get(&dev->kref);
-	DBG(dev, "printer_open returned %x\n", ret);
+
 	return ret;
 }
 
@@ -381,7 +381,6 @@ printer_close(struct inode *inode, struct file *fd)
 	dev->printer_status &= ~PRINTER_SELECTED;
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	DBG(dev, "printer_close\n");
 	kref_put(&dev->kref, printer_dev_free);
 
 	return 0;
@@ -848,8 +847,6 @@ static void printer_reset_interface(struct printer_dev *dev)
 	if (dev->interface < 0)
 		return;
 
-	DBG(dev, "%s\n", __func__);
-
 	if (dev->in_ep->desc)
 		usb_ep_disable(dev->in_ep);
 
@@ -887,8 +884,6 @@ static void printer_soft_reset(struct printer_dev *dev)
 {
 	struct usb_request	*req;
 
-	INFO(dev, "Received Printer Reset Request\n");
-
 	if (usb_ep_disable(dev->in_ep))
 		DBG(dev, "Failed to disable USB in_ep\n");
 	if (usb_ep_disable(dev->out_ep))
@@ -1185,8 +1180,6 @@ static void printer_func_disable(struct usb_function *f)
 {
 	struct printer_dev *dev = func_to_printer(f);
 
-	DBG(dev, "%s\n", __func__);
-
 	printer_reset_interface(dev);
 }
 
-- 
2.25.1


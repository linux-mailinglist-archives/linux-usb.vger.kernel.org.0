Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFAF60E5C
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 02:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfGFAyR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 20:54:17 -0400
Received: from gate.crashing.org ([63.228.1.57]:42824 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfGFAyR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:54:17 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660rlMP017940;
        Fri, 5 Jul 2019 19:54:07 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 08/10] usb: gadget: aspeed: Remove unused "suspended" flag
Date:   Sat,  6 Jul 2019 10:53:43 +1000
Message-Id: <20190706005345.18131-9-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190706005345.18131-1-benh@kernel.crashing.org>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The state bit in the hub is sufficient

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 4 ----
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 79d3cb6bd2e7..4008e7a51188 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -89,7 +89,6 @@ static void ast_vhub_dev_enable(struct ast_vhub_dev *d)
 
 	/* Additional cleanups */
 	d->wakeup_en = false;
-	d->suspended = false;
 	d->enabled = true;
 }
 
@@ -110,7 +109,6 @@ static void ast_vhub_dev_disable(struct ast_vhub_dev *d)
 	writel(0, d->regs + AST_VHUB_DEV_EN_CTRL);
 	d->gadget.speed = USB_SPEED_UNKNOWN;
 	d->enabled = false;
-	d->suspended = false;
 }
 
 static int ast_vhub_dev_feature(struct ast_vhub_dev *d,
@@ -471,7 +469,6 @@ static const struct usb_gadget_ops ast_vhub_udc_ops = {
 
 void ast_vhub_dev_suspend(struct ast_vhub_dev *d)
 {
-	d->suspended = true;
 	if (d->driver && d->driver->suspend) {
 		spin_unlock(&d->vhub->lock);
 		d->driver->suspend(&d->gadget);
@@ -481,7 +478,6 @@ void ast_vhub_dev_suspend(struct ast_vhub_dev *d)
 
 void ast_vhub_dev_resume(struct ast_vhub_dev *d)
 {
-	d->suspended = false;
 	if (d->driver && d->driver->resume) {
 		spin_unlock(&d->vhub->lock);
 		d->driver->resume(&d->gadget);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 00f922604a1c..761919e220d3 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -354,7 +354,6 @@ struct ast_vhub_dev {
 	struct usb_gadget_driver	*driver;
 	bool				registered : 1;
 	bool				wakeup_en : 1;
-	bool				suspended : 1;
 	bool				enabled : 1;
 
 	/* Endpoint structures */
-- 
2.17.1


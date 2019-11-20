Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E21810375B
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 11:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfKTKWn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 05:22:43 -0500
Received: from mailout1.hostsharing.net ([83.223.95.204]:55351 "EHLO
        mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfKTKWn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 05:22:43 -0500
X-Greylist: delayed 418 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 05:22:42 EST
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id 47FF8101933DF;
        Wed, 20 Nov 2019 11:15:43 +0100 (CET)
Received: from localhost (pd95be530.dip0.t-ipconnect.de [217.91.229.48])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id EA2C260E00CA;
        Wed, 20 Nov 2019 11:15:42 +0100 (CET)
X-Mailbox-Line: From 77c07f00a6a9d94323c4a060a3c72817b0703b97 Mon Sep 17 00:00:00 2001
Message-Id: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Wed, 20 Nov 2019 11:15:15 +0100
Subject: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The original dwc_otg driver used a DWC_WORKQ_SCHEDULE() wrapper to queue
work items.  Because that wrapper acquired the driver's global spinlock,
an unlock/lock dance was necessary whenever a work item was queued up
while the global spinlock was already held.

The dwc2 driver dropped DWC_WORKQ_SCHEDULE() in favor of a direct call
to queue_work(), but retained the (now gratuitous) unlock/lock dance in
dwc2_handle_conn_id_status_change_intr().  Drop it.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/dwc2/core_intr.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 6af6add3d4c0..876ff31261d5 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -288,14 +288,9 @@ static void dwc2_handle_conn_id_status_change_intr(struct dwc2_hsotg *hsotg)
 
 	/*
 	 * Need to schedule a work, as there are possible DELAY function calls.
-	 * Release lock before scheduling workq as it holds spinlock during
-	 * scheduling.
 	 */
-	if (hsotg->wq_otg) {
-		spin_unlock(&hsotg->lock);
+	if (hsotg->wq_otg)
 		queue_work(hsotg->wq_otg, &hsotg->wf_otg);
-		spin_lock(&hsotg->lock);
-	}
 }
 
 /**
-- 
2.24.0


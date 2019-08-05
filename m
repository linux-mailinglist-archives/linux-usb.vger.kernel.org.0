Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1079B825A7
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfHETgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:36:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHETgn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 15:36:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68FBE20C01;
        Mon,  5 Aug 2019 19:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565033802;
        bh=MaWD4i6YwcDrZxr6+DF7rK6Zv6dmm/U8/8nieiyyv98=;
        h=From:To:Cc:Subject:Date:From;
        b=n7zyEtuHQUBAht/mnw6on4nRa9KUYPslEjsVlIW0LZZpLVVDuRmbITI1o/Y69A+2z
         LUOwfUF3SKYBS70jNFzT1BguvLSolyd9TMamCvlbi/WTGAXHi4yZSUu3pHZmvI+93H
         1Vx6/F5gdo/wuGvOkEKfZcO/XQPpfydrvnrTYmnw=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>
Subject: [PATCH] USB: musb: convert platform driver to use dev_groups
Date:   Mon,  5 Aug 2019 21:36:32 +0200
Message-Id: <20190805193636.25560-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" any sysfs files.

Cc: Bin Liu <b-liu@ti.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/musb/musb_core.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 2bc55e0ceace..bd63450af76a 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1829,16 +1829,13 @@ static ssize_t srp_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_WO(srp);
 
-static struct attribute *musb_attributes[] = {
+static struct attribute *musb_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_vbus.attr,
 	&dev_attr_srp.attr,
 	NULL
 };
-
-static const struct attribute_group musb_attr_group = {
-	.attrs = musb_attributes,
-};
+ATTRIBUTE_GROUPS(musb);
 
 #define MUSB_QUIRK_B_INVALID_VBUS_91	(MUSB_DEVCTL_BDEVICE | \
 					 (2 << MUSB_DEVCTL_VBUS_SHIFT) | \
@@ -2038,10 +2035,6 @@ static void musb_free(struct musb *musb)
 	 * cleanup after everything's been de-activated.
 	 */
 
-#ifdef CONFIG_SYSFS
-	sysfs_remove_group(&musb->controller->kobj, &musb_attr_group);
-#endif
-
 	if (musb->nIrq >= 0) {
 		if (musb->irq_wake)
 			disable_irq_wake(musb->nIrq);
@@ -2390,22 +2383,12 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 
 	musb_init_debugfs(musb);
 
-	status = sysfs_create_group(&musb->controller->kobj, &musb_attr_group);
-	if (status)
-		goto fail5;
-
 	musb->is_initialized = 1;
 	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
 
 	return 0;
 
-fail5:
-	musb_exit_debugfs(musb);
-
-	musb_gadget_cleanup(musb);
-	musb_host_cleanup(musb);
-
 fail3:
 	cancel_delayed_work_sync(&musb->irq_work);
 	cancel_delayed_work_sync(&musb->finish_resume_work);
@@ -2798,6 +2781,7 @@ static struct platform_driver musb_driver = {
 		.name		= (char *)musb_driver_name,
 		.bus		= &platform_bus_type,
 		.pm		= MUSB_DEV_PM_OPS,
+		.dev_groups	= musb_groups,
 	},
 	.probe		= musb_probe,
 	.remove		= musb_remove,
-- 
2.22.0


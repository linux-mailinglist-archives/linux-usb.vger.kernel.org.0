Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC7A211CFD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 09:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgGBH3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 03:29:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgGBH3V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 03:29:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5048120899;
        Thu,  2 Jul 2020 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593674960;
        bh=2uFQ7JQtFXfbn+25A4c9LawA5iVUvX+l4OINIBGRmlo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DuA97I7g3EcTB56j+3mIjVFbKHz4EcQlJ2ECkPYDwWGaOj9PXDPtBsBli/D3orT8E
         fBHt9QLkEVQBhZ0WFhuYExBDjVVAMqnMh1Qmf7FB+EI8KB5wmKiL8r2T0bk7+0MGf1
         By+CjxPBB7gqo98TyzqBxDxp+t8KpM8DNTPZ/oLs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] USB: phy: fsl-usb: remove character device usage
Date:   Thu,  2 Jul 2020 09:29:14 +0200
Message-Id: <20200702072914.1072878-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702072914.1072878-1-gregkh@linuxfoundation.org>
References: <20200702072914.1072878-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No idea why this driver is using a char device node, statically
allocated, with no dynamic allocation or hook up with devtmpfs, along
with a reserverd major number, for "special" operations, not all of
which ever were implemented.

So just rip it out, as no one must be using it because no modern system
will ever actually create the /dev/ node it needs.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/phy/phy-fsl-usb.c | 69 -----------------------------------
 drivers/usb/phy/phy-fsl-usb.h | 14 -------
 2 files changed, 83 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 93d2257aeec8..0c6d9f9f2994 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -957,67 +957,6 @@ int usb_otg_start(struct platform_device *pdev)
 	return 0;
 }
 
-/* Char driver interface to control some OTG input */
-
-/*
- * Handle some ioctl command, such as get otg
- * status and set host suspend
- */
-static long fsl_otg_ioctl(struct file *file, unsigned int cmd,
-			  unsigned long arg)
-{
-	u32 retval = 0;
-
-	switch (cmd) {
-	case GET_OTG_STATUS:
-		retval = fsl_otg_dev->host_working;
-		break;
-
-	case SET_A_SUSPEND_REQ:
-		fsl_otg_dev->fsm.a_suspend_req_inf = arg;
-		break;
-
-	case SET_A_BUS_DROP:
-		fsl_otg_dev->fsm.a_bus_drop = arg;
-		break;
-
-	case SET_A_BUS_REQ:
-		fsl_otg_dev->fsm.a_bus_req = arg;
-		break;
-
-	case SET_B_BUS_REQ:
-		fsl_otg_dev->fsm.b_bus_req = arg;
-		break;
-
-	default:
-		break;
-	}
-
-	otg_statemachine(&fsl_otg_dev->fsm);
-
-	return retval;
-}
-
-static int fsl_otg_open(struct inode *inode, struct file *file)
-{
-	return 0;
-}
-
-static int fsl_otg_release(struct inode *inode, struct file *file)
-{
-	return 0;
-}
-
-static const struct file_operations otg_fops = {
-	.owner = THIS_MODULE,
-	.llseek = NULL,
-	.read = NULL,
-	.write = NULL,
-	.unlocked_ioctl = fsl_otg_ioctl,
-	.open = fsl_otg_open,
-	.release = fsl_otg_release,
-};
-
 static int fsl_otg_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -1039,12 +978,6 @@ static int fsl_otg_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = register_chrdev(FSL_OTG_MAJOR, FSL_OTG_NAME, &otg_fops);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to register FSL OTG device\n");
-		return ret;
-	}
-
 	return ret;
 }
 
@@ -1061,8 +994,6 @@ static int fsl_otg_remove(struct platform_device *pdev)
 	kfree(fsl_otg_dev->phy.otg);
 	kfree(fsl_otg_dev);
 
-	unregister_chrdev(FSL_OTG_MAJOR, FSL_OTG_NAME);
-
 	if (pdata->exit)
 		pdata->exit(pdev);
 
diff --git a/drivers/usb/phy/phy-fsl-usb.h b/drivers/usb/phy/phy-fsl-usb.h
index fbcc28ad9964..d70341ae5a92 100644
--- a/drivers/usb/phy/phy-fsl-usb.h
+++ b/drivers/usb/phy/phy-fsl-usb.h
@@ -371,21 +371,7 @@ struct fsl_otg_config {
 	u8 otg_port;
 };
 
-/* For SRP and HNP handle */
-#define FSL_OTG_MAJOR		240
 #define FSL_OTG_NAME		"fsl-usb2-otg"
-/* Command to OTG driver ioctl */
-#define OTG_IOCTL_MAGIC		FSL_OTG_MAJOR
-/* if otg work as host, it should return 1, otherwise return 0 */
-#define GET_OTG_STATUS		_IOR(OTG_IOCTL_MAGIC, 1, int)
-#define SET_A_SUSPEND_REQ	_IOW(OTG_IOCTL_MAGIC, 2, int)
-#define SET_A_BUS_DROP		_IOW(OTG_IOCTL_MAGIC, 3, int)
-#define SET_A_BUS_REQ		_IOW(OTG_IOCTL_MAGIC, 4, int)
-#define SET_B_BUS_REQ		_IOW(OTG_IOCTL_MAGIC, 5, int)
-#define GET_A_SUSPEND_REQ	_IOR(OTG_IOCTL_MAGIC, 6, int)
-#define GET_A_BUS_DROP		_IOR(OTG_IOCTL_MAGIC, 7, int)
-#define GET_A_BUS_REQ		_IOR(OTG_IOCTL_MAGIC, 8, int)
-#define GET_B_BUS_REQ		_IOR(OTG_IOCTL_MAGIC, 9, int)
 
 void fsl_otg_add_timer(struct otg_fsm *fsm, void *timer);
 void fsl_otg_del_timer(struct otg_fsm *fsm, void *timer);
-- 
2.27.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B05825A9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbfHETgw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:36:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHETgv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 15:36:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75B2820C01;
        Mon,  5 Aug 2019 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565033811;
        bh=tBIEDTmtMlo//7SwxasZsmFuzk1bxnoDva0Ihq+ftHs=;
        h=From:To:Cc:Subject:Date:From;
        b=NKWfanASSZVEuW0mwJ+jhnUuFVUDwbdwChSLdm6s7dtlrtLL5ui3xIZHlkkapLJRG
         z6F9Llmh5/xlvMNDAefna7WzQNLmMnq34lqQHTbk2lzjGuEzMOYkWtaJRXoKaMHfBe
         Mm88ZA9GTYffD/mrUu+QOfpPRHo7xuh9c+kc99i4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: phy: mv-usb: convert platform driver to use dev_groups
Date:   Mon,  5 Aug 2019 21:36:33 +0200
Message-Id: <20190805193636.25560-3-gregkh@linuxfoundation.org>
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

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/phy/phy-mv-usb.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index cf7ecdc9a9d4..06b47f1028b3 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -641,12 +641,15 @@ static const struct attribute_group inputs_attr_group = {
 	.attrs = inputs_attrs,
 };
 
+static const struct attribute_group *mv_otg_groups[] = {
+	&inputs_attr_group,
+	NULL,
+};
+
 static int mv_otg_remove(struct platform_device *pdev)
 {
 	struct mv_otg *mvotg = platform_get_drvdata(pdev);
 
-	sysfs_remove_group(&mvotg->pdev->dev.kobj, &inputs_attr_group);
-
 	if (mvotg->qwork) {
 		flush_workqueue(mvotg->qwork);
 		destroy_workqueue(mvotg->qwork);
@@ -809,13 +812,6 @@ static int mv_otg_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	retval = sysfs_create_group(&pdev->dev.kobj, &inputs_attr_group);
-	if (retval < 0) {
-		dev_dbg(&pdev->dev,
-			"Can't register sysfs attr group: %d\n", retval);
-		goto err_remove_phy;
-	}
-
 	spin_lock_init(&mvotg->wq_lock);
 	if (spin_trylock(&mvotg->wq_lock)) {
 		mv_otg_run_state_machine(mvotg, 2 * HZ);
@@ -828,8 +824,6 @@ static int mv_otg_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_remove_phy:
-	usb_remove_phy(&mvotg->phy);
 err_disable_clk:
 	mv_otg_disable_internal(mvotg);
 err_destroy_workqueue:
@@ -883,6 +877,7 @@ static struct platform_driver mv_otg_driver = {
 	.remove = mv_otg_remove,
 	.driver = {
 		   .name = driver_name,
+		   .dev_groups = mv_otg_groups,
 		   },
 #ifdef CONFIG_PM
 	.suspend = mv_otg_suspend,
-- 
2.22.0


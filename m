Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DC2825AB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbfHETg5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:36:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHETg5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 15:36:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA71E20C01;
        Mon,  5 Aug 2019 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565033816;
        bh=L5132kSw4G0sGSTFQL3M/YgBOPkQgaXonYY0JN8Sdbk=;
        h=From:To:Cc:Subject:Date:From;
        b=gU4LEh/mUK7sqvWPWOstSZU/jwGQs91TaTTCcos8AwWf3Q9/t4MJJs/nHSkWZ+JJS
         X6AMErsiJ8rsDhgWd5uXsh4S3JW3o5hPyiLq9IqfadmcNBfhsF3vBYy2VEanT/kx/l
         1/HIQB1NNWfhWBetczRJ0qqBVo3iG+wj0NCIlzMs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Subject: [PATCH] USB: usbip: convert platform driver to use dev_groups
Date:   Mon,  5 Aug 2019 21:36:35 +0200
Message-Id: <20190805193636.25560-5-gregkh@linuxfoundation.org>
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

Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/usbip/vudc.h       | 2 +-
 drivers/usb/usbip/vudc_dev.c   | 9 ---------
 drivers/usb/usbip/vudc_main.c  | 1 +
 drivers/usb/usbip/vudc_sysfs.c | 7 ++++++-
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index cf968192e59f..1bd4bc005829 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -115,7 +115,7 @@ struct vudc_device {
 	struct list_head dev_entry;
 };
 
-extern const struct attribute_group vudc_attr_group;
+extern const struct attribute_group *vudc_groups[];
 
 /* visible everywhere */
 
diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index a72c17ff1c6a..c8eeabdd9b56 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -616,18 +616,10 @@ int vudc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_add_udc;
 
-	ret = sysfs_create_group(&pdev->dev.kobj, &vudc_attr_group);
-	if (ret) {
-		dev_err(&udc->pdev->dev, "create sysfs files\n");
-		goto err_sysfs;
-	}
-
 	platform_set_drvdata(pdev, udc);
 
 	return ret;
 
-err_sysfs:
-	usb_del_gadget_udc(&udc->gadget);
 err_add_udc:
 	cleanup_vudc_hw(udc);
 err_init_vudc_hw:
@@ -640,7 +632,6 @@ int vudc_remove(struct platform_device *pdev)
 {
 	struct vudc *udc = platform_get_drvdata(pdev);
 
-	sysfs_remove_group(&pdev->dev.kobj, &vudc_attr_group);
 	usb_del_gadget_udc(&udc->gadget);
 	cleanup_vudc_hw(udc);
 	kfree(udc);
diff --git a/drivers/usb/usbip/vudc_main.c b/drivers/usb/usbip/vudc_main.c
index 390733e6937e..678faa82598c 100644
--- a/drivers/usb/usbip/vudc_main.c
+++ b/drivers/usb/usbip/vudc_main.c
@@ -22,6 +22,7 @@ static struct platform_driver vudc_driver = {
 	.remove		= vudc_remove,
 	.driver		= {
 		.name	= GADGET_NAME,
+		.dev_groups = vudc_groups,
 	},
 };
 
diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index 6dcd3ff655c3..100f680c572a 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -215,7 +215,12 @@ static struct bin_attribute *dev_bin_attrs[] = {
 	NULL,
 };
 
-const struct attribute_group vudc_attr_group = {
+static const struct attribute_group vudc_attr_group = {
 	.attrs = dev_attrs,
 	.bin_attrs = dev_bin_attrs,
 };
+
+const struct attribute_group *vudc_groups[] = {
+	&vudc_attr_group,
+	NULL,
+};
-- 
2.22.0


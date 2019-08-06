Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA05182CD5
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 09:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731828AbfHFHcm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 03:32:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731576AbfHFHcm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 03:32:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CCD4218A3;
        Tue,  6 Aug 2019 07:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565076761;
        bh=iULde65C5z9p9uFwVQvzg1JXA/OpVJfsM24P7DWolqA=;
        h=From:To:Cc:Subject:Date:From;
        b=vvA36gAxtEyQiCkVN63qfcnddkXMEp/P93WjnFHhr7mUQZY42fF20vwsiX7j8fXf7
         GdafZEZO+hr52/h4J3f/nprPCF7X0b2QOmMe1oh1zkmM6VKdihzboT0ZrFy6kLlUO3
         gS+l5kep0MmmcQYeDpufS4Qye4r2belKJVb2/tek=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: phy: twl6030: convert platform driver to use dev_groups
Date:   Tue,  6 Aug 2019 09:32:34 +0200
Message-Id: <20190806073235.25140-1-gregkh@linuxfoundation.org>
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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/phy/phy-twl6030-usb.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index dade34d70419..bfebf1f2e991 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -196,6 +196,12 @@ static ssize_t vbus_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(vbus);
 
+static struct attribute *twl6030_attrs[] = {
+	&dev_attr_vbus.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(twl6030);
+
 static irqreturn_t twl6030_usb_irq(int irq, void *_twl)
 {
 	struct twl6030_usb *twl = _twl;
@@ -361,8 +367,6 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, twl);
-	if (device_create_file(&pdev->dev, &dev_attr_vbus))
-		dev_warn(&pdev->dev, "could not create sysfs file\n");
 
 	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
 	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
@@ -373,7 +377,6 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	if (status < 0) {
 		dev_err(&pdev->dev, "can't get IRQ %d, err %d\n",
 			twl->irq1, status);
-		device_remove_file(twl->dev, &dev_attr_vbus);
 		return status;
 	}
 
@@ -384,7 +387,6 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "can't get IRQ %d, err %d\n",
 			twl->irq2, status);
 		free_irq(twl->irq1, twl);
-		device_remove_file(twl->dev, &dev_attr_vbus);
 		return status;
 	}
 
@@ -408,7 +410,6 @@ static int twl6030_usb_remove(struct platform_device *pdev)
 	free_irq(twl->irq1, twl);
 	free_irq(twl->irq2, twl);
 	regulator_put(twl->usb3v3);
-	device_remove_file(twl->dev, &dev_attr_vbus);
 	cancel_work_sync(&twl->set_vbus_work);
 
 	return 0;
@@ -426,6 +427,7 @@ static struct platform_driver twl6030_usb_driver = {
 	.driver		= {
 		.name	= "twl6030_usb",
 		.of_match_table = of_match_ptr(twl6030_usb_id_table),
+		.dev_groups = twl6030_groups,
 	},
 };
 
-- 
2.22.0


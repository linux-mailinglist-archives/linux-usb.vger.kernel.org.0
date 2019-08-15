Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F478EC27
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbfHOM7G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:59:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729818AbfHOM7G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:59:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0706D208C2;
        Thu, 15 Aug 2019 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565873945;
        bh=ZmgQyoY1ph8Dw8yQn23StvEQ5D9MDiTgOj3maPDAASk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=samr7UJU+TrvtbGg2qgHm83F2aiZo0I/1fON/RPJW4/NXJMmqYbhD/Cr0vsh1vdSr
         v0/T8UP7G0kOh8Wriayj0dj76BhCAWnAgHQNqr2axXjcdBF+/GtwoOLdM/xg9KfUt6
         5QOp5ZxllOv3HIoJdu7NNghqE8b0mwiqBsa7/8XI=
Date:   Thu, 15 Aug 2019 14:59:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2] USB: phy: fsl-usb: convert platform driver to use
 dev_groups
Message-ID: <20190815125903.GA17065@kroah.com>
References: <20190806073235.25140-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806073235.25140-2-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
v2: fix build errors caught by 0-day

 drivers/usb/phy/phy-fsl-usb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index f7c96d209eda..f6a037b5e9ef 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -1043,6 +1043,11 @@ static ssize_t show_fsl_usb2_otg_state(struct device *dev,
 
 static DEVICE_ATTR(fsl_usb2_otg_state, S_IRUGO, show_fsl_usb2_otg_state, NULL);
 
+static struct attribute *fsl_otg_attrs[] = {
+	&dev_attr_fsl_usb2_otg_state.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(fsl_otg);
 
 /* Char driver interface to control some OTG input */
 
@@ -1132,10 +1137,6 @@ static int fsl_otg_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = device_create_file(&pdev->dev, &dev_attr_fsl_usb2_otg_state);
-	if (ret)
-		dev_warn(&pdev->dev, "Can't register sysfs attribute\n");
-
 	return ret;
 }
 
@@ -1152,8 +1153,6 @@ static int fsl_otg_remove(struct platform_device *pdev)
 	kfree(fsl_otg_dev->phy.otg);
 	kfree(fsl_otg_dev);
 
-	device_remove_file(&pdev->dev, &dev_attr_fsl_usb2_otg_state);
-
 	unregister_chrdev(FSL_OTG_MAJOR, FSL_OTG_NAME);
 
 	if (pdata->exit)
@@ -1168,6 +1167,7 @@ struct platform_driver fsl_otg_driver = {
 	.driver = {
 		.name = driver_name,
 		.owner = THIS_MODULE,
+		.dev_groups = fsl_otg_groups,
 	},
 };
 
-- 
2.22.1


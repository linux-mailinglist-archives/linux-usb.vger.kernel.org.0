Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 950BD82CD8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 09:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732122AbfHFHcv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 03:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731711AbfHFHcv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 03:32:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7B712189F;
        Tue,  6 Aug 2019 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565076770;
        bh=HyWQ5OlnEYW/k2SZyUvZcaQcvZE1xtoTaJpDndmQL/I=;
        h=From:To:Cc:Subject:Date:From;
        b=sPUobuASEz4DHbJ0ojwvc7tL6FujPiyflEm2x7KKuqXnJatjB8VZAX7eput4dRANO
         hcAtBH+bggjdxbjlqhtSQjdqoPFWy8GoGARreTPFRk67ZtUhrX45ZQb17D4d0IaQ+K
         zsivkGrUxY0bXjpTlAERN9g2skVsOpudYwCz3f5A=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: phy: fsl-usb: convert platform driver to use dev_groups
Date:   Tue,  6 Aug 2019 09:32:35 +0200
Message-Id: <20190806073235.25140-2-gregkh@linuxfoundation.org>
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
 drivers/usb/phy/phy-fsl-usb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index f7c96d209eda..dae2f21d3276 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -1043,6 +1043,11 @@ static ssize_t show_fsl_usb2_otg_state(struct device *dev,
 
 static DEVICE_ATTR(fsl_usb2_otg_state, S_IRUGO, show_fsl_usb2_otg_state, NULL);
 
+static struct attribute *fsl_otg_attrs[] = {
+	&dev_attr_fsl_usb2_otg_state.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(fsl_otg_attrs);
 
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
2.22.0


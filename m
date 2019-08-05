Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0B8825AA
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730376AbfHETgy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:36:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:56630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHETgy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 15:36:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C0E320C01;
        Mon,  5 Aug 2019 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565033813;
        bh=pjI4lrx4gvaYkzRJTqTJaHemFcNCQ6Jrk4oQMtPREvo=;
        h=From:To:Cc:Subject:Date:From;
        b=fctERwuDd9OCD4yM6PkxlpKky193uPHMCCbfoWYCKf0CGfaXFKm3V3hDcAsC46r2s
         c9jYyKfSlVk4maZbc2rQXX0ikGydbVVHyI7QKJg2Zf+3YuPAfGf+160hEL9Up+/Y8r
         +2vzZZD6MMz+S3TtikYDCpD0Z1ccyHXfw26f7vXY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: phy: tahvo: convert platform driver to use dev_groups
Date:   Mon,  5 Aug 2019 21:36:34 +0200
Message-Id: <20190805193636.25560-4-gregkh@linuxfoundation.org>
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
 drivers/usb/phy/phy-tahvo.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index 0981abc3d1ad..baebb1f5a973 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -312,15 +312,12 @@ static ssize_t otg_mode_store(struct device *device,
 }
 static DEVICE_ATTR_RW(otg_mode);
 
-static struct attribute *tahvo_attributes[] = {
+static struct attribute *tahvo_attrs[] = {
 	&dev_attr_vbus.attr,
 	&dev_attr_otg_mode.attr,
 	NULL
 };
-
-static const struct attribute_group tahvo_attr_group = {
-	.attrs = tahvo_attributes,
-};
+ATTRIBUTE_GROUPS(tahvo);
 
 static int tahvo_usb_probe(struct platform_device *pdev)
 {
@@ -406,17 +403,8 @@ static int tahvo_usb_probe(struct platform_device *pdev)
 		goto err_remove_phy;
 	}
 
-	/* Attributes */
-	ret = sysfs_create_group(&pdev->dev.kobj, &tahvo_attr_group);
-	if (ret) {
-		dev_err(&pdev->dev, "cannot create sysfs group: %d\n", ret);
-		goto err_free_irq;
-	}
-
 	return 0;
 
-err_free_irq:
-	free_irq(tu->irq, tu);
 err_remove_phy:
 	usb_remove_phy(&tu->phy);
 err_disable_clk:
@@ -430,7 +418,6 @@ static int tahvo_usb_remove(struct platform_device *pdev)
 {
 	struct tahvo_usb *tu = platform_get_drvdata(pdev);
 
-	sysfs_remove_group(&pdev->dev.kobj, &tahvo_attr_group);
 	free_irq(tu->irq, tu);
 	usb_remove_phy(&tu->phy);
 	if (!IS_ERR(tu->ick))
@@ -444,6 +431,7 @@ static struct platform_driver tahvo_usb_driver = {
 	.remove		= tahvo_usb_remove,
 	.driver		= {
 		.name	= "tahvo-usb",
+		.dev_groups = tahvo_groups,
 	},
 };
 module_platform_driver(tahvo_usb_driver);
-- 
2.22.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE92825A8
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbfHETgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:36:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHETgq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 15:36:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03211214C6;
        Mon,  5 Aug 2019 19:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565033805;
        bh=gR+qsbB1xrMGo+XBaPZQbfqr0tYF5VE0hR9593Ur99A=;
        h=From:To:Cc:Subject:Date:From;
        b=jDt5lIx7c3l6lkiOxCoojw8Q5EQlIvHQ+bCvcDfo1c9tf0eTiu75vUSURrRPYBQD/
         vIxAT/kJGhsWTkf+0DenBHa1AtTtWBSwvWS9RcLONMBvd5Eg5UyTqTVdanBhrZd1qC
         DZ6IH5Iuk3uNe1lnqEtRXr+GWnlGMaxp/9stBMSI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>
Subject: [PATCH] USB: chipidea: convert platform driver to use dev_groups
Date:   Mon,  5 Aug 2019 21:36:31 +0200
Message-Id: <20190805193636.25560-1-gregkh@linuxfoundation.org>
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

Cc: Peter Chen <Peter.Chen@nxp.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/chipidea/core.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 36c964cd40a3..215c655295b8 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -903,10 +903,7 @@ static struct attribute *ci_attrs[] = {
 	&dev_attr_role.attr,
 	NULL,
 };
-
-static const struct attribute_group ci_attr_group = {
-	.attrs = ci_attrs,
-};
+ATTRIBUTE_GROUPS(ci);
 
 static int ci_hdrc_probe(struct platform_device *pdev)
 {
@@ -1105,14 +1102,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	device_set_wakeup_capable(&pdev->dev, true);
 	dbg_create_files(ci);
 
-	ret = sysfs_create_group(&dev->kobj, &ci_attr_group);
-	if (ret)
-		goto remove_debug;
-
 	return 0;
 
-remove_debug:
-	dbg_remove_files(ci);
 stop:
 	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
 		ci_hdrc_otg_destroy(ci);
@@ -1139,7 +1130,6 @@ static int ci_hdrc_remove(struct platform_device *pdev)
 	}
 
 	dbg_remove_files(ci);
-	sysfs_remove_group(&ci->dev->kobj, &ci_attr_group);
 	ci_role_destroy(ci);
 	ci_hdrc_enter_lpm(ci, true);
 	ci_usb_phy_exit(ci);
@@ -1318,6 +1308,7 @@ static struct platform_driver ci_hdrc_driver = {
 	.driver	= {
 		.name	= "ci_hdrc",
 		.pm	= &ci_pm_ops,
+		.dev_groups = ci_groups,
 	},
 };
 
-- 
2.22.0


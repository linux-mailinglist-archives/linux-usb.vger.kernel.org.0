Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2BE825AC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbfHETg7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:36:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727460AbfHETg7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 15:36:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4689B20C01;
        Mon,  5 Aug 2019 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565033818;
        bh=QBqriY8x/7Shw5VomfNQz2GfF5KUEwSnNHlb84tkjvE=;
        h=From:To:Cc:Subject:Date:From;
        b=irvt6B4XvWPFmhMhSDZ6vvURTVlJWizThU9NPikEuoScn0e+tF3QBnSB8Ev/n8nws
         eQ3eMyhfx+VC/G9qTaF3PF8O43fDRzBQveiFPdVEOW47roPT+izbLoJa7onTxtLNKN
         Ag929MKvviphSBfyTL2ObrJGzqjsetRTvdzhJTZc=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH] USB: typec: ucsi_ccg: convert i2c driver to use dev_groups
Date:   Mon,  5 Aug 2019 21:36:36 +0200
Message-Id: <20190805193636.25560-6-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver core now supports the option to automatically create and
remove any needed sysfs attribute files for a driver when the device is
bound/removed from it.  Convert the uscsi_ccg code to use that instead
of trying to create sysfs files "by hand".

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Ajay Gupta <ajayg@nvidia.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index f7a79a23ebed..e283a42e4f06 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1104,14 +1104,11 @@ static ssize_t do_flash_store(struct device *dev,
 
 static DEVICE_ATTR_WO(do_flash);
 
-static struct attribute *ucsi_ccg_sysfs_attrs[] = {
+static struct attribute *ucsi_ccg_attrs[] = {
 	&dev_attr_do_flash.attr,
 	NULL,
 };
-
-static struct attribute_group ucsi_ccg_attr_group = {
-	.attrs = ucsi_ccg_sysfs_attrs,
-};
+ATTRIBUTE_GROUPS(ucsi_ccg);
 
 static int ucsi_ccg_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
@@ -1189,10 +1186,6 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, uc);
 
-	status = sysfs_create_group(&uc->dev->kobj, &ucsi_ccg_attr_group);
-	if (status)
-		dev_err(uc->dev, "cannot create sysfs group: %d\n", status);
-
 	pm_runtime_set_active(uc->dev);
 	pm_runtime_enable(uc->dev);
 	pm_runtime_idle(uc->dev);
@@ -1209,7 +1202,6 @@ static int ucsi_ccg_remove(struct i2c_client *client)
 	ucsi_unregister_ppm(uc->ucsi);
 	pm_runtime_disable(uc->dev);
 	free_irq(uc->irq, uc);
-	sysfs_remove_group(&uc->dev->kobj, &ucsi_ccg_attr_group);
 
 	return 0;
 }
@@ -1270,6 +1262,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 	.driver = {
 		.name = "ucsi_ccg",
 		.pm = &ucsi_ccg_pm,
+		.dev_groups = ucsi_ccg_groups,
 	},
 	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.22.0


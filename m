Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E67BA83434
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733106AbfHFOp2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:46022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOp2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15691214C6;
        Tue,  6 Aug 2019 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102727;
        bh=nw47svV7ciaRtpZCXUFUGDPT7q5ye7QHw6bCSEb1QPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D8ysuxXN8IF8IdgmVHWDkRUFdlIgQ+HmseBfu1FblG9tSt8/KtOWr6MlhDJUSppSO
         JBCbRtMxd4uuPrnxfDlCKG8xIZqyYx2soPNrX5NOczLbqyYAGGS3cDIt7pA8m8nQth
         nUZ6Tby22AILuxPS9wrtVyuSJxTO7HgyDus6zjHc=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthieu CASTET <castet.matthieu@free.fr>,
        Stanislaw Gruszka <stf_xl@wp.pl>
Subject: [PATCH 04/12] USB: ueagle-atm: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:54 +0200
Message-Id: <20190806144502.17792-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806144502.17792-1-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB drivers now support the ability for the driver core to handle the
creation and removal of device-specific sysfs files in a race-free
manner.  Take advantage of that by converting the driver to use this by
moving the sysfs attributes into a group and assigning the dev_groups
pointer to it.

Cc: Matthieu CASTET <castet.matthieu@free.fr>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/atm/ueagle-atm.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 8faa51b1a520..8b0ea8c70d73 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2458,7 +2458,7 @@ static int claim_interface(struct usb_device *usb_dev,
 	return ret;
 }
 
-static struct attribute *attrs[] = {
+static struct attribute *uea_attrs[] = {
 	&dev_attr_stat_status.attr,
 	&dev_attr_stat_mflags.attr,
 	&dev_attr_stat_human_status.attr,
@@ -2479,9 +2479,7 @@ static struct attribute *attrs[] = {
 	&dev_attr_stat_firmid.attr,
 	NULL,
 };
-static const struct attribute_group attr_grp = {
-	.attrs = attrs,
-};
+ATTRIBUTE_GROUPS(uea);
 
 static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 		   const struct usb_device_id *id)
@@ -2550,18 +2548,12 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 		}
 	}
 
-	ret = sysfs_create_group(&intf->dev.kobj, &attr_grp);
-	if (ret < 0)
-		goto error;
-
 	ret = uea_boot(sc);
 	if (ret < 0)
-		goto error_rm_grp;
+		goto error;
 
 	return 0;
 
-error_rm_grp:
-	sysfs_remove_group(&intf->dev.kobj, &attr_grp);
 error:
 	kfree(sc);
 	return ret;
@@ -2571,7 +2563,6 @@ static void uea_unbind(struct usbatm_data *usbatm, struct usb_interface *intf)
 {
 	struct uea_softc *sc = usbatm->driver_data;
 
-	sysfs_remove_group(&intf->dev.kobj, &attr_grp);
 	uea_stop(sc);
 	kfree(sc);
 }
@@ -2721,6 +2712,7 @@ static struct usb_driver uea_driver = {
 	.id_table = uea_ids,
 	.probe = uea_probe,
 	.disconnect = uea_disconnect,
+	.dev_groups = uea_groups,
 };
 
 MODULE_DEVICE_TABLE(usb, uea_ids);
-- 
2.22.0


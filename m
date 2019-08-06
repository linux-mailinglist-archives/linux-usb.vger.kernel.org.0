Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A5983439
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733124AbfHFOpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:46172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E2F920C01;
        Tue,  6 Aug 2019 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102740;
        bh=ChsaV8DxoOSEzBl5SDaNpJPPMMMa/0dZclujcX1tauo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OtOBRPiz+GACo0HA0MJHX4oDXs7VP3SlbF0xdNu+BZLJZmMI9noVL0atTW+A697rr
         y505s03y25PTmWrPLbKuUeI7/UQDBzp+yj442YW6okJR9u6Pxmq0WOd0yYhYc1KLXz
         B6zLQ94mx29Tra//+GrsbnIkgEFgUqoV4QF7yJo8=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 09/12] USB: lvstest: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:59 +0200
Message-Id: <20190806144502.17792-10-gregkh@linuxfoundation.org>
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

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/lvstest.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/misc/lvstest.c b/drivers/usb/misc/lvstest.c
index e5c03c6d16e9..407fe7570f3b 100644
--- a/drivers/usb/misc/lvstest.c
+++ b/drivers/usb/misc/lvstest.c
@@ -310,7 +310,7 @@ static ssize_t enable_compliance_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(enable_compliance);
 
-static struct attribute *lvs_attributes[] = {
+static struct attribute *lvs_attrs[] = {
 	&dev_attr_get_dev_desc.attr,
 	&dev_attr_u1_timeout.attr,
 	&dev_attr_u2_timeout.attr,
@@ -321,10 +321,7 @@ static struct attribute *lvs_attributes[] = {
 	&dev_attr_enable_compliance.attr,
 	NULL
 };
-
-static const struct attribute_group lvs_attr_group = {
-	.attrs = lvs_attributes,
-};
+ATTRIBUTE_GROUPS(lvs);
 
 static void lvs_rh_work(struct work_struct *work)
 {
@@ -439,12 +436,6 @@ static int lvs_rh_probe(struct usb_interface *intf,
 
 	INIT_WORK(&lvs->rh_work, lvs_rh_work);
 
-	ret = sysfs_create_group(&intf->dev.kobj, &lvs_attr_group);
-	if (ret < 0) {
-		dev_err(&intf->dev, "Failed to create sysfs node %d\n", ret);
-		goto free_urb;
-	}
-
 	pipe = usb_rcvintpipe(hdev, endpoint->bEndpointAddress);
 	maxp = usb_maxpacket(hdev, pipe, usb_pipeout(pipe));
 	usb_fill_int_urb(lvs->urb, hdev, pipe, &lvs->buffer[0], maxp,
@@ -453,13 +444,11 @@ static int lvs_rh_probe(struct usb_interface *intf,
 	ret = usb_submit_urb(lvs->urb, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(&intf->dev, "couldn't submit lvs urb %d\n", ret);
-		goto sysfs_remove;
+		goto free_urb;
 	}
 
 	return ret;
 
-sysfs_remove:
-	sysfs_remove_group(&intf->dev.kobj, &lvs_attr_group);
 free_urb:
 	usb_free_urb(lvs->urb);
 	return ret;
@@ -469,7 +458,6 @@ static void lvs_rh_disconnect(struct usb_interface *intf)
 {
 	struct lvs_rh *lvs = usb_get_intfdata(intf);
 
-	sysfs_remove_group(&intf->dev.kobj, &lvs_attr_group);
 	usb_poison_urb(lvs->urb); /* used in scheduled work */
 	flush_work(&lvs->rh_work);
 	usb_free_urb(lvs->urb);
@@ -479,6 +467,7 @@ static struct usb_driver lvs_driver = {
 	.name =		"lvs",
 	.probe =	lvs_rh_probe,
 	.disconnect =	lvs_rh_disconnect,
+	.dev_groups =	lvs_groups,
 };
 
 module_usb_driver(lvs_driver);
-- 
2.22.0


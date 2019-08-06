Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C6683436
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733115AbfHFOpe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CC0A20C01;
        Tue,  6 Aug 2019 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102732;
        bh=BTvV1CThF/JUo51iU47xDDDbdE00Szro3HXoOb6Xuio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qG90LxUgaWu6vtxd0nt/WPndL+7yVfTY1CR0m5KX3+L69RUIKq5GESKUPTZpp8mJZ
         nipbhMK0+cGoWyM5wWvFOngnAhHZYD5uf1tmxdab3Xh8/SGQmggxJH6VOq7WjkPrb3
         GgA9DEiQVaPzppeQKl62F3sw4MaHnZt8sZ2nQ1VU=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guido Kiener <guido.kiener@rohde-schwarz.com>,
        Steve Bayless <steve_bayless@keysight.com>
Subject: [PATCH 06/12] USB: usbtmc: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:56 +0200
Message-Id: <20190806144502.17792-7-gregkh@linuxfoundation.org>
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

Cc: Guido Kiener <guido.kiener@rohde-schwarz.com>
Cc: Steve Bayless <steve_bayless@keysight.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/class/usbtmc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 4942122b2346..7ff831f2fd21 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -1836,17 +1836,14 @@ capability_attribute(device_capabilities);
 capability_attribute(usb488_interface_capabilities);
 capability_attribute(usb488_device_capabilities);
 
-static struct attribute *capability_attrs[] = {
+static struct attribute *usbtmc_attrs[] = {
 	&dev_attr_interface_capabilities.attr,
 	&dev_attr_device_capabilities.attr,
 	&dev_attr_usb488_interface_capabilities.attr,
 	&dev_attr_usb488_device_capabilities.attr,
 	NULL,
 };
-
-static const struct attribute_group capability_attr_grp = {
-	.attrs = capability_attrs,
-};
+ATTRIBUTE_GROUPS(usbtmc);
 
 static int usbtmc_ioctl_indicator_pulse(struct usbtmc_device_data *data)
 {
@@ -2383,9 +2380,6 @@ static int usbtmc_probe(struct usb_interface *intf,
 	retcode = get_capabilities(data);
 	if (retcode)
 		dev_err(&intf->dev, "can't read capabilities\n");
-	else
-		retcode = sysfs_create_group(&intf->dev.kobj,
-					     &capability_attr_grp);
 
 	if (data->iin_ep_present) {
 		/* allocate int urb */
@@ -2432,7 +2426,6 @@ static int usbtmc_probe(struct usb_interface *intf,
 	return 0;
 
 error_register:
-	sysfs_remove_group(&intf->dev.kobj, &capability_attr_grp);
 	usbtmc_free_int(data);
 err_put:
 	kref_put(&data->kref, usbtmc_delete);
@@ -2445,7 +2438,6 @@ static void usbtmc_disconnect(struct usb_interface *intf)
 	struct list_head *elem;
 
 	usb_deregister_dev(intf, &usbtmc_class);
-	sysfs_remove_group(&intf->dev.kobj, &capability_attr_grp);
 	mutex_lock(&data->io_mutex);
 	data->zombie = 1;
 	wake_up_interruptible_all(&data->waitq);
@@ -2551,6 +2543,7 @@ static struct usb_driver usbtmc_driver = {
 	.resume		= usbtmc_resume,
 	.pre_reset	= usbtmc_pre_reset,
 	.post_reset	= usbtmc_post_reset,
+	.dev_groups	= usbtmc_groups,
 };
 
 module_usb_driver(usbtmc_driver);
-- 
2.22.0


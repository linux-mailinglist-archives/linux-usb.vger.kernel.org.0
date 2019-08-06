Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFAFB8342B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732976AbfHFOpI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730289AbfHFOpH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60FBA20C01;
        Tue,  6 Aug 2019 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102706;
        bh=FQsWFloR7lTfyDgEoh94sVGq3EGeWfDXbbVMGeMavbI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u19hXoB+CP5pZQc0b2a5iaK42ZHpPc8oifh2AhG22KTc3tCLnY3YvuDMBwWbTsKE/
         i6G5abm4xAxYvNxYZ6GJb1Vna685B+NaJJY6TizLF/OHL4jCUUIrhmsB9zTwJOePw6
         FuJHBKYZCGARP7uAoIVRyriVXlIRKDnO7fnPRYlw=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 01/12] USB: add support for dev_groups to struct usb_driver
Date:   Tue,  6 Aug 2019 16:44:51 +0200
Message-Id: <20190806144502.17792-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806144502.17792-1-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that the driver core supports dev_groups for individual drivers,
expose that pointer to struct usb_driver to make it easier for USB
drivers to also use it.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/driver.c | 1 +
 include/linux/usb.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index ebcadaad89d1..687fc5df4c17 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -954,6 +954,7 @@ int usb_register_driver(struct usb_driver *new_driver, struct module *owner,
 	new_driver->drvwrap.driver.remove = usb_unbind_interface;
 	new_driver->drvwrap.driver.owner = owner;
 	new_driver->drvwrap.driver.mod_name = mod_name;
+	new_driver->drvwrap.driver.dev_groups = new_driver->dev_groups;
 	spin_lock_init(&new_driver->dynids.lock);
 	INIT_LIST_HEAD(&new_driver->dynids.list);
 
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 83d35d993e8c..af4eb6419ae8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1151,6 +1151,8 @@ struct usbdrv_wrap {
  * @id_table: USB drivers use ID table to support hotplugging.
  *	Export this with MODULE_DEVICE_TABLE(usb,...).  This must be set
  *	or your driver's probe function will never get called.
+ * @dev_groups: Attributes attached to the device that will be created once it
+ *	is bound to the driver.
  * @dynids: used internally to hold the list of dynamically added device
  *	ids for this driver.
  * @drvwrap: Driver-model core structure wrapper.
@@ -1198,6 +1200,7 @@ struct usb_driver {
 	int (*post_reset)(struct usb_interface *intf);
 
 	const struct usb_device_id *id_table;
+	const struct attribute_group **dev_groups;
 
 	struct usb_dynids dynids;
 	struct usbdrv_wrap drvwrap;
-- 
2.22.0


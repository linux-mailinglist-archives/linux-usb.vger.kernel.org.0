Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B281526CD13
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgIPUxT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 16:53:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:44740 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgIPQyL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 12:54:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 11AF8B53C;
        Wed, 16 Sep 2020 14:27:12 +0000 (UTC)
Message-ID: <1600266411.2424.32.camel@suse.de>
Subject: memory allocations dring device removal
From:   Oliver Neukum <oneukum@suse.de>
To:     Alan Stern <stern@rowland.harvard.edu>, gregKH@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 16 Sep 2020 16:26:51 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am cleaning up house, electronically speaking.
Reading the thread about the keyboard with the storage device
reminded me about a potential issue. What happens if you
allocate memory during disconnect()?

If the storage device is second, the storage driver will
still be bound and the SCSI device will still exist. The
kernel may use it to launder pages. This will fail, as the
device is physically gone. So can we deadlock?

Is this patch necessary?

	Regards
		Oliver

From 97b7e91af588b7489795e3eaf773be032bc91b70 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 28 May 2019 11:43:02 +0200
Subject: [PATCH] base: force NOIO allocations during unplug

There is one overlooked situation under which a driver
must not do IO to allocate memory. You cannot do that
while disconnecting a device. A device being disconnected
is no longer functional in most cases, yet IO may fail
only when the handler runs.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/base/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bb5806a2bd4c..509306a4ea89 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -26,6 +26,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/netdevice.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/mm.h>
 #include <linux/sysfs.h>
 
 #include "base.h"
@@ -3062,6 +3063,7 @@ void device_del(struct device *dev)
 	struct device *parent = dev->parent;
 	struct kobject *glue_dir = NULL;
 	struct class_interface *class_intf;
+	unsigned int noio_flag;
 
 	device_lock(dev);
 	kill_device(dev);
@@ -3073,6 +3075,7 @@ void device_del(struct device *dev)
 	/* Notify clients of device removal.  This call must come
 	 * before dpm_sysfs_remove().
 	 */
+	noio_flag = memalloc_noio_save();
 	if (dev->bus)
 		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,
 					     BUS_NOTIFY_DEL_DEVICE, dev);
@@ -3106,6 +3109,7 @@ void device_del(struct device *dev)
 	device_platform_notify(dev, KOBJ_REMOVE);
 	device_remove_properties(dev);
 	device_links_purge(dev);
+	memalloc_noio_restore(noio_flag);
 
 	if (dev->bus)
 		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,
-- 
2.16.4


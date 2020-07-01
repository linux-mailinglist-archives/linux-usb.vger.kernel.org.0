Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A69E210481
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 09:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgGAHKz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 03:10:55 -0400
Received: from mail5.windriver.com ([192.103.53.11]:41688 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727847AbgGAHKy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 03:10:54 -0400
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
        by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0617A0oY022996
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
        Wed, 1 Jul 2020 00:10:10 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Jul 2020 00:09:49 -0700
From:   <qiang.zhang@windriver.com>
To:     <balbi@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: function: printer: Interface is disabled and returns error
Date:   Tue, 30 Jun 2020 13:23:31 +0800
Message-ID: <20200630052331.33020-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

After the device is disconnected from the host side, the interface of
the device is reset. If the userspace operates the device again,
an error code should be returned.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/gadget/function/f_printer.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 9c7ed2539ff7..2b45a61e4213 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -338,6 +338,11 @@ printer_open(struct inode *inode, struct file *fd)
 
 	spin_lock_irqsave(&dev->lock, flags);
 
+	if (dev->interface < 0) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		return -ENODEV;
+	}
+
 	if (!dev->printer_cdev_open) {
 		dev->printer_cdev_open = 1;
 		fd->private_data = dev;
@@ -430,6 +435,12 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 	mutex_lock(&dev->lock_printer_io);
 	spin_lock_irqsave(&dev->lock, flags);
 
+	if (dev->interface < 0) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		mutex_unlock(&dev->lock_printer_io);
+		return -ENODEV;
+	}
+
 	/* We will use this flag later to check if a printer reset happened
 	 * after we turn interrupts back on.
 	 */
@@ -561,6 +572,12 @@ printer_write(struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 	mutex_lock(&dev->lock_printer_io);
 	spin_lock_irqsave(&dev->lock, flags);
 
+	if (dev->interface < 0) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		mutex_unlock(&dev->lock_printer_io);
+		return -ENODEV;
+	}
+
 	/* Check if a printer reset happens while we have interrupts on */
 	dev->reset_printer = 0;
 
@@ -667,6 +684,13 @@ printer_fsync(struct file *fd, loff_t start, loff_t end, int datasync)
 
 	inode_lock(inode);
 	spin_lock_irqsave(&dev->lock, flags);
+
+	if (dev->interface < 0) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		inode_unlock(inode);
+		return -ENODEV;
+	}
+
 	tx_list_empty = (likely(list_empty(&dev->tx_reqs)));
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -689,6 +713,13 @@ printer_poll(struct file *fd, poll_table *wait)
 
 	mutex_lock(&dev->lock_printer_io);
 	spin_lock_irqsave(&dev->lock, flags);
+
+	if (dev->interface < 0) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		mutex_unlock(&dev->lock_printer_io);
+		return EPOLLERR | EPOLLHUP;
+	}
+
 	setup_rx_reqs(dev);
 	spin_unlock_irqrestore(&dev->lock, flags);
 	mutex_unlock(&dev->lock_printer_io);
@@ -722,6 +753,11 @@ printer_ioctl(struct file *fd, unsigned int code, unsigned long arg)
 
 	spin_lock_irqsave(&dev->lock, flags);
 
+	if (dev->interface < 0) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		return -ENODEV;
+	}
+
 	switch (code) {
 	case GADGET_GET_PRINTER_STATUS:
 		status = (int)dev->printer_status;
-- 
2.24.1


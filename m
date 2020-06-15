Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5666B1F93A3
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgFOJhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 05:37:46 -0400
Received: from mail.windriver.com ([147.11.1.11]:54996 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFOJhq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 05:37:46 -0400
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05F9bTtc012340
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
        Mon, 15 Jun 2020 02:37:30 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 15 Jun 2020 02:37:09 -0700
From:   <qiang.zhang@windriver.com>
To:     <balbi@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: function: printer: Add gadget dev interface status judgment
Date:   Mon, 15 Jun 2020 17:46:08 +0800
Message-ID: <20200615094608.26179-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

After the interface of gadget printer device was disabled,
We should not continue operate the device.

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


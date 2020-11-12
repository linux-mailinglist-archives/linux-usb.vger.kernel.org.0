Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7270F2B0015
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 08:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgKLHHg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 02:07:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7520 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgKLHH3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 02:07:29 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWt2V1FC9zhkl5;
        Thu, 12 Nov 2020 15:07:14 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Nov 2020
 15:07:15 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <akpm@linux-foundation.org>, <viro@zeniv.linux.org.uk>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-kernel@vger.kernel.org>, <martin.petersen@oracle.com>,
        <john.garry@huawei.com>, <himanshu.madhani@cavium.com>,
        <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <uma.shankar@intel.com>, <anshuman.gupta@intel.com>,
        <animesh.manna@intel.com>, <linux-usb@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH v4 4/5] usb: dwc3: debugfs: Introduce DEFINE_SHOW_STORE_ATTRIBUTE
Date:   Thu, 12 Nov 2020 15:07:42 +0800
Message-ID: <1605164864-58944-5-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605164864-58944-1-git-send-email-luojiaxing@huawei.com>
References: <1605164864-58944-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Seq introduce a new helper macro DEFINE_SHOW_STORE_ATTRIBUTE for
Read-Write file, so we apply it at dwc3 debugfs to reduce some duplicated
code.

While at that, also use DEFINE_SHOW_ATTRIBUTE() where possible.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
Acked-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/debugfs.c | 52 ++++------------------------------------------
 1 file changed, 4 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 5da4f60..2b5de8d 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -348,11 +348,6 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int dwc3_lsp_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, dwc3_lsp_show, inode->i_private);
-}
-
 static ssize_t dwc3_lsp_write(struct file *file, const char __user *ubuf,
 			      size_t count, loff_t *ppos)
 {
@@ -377,13 +372,7 @@ static ssize_t dwc3_lsp_write(struct file *file, const char __user *ubuf,
 	return count;
 }
 
-static const struct file_operations dwc3_lsp_fops = {
-	.open			= dwc3_lsp_open,
-	.write			= dwc3_lsp_write,
-	.read			= seq_read,
-	.llseek			= seq_lseek,
-	.release		= single_release,
-};
+DEFINE_SHOW_STORE_ATTRIBUTE(dwc3_lsp);
 
 static int dwc3_mode_show(struct seq_file *s, void *unused)
 {
@@ -412,11 +401,6 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int dwc3_mode_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, dwc3_mode_show, inode->i_private);
-}
-
 static ssize_t dwc3_mode_write(struct file *file,
 		const char __user *ubuf, size_t count, loff_t *ppos)
 {
@@ -445,13 +429,7 @@ static ssize_t dwc3_mode_write(struct file *file,
 	return count;
 }
 
-static const struct file_operations dwc3_mode_fops = {
-	.open			= dwc3_mode_open,
-	.write			= dwc3_mode_write,
-	.read			= seq_read,
-	.llseek			= seq_lseek,
-	.release		= single_release,
-};
+DEFINE_SHOW_STORE_ATTRIBUTE(dwc3_mode);
 
 static int dwc3_testmode_show(struct seq_file *s, void *unused)
 {
@@ -491,11 +469,6 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int dwc3_testmode_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, dwc3_testmode_show, inode->i_private);
-}
-
 static ssize_t dwc3_testmode_write(struct file *file,
 		const char __user *ubuf, size_t count, loff_t *ppos)
 {
@@ -528,13 +501,7 @@ static ssize_t dwc3_testmode_write(struct file *file,
 	return count;
 }
 
-static const struct file_operations dwc3_testmode_fops = {
-	.open			= dwc3_testmode_open,
-	.write			= dwc3_testmode_write,
-	.read			= seq_read,
-	.llseek			= seq_lseek,
-	.release		= single_release,
-};
+DEFINE_SHOW_STORE_ATTRIBUTE(dwc3_testmode);
 
 static int dwc3_link_state_show(struct seq_file *s, void *unused)
 {
@@ -564,11 +531,6 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int dwc3_link_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, dwc3_link_state_show, inode->i_private);
-}
-
 static ssize_t dwc3_link_state_write(struct file *file,
 		const char __user *ubuf, size_t count, loff_t *ppos)
 {
@@ -620,13 +582,7 @@ static ssize_t dwc3_link_state_write(struct file *file,
 	return count;
 }
 
-static const struct file_operations dwc3_link_state_fops = {
-	.open			= dwc3_link_state_open,
-	.write			= dwc3_link_state_write,
-	.read			= seq_read,
-	.llseek			= seq_lseek,
-	.release		= single_release,
-};
+DEFINE_SHOW_STORE_ATTRIBUTE(dwc3_link_state);
 
 struct dwc3_ep_file_map {
 	const char name[25];
-- 
2.7.4


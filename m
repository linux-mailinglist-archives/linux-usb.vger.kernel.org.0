Return-Path: <linux-usb+bounces-24532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0081ACFACC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 03:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792371896FA4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 01:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1533A8F7;
	Fri,  6 Jun 2025 01:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhfUMlFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5D2BD1B
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749173941; cv=none; b=dw3N8romFCVIwVH2VindTdOO7Bb6hWSrkoxK5pGr7SmYmop3OmPnbTskYSkyKa0FwcaLRT5lNTCuObDpn954iC7OclSIyqDkEMYi/5Op7ItLa6xAsvW+0C8aNTXL1GsJdWuPFI6hb/au8BfDEwEGUyma6oN+F8WqU3iMINwd2lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749173941; c=relaxed/simple;
	bh=rbFBCepi0mQKHVHCeg50/wRkHwHUX3ypUbUi2JtQ7Gc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p7H5k1NZL+sdsAUbZMafpYexAs7MuQIeVBOowF98l1zGVIRMLFpu+zaK0M6RjjlEiCtj4ucAnE7oWVtU7SYNBspMN4wJLNvqJEwJFzT0CsFoPP7XpUzVdZ+QXYDm6975BIBLJ6T14wPlxPM8QFNkaAYVc4bFi83s+5xehqTGzt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhfUMlFk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749173939; x=1780709939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rbFBCepi0mQKHVHCeg50/wRkHwHUX3ypUbUi2JtQ7Gc=;
  b=AhfUMlFkJ3onPSbmaan/jCKhdbPGMu7uug+oAcWgry/ovJXUezO/6Yjo
   O3cdQRbif5w+k4KLKvh3pLofYBL6TIxIf9H1RNa5wuRgp5sGSJUmwwzzj
   +8kS54pmI7m6esK4tcn7LRuQ+m5PqkjAskT/9VJU6MBIq96TxxkTbFZpC
   FssfxBU0ASOq8b1WYPlmWdfaIEC9UdRpzBtGcpdvgCYM7ZvsqGP+nZmNV
   Tvr3uQ0Z2NsPH811cDLsi8U24bx2bUmslB6hviTywJPEdqApTihX2a2mK
   oj63wY4vGvkGidEv/ypTCTPVWoErmfqpBZSoHrXNQuYPTeSntH1jpQfma
   w==;
X-CSE-ConnectionGUID: 8KwNNEZzQHSBs7WW8ypmEQ==
X-CSE-MsgGUID: z5yUOjTXSbmdqWfBSRPrdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38947581"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="38947581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 18:38:59 -0700
X-CSE-ConnectionGUID: sWWF7vrlTDW/gZG6YUfZlA==
X-CSE-MsgGUID: ju1ptKKSSIG28j6QZs1KEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="146276868"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa007.jf.intel.com with ESMTP; 05 Jun 2025 18:38:59 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH 2/3] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Thu,  5 Jun 2025 18:38:14 -0700
Message-Id: <faff193e6dbe86ed3076d425f0cb91e28e5739fc.1749142912.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749142912.git.pooja.katiyar@intel.com>
References: <cover.1749142912.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add debugfs entry for writing message_out data structure to handle
UCSI 2.1 and 3.0 commands through debugfs interface.

Users writing to the message_out debugfs file should ensure the input
data adheres to the following format:
1. Input must be a non-empty valid hexadecimal string.
2. Input length of hexadecimal string must not exceed 256 bytes of
   length to be in alignment with the message out data structure size
   as per the UCSI specification v2.1.
3. If the input string length is odd, then user needs to prepend a
   '0' to the first character for proper hex conversion.

Below are examples of valid hex strings. Note that these values are
just examples. The exact values depend on specific command use case.

	#echo 1A2B3C4D > message_out
	#echo 01234567 > message_out

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h    |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index eae2b18a2d8a..004587ce3427 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -76,6 +76,30 @@ static int ucsi_resp_show(struct seq_file *s, void *not_used)
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_resp);
 
+static ssize_t ucsi_message_out_write(struct file *file,
+				      const char __user *data, size_t count, loff_t *ppos)
+{
+	struct ucsi *ucsi = file->private_data;
+	int ret;
+
+	char *buf __free(kfree) = memdup_user_nul(data, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = hex2bin(ucsi->debugfs->message_out, buf,
+		      min(count / 2, sizeof(ucsi->debugfs->message_out)));
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations ucsi_message_out_fops = {
+	.open = simple_open,
+	.write = ucsi_message_out_write,
+	.llseek = generic_file_llseek,
+};
+
 void ucsi_debugfs_register(struct ucsi *ucsi)
 {
 	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
@@ -85,6 +109,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
 	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
 	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 14e3e362c54d..e7453b055ff7 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -429,6 +429,8 @@ struct ucsi_bitfield {
 
 /* -------------------------------------------------------------------------- */
 
+#define MESSAGE_OUT_MAX_LEN 256
+
 struct ucsi_debugfs_entry {
 	u64 command;
 	struct ucsi_data {
@@ -436,6 +438,7 @@ struct ucsi_debugfs_entry {
 		u64 high;
 	} response;
 	u32 status;
+	u8 message_out[MESSAGE_OUT_MAX_LEN];
 	struct dentry *dentry;
 };
 
-- 
2.34.1



Return-Path: <linux-usb+bounces-25196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB9AEBEE4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 20:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4510D188F83D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556DE2EB5DF;
	Fri, 27 Jun 2025 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCKxFTfs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722832EAB9E
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047832; cv=none; b=Cv1xT94/emFvsGipEUQfKnvyeLqymSQwSv0B1uT4q66+QQl7YZ9+OnBoMyQkl8c87oRGkk5eAzkqN28tR4byuNtKx/0iJzGKEas4EOU/uHiMkp8dantp0V8feuKjnA5ZocrAalLOoSfyTenI6lwBmjnevshmR6VI5MR5uQ6zKyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047832; c=relaxed/simple;
	bh=oce+tUENBV/+9V9lNFiv8JjyDbCvfCbvhG5Tcwejvqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FfSQSVTFAwFF/zYXrcC8UOkzlFyH1ttO0rafHwRJ4y6lPXBv2zZTJt7k6XrnnBzEF1oXHFLANOSD01o/ukujxmSrOxTD9ldcWJogm2OBdlEZi3XG0lMDDZyj4CwiqO3jcU0zZSBumn4annlNxZWbRQ1r1M0ClVC1Neehlt9FbGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCKxFTfs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751047831; x=1782583831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oce+tUENBV/+9V9lNFiv8JjyDbCvfCbvhG5Tcwejvqo=;
  b=gCKxFTfszFjAgHkH6haYT8bhFVkeiHNW0F98/i2kU0y2LfIlOQbRZiMg
   CLAM2QiBEBgf0yG6fimnp9Z6gYPCcOd1aAm9Tsd83EV9ijaDL/AW5/uc4
   9P33Bt4BgMKpYE4vg4uMV2YcWfTEuRQvqWohz2FsZpl1Ua/HIQfpYczK9
   D5QKYJNQpex3Us9rQdoRIYi7LIwea5n5X93Y1dXo3EAxY6dG/9iXxPlHA
   pTeykZCDeXnhAzJ2f0P/p+CmtovKbUC6CEsoPzLHR1hJyTA21ZEZrH987
   eGn83aCooW4rnk1dPmg3ZOKTy0HJ5SRdSuwL5Sn+yXZQtjknPGEz7eeNE
   w==;
X-CSE-ConnectionGUID: tk9jipAARaaROkvx3ETNiA==
X-CSE-MsgGUID: J1lyjvX2So+h5fxj98JVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53310003"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53310003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:10:31 -0700
X-CSE-ConnectionGUID: 3pjOIeVbQhimp+QZ89eWsA==
X-CSE-MsgGUID: Ui4vRCKqRSGfbn9rmEZlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="183773590"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 11:10:31 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/3] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Fri, 27 Jun 2025 11:10:11 -0700
Message-Id: <d43e738a9ffecc22f82b8e214f28ce0958f204d4.1751042810.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751042810.git.pooja.katiyar@intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h    |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index c3c349e712d0..6058986ea7fd 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -80,6 +80,30 @@ static int ucsi_resp_show(struct seq_file *s, void *not_used)
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
@@ -89,6 +113,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
 	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
 	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index dbc7bcb07bc0..0d1c39cfe8a9 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -434,6 +434,8 @@ struct ucsi_bitfield {
 
 /* -------------------------------------------------------------------------- */
 
+#define MESSAGE_OUT_MAX_LEN 256
+
 struct ucsi_debugfs_entry {
 	u64 command;
 	struct ucsi_data {
@@ -441,6 +443,7 @@ struct ucsi_debugfs_entry {
 		u64 high;
 	} response;
 	int status;
+	u8 message_out[MESSAGE_OUT_MAX_LEN];
 	struct dentry *dentry;
 };
 
-- 
2.34.1



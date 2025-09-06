Return-Path: <linux-usb+bounces-27617-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F4B4690A
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 06:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A3D5C46B1
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 04:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE8F26B0B6;
	Sat,  6 Sep 2025 04:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqhJb2Qq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC6526981C
	for <linux-usb@vger.kernel.org>; Sat,  6 Sep 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757133058; cv=none; b=MQqsQe7y7B8BvayiOZ36oRb6Ebc8YMiENgoehUmQyT8Mv4rUl/njKmMCgNxGBkEIje/Jh+NthtY6jvBlzgNhi/nQbpNYvMSggiiL+MdtBXZvv1SQT0nkbDKCWayncRltYzGyxCsQZ6poEqix7TErBVlbRGr3hfDhEmy0eHLN/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757133058; c=relaxed/simple;
	bh=YhfSNUnyth1o2hPAWBJRQYK4vKqqRrYH3wpRASo/QTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiTDY90W/OcXNwM4AniFdRYsi+vNy48uidn29aHugrH+WUrgfT5SrNLIYimQ2CSi+0EHx8nNyImUPxmPcQt1wkwXAySpddj+eJQGAkB1e0h1M3Wjl9Yt/1xZ58QHKgJ9i1myr/ON6p4vjGV97HLPb1GVJr0HY4BSJObOEvdcSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqhJb2Qq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757133056; x=1788669056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YhfSNUnyth1o2hPAWBJRQYK4vKqqRrYH3wpRASo/QTY=;
  b=lqhJb2QqSyxqGRc3FkvNxOSCmus6HafRTWfGiSZQdGzFmw52AG6XaTKV
   P2ZJGgpUH9q2/PlCaquJtuGVjHAqujSIgAKcsHKdKvvb8AcUanJmuj080
   h1oi00A88Fmus2Ba1pnEPxxeDmr2nLjZcUcSHhR5huHBlA866svs/jcCr
   mtEe0SP6wo1gGOMgBACZHgNSmue7JT4Hunl3g9J2sosG8Kxt9nk24gPm8
   /sxTs0XcH6JHir7Qo+pfUHNTYOJFMZS8B4ia3iV2NgHLfcQ2k87X4ruCF
   kjy7CHFTqJp0ynnZz8EvhZIeRUnfcxdDdZ/MVEPFyNvg8G8MsdaVdmNmV
   g==;
X-CSE-ConnectionGUID: pL2tzq0pRImnHYrgKI8JMQ==
X-CSE-MsgGUID: ZVE+1NpjRBKnMh0kHPvU5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63307769"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="63307769"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 21:30:55 -0700
X-CSE-ConnectionGUID: ntkH5AzUQvamuKgu1TDVfQ==
X-CSE-MsgGUID: H78eoA28QtCtyx+7ZkB6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="173128891"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 21:30:55 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 3/4] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Fri,  5 Sep 2025 21:31:00 -0700
Message-ID: <5f5f5f905f2b5d9208f51eafa4c228c25d11dbef.1757024530.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757024530.git.pooja.katiyar@intel.com>
References: <cover.1757024530.git.pooja.katiyar@intel.com>
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
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 0a20b966578c..6904722790ba 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -81,6 +81,30 @@ static int ucsi_resp_show(struct seq_file *s, void *not_used)
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
+	ucsi->message_out_size = min(count / 2, UCSI_MAX_MESSAGE_OUT_LENGTH);
+	ret = hex2bin(ucsi->message_out, buf, ucsi->message_out_size);
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
@@ -90,6 +114,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
 	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
 	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
-- 
2.43.0



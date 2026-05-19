Return-Path: <linux-usb+bounces-37735-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YANXLFyvDGrdkwUAu9opvQ
	(envelope-from <linux-usb+bounces-37735-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC49583D17
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2C713011A53
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BE136C580;
	Tue, 19 May 2026 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvF5GHuB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA536B07E
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216216; cv=none; b=LOCUad0H5eU7dBG8Hwhr0b5/mhE3Z13zVNQSY7Nov/Z2LM8nsuFkPu+Wk/ATlaFd1iN05+JJGww9pagsLBXmk5jIzYXBvSJlwtvOyCFGkV+aTcnEr/3caXrsYDqucoYq/VSqw/KFMrT1Wazs1riVwzAXUBHVeqFPHpRGjw41ckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216216; c=relaxed/simple;
	bh=1pmqSVjxdN/lpfNg7o0N2PX4DXnem3dtrIsYC6UqeXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZCt5I1iavzhza5CONu4aWllLzDA5FzjI0Jfw+Hdxbv/Tfs024wDTzX9tbpI24DgEII2+dyKGFQledEJkUT8CSfrahE5GHS+oMbpNkWjDxX5P5lwQhvQ0vHvG3WrdDlOtLNgjUw3MfOphHzXhxMFDB1LfGA4Y/huJ1fSYbUHLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvF5GHuB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779216216; x=1810752216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1pmqSVjxdN/lpfNg7o0N2PX4DXnem3dtrIsYC6UqeXU=;
  b=jvF5GHuByPSQemxoEkAg67ypW7vhXFj6euuTMUOBJgem2heJnWDHmIui
   4tI9NKn5BuiRb4Jpw5LlT+3xwDGamziRiWRRNtZShCJbKjwTOIj1CNQx9
   sVqcwbaHwcs1xPouN3c0XCQk7lX+2kgs3SskWxsl2XxugjCDc+AEzmrRO
   NM04egrtBT7B7VoxvLTwfvmqQtYOA6AoSDmTemWE/bXAPzXJbiDH55KP9
   NfV6Irs2/uSAIOLm+J166Xxya9odXaZEy2d4jdPX/ZrhvU3h+V8j1bh0M
   nNl6sro0uLyoANbBqYYI32msgI+ZdsGEp9xtgFrlSMccQiMdmfTH3HA3K
   Q==;
X-CSE-ConnectionGUID: d5Iynm7NROWW0FCe5zWk7Q==
X-CSE-MsgGUID: 4kEmHg12R+Khym0kvz6qSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102783843"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102783843"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:43:36 -0700
X-CSE-ConnectionGUID: WhK4PHKAQ56+ddzn245Jow==
X-CSE-MsgGUID: VRXWYqAFSFG46wQCgha2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263633799"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 11:43:35 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	heikki.krogerus@linux.intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH v8 2/3] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Tue, 19 May 2026 11:45:13 -0700
Message-ID: <812820ed3caae2d9ab86e4b26022c5a36b645f86.1778798352.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778798352.git.pooja.katiyar@intel.com>
References: <cover.1778798352.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37735-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 3DC49583D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changelog v7:
- Added changelog.

Changelog v6:
- Removed message_out field from UCSI structure and added it back
  to ucsi_debugfs_entry structure.

Changelog v3:
- Updated debugfs message_out write handler to use message_out fields
  in UCSI structure.

 drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h    |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index a4b9a6b51649..be987e53a8bd 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -110,6 +110,30 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_vbus_volt);
 
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
 	ucsi->debugfs = kzalloc_obj(*ucsi->debugfs);
@@ -122,6 +146,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
 	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
 	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c8e4d7b9c25a..0558b4c39631 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -455,6 +455,8 @@ struct ucsi_bitfield {
 
 /* -------------------------------------------------------------------------- */
 
+#define MESSAGE_OUT_MAX_LEN 256
+
 struct ucsi_debugfs_entry {
 	u64 command;
 	struct ucsi_data {
@@ -462,6 +464,7 @@ struct ucsi_debugfs_entry {
 		u64 high;
 	} response;
 	int status;
+	u8 message_out[MESSAGE_OUT_MAX_LEN];
 	struct dentry *dentry;
 };
 
-- 
2.43.0



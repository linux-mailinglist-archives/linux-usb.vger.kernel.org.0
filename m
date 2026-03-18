Return-Path: <linux-usb+bounces-35079-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEWgFYAmu2kcfwIAu9opvQ
	(envelope-from <linux-usb+bounces-35079-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C722C35AC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C02A1303102B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 22:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EBA36F41F;
	Wed, 18 Mar 2026 22:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8ljsXIY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFC3093B8
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872764; cv=none; b=Fffjm7oLzmkSN/9nKXkcA3KK3wIE0CXJRlBvEJr4rm7YHoy3gOwFlhNAu4JFQ2ApZ9eE0Oyp/VHP6pCTVVeZbazHMSMbx6k8qS0f7QgwXevbTN/kVyyC1HBCxIHQBqol0LRtbqAYImoENLq3gdn6rKdLiJdUpB2g3eH9gZK4bbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872764; c=relaxed/simple;
	bh=nru6dcxCt9Y8Sq8MK94VWdxU6NLM5sFp48Rf2rwlEPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btzgRfFEytvt+npcbzbBlI1MyAJ3UxreIpDFZgmRHKbPB+8/Sb/XmjCMcQY1V392WawHI//jW0kxX+Fz41eM4BI9hznxS19yEuaZeKw0HhycDrXQCiYW0XDCkRpF1xcOKIyHx8RCdGbtGSUNNEM4l1Xc7HwrpXalM7z6Tgu8sCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8ljsXIY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773872764; x=1805408764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nru6dcxCt9Y8Sq8MK94VWdxU6NLM5sFp48Rf2rwlEPk=;
  b=Y8ljsXIYO+gBct69dNMwHACwKiMD2GocgG93Cso7+TvjiqlQlW8QK48V
   r1p85cHYtfyo7NZ2WcaNSn34zXkeaO/B78r/RnNPZY7TIhW/Wwfq5LSf7
   rcfcsi2tIQKsznQSRkjBBTLaYGlQ8eIppzmBF2Mhgi86kEAa/abDIlbuz
   qKd2vjwECepA11qp3BIkTcnicKLIqyC7UnjtE93iQ3LpovFmrJVre+2rm
   jAlUiZ49MerxweKFjtWxoauqbh9PA1Rk7IofLZLGALO54El8EH44mFPww
   Q70GkW9NhidbwtBltlMA+hXlTXPDmiz+Vxzk4Xj4mSg6BrADQhg/sjO5x
   w==;
X-CSE-ConnectionGUID: tVjeheCRQJq61MC0Fd8u7A==
X-CSE-MsgGUID: PEO3sPwRTSKtHW4tdI8GWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74637581"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74637581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 15:26:04 -0700
X-CSE-ConnectionGUID: j0RyHoxJRF29D72O9bQfUg==
X-CSE-MsgGUID: IjvaIDd+R723PtGmuxj29g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227467452"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 15:26:03 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH 2/3] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Wed, 18 Mar 2026 15:25:30 -0700
Message-ID: <fd1d0eb97753925b5621c7913576b899c024cfa1.1773090896.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773090896.git.pooja.katiyar@intel.com>
References: <cover.1773090896.git.pooja.katiyar@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35079-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6C722C35AC
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
index 82565f502bdf..e51a8472fc27 100644
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



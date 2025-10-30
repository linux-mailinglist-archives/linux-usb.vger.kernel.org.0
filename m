Return-Path: <linux-usb+bounces-29902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B557C20B2A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 15:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 079BD34DE4E
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AC227F010;
	Thu, 30 Oct 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kE6aXI9i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355AA2773DA
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835715; cv=none; b=hk+EGcBriUPEObWj5AaO7rPs4SBdfBek1cZADvwEp0ceoXBSbOy8vOZfqbtXDSy4aKNOwlhIAuJuzhwwSKDNHfVwD/KC3TfMIhqJvyV9f+S2xqVuuo6HmZGq/Noe5SxOuU9BviQrQ3Z4fdSUxX34jPLRc0DC125/6yslf0seBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835715; c=relaxed/simple;
	bh=8qZVfLD8eoanX5MDq0ZIIuk+Fhdb6tPrqMJPa+kk2OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEy62Rhb9fjretsGOoZmqDwuc+y7smSjvsI6oXvOD7ngsVl1uiR/lEA5YC4abpwmiMwsCZS7YxkvWpnLFt4ZTveFn+VzLGGZIvFhkdlric2ob9L2OmjXoA1ZM1HWaUiKz7YBWOob98tyFtf3Q9hJF5GKzCkqD8Rg68M4+0LFeRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kE6aXI9i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761835714; x=1793371714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qZVfLD8eoanX5MDq0ZIIuk+Fhdb6tPrqMJPa+kk2OM=;
  b=kE6aXI9iUIIZZ3nlhfjnsf33D2YpDtxuPUgb+FT5e0WDIbNUmvJmYZUu
   ruqVzL9rxbOP3iR8sEFRVonrrE7Rfy2f+FVTomDqiRi8lN0K69we+cOUU
   yqmNg7Zwo0JvttMWO+9+RHDD73ob3dIPoM6WMTVxr6XeesAH6xo/PIfhY
   0iE5e/dh/LbDhycBGA2j7Fnxve1x3jouddwbffN8XjOfb2XezCcJTm7oj
   bo8vgmzjW9qX0Fcvx1XUdHPlqJVsqJS+7HeeI5heHtrDcshvRVgGey+Pu
   9CkbfW+br6iHysJaDPd6W6KgARgb4mPBN/XuIEmdW3qqN0K0h73UNp0fa
   w==;
X-CSE-ConnectionGUID: RitbiGBwTkye8aTA1lvpPw==
X-CSE-MsgGUID: aVbfx3N+S1qgaE5xpcdhTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63679257"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63679257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:48:33 -0700
X-CSE-ConnectionGUID: eQbGqvrBTbClGp+pAMhTSg==
X-CSE-MsgGUID: 2CZdmYBuRA+fqFrbAGkv6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185631506"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 07:48:33 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v5 3/4] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Thu, 30 Oct 2025 07:48:57 -0700
Message-ID: <0a81c2209eb299c1af191cd7ce758a92d5adf81b.1761773881.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761773881.git.pooja.katiyar@intel.com>
References: <cover.1761773881.git.pooja.katiyar@intel.com>
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
Changelog v3:
- Updated debugfs message_out write handler to use message_out fields in
  UCSI structure.

Changelog v2:
- No changes.

 drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 4bf3a8f65a4e..0693acf04c37 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -109,6 +109,30 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
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
@@ -121,6 +145,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
 	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
 	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
-- 
2.43.0



Return-Path: <linux-usb+bounces-29901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBAAC20BFC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 15:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF3F34EC87F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 14:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3F3274B23;
	Thu, 30 Oct 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df2h5Pog"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF161FBEA8
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835715; cv=none; b=mUPlCk6nnczLV/1wN44K8YX3NH6nCWWrUILhJFxi0jAYCtvFz7e4ak4QM//zZcRU9MmIMv9GK2PZyKJrX7K+wcF0RlYiApgU+jTQqx5g4wfhMCQp9NXCE/BJTCK17PHRmZAHSebHexo9wfW5d2OQ9AQ451BfzC1R/mAc58ijtAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835715; c=relaxed/simple;
	bh=yoJDLEjnF4BWl+bk/p2Hfs0K2GKGjoA8NnOQpRWd4Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzyfCBBI8+AdYNBJ1NDV2G2dpGzPk1cPX44TcALhFR6e/fjDkIILnNoWjjJJdN4zIkc8RXtEl45l1K7vvG7WvjUcD2cWn5K81IzAQLT7dSh33r7ehJ2MvXZu7duuQfWPNL0pkeUkThpPHIGWc8Jt4vVvixsixmGo4bpojn2dCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df2h5Pog; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761835713; x=1793371713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yoJDLEjnF4BWl+bk/p2Hfs0K2GKGjoA8NnOQpRWd4Bo=;
  b=df2h5Pogl8qjPXEQJusl9FvVHDX06IAyicqIZ1OcjyFD8TbbVqba26oZ
   035CgbDycxFK04efhw3Jw3FzolwXLg05fZrTD4CMrLDA9faxEhlIuLb9k
   4+XoWzimbbfdzb8Xv60TMPMQ/5eU1umzKqQUX3g8c7EPQ/EoznRs/IxKI
   n0CpkYmtP0VV9J2R3faZwOh3B6wnYLCC8gqURnEaVYlLibfWgMQDhRhUw
   K6ozAGwAtf8LuozHWb7nDtkWuYYeXJZxV0IgBJ9jZYooVuJT785D52m1C
   gQtYsJqS18t9x7dmuNGcnwZYOoJ624HiSm7fvcYsWgJxBbRN7ZpdfwsZa
   A==;
X-CSE-ConnectionGUID: 79yqZJHNRwixuENNmOZd4Q==
X-CSE-MsgGUID: n1XkA8VxR5WpqNswtI5iag==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63679255"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63679255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:48:32 -0700
X-CSE-ConnectionGUID: 3aoGMDOoQf6/BxHpDkUeCw==
X-CSE-MsgGUID: nhphEkDgRD6m2r4nNKis3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185631503"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2025 07:48:32 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v5 2/4] usb: typec: ucsi: Add support for message out data structure
Date: Thu, 30 Oct 2025 07:48:56 -0700
Message-ID: <5bb1f367e44c9fc5244c3e10e513f02d62fe8166.1761773881.git.pooja.katiyar@intel.com>
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

Add support for updating message out data structure for UCSI
ACPI interface for UCSI 2.1 and UCSI 3.0 commands such as
Set PDOs and LPM Firmware Update.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v3:
- Added message_out fields to UCSI structure and updated sync_control
  to perform write operation.
- Removed extra DSM Write call.

Changelog v2:
- Moved write_message_out operation to .sync_control.
- Updated ucsi_send_command to accept message_out data.

 drivers/usb/typec/ucsi/ucsi.c      | 14 ++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h      |  2 ++
 drivers/usb/typec/ucsi/ucsi_acpi.c | 16 ++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ee0c0d77e67d..ae199e5683cb 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -67,6 +67,20 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
 
 	reinit_completion(&ucsi->complete);
 
+	if (ucsi->message_out_size > 0) {
+		if (!ucsi->ops->write_message_out) {
+			ucsi->message_out_size = 0;
+			ret = -EOPNOTSUPP;
+			goto out_clear_bit;
+		}
+
+		ret = ucsi->ops->write_message_out(ucsi, ucsi->message_out,
+						   ucsi->message_out_size);
+		ucsi->message_out_size = 0;
+		if (ret)
+			goto out_clear_bit;
+	}
+
 	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 76343285be59..8c79e6699020 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -69,6 +69,7 @@ struct dentry;
  * @read_cci: Read CCI register
  * @poll_cci: Read CCI register while polling with notifications disabled
  * @read_message_in: Read message data from UCSI
+ * @write_message_out: Write message data to UCSI
  * @sync_control: Blocking control operation
  * @async_control: Non-blocking control operation
  * @update_altmodes: Squashes duplicate DP altmodes
@@ -84,6 +85,7 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
+	int (*write_message_out)(struct ucsi *ucsi, void *data, size_t data_len);
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index f1d1f6917b09..f9beeb835238 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -86,6 +86,21 @@ static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return 0;
 }
 
+static int ucsi_acpi_write_message_out(struct ucsi *ucsi, void *data, size_t data_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+
+	if (!data || !data_len)
+		return -EINVAL;
+
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		memcpy(ua->base + UCSI_MESSAGE_OUT, data, data_len);
+	else
+		memcpy(ua->base + UCSIv2_MESSAGE_OUT, data, data_len);
+
+	return 0;
+}
+
 static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
@@ -101,6 +116,7 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.read_cci = ucsi_acpi_read_cci,
 	.poll_cci = ucsi_acpi_poll_cci,
 	.read_message_in = ucsi_acpi_read_message_in,
+	.write_message_out = ucsi_acpi_write_message_out,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_acpi_async_control
 };
-- 
2.43.0



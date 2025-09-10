Return-Path: <linux-usb+bounces-27842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0AB50A85
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 03:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFFC64E5F66
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 01:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CA22253FC;
	Wed, 10 Sep 2025 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/7kmurk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3BF223DD1
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 01:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469116; cv=none; b=ZwvIzzwY/upvh+zLBvP2z0SuSlS/5Aars8SdGSL6EOEZFtgNatiXS1zjyQT8v7qzPypls+5lPY3oRvGbuPpzG++5M9Z9vJKCyL3LcJqne6lvI/V/NFwuEBzY0GlL1xbPNkB1cOeuTi6U/v1pA/O9uoFF6SOykiKaFk+CULnBtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469116; c=relaxed/simple;
	bh=yTx4bXHO6RFl4BG0JLhdMvjFLEeLzku9leuee60Oyjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxlxIbCKgJGobieDmBzOrIvDmhPmLgq87X12QfAda6Ap9IqV0KDp249/5BSBIs41a/sGX+gGbX5Nuhl7Ld/Vd6RAiorTUtjnbOuhhXAesjQk/8Y13wmkLHxqu4BZGnPaE3ReAHmiA9JOEKrJYtmsXg2opMwl8GKImTHzGzp8EfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/7kmurk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757469115; x=1789005115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yTx4bXHO6RFl4BG0JLhdMvjFLEeLzku9leuee60Oyjk=;
  b=f/7kmurkK4QobIWKT2jJD5hmPdWx1RSWKsofi/u5qMNy5v8LWdH5z5jh
   0V6ZhZlyTmYhcq+KYakksF4WV4dZ7NgejieWX2E0uSjNcnTKt8Ryvx4y2
   9qecj27YHFoTPLBeLxyC1V9EyRSdhCeJYigu+QAVoSSEonjtDRfEByOZi
   /aTyNVpxe1uxqBtLXT/vjVjuUu+QmkH/3eJF8RC+hF1gYpTPggZnUQtme
   MSrqDu1cM0L2ADut+tOXJ92pXn0Rdu0mF8qAi+eipXdZyQwlh+5DsfUcp
   qOrFMstTmyJ/bODt4g97qF7fnQ3l+ncrO4e/RhrUqvVO2b1rUm/Zvgx1Q
   A==;
X-CSE-ConnectionGUID: hXygu74HT/SmKW8F6zpoYA==
X-CSE-MsgGUID: s/bqNZzXQ++rUmFsZTczGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59692223"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59692223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:51:53 -0700
X-CSE-ConnectionGUID: +bIlq38cTCCSLV6qccfA/g==
X-CSE-MsgGUID: xBdBm28tSIyrAQ6IXgydjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="174039174"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2025 18:51:53 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v4 2/4] usb: typec: ucsi: Add support for message out data structure
Date: Tue,  9 Sep 2025 18:52:05 -0700
Message-ID: <429be91c2fdc038c266103083457ff9086e26d2e.1757374784.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757374784.git.pooja.katiyar@intel.com>
References: <cover.1757374784.git.pooja.katiyar@intel.com>
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

Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v4:
- Fixed build errors reported by kernel test robot.
- Added changelogs.

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
index 073b80cfa414..a82088554a40 100644
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
index ba21fea53cb7..e6ca70f7fa1f 100644
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



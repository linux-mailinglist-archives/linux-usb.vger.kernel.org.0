Return-Path: <linux-usb+bounces-27615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46196B46908
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 06:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA865C4679
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 04:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7877B254877;
	Sat,  6 Sep 2025 04:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWnbLBFn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2432673BE
	for <linux-usb@vger.kernel.org>; Sat,  6 Sep 2025 04:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757133056; cv=none; b=NuI+AL5bVAYQda1DN3YEm65w16MDEXJBBkevQ3cAuMch3GcPwXM/uVPoLQZhC8L6vfLtkZv9zkHAxPRL0uuIfkxYYUHAqkJyvG3WoW3uPa7RMdfdX0ZZHqcqyTkIcahAKEW4zBb1HvKkoBH+xPo2ZwfhauF7C74DnVuxpp48K/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757133056; c=relaxed/simple;
	bh=LBhLsqKNzHtcwEGIhyZKmskZMwgVOLWLIZC8Dw+C5Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLwMBL+g/AQPSX6tb0DpF0Yc4nscDH8ka6kgH/eVZLuQmqnZ/sf4LqykqFkF8avMfCcKI62cQFxuRLRzH92gEVOxMEWu1ZCIUpLt6WhN4568eBvcTNeyMVO3UUBvXLMc6xFuOnAFZqYLSuJZMuWMbGFL4j9jQrha7UyKQQelbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWnbLBFn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757133055; x=1788669055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LBhLsqKNzHtcwEGIhyZKmskZMwgVOLWLIZC8Dw+C5Sc=;
  b=OWnbLBFnC840sqzEsYFxcWV5rZcY7jlh7Y8Bp53pPY7oWIh0sofadPdG
   /GqbT5T6XcVqbeHZ8fAH1R0IFSdKH2l9qnGIPll05zsWXEoL97scelCsi
   VmrONU+PCilZ8faS3MIPZCNPv8tRExa3HvOdOJLcflq4eelT9fUQ0i5mO
   8WTt+5OEsPXMkg5VZu8FVWM8BXbPIbqmVYjCWN3iifur4YuL1Q8xKUy0C
   /xcIzgA4TZf0/IWaU4wyiVKFNxWiNH9sXzbaUSQCa8/bI4vlwyvLL4k5y
   Wo5KpR1Yb78Iuw3Y2xTp+JOZ3IyTzEvEsrk1ccLm7VHzP8qLe7+WfwEiK
   w==;
X-CSE-ConnectionGUID: QuBxL7DtSymy2NI4jhCtug==
X-CSE-MsgGUID: eFkfTlICSCOJYKwEl5Z0fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63307765"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="63307765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 21:30:54 -0700
X-CSE-ConnectionGUID: Qb22doz8QGuFDUwv7UiL5g==
X-CSE-MsgGUID: l9axec7dS8CNGeImIOn5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="173128887"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 21:30:54 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	pooja.katiyar@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 2/4] usb: typec: ucsi: Add support for message out data structure
Date: Fri,  5 Sep 2025 21:30:59 -0700
Message-ID: <b2131513a3ab5eca0425b6bf62a8d5729fafb88e.1757024530.git.pooja.katiyar@intel.com>
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

Add support for updating message out data structure for UCSI
ACPI interface for UCSI 2.1 and UCSI 3.0 commands such as
Set PDOs and LPM Firmware Update.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c      | 14 ++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h      |  2 ++
 drivers/usb/typec/ucsi/ucsi_acpi.c | 16 ++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index c953aa7d5283..02e43687c3f6 100644
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
index 673f57eb7842..d932fa1a40b9 100644
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



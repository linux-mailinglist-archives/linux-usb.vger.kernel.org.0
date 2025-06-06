Return-Path: <linux-usb+bounces-24531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF051ACFACB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 03:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0813AEE3B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 01:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7E93596A;
	Fri,  6 Jun 2025 01:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nmjpv+1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4352BD1B
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 01:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749173929; cv=none; b=F67XcnyuOFUGXtZ9tdgfSu3laBZnAlqo5oMWhyp9ijk9AfE3SGwPNwwbA0VKqhb2WpKIK30HiTtFLhjKSB692qv7v0sMrCODao+dZEhpgHc9Fq9hs0IpTHxR2GhPRCZsCUkZHzIXPa+otW81oa5SkI48gs2NOGbMUhDA+LsCAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749173929; c=relaxed/simple;
	bh=3jUQ9Ocy6Ru2CZgNAylcRjqTTpOBSPPJ34sgvgYxOcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GkWnO2Xu+ljELA6f6kwT5qy/Rlx+fnP1lnYH5LlH0Hx4Ek25Q2DAveGJol+qA1mb3vX28ZLjlU+1BCUfmAjcdqiEma3+yqiAKiA0xwa2FzQ3VZVAcSfKXnWZvX8Z5GfhTaGKEhRIDt/mjHeYZH+l5eZ+Gehyi9XvErrjpur7mlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nmjpv+1g; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749173928; x=1780709928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3jUQ9Ocy6Ru2CZgNAylcRjqTTpOBSPPJ34sgvgYxOcw=;
  b=Nmjpv+1ghL0NV7OHFbRVm1O2wMCDFAhPfil6QRbnCSSctsLKwdHTWguO
   GD9OzxOjBHFcFjx+E5jUmp1pB2GhW5lS85hcG+MX/4TvhCjA1/HK43KWm
   O9XOvG7ruhtTU0zZFx6qb7Woves9VbJFevqHeTXuV4603kATUpcUEac7K
   SRG2t4zHpgtPSzb7zKTg3vvKipjB0GLF6ycdm9oRL8krFwX7HhT1cSQpR
   xfqon/O6W0L5QNI9/UlmupepwsYqM0lvuIl8Urq/AsFpUo4b5gaXHon3W
   MD8qStntubDpcjBOmuL/XQfBkAXvEV+ZBDnHjzrexdgOKkvjZmwx2gRhg
   g==;
X-CSE-ConnectionGUID: nFhDbhq+TVWtvyD9LMLaoQ==
X-CSE-MsgGUID: e6dafjgoQZOXOHeyj4I9QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38947572"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="38947572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 18:38:47 -0700
X-CSE-ConnectionGUID: slQdRHSdQQqdcjdkzeeuCQ==
X-CSE-MsgGUID: p/d/ddRpRoafL93ES5Yb6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="146276831"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa007.jf.intel.com with ESMTP; 05 Jun 2025 18:38:47 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH 1/3] usb: typec: ucsi: Add support for message out data structure
Date: Thu,  5 Jun 2025 18:38:13 -0700
Message-Id: <fc7574af6943abd10d25583c43add275f189270a.1749142912.git.pooja.katiyar@intel.com>
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

Add support for updating message out data structure for UCSI ACPI
interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
LPM Firmware Update.

Additionally, introduce a wrapper function to access this operation
via debugfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h      | 10 ++++++++++
 drivers/usb/typec/ucsi/ucsi_acpi.c | 16 ++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 9c5278a0c5d4..14e3e362c54d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -79,6 +79,7 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
+	int (*write_message_out)(struct ucsi *ucsi, void *data, size_t data_len);
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
 			    void *data, size_t size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
@@ -532,6 +533,15 @@ struct ucsi_connector {
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
 		      void *retval, size_t size);
 
+static inline int ucsi_send_message_out(struct ucsi *ucsi,
+					void *data, size_t size)
+{
+	if (!ucsi->ops->write_message_out)
+		return -EOPNOTSUPP;
+
+	return ucsi->ops->write_message_out(ucsi, data, size);
+}
+
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 6b92f296e985..01d85e079d08 100644
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
+	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
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
2.34.1



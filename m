Return-Path: <linux-usb+bounces-11606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A6915914
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 23:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EE721C22155
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 21:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B041A08CF;
	Mon, 24 Jun 2024 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klrMYFCE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB82233B
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719264834; cv=none; b=PHahWa+msQgUkW3nWPwYEOawxBy9fKVGxeWTSYO3hiXQedOjIB5Lf2gzA+dSZ933fon5XdbH6PL/4zdM2OFeALD1T4ZOC5QTlEjA5Wf+ZW998WcRSQcMda0yTAVgYfZKkCd8g0oYCSmUj+LM3LqNuoTOcvRd7EdiZbhI7Kv0VRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719264834; c=relaxed/simple;
	bh=GgKw4AlDV/tYiAX2rONV4hlR8YRZdM4Pb3vzK0X9E/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dF3/BTD1+7G4o8OOvTwIClBBwiUrI0SNgkQvjBnHRMXu87Zu7GrdJQF4GLtbMyWAnHonA9G6tQzVTcfHT9dK9ObwPBJ23rBrq9tfCn473vAs0lmaCIsLghLcolfNihUpxLLJ9YyvYM3xowZQsQqGHzeij26npUvA8xYDf0NrDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klrMYFCE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719264833; x=1750800833;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GgKw4AlDV/tYiAX2rONV4hlR8YRZdM4Pb3vzK0X9E/E=;
  b=klrMYFCEgkQTrNXbBSNW5VrhV5DGTvV5LgLo+nTP1xkxqqzWNDWuuJsD
   s5Wr7BpFFmEJ5D7tzmSNvr/8QtIwHlD3rdSds2XLT0fdPENLrjFKoj9p4
   2a8o+Nckz76RVtmRuqhA4s4SsRfQbUaXneRjSqmH3AmuD/xC4/3mvOstn
   zvq1gzvjrLVz37rpvTkRrS1n6ODi+8GVLbr756G2+rSFSufvB4Z+Ipuih
   OCUvFb4s/n8iJW+etvtR+0MHYzJRDJVFM0La57XKis3+w00hGbc3vTimi
   E2cqDFSSGqNvRL2M2f13mmfHRUR3YE/0WMgBd4dNiaL7zODHu8r4R+mst
   Q==;
X-CSE-ConnectionGUID: /H9uURL9TVm7WRSGLRnHkA==
X-CSE-MsgGUID: YNMugVQ6T7ybuI17FGK8XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16013399"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="16013399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 14:33:52 -0700
X-CSE-ConnectionGUID: VKKH6yoRR76QLZAe5gD02Q==
X-CSE-MsgGUID: b83eRgeETTyyP3kNtMkWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43304843"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa010.jf.intel.com with ESMTP; 24 Jun 2024 14:33:51 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@intel.com,
	pooja.katiyar@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v2] usb: typec: ucsi: UCSI2.0 Get Error Status changes
Date: Mon, 24 Jun 2024 14:33:59 -0700
Message-Id: <20240624213359.1270018-1-pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI 2.0 Get Error Status command to add connector
number field to the command structure.

Connector number field is extracted from the previous UCSI command
which has failed and is used to get the failure reason/Error using
Get Error Status command.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Change in v2:
- Rebasing the patch to the latest USB tree tip to address the patch
apply issue

 drivers/usb/typec/ucsi/ucsi.c | 29 ++++++++++++++++++++++++++---
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2cc7aedd490f..016ba2f4583e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -65,8 +65,9 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
 
-static int ucsi_read_error(struct ucsi *ucsi)
+static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 {
+	u64 command;
 	u16 error;
 	int ret;
 
@@ -75,7 +76,8 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	if (ret)
 		return ret;
 
-	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
+	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
+	ret = ucsi_exec_command(ucsi, command);
 	if (ret < 0)
 		return ret;
 
@@ -128,9 +130,30 @@ static int ucsi_read_error(struct ucsi *ucsi)
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 {
+	u8 connector_num;
 	u32 cci;
 	int ret;
 
+	if (ucsi->version > UCSI_VERSION_1_2) {
+		switch (UCSI_COMMAND(cmd)) {
+		case UCSI_GET_ALTERNATE_MODES:
+			connector_num = UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(cmd);
+			break;
+		case UCSI_PPM_RESET:
+		case UCSI_CANCEL:
+		case UCSI_ACK_CC_CI:
+		case UCSI_SET_NOTIFICATION_ENABLE:
+		case UCSI_GET_CAPABILITY:
+			connector_num = 0;
+			break;
+		default:
+			connector_num = UCSI_DEFAULT_GET_CONNECTOR_NUMBER(cmd);
+			break;
+		}
+	} else {
+		connector_num = 0;
+	}
+
 	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
 	if (ret)
 		return ret;
@@ -160,7 +183,7 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 
 			return -EIO;
 		}
-		return ucsi_read_error(ucsi);
+		return ucsi_read_error(ucsi, connector_num);
 	}
 
 	if (cmd == UCSI_CANCEL && cci & UCSI_CCI_CANCEL_COMPLETE) {
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c4d103db9d0f..608d88f3b827 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -116,6 +116,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
 #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
 
+#define UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(_cmd_)	(((_cmd_) >> 24) & GENMASK(6, 0))
+#define UCSI_DEFAULT_GET_CONNECTOR_NUMBER(_cmd_)	(((_cmd_) >> 16) & GENMASK(6, 0))
+
 /* CONNECTOR_RESET command bits */
 #define UCSI_CONNECTOR_RESET_HARD		BIT(23) /* Deprecated in v1.1 */
 
-- 
2.34.1



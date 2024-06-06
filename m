Return-Path: <linux-usb+bounces-10941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084D8FDB7E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 02:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F36D2849CE
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 00:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B42C8C0;
	Thu,  6 Jun 2024 00:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DN4rWgBp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77CEAC7
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 00:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717634014; cv=none; b=Dkvm2bhzbyq7W2BYKuemKSOnllgEcX0QoyeaY3OL9GoJUMyonRa/teKsBB1tMq6XjGXBinjEzNtfaBilPWcHWl9Ht6S1GysqBzn99A24LBqUH3NQTMkQd8eGlwHTJh8NXFrl97J+SAs43At1SJXTbFWmWY2m4CdLA6WB+fACzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717634014; c=relaxed/simple;
	bh=PWu+Mdmn5vWax/jE+X3fiIhQcWIwiH323ISaKGnWq7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CeREHLi0BGD5vqgXAG7oXi/Ocg+jn1wkeu1hQH+MDIDK0oKQ8uEw0VFJPdAD+0bgfrRi2nG8haHkHy71vXOT/h4CesZwS5Z3SCZ1RSRpYt85eJinJ0pHlFhEFu85IrsjWgoi9L1TWQx1YCN2Bo9B3pIw210nph6t11GYOJEd8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DN4rWgBp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717634013; x=1749170013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PWu+Mdmn5vWax/jE+X3fiIhQcWIwiH323ISaKGnWq7Q=;
  b=DN4rWgBp7QYwGo/LGBwJGlJqhcEMXnG72mf4NNqt37NX82UXfkrM5PA2
   BxjKcX/zTMJFmrs5U1FqvTcpiINz38P7y1FYO0QbkJyrLUHpq7vhnO9bg
   e2hQsNGMzpR40HOkqGtV2brbwhBPdPKjjiQhB8hFI49RQLqnN3VN9oqHz
   MHDUnP+ZTd3W4/JEQ12od//mWnK1fc18S2Kp+DH+/OtBcKPwBIR5pGl5n
   teRylZr5hGaRigeb+TZWOGGIqg2kP+rLkUXdPp7CFr+SrTHqrK42J4DXo
   kcP0kYQdqPcWYeJhN9ZxdAXgWK4X7tM1yPVuBF2ZxVk5QXq2O4TZD6Bc4
   w==;
X-CSE-ConnectionGUID: fPS355psSgyA0g3y/heMFg==
X-CSE-MsgGUID: h6rFoJxHRVydWfNSWV9ufQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11931192"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="11931192"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 17:33:32 -0700
X-CSE-ConnectionGUID: eb+gykrvSgOp4Tdn9m9OGw==
X-CSE-MsgGUID: aOhvusToSimFD06dTAwqvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42192957"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2024 17:33:32 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	pooja.katiyar@intel.com
Subject: [PATCH] usb: typec: ucsi: UCSI2.0 Get Error Status changes
Date: Wed,  5 Jun 2024 17:32:11 -0700
Message-Id: <20240606003211.1337526-1-pooja.katiyar@intel.com>
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

 drivers/usb/typec/ucsi/ucsi.c | 29 ++++++++++++++++++++++++++---
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bd6ae92aa39e..d6037ec2a642 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -71,8 +71,9 @@ static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
 
-static int ucsi_read_error(struct ucsi *ucsi)
+static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 {
+	u64 command;
 	u16 error;
 	int ret;
 
@@ -81,7 +82,8 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	if (ret)
 		return ret;
 
-	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
+	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
+	ret = ucsi_exec_command(ucsi, command);
 	if (ret < 0)
 		return ret;
 
@@ -134,9 +136,30 @@ static int ucsi_read_error(struct ucsi *ucsi)
 
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
@@ -161,7 +184,7 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (cci & UCSI_CCI_ERROR) {
 		if (cmd == UCSI_GET_ERROR_STATUS)
 			return -EIO;
-		return ucsi_read_error(ucsi);
+		return ucsi_read_error(ucsi, connector_num);
 	}
 
 	if (cmd == UCSI_CANCEL && cci & UCSI_CCI_CANCEL_COMPLETE) {
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 0e7c92eb1b22..349fbdc819c7 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -111,6 +111,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
 #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
 
+#define UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(_cmd_)	(((_cmd_) >> 24) & GENMASK(6, 0))
+#define UCSI_DEFAULT_GET_CONNECTOR_NUMBER(_cmd_)	(((_cmd_) >> 16) & GENMASK(6, 0))
+
 /* CONNECTOR_RESET command bits */
 #define UCSI_CONNECTOR_RESET_HARD		BIT(23) /* Deprecated in v1.1 */
 
-- 
2.34.1



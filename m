Return-Path: <linux-usb+bounces-13250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B617994C741
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 01:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6082E1F22CD6
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 23:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B92415F404;
	Thu,  8 Aug 2024 23:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7UiW+vG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0D15F303
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723158876; cv=none; b=rjOx6Jkrr32ZZHeukxVME7qlWxlyJqdBuFUZsWQiseDQr4aoOeEqZKph++rxBPw+5wtzrHrmAdGKyRiQh1HnUX0wYzo+pM1LAYrSksA6KIY+4XHV3Tbiwl88fOsKlk7hTunOkZRFR73UgxWOEArEmjTNHb/p0RHL3udsJX99rX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723158876; c=relaxed/simple;
	bh=+j26Pq03xPtEY/N0a1hoZ7bDghSj/EIn7I1VMji0gyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b00dv/lsID8fFuP83lUBdDCjoPxCREGhp3Qbdb4ghQF6nXGGS67ZvQEsv300icJ2ybT9APd1ceXrVt4xfzdAZysHy1mWY3IX4a6X74JdO4yA3Yvnitbam7ew9eZtfU3hPu7Ei7ZCrM9MDL/DEr93hQcbM4sNYuA6i8SnCj/x1SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7UiW+vG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723158875; x=1754694875;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+j26Pq03xPtEY/N0a1hoZ7bDghSj/EIn7I1VMji0gyk=;
  b=R7UiW+vGPY+H0PTqXk2EV9XONYygK9jbg1phc5bWOqALmhmgSXWjhBLg
   uKKVaS6X7usneWXrDTP45dE/jihoaTutKrwlTT8JovUvlVJuL3RTmJpVl
   Jv+yIxRblAtPcm4Fub6ns8ytEriF2ZfpC9/+qkfvu9lrBXZirjdMGxV1M
   OTmaMSz7E9MAAAffEsbKGBDWNtZZ1UW6WxOfsXA/XKQethfFrookbfGGQ
   aktnVSpddGKfYQaQ/tZbB4z7ulLwCqZNOwMr77tlQIMjCw6Ekt0UmBbru
   ARgiKrA1cl32l1Cq92YG6etOdNuvsAOXuaA5lpZCljYsWtEvnOMwtDVUC
   A==;
X-CSE-ConnectionGUID: 4Nm78DevRoKjldmRqG8YTw==
X-CSE-MsgGUID: 06IHKVmOQvOM5pNO/WiZMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21439897"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21439897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 16:14:34 -0700
X-CSE-ConnectionGUID: THMjQWVkR8C1XvgMJZVU+w==
X-CSE-MsgGUID: 9JfHMNiRTharX78M5zDMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57037944"
Received: from venkat-lin-vm.fm.intel.com ([10.80.128.171])
  by fmviesa006.fm.intel.com with ESMTP; 08 Aug 2024 16:14:33 -0700
From: Venkat Jayaraman <venkat.jayaraman@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	venkat.jayaraman@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH] usb: typec: ucsi: Add DATA_RESET option of Connector Reset command
Date: Thu,  8 Aug 2024 16:14:43 -0700
Message-Id: <20240808231443.1772374-1-venkat.jayaraman@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify CONNECTOR_RESET command implementation to accommodate
DATA_RESET reset type as defined in UCSI spec v2.0 and later.

Hard Reset bit field was defined with value 1 in UCSI spec version 1.0.
Starting with spec version 1.1, Hard Reset bit field was removed from the
CONNECTOR_RESET command, until spec 2.0 reintroduced it with value 0, so, 
the value to pass in to the command for a Hard Reset is different depending
on the UCSI version supported by the LPM.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
---

 drivers/usb/typec/ucsi/ucsi.c | 16 +++++++++++++++-
 drivers/usb/typec/ucsi/ucsi.h |  5 ++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index dcd3765cc1f5..7482baec36f8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1343,12 +1343,26 @@ EXPORT_SYMBOL_GPL(ucsi_connector_change);
 
 /* -------------------------------------------------------------------------- */
 
+/**
+ * Hard Reset bit field was defined with value 1 in UCSI spec version 1.0.
+ * Starting with spec version 1.1, Hard Reset bit field was removed from the
+ * CONNECTOR_RESET command, until spec 2.0 reintroduced it with value 0, so, in effect,
+ * the value to pass in to the command for a Hard Reset is different depending
+ * on the supported UCSI version by the LPM.
+ *
+ * For performing a Data Reset on LPMs supporting version 2.0 and greater,
+ * this function needs to be called with the second argument set to 0.
+ */
 static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 {
 	u64 command;
 
 	command = UCSI_CONNECTOR_RESET | UCSI_CONNECTOR_NUMBER(con->num);
-	command |= hard ? UCSI_CONNECTOR_RESET_HARD : 0;
+
+	if (con->ucsi->version < UCSI_VERSION_1_1)
+		command |= hard ? UCSI_CONNECTOR_RESET_HARD_VER_1_0 : 0;
+	else if (con->ucsi->version >= UCSI_VERSION_2_0)
+		command |= hard ? 0 : UCSI_CONNECTOR_RESET_DATA_VER_2_0;
 
 	return ucsi_send_command(con->ucsi, command, NULL, 0);
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 57129f3c0814..06c642e2838f 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -29,6 +29,7 @@ struct dentry;
 #define UCSIv2_MESSAGE_OUT		272
 
 /* UCSI versions */
+#define UCSI_VERSION_1_1	0x0110
 #define UCSI_VERSION_1_2	0x0120
 #define UCSI_VERSION_2_0	0x0200
 #define UCSI_VERSION_2_1	0x0210
@@ -122,7 +123,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_DEFAULT_GET_CONNECTOR_NUMBER(_cmd_)	(((_cmd_) >> 16) & GENMASK(6, 0))
 
 /* CONNECTOR_RESET command bits */
-#define UCSI_CONNECTOR_RESET_HARD		BIT(23) /* Deprecated in v1.1 */
+#define UCSI_CONNECTOR_RESET_HARD_VER_1_0	BIT(23) /* Deprecated in v1.1 */
+#define UCSI_CONNECTOR_RESET_DATA_VER_2_0	BIT(23) /* Redefined in v2.0 */
+
 
 /* ACK_CC_CI bits */
 #define UCSI_ACK_CONNECTOR_CHANGE		BIT(16)
-- 
2.34.1



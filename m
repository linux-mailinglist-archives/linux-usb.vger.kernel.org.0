Return-Path: <linux-usb+bounces-13399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFC951068
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 01:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDAD31F21DC1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 23:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C661AB53D;
	Tue, 13 Aug 2024 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pr2jMVNW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17F153BF6
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591113; cv=none; b=sRrP48ZDxplPhOKh9Tguie4uOIqKjxv/KqxuSriNTWrILMeXrqiTVzHQmjGqb0TZeKhH9o7DkG9nMXbYP/i306P+FjIE0ibBsMoiYaiL7jAGelIWmLCs6cM/ThiaYbGkGrJLSGynAvVPgR74NxrvIwni1rtbvutw+iVcWYpY0sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591113; c=relaxed/simple;
	bh=K/j7W1h0nPfSfCYTie9+7bsGA/ctv7Csil9bwwcWpOg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JOXuX08utRNd1qPyuRU9JvwNqrI4+QQFBWp6mhIGXAkywlNbBJF3vAjY9ZKSAprdZDkgfzqkA204MlRRa4xHuz/hUpz0YH/RfFV8wvRIKRE3VZjl2vc8CcdGseX9evIFwUIgG/rULsr+PjeZgzhTT6jClARzSsHVE4Q4lwrMJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pr2jMVNW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723591112; x=1755127112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K/j7W1h0nPfSfCYTie9+7bsGA/ctv7Csil9bwwcWpOg=;
  b=Pr2jMVNWKpjCCrHxBBEOi5lqcisI3uUSbgEb1BE1xpLDtQXg32KLwVG1
   GFcnvexYbd1ajE76hto7xr8aOKeU+8O/jX8uWDEqjmyx+1lnXAKuB36DW
   myVSZSQul6FlYiuDyLF2LG0R69X68oUNvWjEZK5zhBNkis1F0NMsMmOXR
   58uE2b4147/Qpg/9Nv7133PS3kqYzXiBPEf00z1eXiZZdE6Nv8hPCZBRW
   jLDmAZV4UQ/lXzj6EEuEW53yJLEu2TRi8gS8SAt5s9Y565o8ca0dzlqkp
   0iZ5zSWzEQNN19ufR6FrwQNELIvzDYWKGPgABCydPm2FBU4dL6hk5tJK9
   w==;
X-CSE-ConnectionGUID: VhAvRQhDT3q2xYOhFzOFJA==
X-CSE-MsgGUID: f93HYuvOQ8isjYMmBKj95g==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21754272"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21754272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 16:18:30 -0700
X-CSE-ConnectionGUID: s+CBu0HuSJew2sWxJ/o2iQ==
X-CSE-MsgGUID: EH4vEQYbSzSwtsbZkSYrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="62971880"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2024 16:18:29 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: pooja.katiyar@intel.com,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH v2] usb: typec: ucsi: Add DATA_RESET option of Connector Reset command
Date: Tue, 13 Aug 2024 16:18:28 -0700
Message-Id: <20240813231828.1192338-1-pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Venkat Jayaraman <venkat.jayaraman@intel.com>

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

Changes in v2:
- Update commenting style to address warning reported by kernel test
  robot 

 drivers/usb/typec/ucsi/ucsi.c | 16 +++++++++++++++-
 drivers/usb/typec/ucsi/ucsi.h |  5 ++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index dcd3765cc1f5..7482baec36f8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1343,12 +1343,26 @@ EXPORT_SYMBOL_GPL(ucsi_connector_change);
 
 /* -------------------------------------------------------------------------- */
 
+/*
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



Return-Path: <linux-usb+bounces-13622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1BD956982
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 13:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1CCC1C21720
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 11:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876BF166F18;
	Mon, 19 Aug 2024 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfR7OX2N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00515B140
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067661; cv=none; b=dq0Gg4IxkfHKerWLo5+jIS8XFw7OSUTtEWl5XVfpKUv4i3gjSwq9hAnk9nywN/7FJGcqVpOJta1pXov4bY36+p4XfrRKL0lqSALnOlojO9bgMowCIXPYaiiHkPvKbGl9l69XLujyJs+LKy1rRfIdF6vtqDV5ewPv9jxfK8uPXjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067661; c=relaxed/simple;
	bh=3VP9VUTlBI4F7r6su3b2T9/XTB2ROE0dlfAhwIwdWkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=essgxXfKUIerf5KCBWEhVj6aGq/bMwb+jJDOeyYmVuv7ZYUaLJlWUoRM0BhTGuNhagXl10Q3rlUFXYtRU1gDasaJRDLhAOqDAtIC23WTh88MXDJXXaxU5WPKcyW1VqdoxlER74W06psM+Y9ca9U5jyE+dkm+vmUc2SZ0tqxUCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfR7OX2N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724067659; x=1755603659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3VP9VUTlBI4F7r6su3b2T9/XTB2ROE0dlfAhwIwdWkE=;
  b=XfR7OX2NY/u/aBtiV2Xhxwm+VYrYIyDSu60BexpWGs1+HSUwMeUxtPuC
   xnEVy5dQCk9Ts7aPzLd/1ljPKtsruFtmhKthP+YDuR3A7n+7GPQYZv0na
   jbo5hc1QX4FvdcMBgJhZqlBd9tMTTbLdT7A3guNngb2L9gxceJQkNfhGN
   VE1dm9Sf4ahq6bWo6OUqwGac6gZJ01Zgudz7gM6SptnHtNefFyFWw+7sL
   PcxFLfo04pv6ZJmwOXLvTx/otgqwS/zUC+AP++vvji/798gpZyukdNcMr
   /spbTx9PxCvWwJcX98fLkTYyzFw5ZhvknNMUNv6SfTMT/ETNKwk3otNh0
   A==;
X-CSE-ConnectionGUID: ubGgmHPgRdGjMxqE3cOe3g==
X-CSE-MsgGUID: HFo7emMyQxGEp+iiuRY9Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13092951"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="13092951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 04:40:59 -0700
X-CSE-ConnectionGUID: OOR600oLSBeAHnzia1n15A==
X-CSE-MsgGUID: oszOZdrHQkK9Yknnhkrz4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="91118710"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 04:40:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A1B55562; Mon, 19 Aug 2024 14:40:54 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/4] thunderbolt: Add missing usb4_port_sb_read() to usb4_port_sw_margin()
Date: Mon, 19 Aug 2024 14:40:51 +0300
Message-ID: <20240819114054.4139941-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>
References: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@linux.intel.com>

Synchronize the operation completion by reading back the software
margining operation completion metadata into margining->results.

Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Co-developed-by: R Kannappan <r.kannappan@intel.com>
Signed-off-by: R Kannappan <r.kannappan@intel.com>
Co-developed-by: Rene Sapiens <rene.sapiens@intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c |  5 ++---
 drivers/thunderbolt/tb.h      |  2 +-
 drivers/thunderbolt/usb4.c    | 13 ++++++++++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 9ed4bb2e8d05..a0d07887990e 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -785,9 +785,8 @@ static int margining_run_write(void *data, u64 val)
 			    margining->time ? "time" : "voltage", dev_name(dev),
 			    margining->lanes);
 		ret = usb4_port_sw_margin(port, margining->target, margining->index,
-					  margining->lanes, margining->time,
-					  margining->right_high,
-					  USB4_MARGIN_SW_COUNTER_CLEAR);
+					  margining->lanes, margining->time, margining->right_high,
+					  USB4_MARGIN_SW_COUNTER_CLEAR, &margining->results[0]);
 		if (ret)
 			goto out_clx;
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b47f7873c847..321db4076573 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1360,7 +1360,7 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 			bool timing, bool right_high, u32 *results);
 int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, unsigned int lanes, bool timing,
-			bool right_high, u32 counter);
+			bool right_high, u32 counter, u32 *results);
 int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
 			       u8 index, u32 *errors);
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 4d83b65afb5b..5505aa95c2ea 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1703,6 +1703,7 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
  * @timing: Perform timing margining instead of voltage
  * @right_high: Use Right/high margin instead of left/low
  * @counter: What to do with the error counter
+ * @results: Data word for the operation completion data
  *
  * Runs software lane margining on USB4 port. Read back the error
  * counters by calling usb4_port_sw_margin_errors(). Returns %0 in
@@ -1710,7 +1711,7 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
  */
 int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, unsigned int lanes, bool timing,
-			bool right_high, u32 counter)
+			bool right_high, u32 counter, u32 *results)
 {
 	u32 val;
 	int ret;
@@ -1728,8 +1729,14 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 	if (ret)
 		return ret;
 
-	return usb4_port_sb_op(port, target, index,
-			       USB4_SB_OPCODE_RUN_SW_LANE_MARGINING, 2500);
+	ret = usb4_port_sb_op(port, target, index,
+			      USB4_SB_OPCODE_RUN_SW_LANE_MARGINING, 2500);
+	if (ret)
+		return ret;
+
+	return usb4_port_sb_read(port, target, index, USB4_SB_DATA, results,
+				 sizeof(*results));
+
 }
 
 /**
-- 
2.43.0



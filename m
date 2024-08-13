Return-Path: <linux-usb+bounces-13369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920195032D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 13:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3CA91F237ED
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E0A198A2F;
	Tue, 13 Aug 2024 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWPsO6sZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F91953B9
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546905; cv=none; b=fh7LZZXuwZJJEddEWO5AGCrCGCQdGjQ0ekJYva4swSR9QFcMqc89CqXqeXYFLyEYNZzKnjgH9Ts3KgXySaurb3aY6N3b0mur8m/4+q4ELydCjdohcJfRdeqtMEXluUoPE9sKV0rXUSgWudukKmtAPPg8KEJ8fCDk1k0y5a5dEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546905; c=relaxed/simple;
	bh=3VP9VUTlBI4F7r6su3b2T9/XTB2ROE0dlfAhwIwdWkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NN6qLeRYb2uleaJjHzl45sOZBHvIVXF812Xo5zCkM9mZIbqBytKFFsjZg7CgqHThScgR2Ldt3SFh+LAJ3Y8tThdiIicpjNdSKVz8GDDRgLSEducJOcGxa1F1mQ3jFunji/Htwp2+sZGxnbNd8JHkpWeTClW72ELJQVPxcD9CH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWPsO6sZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723546903; x=1755082903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3VP9VUTlBI4F7r6su3b2T9/XTB2ROE0dlfAhwIwdWkE=;
  b=NWPsO6sZm2vS1XjoRNPtd0hst6Ed7JDeu8ORtrTENfwNrO27zZ+EdKA6
   CJj01Te4wvW3J0B9xS+WXRBPernv0fm9fdsjPSHxDZ9nUTuABfUIxaDYk
   wPaaaGBD74KS6Y+BCnibiPz91Zr4MyGdE3xp2aXg0TFZp3XOD7lUx9BIU
   Y3Vwk9MVSNabKwGsVeU0+af5e4DWIXM65FraC4srXb4m8ynneMlvfcYyK
   IWxYOMylUM7xsgcYqv65VPt0j1Vuln5LNnqfyBJhtQRpyR55OMcMgip/Y
   qGkPpvFzvw83kVXcpjuIkcOJsJyieRXrzf7oWOKyvpiU0xKpQUd8VfLQ5
   A==;
X-CSE-ConnectionGUID: MXXt4a8zTXuYYAyaHCVtzQ==
X-CSE-MsgGUID: CyNWFx1PRcCcPoNd0UgRxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33104395"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="33104395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:01:39 -0700
X-CSE-ConnectionGUID: xRD8OLRFR1KI6Ds1VcRCpQ==
X-CSE-MsgGUID: 9ivu02XbQz69Z8CRhViR/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="89291144"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 13 Aug 2024 04:01:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BB87815C; Tue, 13 Aug 2024 14:01:35 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/4] thunderbolt: Add missing usb4_port_sb_read() to usb4_port_sw_margin()
Date: Tue, 13 Aug 2024 14:01:32 +0300
Message-ID: <20240813110135.2178900-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813110135.2178900-1-mika.westerberg@linux.intel.com>
References: <20240813110135.2178900-1-mika.westerberg@linux.intel.com>
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



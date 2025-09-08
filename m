Return-Path: <linux-usb+bounces-27738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF1B495D8
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFF7B7A8ECC
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D283191DE;
	Mon,  8 Sep 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/vEYPwA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBB331812C
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349162; cv=none; b=AU1TXn+a4a8u4Tu7KVCUbufEDAkJ8G2QqbWSN+M4riPQGKVtQntY4Ac5imotfOBWcDOKJpQI4g868n2CgMbLIJUH7bgeHY9P4Me9TLbAu+XjHx1GLsE5uPJT55Yv8vCLZqY/NsJJB8axEinFPwlxKTmiCNZsvjcq2qskcoz7VQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349162; c=relaxed/simple;
	bh=QkAWk/4l4CMT/rymGkO/96uUb4tkcCsTeJv87XoJ28E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrOzDrdpWsIXhp7McsXmXeC3lHcl28gj/+7Xs+hteAktM9dKn2ZCoq5J2aOqTGMg8p6chsG7LYDq5wCp1P352LkVifmhwWjezPn/2nKlEfBgcDZxTIHFc/G6JHxW57ORKciwmnXyF5+RXjbzuNsv49mqYrvDPSVLZBpsbZM79pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/vEYPwA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349159; x=1788885159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QkAWk/4l4CMT/rymGkO/96uUb4tkcCsTeJv87XoJ28E=;
  b=G/vEYPwAAGQqDUoOqcm3YD3ubRbWRujpN1HS4QzRax0H67uU63dvhys6
   JPU0FBnYkz2QEbCPtELRNwASaX2E+1o4OxNvyOeYG7eZR5ZCFxQH25Zkj
   ugJwCnYZQ4jnw9Tw4TM9hDvXGu27/sbo5q5Cbefh/0FKC3+yMLI81br4T
   SAbkxmlniKzBYYoC9bV5bJzoolBR8dh5EoeoUhds7E0OSfuH6dWVYd7m9
   LMjgZR/hVvrAagZUr78kKGBzNLrsEITYhVAnu1mQL9rOLR8xYjrBXHNpp
   YEzs50HT/sjsGZe9kLTkRkMdfHCPCiKYXGT2oEzClFXPFIT4YJFSbHqwl
   Q==;
X-CSE-ConnectionGUID: UJvGYgkdTGifQ3C4G9/jYg==
X-CSE-MsgGUID: 7e0/NHa1TVWmK0kuoAhYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443069"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: pT4WikbJRAKxTEk3M7tcnA==
X-CSE-MsgGUID: NUbmlp4EQGqTxtpXWoOp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291157"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0C843A7; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 19/26] thunderbolt: Add missing documentation in tb.h
Date: Mon,  8 Sep 2025 18:32:23 +0200
Message-ID: <20250908163230.2614397-20-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Add missing parameters and struct/enum description in tb.h kernel-doc
comments. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index c1ffaf0bb39e..8e2762ff8d51 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -324,7 +324,7 @@ struct usb4_port {
 };
 
 /**
- * tb_retimer: Thunderbolt retimer
+ * struct tb_retimer - Thunderbolt retimer
  * @dev: Device for the retimer
  * @tb: Pointer to the domain the retimer belongs to
  * @index: Retimer index facing the router USB4 port
@@ -552,6 +552,7 @@ static inline void *tb_priv(struct tb *tb)
 
 /**
  * tb_upstream_port() - return the upstream port of a switch
+ * @sw: Router
  *
  * Every switch has an upstream port (for the root switch it is the NHI).
  *
@@ -1241,6 +1242,7 @@ static inline int tb_route_length(u64 route)
 
 /**
  * tb_downstream_route() - get route to downstream switch
+ * @port: Port to check
  *
  * Port must not be the upstream port (otherwise a loop is created).
  *
@@ -1364,7 +1366,7 @@ int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width
 int usb4_port_asym_start(struct tb_port *port);
 
 /**
- * enum tb_sb_target - Sideband transaction target
+ * enum usb4_sb_target - Sideband transaction target
  * @USB4_SB_TARGET_ROUTER: Target is the router itself
  * @USB4_SB_TARGET_PARTNER: Target is partner
  * @USB4_SB_TARGET_RETIMER: Target is retimer
@@ -1409,6 +1411,8 @@ enum usb4_margining_lane {
  * @voltage_time_offset: Offset for voltage / time for software margining
  * @optional_voltage_offset_range: Enable optional extended voltage range
  * @right_high: %false if left/low margin test is performed, %true if right/high
+ * @upper_eye: %true if margin test is done on upper eye, %false if done on
+ *	       lower eye
  * @time: %true if time margining is used instead of voltage
  */
 struct usb4_port_margining_params {
-- 
2.50.1



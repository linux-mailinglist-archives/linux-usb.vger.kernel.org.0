Return-Path: <linux-usb+bounces-27740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC1B495A0
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28363B343D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165D831985D;
	Mon,  8 Sep 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6UfODe7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016E3191A5
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349163; cv=none; b=o8lt1TFt+0w7Ckg9dfObBU/Dt3rWcAmEYYnEVQyvbbYv/RgDFpiCIz8VsS2r2fECkRK5eBjL3j/rfex2ejS+cw2F1aEsiuYytuXc8H6DZ3aKD0gc33tcMdisT/dOkJ5IkLX24B/pwCRjoDan/VIZPli6si5PNB6nmye5NPxpeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349163; c=relaxed/simple;
	bh=jOsxFuu7qlO8iTazyxVINzsooCCK0PM8Nd1OELPDxwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7lpmYC8MFkAFzJJ2GFl4lFG5GNG2FtkgdcKjjeUtmbxDzFAWLc447/JaULT3mUiMlEgMeNYdQ3nAegBvvDY4r+K290Vgbup2c3WIf5GbQWTwMil7l/SXl5XZ3KHnyh9q76dxeWNePf3cgAefB1HcAOsLNGj2A9NK+5YovTkMUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6UfODe7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349161; x=1788885161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jOsxFuu7qlO8iTazyxVINzsooCCK0PM8Nd1OELPDxwY=;
  b=M6UfODe7paFJ6ewJi7ywFd21UQOKktF8KxUfH9vVb0YFig6mfqXxOvJY
   lcsNkqwFsjD0hnHpuYUCNiWte7daSLLmR1BuNGKtvQhsxY6CrtpR98v/L
   6dRZoUJepoAa+Ag/EGQJ8G727uNXWPSqRytTJ3QZ9ivXwV3ScVJyirk/+
   EVAB4+kj2G4ZCmjN+oyyaPV/6U8pvxCzTmsArEJ1xy4HTt0NIrXsyb4V4
   KaQyxzF0E0vm4RS5K1WZrWdQz9ExWknDPCYLfRkvRvaRJiou9UbKtZCjD
   L209g/bWtBYVVnauP7/sSXnsJC9M1aW4bEkxy8mkDoHetMn1pPgcAWLi9
   g==;
X-CSE-ConnectionGUID: pIet0glRR+GjqQhMllZQqQ==
X-CSE-MsgGUID: DtnRDX+oRf+LprbFBcJNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443072"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: ZV5t49iMRYWNclCNsvjf5Q==
X-CSE-MsgGUID: Jms7Zr53S5+PJYqJvpBx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291156"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 05FECA5; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 17/26] thunderbolt: Update tb.c function documentation
Date: Mon,  8 Sep 2025 18:32:21 +0200
Message-ID: <20250908163230.2614397-18-mika.westerberg@linux.intel.com>
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

Make tb.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c14ab1fbeeaf..077ec855eb9d 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -225,14 +225,12 @@ static int tb_enable_clx(struct tb_switch *sw)
 	return ret == -EOPNOTSUPP ? 0 : ret;
 }
 
-/**
- * tb_disable_clx() - Disable CL states up to host router
- * @sw: Router to start
+/*
+ * Disables CL states from @sw up to the host router.
  *
- * Disables CL states from @sw up to the host router. Returns true if
- * any CL state were disabled. This can be used to figure out whether
- * the link was setup by us or the boot firmware so we don't
- * accidentally enable them if they were not enabled during discovery.
+ * This can be used to figure out whether the link was setup by us or the
+ * boot firmware so we don't accidentally enable them if they were not
+ * enabled during discovery.
  */
 static bool tb_disable_clx(struct tb_switch *sw)
 {
@@ -456,10 +454,8 @@ static void tb_scan_xdomain(struct tb_port *port)
 	}
 }
 
-/**
- * tb_find_unused_port() - return the first inactive port on @sw
- * @sw: Switch to find the port on
- * @type: Port type to look for
+/*
+ * Returns the first inactive port on @sw.
  */
 static struct tb_port *tb_find_unused_port(struct tb_switch *sw,
 					   enum tb_port_type type)
@@ -549,6 +545,8 @@ static struct tb_tunnel *tb_find_first_usb3_tunnel(struct tb *tb,
  * from @src_port to @dst_port. Does not take USB3 tunnel starting from
  * @src_port and ending on @src_port into account because that bandwidth is
  * already included in as part of the "first hop" USB3 tunnel.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
 					   struct tb_port *src_port,
@@ -601,6 +599,8 @@ static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
  * If there is bandwidth reserved for any of the groups between
  * @src_port and @dst_port (but not yet used) that is also taken into
  * account in the returned consumed bandwidth.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_consumed_dp_bandwidth(struct tb *tb,
 				    struct tb_port *src_port,
@@ -701,6 +701,8 @@ static bool tb_asym_supported(struct tb_port *src_port, struct tb_port *dst_port
  * single link at @port. If @include_asym is set then includes the
  * additional banwdith if the links are transitioned into asymmetric to
  * direction from @src_port to @dst_port.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_maximum_bandwidth(struct tb *tb, struct tb_port *src_port,
 				struct tb_port *dst_port, struct tb_port *port,
@@ -807,6 +809,8 @@ static int tb_maximum_bandwidth(struct tb *tb, struct tb_port *src_port,
  * If @include_asym is true then includes also bandwidth that can be
  * added when the links are transitioned into asymmetric (but does not
  * transition the links).
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 				 struct tb_port *dst_port, int *available_up,
@@ -1029,6 +1033,8 @@ static int tb_create_usb3_tunnels(struct tb_switch *sw)
  * (requested + currently consumed) on that link exceed @asym_threshold.
  *
  * Must be called with available >= requested over all links.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			     struct tb_port *dst_port, int requested_up,
@@ -1135,6 +1141,8 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
  * Goes over each link from @src_port to @dst_port and tries to
  * transition the link to symmetric if the currently consumed bandwidth
  * allows and link asymmetric preference is ignored (if @keep_asym is %false).
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 			    struct tb_port *dst_port, bool keep_asym)
-- 
2.50.1



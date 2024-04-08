Return-Path: <linux-usb+bounces-9059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5E89BFD6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 15:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71012285D9A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 13:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28667BAEC;
	Mon,  8 Apr 2024 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmsY9/4P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F36CDA8
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581288; cv=none; b=YOkbMWmg1kLs4IqiJ7YlIYvRY+UbjaR6qrBSjpzw1KOU0yQ5dGJMip+U50DwB30UJwsmAfedVe4suU5YGQdLATeOT06pNGVWvks3u+BmYD8bYqidmYxhtn2EREZjskNjCt+2GFu9/xPl+Or/KzcUIGuwC0VI0PtieCMOxzMWoSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581288; c=relaxed/simple;
	bh=onkmaoZvkauW8Q4MGh3eVchFeNAmDaYgmCBvXuFcIGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHmSI3ArpHRhtuKgkphw59u24t6/cCgZUtx5nVGMZZJZ8v6cQ7n+j2QRut0bFotl+KTPLhETuO0t6ZhfOVFh/YGKJXD15ecjuDNT86OOcELMpvCZ+PZpFNr14ylCdbky7neGIIJq5V6cijuHZ6i+kgbt+lhBMFq5JJcUO8fLu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmsY9/4P; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712581286; x=1744117286;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=onkmaoZvkauW8Q4MGh3eVchFeNAmDaYgmCBvXuFcIGE=;
  b=DmsY9/4PUeBnv9CqrC3OJolvsHdFiwvpyAkX7PLM4eXaMS1s6qCKftmN
   vNK1X81BiN9/FClkUNRWBcBcchLuyDjng4CJl9iCwZzeKPEcthmKh8+ww
   3GTFpds+xTkRBxX1pgLDh6LO2AV7liFYTLelfAKQI9Jl0JPtDhglTVrw/
   sgDg6e7p3eYJ6eL6BlUxh/5njEp+IT5U75qKSsmviuVGMObau4l3LlEgI
   9kBePzGmt2BJryupQN2WSR3odupaR3QLmdRocKNsuqobhi1FyOVz7Nfap
   KqciKI7UJjX6mVeofoUwgilhz28iwaKFS2GEeuYkCuJAg7GwYxzzVojDU
   g==;
X-CSE-ConnectionGUID: MUS65IcYRHW87DwxT/fu+w==
X-CSE-MsgGUID: p8dRn+lCT9mAGwf2iPy0Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11630688"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="11630688"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 06:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="937091483"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="937091483"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2024 06:00:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CF6B924D; Mon,  8 Apr 2024 16:00:31 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Fix calculation of consumed USB3 bandwidth on a path
Date: Mon,  8 Apr 2024 16:00:30 +0300
Message-ID: <20240408130031.51616-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Currently, when setup a new USB3 tunnel that is starting from downstream USB3
adapter of first depth router (or deeper), to upstream USB3 adapter of a second
depth router (or deeper), we calculate consumed bandwidth. For this calculation
we take into account first USB3 tunnel consumed bandwidth while we shouldn't,
because we just recalculating the first USB3 tunnel allocated bandwidth.

Fix that, so that more bandwidth is available for the new USB3 tunnel being
setup.

While there, fix the kernel-doc to decribe more accurately the purpose of the
function.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 3e44c78ac409..10e719dd837c 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -498,8 +498,9 @@ static struct tb_tunnel *tb_find_first_usb3_tunnel(struct tb *tb,
  * @consumed_down: Consumed downstream bandwidth (Mb/s)
  *
  * Calculates consumed USB3 and PCIe bandwidth at @port between path
- * from @src_port to @dst_port. Does not take tunnel starting from
- * @src_port and ending from @src_port into account.
+ * from @src_port to @dst_port. Does not take USB3 tunnel starting from
+ * @src_port and ending on @src_port into account because that bandwidth is
+ * already included in as part of the "first hop" USB3 tunnel.
  */
 static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
 					   struct tb_port *src_port,
@@ -514,8 +515,8 @@ static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
 	*consumed_up = *consumed_down = 0;
 
 	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
-	if (tunnel && tunnel->src_port != src_port &&
-	    tunnel->dst_port != dst_port) {
+	if (tunnel && !tb_port_is_usb3_down(src_port) &&
+	    !tb_port_is_usb3_up(dst_port)) {
 		int ret;
 
 		ret = tb_tunnel_consumed_bandwidth(tunnel, consumed_up,
-- 
2.43.0



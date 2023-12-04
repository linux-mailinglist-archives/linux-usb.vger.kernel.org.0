Return-Path: <linux-usb+bounces-3644-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9880303A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB4A280E25
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6927A210FF;
	Mon,  4 Dec 2023 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eD+CmL3E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2C3100
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701685542; x=1733221542;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJeWwnvMh6AR6XKR1G3piVA8TqQ7rB7zxcZzMZq04A4=;
  b=eD+CmL3EhPHSxlim2R5DT6pf4NzweX3CkCZYWl8BLhu+UUqvNXWEXdv2
   MdgmG73iJhcRM/2qyQz9Oa/raRPat65GMuqjI+gzOA2QTh9dqHLMpdy7p
   1uCVV41jnmRJwbnGChWSk/QSX5OWBiWv6eiIPHSh02WM96NfdwOxGCTnH
   YYBhub1afe4CPtCmyz3SvN1Z2a5pAUnmXo2EHa9SVDXXHf54Nf1rwR3Ik
   Hndk7Y3y3yLEY2WKMjgdKYpy1MJYEtsHZpUFVtnXkUXvCzIklTb0bvlns
   TFX+9+f/P1n1lCLNdZz+11Q1Sbz3owt421D9uJYEmP4AWP3DOeyRfVzB6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378746621"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="378746621"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1017788098"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="1017788098"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2023 02:25:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B5B73315; Mon,  4 Dec 2023 12:25:38 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix minimum allocated USB 3.x and PCIe bandwidth
Date: Mon,  4 Dec 2023 12:25:38 +0200
Message-ID: <20231204102538.1634776-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

With the current bandwidth allocation we end up reserving too much for the USB
3.x and PCIe tunnels that leads to reduced capabilities for the second
DisplayPort tunnel.

Fix this by decreasing the USB 3.x allocation to 900 Mb/s which then allows
both tunnels to get the maximum HBR2 bandwidth.  This way, the reserved
bandwidth for USB 3.x and PCIe, would be 1350 Mb/s (taking weights of USB 3.x
and PCIe into account). So bandwidth allocations on a link are:
USB 3.x + PCIe tunnels => 1350 Mb/s
DisplayPort tunnel #1  => 17280 Mb/s
DisplayPort tunnel #2  => 17280 Mb/s

Total consumed bandwidth is 35910 Mb/s. So that all the above can be tunneled
on a Gen 3 link (which allows maximum of 36000 Mb/s).

Fixes: 582e70b0d3a4 ("thunderbolt: Change bandwidth reservations to comply USB4 v2")
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 4277733d0021..f8f0d24ff6e4 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2311,13 +2311,13 @@ int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 		goto err_request;
 
 	/*
-	 * Always keep 1000 Mb/s to make sure xHCI has at least some
+	 * Always keep 900 Mb/s to make sure xHCI has at least some
 	 * bandwidth available for isochronous traffic.
 	 */
-	if (consumed_up < 1000)
-		consumed_up = 1000;
-	if (consumed_down < 1000)
-		consumed_down = 1000;
+	if (consumed_up < 900)
+		consumed_up = 900;
+	if (consumed_down < 900)
+		consumed_down = 900;
 
 	ret = usb4_usb3_port_write_allocated_bandwidth(port, consumed_up,
 						       consumed_down);
-- 
2.42.0



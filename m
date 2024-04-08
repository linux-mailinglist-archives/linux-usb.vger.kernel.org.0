Return-Path: <linux-usb+bounces-9056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13489BF60
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 14:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C795B27127
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD35A6F06B;
	Mon,  8 Apr 2024 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTF/wiWq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4CA6CDDC
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580491; cv=none; b=VeGA7nTWSBz1YnSYqXarla8ofnQWd7ba+zGc2k26zD/Q/JvggrTqRB8/nbil444dJ+FSxhcXaz1r9TVNJhq51kHXF5Q+hkChqOizfyMfAVGn7FzBmIh5b5JIXeqzMYwrzVVH4fgpe+hdgQpuQMcngMMjWDmrP30FKxKSNwu6K0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580491; c=relaxed/simple;
	bh=tEER5V8oua3LXDYSVx60SqScTANyqQZWAFAPcLviHqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WtafAj0P9wUvt/xK5I5e+O6QFtkhDjyThDWWHeUQy/JKETFIBmXmPQyPjzvYLAYtJ7/mrHcJ5XMMVKP//q/kjE3phs4gmKCoa1pqnoUwocQYFrwtbj6oX1h7A/+AYYaKRW+kqi9Mxy0nvKZIeWX0R9XbET3oPlZ808FMdzLWUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTF/wiWq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712580490; x=1744116490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tEER5V8oua3LXDYSVx60SqScTANyqQZWAFAPcLviHqI=;
  b=RTF/wiWq3ERPTRgSmnQSf2cHVeKIkaAjdqd62EOpBLx/JJY9hKll9xgp
   dD8qKEvDbcumx/rOK6OP9k/Lp/gaLvRAv+uJ7GxhG8LMNl/AU5xvJ76l2
   Zj+gkEmBu2INpMbKhWO2MkdKeBqliWGNP+qmdu9RpTeXRu6aeKKiuk+Q6
   c+8A4XNFBSRCSRq2bOUm27K1djcxqLHZaGD1TWVYHzrzz/laOwe3qpTW6
   djEg0czySmMaucq8AgNz1LnUshAYAHO/xeZRScf3DKZ13QN+r4AkL2mPu
   F8knTz2/Rj7FZZaPdJoXpMhqpldUt74rUiWEdjLG/iTJvO5m6xZFoNpdc
   Q==;
X-CSE-ConnectionGUID: JjRSerZ0QWWQpd2Cx46L4g==
X-CSE-MsgGUID: hD5CmM3RTviPy7UNGKkVWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7721282"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7721282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 05:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="937091421"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="937091421"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2024 05:48:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 02584194; Mon,  8 Apr 2024 15:48:03 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Fix wake configurations after device unplug
Date: Mon,  8 Apr 2024 15:48:02 +0300
Message-ID: <20240408124803.12329-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Currently we don't configure correctly the wake events after unplug of device
router. What can happen is that the downstream ports of host router will be
configured to wake on: USB4-wake and wake-on-disconnect, but not on
wake-on-connect. This may cause the later plugged device not to wake the
domain and fail in enumeration. Fix this by clearing downstream port's "USB4
Port is Configured" bit, after unplug of a device router.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6ffc4e81ffed..4edfd6e34e31 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3180,22 +3180,29 @@ void tb_switch_unconfigure_link(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 
-	if (sw->is_unplugged)
-		return;
 	if (!tb_route(sw) || tb_switch_is_icm(sw))
 		return;
 
+	/*
+	 * Unconfigure downstream port so that wake-on-connect can be
+	 * configured after router unplug. No need to unconfigure upstream port
+	 * since its router is unplugged.
+	 */
 	up = tb_upstream_port(sw);
-	if (tb_switch_is_usb4(up->sw))
-		usb4_port_unconfigure(up);
-	else
-		tb_lc_unconfigure_port(up);
-
 	down = up->remote;
 	if (tb_switch_is_usb4(down->sw))
 		usb4_port_unconfigure(down);
 	else
 		tb_lc_unconfigure_port(down);
+
+	if (sw->is_unplugged)
+		return;
+
+	up = tb_upstream_port(sw);
+	if (tb_switch_is_usb4(up->sw))
+		usb4_port_unconfigure(up);
+	else
+		tb_lc_unconfigure_port(up);
 }
 
 static void tb_switch_credits_init(struct tb_switch *sw)
-- 
2.43.0



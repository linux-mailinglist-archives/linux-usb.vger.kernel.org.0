Return-Path: <linux-usb+bounces-6326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAD852FC1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 12:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FF8228ACEA
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 11:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8854E376F7;
	Tue, 13 Feb 2024 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFhSkI61"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13076364C1
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707824604; cv=none; b=sQsEWjC8pXHp9xdR6B8ACPchT2iq0ZC4h2gU2Dh4O14D4jiQtLJQIUZizJZSIaq4KfMiwBC2xfJHeyswBP2Ihticp80rzkOSG7+ZsaUh5PdHSuIudODViL/fdXlUaJAZIm90fXTVF1Bz0FzTu69gA5CfCenkbqZ+05wYOeBDug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707824604; c=relaxed/simple;
	bh=Z6vdbH0sL/7WuuaDqnmyVnoHfSKszJCF4ZyB/upKVb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLJKF+stMBCSB8V9yLq5ZNq81yBkLm0E20+rFOvZNBAv1pAVihrd3FzmA0YcsUpFhuRGxrxnFrYdZMJGXesjmWYUTT2ewZFTEmPa5AF7AtKZF9/GflA7yfR+4p1LQHj5JYxHjtsi/C8iSLrvTuF9Njfnt8l94cpcS3CQ/0ZdOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFhSkI61; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707824602; x=1739360602;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z6vdbH0sL/7WuuaDqnmyVnoHfSKszJCF4ZyB/upKVb0=;
  b=BFhSkI61SdTMhIj8dAp8Ry6KaqcyxX5IjX5PcHBQL2fZSMO1VifhUZJ/
   I3p8jb1vpib8zhqzDosD9aEpie8auRZUd0EnDiYGj7fjGJNApJPe/fdNV
   bOhpWzLhA/YG9w5FGPGwqe4lmAaMyo6DYjJZ8QNta5Rnt3U7eCKr0ns1T
   5bsY5KeLGeOVF5nVljyY8BVcMOGXdbYevv3dCZ/T8GNkHmPRAFFhCBFV4
   TfbhEGGdhFwCROBbu+NlLgrjSA53ILi0QZE14Orxf++EqBa39ESGWGtEf
   RTe+1OvVYiyuqj0ukl72Um12AFi8eUVEnRwHkY6LPYBUk7zOj6XBntxBd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436972473"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="436972473"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935335941"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="935335941"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2024 03:43:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 505D6193; Tue, 13 Feb 2024 13:43:18 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Keep the domain powered when USB4 port is in redrive mode
Date: Tue, 13 Feb 2024 13:43:17 +0200
Message-ID: <20240213114318.3023150-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a DiplayPort cable is directly connected to the host routers USB4
port, there is no tunnel involved but the port is in "redrive" mode
meaning that it is re-driving the DisplayPort signals from its
DisplayPort source. In this case we need to keep the domain powered on
otherwise once the domain enters D3cold the connected monitor blanks
too.

Since this happens only on Intel Barlow Ridge add a quirk that takes
runtime PM reference if we detect that the USB4 port entered redrive
mode (and release it once it exits the mode).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 14 +++++++++++
 drivers/thunderbolt/tb.c     | 49 +++++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.h     |  4 +++
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index e6bfa63b40ae..e81de9c30eac 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -43,6 +43,12 @@ static void quirk_usb3_maximum_bandwidth(struct tb_switch *sw)
 	}
 }
 
+static void quirk_block_rpm_in_redrive(struct tb_switch *sw)
+{
+	sw->quirks |= QUIRK_KEEP_POWER_IN_DP_REDRIVE;
+	tb_sw_dbg(sw, "preventing runtime PM in DP redrive mode\n");
+}
+
 struct tb_quirk {
 	u16 hw_vendor_id;
 	u16 hw_device_id;
@@ -86,6 +92,14 @@ static const struct tb_quirk tb_quirks[] = {
 		  quirk_usb3_maximum_bandwidth },
 	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HUB_40G_BRIDGE, 0x0000, 0x0000,
 		  quirk_usb3_maximum_bandwidth },
+	/*
+	 * Block Runtime PM in DP redrive mode for Intel Barlow Ridge host
+	 * controllers.
+	 */
+	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI, 0x0000, 0x0000,
+		  quirk_block_rpm_in_redrive },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI, 0x0000, 0x0000,
+		  quirk_block_rpm_in_redrive },
 	/*
 	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
 	 */
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 306c62c35a05..c5ce7a694b27 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1973,6 +1973,49 @@ static void tb_tunnel_dp(struct tb *tb)
 		tb_dbg(tb, "no suitable DP IN adapter available, not tunneling\n");
 }
 
+static void tb_enter_redrive(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+
+	if (!(sw->quirks & QUIRK_KEEP_POWER_IN_DP_REDRIVE))
+		return;
+
+	/*
+	 * If we get hot-unplug for the DP IN port of the host router
+	 * and the DP resource is not available anymore it means there
+	 * is a monitor connected directly to the Type-C port and we are
+	 * in "redrive" mode. For this to work we cannot enter RTD3 so
+	 * we bump up the runtime PM reference count here.
+	 */
+	if (!tb_port_is_dpin(port))
+		return;
+	if (tb_route(sw))
+		return;
+	if (!tb_switch_query_dp_resource(sw, port)) {
+		port->redrive = true;
+		pm_runtime_get(&sw->dev);
+		tb_port_dbg(port, "enter redrive mode, keeping powered\n");
+	}
+}
+
+static void tb_exit_redrive(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+
+	if (!(sw->quirks & QUIRK_KEEP_POWER_IN_DP_REDRIVE))
+		return;
+
+	if (!tb_port_is_dpin(port))
+		return;
+	if (tb_route(sw))
+		return;
+	if (port->redrive && tb_switch_query_dp_resource(sw, port)) {
+		port->redrive = false;
+		pm_runtime_put(&sw->dev);
+		tb_port_dbg(port, "exit redrive mode\n");
+	}
+}
+
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
 {
 	struct tb_port *in, *out;
@@ -1989,7 +2032,10 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
 	}
 
 	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, out);
-	tb_deactivate_and_free_tunnel(tunnel);
+	if (tunnel)
+		tb_deactivate_and_free_tunnel(tunnel);
+	else
+		tb_enter_redrive(port);
 	list_del_init(&port->list);
 
 	/*
@@ -2016,6 +2062,7 @@ static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
 	tb_port_dbg(port, "DP %s resource available after hotplug\n",
 		    tb_port_is_dpin(port) ? "IN" : "OUT");
 	list_add_tail(&port->list, &tcm->dp_resources);
+	tb_exit_redrive(port);
 
 	/* Look for suitable DP IN <-> DP OUT pairs now */
 	tb_tunnel_dp(tb);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 1bbbeb034e0e..8e87d1a0005c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -23,6 +23,8 @@
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 /* Disable CLx if not supported */
 #define QUIRK_NO_CLX					BIT(1)
+/* Need to keep power on while USB4 port is in redrive mode */
+#define QUIRK_KEEP_POWER_IN_DP_REDRIVE			BIT(2)
 
 /**
  * struct tb_nvm - Structure holding NVM information
@@ -265,6 +267,7 @@ struct tb_bandwidth_group {
  * @group_list: The adapter is linked to the group's list of ports through this
  * @max_bw: Maximum possible bandwidth through this adapter if set to
  *	    non-zero.
+ * @redrive: For DP IN, if true the adapter is in redrive mode.
  *
  * In USB4 terminology this structure represents an adapter (protocol or
  * lane adapter).
@@ -293,6 +296,7 @@ struct tb_port {
 	struct tb_bandwidth_group *group;
 	struct list_head group_list;
 	unsigned int max_bw;
+	bool redrive;
 };
 
 /**
-- 
2.43.0



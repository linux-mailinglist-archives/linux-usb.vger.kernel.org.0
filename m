Return-Path: <linux-usb+bounces-18386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBDC9ECA70
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 11:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42376188D4C5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 10:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872B91FF1B0;
	Wed, 11 Dec 2024 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pp8abddM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AA51EC4DF
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733913336; cv=none; b=Ip2+Gpxj8mIspLvhvzP+7r8GkylqjhQ2wDSG8vJVa1t310rvIDlXZ4LyReG82LJGQRugdTceyMnKA77uWGUHnZUR3J94bspSp5iFKuN6+C0tCl7iOxwgZxcknc0cWBW7b1e0edlPJeuogwMOqn5ADMBpG4ILwKTA5B0ksjGlPvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733913336; c=relaxed/simple;
	bh=52Iz8M8JtwknXNQ/ZHBOIKcqBeAlBBf3yvySCSlKRks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VoaHnUJ3z0s22L8H/emPthc9VnRJAEbR+KWteGodWs0iYg80Fek3zJlzD7fp+lzhwwPNkUof8PIns1vJL1TFZSxmqr1Ya60zjr/XUxoin9K8boiZm/oM0ZkUAdiju/ebxOznMAaEGTRWoDb4d6dGFQM/OvBHu+IOHBU88jWpzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pp8abddM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733913334; x=1765449334;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=52Iz8M8JtwknXNQ/ZHBOIKcqBeAlBBf3yvySCSlKRks=;
  b=Pp8abddMKw4C6DHpHUKQe5Wsf1S0HKSCRjIWOL08Q482F/g9y7gFioCn
   P66Z8O95FR/ciBR2p6lIT/Dixae//D1Yg90k6Xf5JC5jfXRR86r7QTSxb
   8XiU/g+srbBGsZFv76UhUwzYMDhlwOBlC7mQjemsoGPNBPzxVM7Yvrq9d
   bxVnVwLaIt22y5vgW0boJyqWfTk0sRWvUfgbYfjAxWhZ17RmDnm9ufBpP
   VujsUnEhTXekTw7yQl1PLHXZPn+li8/CH2atcspHAkgZxSgu/nyOMfdNG
   Zi8Tph716WYr+Dyv4i7imZvbdB6hBY2epdsVINTlEaEKn4ZOZNE5ymFlB
   w==;
X-CSE-ConnectionGUID: 4VkJAonqRgiaW98zoni3xA==
X-CSE-MsgGUID: NN5BrQdBSACCoBDzcZLPtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37973963"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="37973963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 02:35:34 -0800
X-CSE-ConnectionGUID: SPwKbDqgTP6DNdKlGED4UQ==
X-CSE-MsgGUID: 0GZBbFP0R0GioOIJmLViEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100289994"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2024 02:35:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DA42F192; Wed, 11 Dec 2024 12:35:29 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aaron Rainbolt <arainbolt@kfocus.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Improve redrive mode handling
Date: Wed, 11 Dec 2024 12:35:29 +0200
Message-ID: <20241211103529.2302706-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When USB-C monitor is connected directly to Intel Barlow Ridge host, it
goes into "redrive" mode that basically routes the DisplayPort signals
directly from the GPU to the USB-C monitor without any tunneling needed.
However, the host router must be powered on for this to work. Aaron
reported that there are a couple of cases where this will not work with
the current code:

  - Booting with USB-C monitor plugged in.
  - Plugging in USB-C monitor when the host router is in sleep state
    (runtime suspended).
  - Plugging in USB-C device while the system is in system sleep state.

In all these cases once the host router is runtime suspended the picture
on the connected USB-C display disappears too. This is certainly not
what the user expected.

For this reason improve the redrive mode handling to keep the host
router from runtime suspending when detect that any of the above cases
is happening.

Fixes: a75e0684efe5 ("thunderbolt: Keep the domain powered when USB4 port is in redrive mode")
Reported-by: Aaron Rainbolt <arainbolt@kfocus.org>
Closes: https://lore.kernel.org/linux-usb/20241009220118.70bfedd0@kf-ir16/
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4f777788e917..a7c6919fbf97 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2059,6 +2059,37 @@ static void tb_exit_redrive(struct tb_port *port)
 	}
 }
 
+static void tb_switch_enter_redrive(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port)
+		tb_enter_redrive(port);
+}
+
+/*
+ * Called during system and runtime suspend to forcefully exit redrive
+ * mode without querying whether the resource is available.
+ */
+static void tb_switch_exit_redrive(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	if (!(sw->quirks & QUIRK_KEEP_POWER_IN_DP_REDRIVE))
+		return;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!tb_port_is_dpin(port))
+			continue;
+
+		if (port->redrive) {
+			port->redrive = false;
+			pm_runtime_put(&sw->dev);
+			tb_port_dbg(port, "exit redrive mode\n");
+		}
+	}
+}
+
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
 {
 	struct tb_port *in, *out;
@@ -2909,6 +2940,7 @@ static int tb_start(struct tb *tb, bool reset)
 	tb_create_usb3_tunnels(tb->root_switch);
 	/* Add DP IN resources for the root switch */
 	tb_add_dp_resources(tb->root_switch);
+	tb_switch_enter_redrive(tb->root_switch);
 	/* Make the discovered switches available to the userspace */
 	device_for_each_child(&tb->root_switch->dev, NULL,
 			      tb_scan_finalize_switch);
@@ -2924,6 +2956,7 @@ static int tb_suspend_noirq(struct tb *tb)
 
 	tb_dbg(tb, "suspending...\n");
 	tb_disconnect_and_release_dp(tb);
+	tb_switch_exit_redrive(tb->root_switch);
 	tb_switch_suspend(tb->root_switch, false);
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
 	tb_dbg(tb, "suspend finished\n");
@@ -3016,6 +3049,7 @@ static int tb_resume_noirq(struct tb *tb)
 		tb_dbg(tb, "tunnels restarted, sleeping for 100ms\n");
 		msleep(100);
 	}
+	tb_switch_enter_redrive(tb->root_switch);
 	 /* Allow tb_handle_hotplug to progress events */
 	tcm->hotplug_active = true;
 	tb_dbg(tb, "resume finished\n");
@@ -3079,6 +3113,12 @@ static int tb_runtime_suspend(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 
 	mutex_lock(&tb->lock);
+	/*
+	 * The below call only releases DP resources to allow exiting and
+	 * re-entering redrive mode.
+	 */
+	tb_disconnect_and_release_dp(tb);
+	tb_switch_exit_redrive(tb->root_switch);
 	tb_switch_suspend(tb->root_switch, true);
 	tcm->hotplug_active = false;
 	mutex_unlock(&tb->lock);
@@ -3110,6 +3150,7 @@ static int tb_runtime_resume(struct tb *tb)
 	tb_restore_children(tb->root_switch);
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list)
 		tb_tunnel_restart(tunnel);
+	tb_switch_enter_redrive(tb->root_switch);
 	tcm->hotplug_active = true;
 	mutex_unlock(&tb->lock);
 
-- 
2.45.2



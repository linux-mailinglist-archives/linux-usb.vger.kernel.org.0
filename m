Return-Path: <linux-usb+bounces-9055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6089BF5F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 14:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0711C2141C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 12:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54596E60E;
	Mon,  8 Apr 2024 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrj0hNvq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CC6BFA9
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580489; cv=none; b=NxoeK4dlUa6m5Ekez+EA152CIHEKI36tRTwr1jhnS27RRm7dL/of9B17D0dsaxFRz6o7mch7/EIZzTd4VtS/JhnrDUB0HgB8gedz8CozHFXpwsPsDEXL0OJ8epANFUMWF3vv42zwuxS6lMzNJV3P35bQtJM4TET2MTNULZSFK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580489; c=relaxed/simple;
	bh=tcQY+L65bmhF7UovNVosDQjsP9ILz3Rb1zWcHkLKa78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBclXK7JSW/A3ULYOdnIEcTnZ2Sqq/1Y82Wl4pksalJAulW6+KFLBAIQEEt9bYzL4pcFcmPfzqLQyH+mOGL6hKyMOWXgojYLydohh1t4gUKyG//fpHqPe5YYZKVEb6LQlNn2MCt4CrQcCahsY9YIPCDxiNYWxR+hTIj6I5Tao2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrj0hNvq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712580488; x=1744116488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tcQY+L65bmhF7UovNVosDQjsP9ILz3Rb1zWcHkLKa78=;
  b=Yrj0hNvq1FD2Sq31FTU0lLuFeT3oJoYQvqfes7+PEIWgglR+pbY0VkwQ
   X4ESn6+Kb7OYH8sS2jkba42iqpMzq2a9ODF8Uf25Kh9+Cf4Gnr20gtDZN
   4ZeYmi96rSotaGxfjrFn+ZDD4nZZ9ynSfcYvoMnjR/wvVjc2kq7Cdu5Q6
   hXMPllKeMRURjlGK4nReut+0vOmAG72zycVtiJLF39JC5H9WuKtHF3XMJ
   PY36PpcxI9oopOIj5w9CgGcjMlEmYJyr/tD39XhWW6AtBIkGdQdzk605A
   2NA3Ws04MB+CLzQBsFoNikH6oTKTVdBKDc+UV3jej2RCPACR0NS/rbMn9
   A==;
X-CSE-ConnectionGUID: eHO257NzQwyQ1P3ssnkp8w==
X-CSE-MsgGUID: yucwNryxQymoO9UUmNR2Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7721280"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7721280"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 05:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="937091419"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="937091419"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2024 05:48:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1149B12C; Mon,  8 Apr 2024 15:48:04 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Avoid notify PM core about runtime PM resume
Date: Mon,  8 Apr 2024 15:48:03 +0300
Message-ID: <20240408124803.12329-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240408124803.12329-1-mika.westerberg@linux.intel.com>
References: <20240408124803.12329-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Currently we notify PM core about occurred wakes after any resume. This
is not actually needed after resume from runtime suspend. Hence, notify
PM core about occurred wakes only after resume from system sleep. Also,
if the wake occurred in USB4 router upstream port, we don't notify the
PM core about it since it is not actually needed and can cause
unexpected autowake (e.g. if /sys/power/wakeup_count is used).

While there add the missing kernel-doc for tb_switch_resume().

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 27 +++++++++++++++++++++++++--
 drivers/thunderbolt/tb.c     |  4 ++--
 drivers/thunderbolt/tb.h     |  3 ++-
 drivers/thunderbolt/usb4.c   | 13 +++++++------
 4 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 4edfd6e34e31..326433df5880 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3448,7 +3448,26 @@ static int tb_switch_set_wake(struct tb_switch *sw, unsigned int flags)
 	return tb_lc_set_wake(sw, flags);
 }
 
-int tb_switch_resume(struct tb_switch *sw)
+static void tb_switch_check_wakes(struct tb_switch *sw)
+{
+	if (device_may_wakeup(&sw->dev)) {
+		if (tb_switch_is_usb4(sw))
+			usb4_switch_check_wakes(sw);
+	}
+}
+
+/**
+ * tb_switch_resume() - Resume a switch after sleep
+ * @sw: Switch to resume
+ * @runtime: Is this resume from runtime suspend or system sleep
+ *
+ * Resumes and re-enumerates router (and all its children), if still plugged
+ * after suspend. Don't enumerate device router whose UID was changed during
+ * suspend. If this is resume from system sleep, notifies PM core about the
+ * wakes occurred during suspend. Disables all wakes, except USB4 wake of
+ * upstream port for USB4 routers that shall be always enabled.
+ */
+int tb_switch_resume(struct tb_switch *sw, bool runtime)
 {
 	struct tb_port *port;
 	int err;
@@ -3497,6 +3516,9 @@ int tb_switch_resume(struct tb_switch *sw)
 	if (err)
 		return err;
 
+	if (!runtime)
+		tb_switch_check_wakes(sw);
+
 	/* Disable wakes */
 	tb_switch_set_wake(sw, 0);
 
@@ -3526,7 +3548,8 @@ int tb_switch_resume(struct tb_switch *sw)
 			 */
 			if (tb_port_unlock(port))
 				tb_port_warn(port, "failed to unlock port\n");
-			if (port->remote && tb_switch_resume(port->remote->sw)) {
+			if (port->remote &&
+			    tb_switch_resume(port->remote->sw, runtime)) {
 				tb_port_warn(port,
 					     "lost during suspend, disconnecting\n");
 				tb_sw_set_unplugged(port->remote->sw);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 360cb95f39aa..3e44c78ac409 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2942,7 +2942,7 @@ static int tb_resume_noirq(struct tb *tb)
 	if (!tb_switch_is_usb4(tb->root_switch))
 		tb_switch_reset(tb->root_switch);
 
-	tb_switch_resume(tb->root_switch);
+	tb_switch_resume(tb->root_switch, false);
 	tb_free_invalid_tunnels(tb);
 	tb_free_unplugged_children(tb->root_switch);
 	tb_restore_children(tb->root_switch);
@@ -3068,7 +3068,7 @@ static int tb_runtime_resume(struct tb *tb)
 	struct tb_tunnel *tunnel, *n;
 
 	mutex_lock(&tb->lock);
-	tb_switch_resume(tb->root_switch);
+	tb_switch_resume(tb->root_switch, true);
 	tb_free_invalid_tunnels(tb);
 	tb_restore_children(tb->root_switch);
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list)
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index feed8ecaf712..18aae4ccaed5 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -827,7 +827,7 @@ int tb_switch_configuration_valid(struct tb_switch *sw);
 int tb_switch_add(struct tb_switch *sw);
 void tb_switch_remove(struct tb_switch *sw);
 void tb_switch_suspend(struct tb_switch *sw, bool runtime);
-int tb_switch_resume(struct tb_switch *sw);
+int tb_switch_resume(struct tb_switch *sw, bool runtime);
 int tb_switch_reset(struct tb_switch *sw);
 int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 			   u32 value, int timeout_msec);
@@ -1288,6 +1288,7 @@ static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
 	return usb4_switch_version(sw) > 0;
 }
 
+void usb4_switch_check_wakes(struct tb_switch *sw);
 int usb4_switch_setup(struct tb_switch *sw);
 int usb4_switch_configuration_valid(struct tb_switch *sw);
 int usb4_switch_read_uid(struct tb_switch *sw, u64 *uid);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 9860b49d7a2b..78b06e922fda 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -155,7 +155,13 @@ static inline int usb4_switch_op_data(struct tb_switch *sw, u16 opcode,
 				tx_dwords, rx_data, rx_dwords);
 }
 
-static void usb4_switch_check_wakes(struct tb_switch *sw)
+/**
+ * usb4_switch_check_wakes() - Check for wakes and notify PM core about them
+ * @sw: Router whose wakes to check
+ *
+ * Checks wakes occurred during suspend and notify the PM core about them.
+ */
+void usb4_switch_check_wakes(struct tb_switch *sw)
 {
 	bool wakeup_usb4 = false;
 	struct usb4_port *usb4;
@@ -163,9 +169,6 @@ static void usb4_switch_check_wakes(struct tb_switch *sw)
 	bool wakeup = false;
 	u32 val;
 
-	if (!device_may_wakeup(&sw->dev))
-		return;
-
 	if (tb_route(sw)) {
 		if (tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_6, 1))
 			return;
@@ -244,8 +247,6 @@ int usb4_switch_setup(struct tb_switch *sw)
 	u32 val = 0;
 	int ret;
 
-	usb4_switch_check_wakes(sw);
-
 	if (!tb_route(sw))
 		return 0;
 
-- 
2.43.0



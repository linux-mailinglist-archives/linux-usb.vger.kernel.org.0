Return-Path: <linux-usb+bounces-23184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BEA9173F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6D9617B3CC
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEF222A4D2;
	Thu, 17 Apr 2025 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4ftZmI9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034562288E3
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880675; cv=none; b=leIFdoACiDftm9Woj/ST/SkwhIg3re+avEY71e7+EV3UwSL08Kt9Y9lVDRjfDZGHodd5/zQMMKWVkh4aklatP4vCIvWD8A8WwaC3q94+jEkSkBV1BZAfI637owLd9QwKhw6KPi7IU0sGfjriCsb2HxuyRRrFFWCuWcFFL7FfgY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880675; c=relaxed/simple;
	bh=8ptKG71osZf9Z7VcQVSNGRCr6hO9tgDtvzwD3L6mOmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkvgXjV0dRkY/EvgYg2ybkVA2cJ+EXY/WaSIuosrF61ApSl/F1T0b2amjMxT2lrRvJXAgyskwCxJak92QjIngObXUawBsopeeuOsyt6daLvxxFVxeZcAeVlFiJKY7/A350Bs4tbFqv/NTLi3LLI4xlPPcPrrEvDrGxbzU36zBbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4ftZmI9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744880674; x=1776416674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ptKG71osZf9Z7VcQVSNGRCr6hO9tgDtvzwD3L6mOmQ=;
  b=k4ftZmI90dsHWlh8cYSZisOj05W0dhbLUGA3brgNJodpfAoC5rPf15hA
   Ocbk8sTxrj7TSQE+jg7K5EK6tBwtet/oLl2tYzgE1083jh2iGdqhsSSzn
   5W0djGYcspMjtp7WluaEl6im8/rVBuI0Jmb3zx4P6PoW6iu+Jg3MFTULW
   tCVj70VkHBDyizSseQuO0s/28PNGpGRPXJnzKPd3GYonmTNuXGsmCwEkn
   Ukkb46gWIGnevdkqMk27zomET/u3V3YvCt/fZg0xG+Np0UZfEP4ssEgR+
   54uuRn6m+URyvNoyl2qVZsPRBwS/UOP+CZOGJMgP622WGyQPCCEdriNj0
   w==;
X-CSE-ConnectionGUID: KDaBpfAMSwCxFHziSR2R1Q==
X-CSE-MsgGUID: KfE7Pk16TxW/xTFT7L5M7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45692743"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45692743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:04:30 -0700
X-CSE-ConnectionGUID: HOBzvQCOTWCOhhre5M1Iyg==
X-CSE-MsgGUID: 94oycCNIQEyHvr4VOd12qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131287407"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 17 Apr 2025 02:04:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 050B5741; Thu, 17 Apr 2025 12:04:27 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/4] thunderbolt: Notify userspace about firmware CM tunneling events
Date: Thu, 17 Apr 2025 12:04:25 +0300
Message-ID: <20250417090426.221773-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

In the same way we do for software connection manager, send
notifications about tunneling changes done by the firmware connection
manager as well. There are some limitations with this though, for
example we only get "DP Configuration Changed" message from the firmware
without any indication if DisplayPort tunnel was activated or
deactivated. Also we don't get information about the tunnel itself
either so the event then looks like:

  TUNNEL_EVENT=changed
  TUNNEL_DETAILS=(DP)

XDomain connections are similar to what the software connection manager
sends.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c     | 36 ++++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb_msgs.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 7859bccc592d..f213d9174dc5 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -22,6 +22,7 @@
 #include "ctl.h"
 #include "nhi_regs.h"
 #include "tb.h"
+#include "tunnel.h"
 
 #define PCIE2CIO_CMD			0x30
 #define PCIE2CIO_CMD_TIMEOUT		BIT(31)
@@ -379,6 +380,27 @@ static bool icm_firmware_running(const struct tb_nhi *nhi)
 	return !!(val & REG_FW_STS_ICM_EN);
 }
 
+static void icm_xdomain_activated(struct tb_xdomain *xd, bool activated)
+{
+	struct tb_port *nhi_port, *dst_port;
+	struct tb *tb = xd->tb;
+
+	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
+	dst_port = tb_xdomain_downstream_port(xd);
+
+	if (activated)
+		tb_tunnel_event(tb, TB_TUNNEL_ACTIVATED, TB_TUNNEL_DMA,
+				nhi_port, dst_port);
+	else
+		tb_tunnel_event(tb, TB_TUNNEL_DEACTIVATED, TB_TUNNEL_DMA,
+				nhi_port, dst_port);
+}
+
+static void icm_dp_event(struct tb *tb)
+{
+	tb_tunnel_event(tb, TB_TUNNEL_CHANGED, TB_TUNNEL_DP, NULL, NULL);
+}
+
 static bool icm_fr_is_supported(struct tb *tb)
 {
 	return !x86_apple_machine;
@@ -584,6 +606,7 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	if (reply.hdr.flags & ICM_FLAGS_ERROR)
 		return -EIO;
 
+	icm_xdomain_activated(xd, true);
 	return 0;
 }
 
@@ -603,6 +626,8 @@ static int icm_fr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	nhi_mailbox_cmd(tb->nhi, cmd, 1);
 	usleep_range(10, 50);
 	nhi_mailbox_cmd(tb->nhi, cmd, 2);
+
+	icm_xdomain_activated(xd, false);
 	return 0;
 }
 
@@ -1151,6 +1176,7 @@ static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	if (reply.hdr.flags & ICM_FLAGS_ERROR)
 		return -EIO;
 
+	icm_xdomain_activated(xd, true);
 	return 0;
 }
 
@@ -1191,7 +1217,12 @@ static int icm_tr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 		return ret;
 
 	usleep_range(10, 50);
-	return icm_tr_xdomain_tear_down(tb, xd, 2);
+	ret = icm_tr_xdomain_tear_down(tb, xd, 2);
+	if (ret)
+		return ret;
+
+	icm_xdomain_activated(xd, false);
+	return 0;
 }
 
 static void
@@ -1718,6 +1749,9 @@ static void icm_handle_notification(struct work_struct *work)
 			if (tb_is_xdomain_enabled())
 				icm->xdomain_disconnected(tb, n->pkg);
 			break;
+		case ICM_EVENT_DP_CONFIG_CHANGED:
+			icm_dp_event(tb);
+			break;
 		case ICM_EVENT_RTD3_VETO:
 			icm->rtd3_veto(tb, n->pkg);
 			break;
diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index a1670a96cbdc..144f7332d5d2 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -118,6 +118,7 @@ enum icm_event_code {
 	ICM_EVENT_DEVICE_DISCONNECTED = 0x4,
 	ICM_EVENT_XDOMAIN_CONNECTED = 0x6,
 	ICM_EVENT_XDOMAIN_DISCONNECTED = 0x7,
+	ICM_EVENT_DP_CONFIG_CHANGED = 0x8,
 	ICM_EVENT_RTD3_VETO = 0xa,
 };
 
-- 
2.47.2



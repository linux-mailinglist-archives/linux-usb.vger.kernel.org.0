Return-Path: <linux-usb+bounces-22904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27539A843C9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 14:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7628C7D8D
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 12:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CE028541E;
	Thu, 10 Apr 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1wxbGfG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D472853EB
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289768; cv=none; b=s86ed+Vmvxh+DMdx7jGoGlyCa6cdPvuTCNfRMbNy57LCTYrazzuvDqDs2c5qjoWBZWTnJh83CQyFKbhG9Uff1571WgYEGyjpfdyq+0L4r8sozAgj6LAA+C8HXi1fTAvEBMvuL3UxtXJ3y2Y+/eYQXClFdtyTCbhyf9LCNUkBG4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289768; c=relaxed/simple;
	bh=8ptKG71osZf9Z7VcQVSNGRCr6hO9tgDtvzwD3L6mOmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUeQd0Lq31oiO+5ne3am2PFsGLaZ4dL9AQTTBxl0F/iDu/PP4EqbXLuYNqZvqE6klO9jszEaNQkE2RTB+Mh7p6NvqTpkcJ1Vb+Jg+ZcbHIafF7/TNLAbJb7hBowQlDHeCEbUhSqn0hIkTgW3/wyAeZGgX7gPQSiXerMsI94+XH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1wxbGfG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744289766; x=1775825766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ptKG71osZf9Z7VcQVSNGRCr6hO9tgDtvzwD3L6mOmQ=;
  b=N1wxbGfGbdgUSzGT6nmQEgAjVI/SVIiQ5cv7b/8vi9HXMJGvk+KMwvtt
   Zw+FB8mh6JjmbRZfJz1q+Cu6geqFnmV+8uTkC88/JNxp1xow8xrDuHLNB
   33hyYd6kMwyi/6s8qyPs6X7Opg5/JvJUxSfASXD0AJs7bjzv/MMyhpEsJ
   RQiWlaULM8wIPvvDC9joCUSapvFWJCXToFVglcOlErtl/xZYbbSQbY3QF
   gNezseRCGy6XEnFnqTHrdpTkgo6f147csGAOGPFiBuy8RlT46UoZ/h+0v
   rSu1VDuwSB185ObN5OJv3n1DyRMoc/nrlnzjfHfrfGshfSsmOCetCDRAB
   w==;
X-CSE-ConnectionGUID: /0ljArpWRgG7sU5zep7NZA==
X-CSE-MsgGUID: BOrMTxgDQ3yr/jEyEMU1oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48512299"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48512299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 05:56:04 -0700
X-CSE-ConnectionGUID: Zls1DrErTea2Os/nTffk/w==
X-CSE-MsgGUID: 2S1AQRQ+R4yUiBwvNPR3xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="159861910"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2025 05:56:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C1C5B54E; Thu, 10 Apr 2025 15:56:00 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Notify userspace about firmware CM tunneling events
Date: Thu, 10 Apr 2025 15:56:00 +0300
Message-ID: <20250410125600.3074417-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
References: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
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



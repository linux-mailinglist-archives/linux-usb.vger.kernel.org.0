Return-Path: <linux-usb+bounces-23182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77DA91740
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 040E33A8B47
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C34D1ACEBE;
	Thu, 17 Apr 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkfsBN7I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914C227E94
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880674; cv=none; b=Ozxv3iecMnULfxzRUcHMI49se7JI6YseS0vImihSvywtVnv84vhTWZL7itqhWoP5kpsEMzX6ZAZHZnOIU6sxrDN5T8OUgBInSYDRJ2cyissWTVW4IBPvBzQUvEqGkTESK0i2Z18Nq4fCkLPbDJqu5EZs9p3D+Xp0TET+T0+1GAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880674; c=relaxed/simple;
	bh=w4/E/uG9xfZKyESIFc/a8meKbbaPSygZubR2fGdsEug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrbTIbWnVRIn5eHHi+//ftaWDqUvUtltEAeNXmr0c2Khs3U1L9gI4WQIsOmxxujeMnww/vPExnMnVgSH99vS+IVN+8+XMW+youzJF8cfzlEy2WhDFeF1j5A9gTgfXhDl5uVpCOSNsW71mY//OwMNlsCnU9owV9UcDbgCuyEL4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkfsBN7I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744880672; x=1776416672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4/E/uG9xfZKyESIFc/a8meKbbaPSygZubR2fGdsEug=;
  b=AkfsBN7IhYG92AodBkQkLYM/UIy6BmqdRKI2/+ca3nrt6ZGN35utg1J6
   1gKgjXjZQC0nT3Mh7HRZ92Oa29ymHKTjkljtSvDp/6xJSMhrS3BG75nGU
   817yiCgpe2yCzFrxhxrsK/XVmB2/Tpf2MzSwb5Y/XLVNbIaSFkFxzVVFD
   yG/bCOnDP1oX1m51lxwaTjHuoGyJpcW2g1Z8nCS/0cLk1n5z9V/uuFM+o
   0FeRpx54Ti7c0KMZFi4rYJ7tehDhjtXi82ZXPjhccSGWYgLvIyA5FKviF
   o0o4NYbK3qinOEqy3UV445vJur8sscg9ZBFVxw7SKv2reOVm1/dXzhXry
   g==;
X-CSE-ConnectionGUID: eibX5pFWRYOlzQbixaACTA==
X-CSE-MsgGUID: Cav5YrHSRYmX7c4GG/gH8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50281225"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="50281225"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:04:30 -0700
X-CSE-ConnectionGUID: SqQF3yFMQ/q55ZPV1oWKLg==
X-CSE-MsgGUID: hcjeWXwkRguY7OmlYGmdpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131066816"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 02:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EF16C8F; Thu, 17 Apr 2025 12:04:26 +0300 (EEST)
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
Subject: [PATCH v2 2/4] thunderbolt: Notify userspace about software CM tunneling events
Date: Thu, 17 Apr 2025 12:04:24 +0300
Message-ID: <20250417090426.221773-3-mika.westerberg@linux.intel.com>
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

This adds notification whenever software connection manager activates,
changes or deactivates a tunnel, and also if there is limitation in
bandwidth.

The notification looks like below:

  TUNNEL_EVENT=activated|changed|deactivated|low bandwidth|
  	       insufficient bandwidth
  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)

Userspace can then listen these and inform user if needed. For example
if there is not enough bandwidth, it can show warning dialog to the user.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     | 22 +++++++--
 drivers/thunderbolt/tunnel.c | 92 ++++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/tunnel.h | 23 +++++++++
 3 files changed, 129 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 8c527af98927..c14ab1fbeeaf 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -952,6 +952,15 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 	tb_port_dbg(up, "available bandwidth for new USB3 tunnel %d/%d Mb/s\n",
 		    available_up, available_down);
 
+	/*
+	 * If the available bandwidth is less than 1.5 Gb/s notify
+	 * userspace that the connected isochronous device may not work
+	 * properly.
+	 */
+	if (available_up < 1500 || available_down < 1500)
+		tb_tunnel_event(tb, TB_TUNNEL_LOW_BANDWIDTH, TB_TUNNEL_USB3,
+				down, up);
+
 	tunnel = tb_tunnel_alloc_usb3(tb, up, down, available_up,
 				      available_down);
 	if (!tunnel) {
@@ -2000,8 +2009,10 @@ static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 
 	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down,
 				     true);
-	if (ret)
+	if (ret) {
+		tb_tunnel_event(tb, TB_TUNNEL_NO_BANDWIDTH, TB_TUNNEL_DP, in, out);
 		goto err_reclaim_usb;
+	}
 
 	tb_dbg(tb, "available bandwidth for new DP tunnel %u/%u Mb/s\n",
 	       available_up, available_down);
@@ -2622,8 +2633,12 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 			}
 		}
 
-		return tb_tunnel_alloc_bandwidth(tunnel, requested_up,
-						 requested_down);
+		ret = tb_tunnel_alloc_bandwidth(tunnel, requested_up,
+						requested_down);
+		if (ret)
+			goto fail;
+
+		return 0;
 	}
 
 	/*
@@ -2699,6 +2714,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 			      "failing the request by rewriting allocated %d/%d Mb/s\n",
 			      allocated_up, allocated_down);
 		tb_tunnel_alloc_bandwidth(tunnel, &allocated_up, &allocated_down);
+		tb_tunnel_event(tb, TB_TUNNEL_NO_BANDWIDTH, TB_TUNNEL_DP, in, out);
 	}
 
 	return ret;
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 76254ed3f47f..d52efe3f658c 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -100,6 +100,14 @@ MODULE_PARM_DESC(bw_alloc_mode,
 
 static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 
+static const char * const tb_event_names[] = {
+	[TB_TUNNEL_ACTIVATED] = "activated",
+	[TB_TUNNEL_CHANGED] = "changed",
+	[TB_TUNNEL_DEACTIVATED] = "deactivated",
+	[TB_TUNNEL_LOW_BANDWIDTH] = "low bandwidth",
+	[TB_TUNNEL_NO_BANDWIDTH] = "insufficient bandwidth",
+};
+
 /* Synchronizes kref_get()/put() of struct tb_tunnel */
 static DEFINE_MUTEX(tb_tunnel_lock);
 
@@ -220,6 +228,72 @@ void tb_tunnel_put(struct tb_tunnel *tunnel)
 	mutex_unlock(&tb_tunnel_lock);
 }
 
+/**
+ * tb_tunnel_event() - Notify userspace about tunneling event
+ * @tb: Domain where the event occurred
+ * @event: Event that happened
+ * @type: Type of the tunnel in question
+ * @src_port: Tunnel source port (can be %NULL)
+ * @dst_port: Tunnel destination port (can be %NULL)
+ *
+ * Notifies userspace about tunneling @event in the domain. The tunnel
+ * does not need to exist (e.g the tunnel was not activated because
+ * there is not enough bandwidth). If the @src_port and @dst_port are
+ * given fill in full %TUNNEL_DETAILS environment variable. Otherwise
+ * uses the shorter one (just the tunnel type).
+ */
+void tb_tunnel_event(struct tb *tb, enum tb_tunnel_event event,
+		     enum tb_tunnel_type type,
+		     const struct tb_port *src_port,
+		     const struct tb_port *dst_port)
+{
+	char *envp[3] = { NULL };
+
+	if (WARN_ON_ONCE(event >= ARRAY_SIZE(tb_event_names)))
+		return;
+	if (WARN_ON_ONCE(type >= ARRAY_SIZE(tb_tunnel_names)))
+		return;
+
+	envp[0] = kasprintf(GFP_KERNEL, "TUNNEL_EVENT=%s", tb_event_names[event]);
+	if (!envp[0])
+		return;
+
+	if (src_port != NULL && dst_port != NULL) {
+		envp[1] = kasprintf(GFP_KERNEL, "TUNNEL_DETAILS=%llx:%u <-> %llx:%u (%s)",
+				    tb_route(src_port->sw), src_port->port,
+				    tb_route(dst_port->sw), dst_port->port,
+				    tb_tunnel_names[type]);
+	} else {
+		envp[1] = kasprintf(GFP_KERNEL, "TUNNEL_DETAILS=(%s)",
+				    tb_tunnel_names[type]);
+	}
+
+	if (envp[1])
+		tb_domain_event(tb, envp);
+
+	kfree(envp[1]);
+	kfree(envp[0]);
+}
+
+static inline void tb_tunnel_set_active(struct tb_tunnel *tunnel, bool active)
+{
+	if (active) {
+		tunnel->state = TB_TUNNEL_ACTIVE;
+		tb_tunnel_event(tunnel->tb, TB_TUNNEL_ACTIVATED, tunnel->type,
+				tunnel->src_port, tunnel->dst_port);
+	} else {
+		tunnel->state = TB_TUNNEL_INACTIVE;
+		tb_tunnel_event(tunnel->tb, TB_TUNNEL_DEACTIVATED, tunnel->type,
+				tunnel->src_port, tunnel->dst_port);
+	}
+}
+
+static inline void tb_tunnel_changed(struct tb_tunnel *tunnel)
+{
+	tb_tunnel_event(tunnel->tb, TB_TUNNEL_CHANGED, tunnel->type,
+			tunnel->src_port, tunnel->dst_port);
+}
+
 static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 {
 	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
@@ -992,7 +1066,7 @@ static void tb_dp_dprx_work(struct work_struct *work)
 				return;
 			}
 		} else {
-			tunnel->state = TB_TUNNEL_ACTIVE;
+			tb_tunnel_set_active(tunnel, true);
 		}
 		mutex_unlock(&tb->lock);
 	}
@@ -2326,7 +2400,7 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 		}
 	}
 
-	tunnel->state = TB_TUNNEL_ACTIVE;
+	tb_tunnel_set_active(tunnel, true);
 	return 0;
 
 err:
@@ -2356,7 +2430,7 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel)
 	if (tunnel->post_deactivate)
 		tunnel->post_deactivate(tunnel);
 
-	tunnel->state = TB_TUNNEL_INACTIVE;
+	tb_tunnel_set_active(tunnel, false);
 }
 
 /**
@@ -2449,8 +2523,16 @@ int tb_tunnel_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	if (!tb_tunnel_is_active(tunnel))
 		return -ENOTCONN;
 
-	if (tunnel->alloc_bandwidth)
-		return tunnel->alloc_bandwidth(tunnel, alloc_up, alloc_down);
+	if (tunnel->alloc_bandwidth) {
+		int ret;
+
+		ret = tunnel->alloc_bandwidth(tunnel, alloc_up, alloc_down);
+		if (ret)
+			return ret;
+
+		tb_tunnel_changed(tunnel);
+		return 0;
+	}
 
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 8a0a0cb21a89..5e9fb73d5220 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -194,6 +194,29 @@ static inline bool tb_tunnel_direction_downstream(const struct tb_tunnel *tunnel
 						 tunnel->dst_port);
 }
 
+/**
+ * enum tb_tunnel_event - Tunnel related events
+ * @TB_TUNNEL_ACTIVATED: A tunnel was activated
+ * @TB_TUNNEL_CHANGED: There is a tunneling change in the domain. Includes
+ *		       full %TUNNEL_DETAILS if the tunnel in question is known
+ *		       (ICM does not provide that information).
+ * @TB_TUNNEL_DEACTIVATED: A tunnel was torn down
+ * @TB_TUNNEL_LOW_BANDWIDTH: Tunnel bandwidth is not optimal
+ * @TB_TUNNEL_NO_BANDWIDTH: There is not enough bandwidth for a tunnel
+ */
+enum tb_tunnel_event {
+	TB_TUNNEL_ACTIVATED,
+	TB_TUNNEL_CHANGED,
+	TB_TUNNEL_DEACTIVATED,
+	TB_TUNNEL_LOW_BANDWIDTH,
+	TB_TUNNEL_NO_BANDWIDTH,
+};
+
+void tb_tunnel_event(struct tb *tb, enum tb_tunnel_event event,
+		     enum tb_tunnel_type type,
+		     const struct tb_port *src_port,
+		     const struct tb_port *dst_port);
+
 const char *tb_tunnel_type_name(const struct tb_tunnel *tunnel);
 
 #define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
-- 
2.47.2



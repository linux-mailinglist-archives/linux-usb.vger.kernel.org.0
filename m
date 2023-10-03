Return-Path: <linux-usb+bounces-1015-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAB7B65AA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9DC5D281874
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5315101D0;
	Tue,  3 Oct 2023 09:40:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F611C8B
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2675FAB
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326013; x=1727862013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kki/1BQHi8+I+o6kzCt0a7t7cPCxcxYW5iAwFIdxdOU=;
  b=LusfjsQaeryEjs5suuyWBimB2125/RlmuD0SW/YXVVglUvJ5JDYa/5C2
   WItaL1vAUx+k8FeWO5l3q5Vu7IFGfXTcTHQg8+vJGxYaR9qaDOzusUHso
   UJhOK3os657ht8xD7/eK5ARra1izTzyPimUvj8WtAnIXjGNwqfC+tizNF
   odA3Tls6U2C09Pn8HnxqHBfsfJD6d60Dvnr3lbzR9QcMBafZONZm/dqOy
   QxzpW5VpqayoL91yGCBtF5hsLRLjUGqwe+wh5sq3mJVPiSbhOSc8TgR0n
   LcbkZJNgz4VPLhMdpcx2KQ0jPT4z9eeuzw5HiS3dK+Fm1Qy0xEX2QMyNQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362204853"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362204853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727558513"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="727558513"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C32951B01; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/13] thunderbolt: Expose tb_tunnel_xxx() log macros to the rest of the driver
Date: Tue,  3 Oct 2023 12:40:01 +0300
Message-Id: <20231003094005.2676823-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In order to allow more consistent logging of tunnel related information
make these logging macros available to the rest of the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 26 +++++---------------------
 drivers/thunderbolt/tunnel.h | 24 +++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 85b1cccf518f..9775332dee0e 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -58,27 +58,6 @@ MODULE_PARM_DESC(bw_alloc_mode,
 
 static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 
-#define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
-	do {                                                            \
-		struct tb_tunnel *__tunnel = (tunnel);                  \
-		level(__tunnel->tb, "%llx:%u <-> %llx:%u (%s): " fmt,   \
-		      tb_route(__tunnel->src_port->sw),                 \
-		      __tunnel->src_port->port,                         \
-		      tb_route(__tunnel->dst_port->sw),                 \
-		      __tunnel->dst_port->port,                         \
-		      tb_tunnel_names[__tunnel->type],			\
-		      ## arg);                                          \
-	} while (0)
-
-#define tb_tunnel_WARN(tunnel, fmt, arg...) \
-	__TB_TUNNEL_PRINT(tb_WARN, tunnel, fmt, ##arg)
-#define tb_tunnel_warn(tunnel, fmt, arg...) \
-	__TB_TUNNEL_PRINT(tb_warn, tunnel, fmt, ##arg)
-#define tb_tunnel_info(tunnel, fmt, arg...) \
-	__TB_TUNNEL_PRINT(tb_info, tunnel, fmt, ##arg)
-#define tb_tunnel_dbg(tunnel, fmt, arg...) \
-	__TB_TUNNEL_PRINT(tb_dbg, tunnel, fmt, ##arg)
-
 static inline unsigned int tb_usable_credits(const struct tb_port *port)
 {
 	return port->total_credits - port->ctl_credits;
@@ -2375,3 +2354,8 @@ void tb_tunnel_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
 		tunnel->reclaim_available_bandwidth(tunnel, available_up,
 						    available_down);
 }
+
+const char *tb_tunnel_type_name(const struct tb_tunnel *tunnel)
+{
+	return tb_tunnel_names[tunnel->type];
+}
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index bf690f7beeee..750ebb570d99 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -137,5 +137,27 @@ static inline bool tb_tunnel_is_usb3(const struct tb_tunnel *tunnel)
 	return tunnel->type == TB_TUNNEL_USB3;
 }
 
-#endif
+const char *tb_tunnel_type_name(const struct tb_tunnel *tunnel);
+
+#define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
+	do {                                                            \
+		struct tb_tunnel *__tunnel = (tunnel);                  \
+		level(__tunnel->tb, "%llx:%u <-> %llx:%u (%s): " fmt,   \
+		      tb_route(__tunnel->src_port->sw),                 \
+		      __tunnel->src_port->port,                         \
+		      tb_route(__tunnel->dst_port->sw),                 \
+		      __tunnel->dst_port->port,                         \
+		      tb_tunnel_type_name(__tunnel),			\
+		      ## arg);                                          \
+	} while (0)
 
+#define tb_tunnel_WARN(tunnel, fmt, arg...) \
+	__TB_TUNNEL_PRINT(tb_WARN, tunnel, fmt, ##arg)
+#define tb_tunnel_warn(tunnel, fmt, arg...) \
+	__TB_TUNNEL_PRINT(tb_warn, tunnel, fmt, ##arg)
+#define tb_tunnel_info(tunnel, fmt, arg...) \
+	__TB_TUNNEL_PRINT(tb_info, tunnel, fmt, ##arg)
+#define tb_tunnel_dbg(tunnel, fmt, arg...) \
+	__TB_TUNNEL_PRINT(tb_dbg, tunnel, fmt, ##arg)
+
+#endif
-- 
2.40.1



Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EB632D331
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 13:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240846AbhCDMdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 07:33:25 -0500
Received: from mga04.intel.com ([192.55.52.120]:10302 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240797AbhCDMdR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Mar 2021 07:33:17 -0500
IronPort-SDR: PL2OKzZDdZoqplpLNB+EicacRX2HVDEG+L+idnE+qvKHHnXpVNHbEmhQ4q+UReOHlOkhp4VxmD
 i++VpfzGmP0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="184994133"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="184994133"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:31:29 -0800
IronPort-SDR: SmusOe2hZXijIRsBdqL+bf5HfE5avM4ARXd2xDVV6nYU4cDMXzz0T4ipeO6Xdjr5Y13RbaOSbC
 WaULhjshLJDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="374534659"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 04 Mar 2021 04:31:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4EB6E29E; Thu,  4 Mar 2021 14:31:26 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH 03/18] thunderbolt: Decrease control channel timeout for software connection manager
Date:   Thu,  4 Mar 2021 15:31:10 +0300
Message-Id: <20210304123125.43630-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
References: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the firmware connection manager is not proxying between the
software and the hardware we can decrease the timeout for control
packets significantly. The USB4 spec recommends 10 ms +- 1 ms but we use
slightly larger value (100 ms) which is recommendation from Intel
Thunderbolt firmware folks. When firmware connection manager is running
then we keep using the existing 5000 ms.

To implement this we move the control channel allocation to
tb_domain_alloc(), and pass the timeout from that function to the
tb_ctl_alloc(). Then make both connection manager implementations pass
the timeout when they alloc the domain structure.

While there update kernel-doc of struct tb_ctl to match the reality.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c    | 15 +++++---
 drivers/thunderbolt/ctl.h    |  5 ++-
 drivers/thunderbolt/domain.c | 66 +++++++++++++++++-------------------
 drivers/thunderbolt/icm.c    |  2 +-
 drivers/thunderbolt/tb.c     |  4 ++-
 drivers/thunderbolt/tb.h     |  2 +-
 6 files changed, 49 insertions(+), 45 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index b79be1f02d92..0fb5e04191e2 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -29,6 +29,7 @@
  * @request_queue_lock: Lock protecting @request_queue
  * @request_queue: List of outstanding requests
  * @running: Is the control channel running at the moment
+ * @timeout_msec: Default timeout for non-raw control messages
  * @callback: Callback called when hotplug message is received
  * @callback_data: Data passed to @callback
  */
@@ -43,6 +44,7 @@ struct tb_ctl {
 	struct list_head request_queue;
 	bool running;
 
+	int timeout_msec;
 	event_cb callback;
 	void *callback_data;
 };
@@ -613,6 +615,7 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 /**
  * tb_ctl_alloc() - allocate a control channel
  * @nhi: Pointer to NHI
+ * @timeout_msec: Default timeout used with non-raw control messages
  * @cb: Callback called for plug events
  * @cb_data: Data passed to @cb
  *
@@ -620,13 +623,15 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
  *
  * Return: Returns a pointer on success or NULL on failure.
  */
-struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, event_cb cb, void *cb_data)
+struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int timeout_msec, event_cb cb,
+			    void *cb_data)
 {
 	int i;
 	struct tb_ctl *ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
 	if (!ctl)
 		return NULL;
 	ctl->nhi = nhi;
+	ctl->timeout_msec = timeout_msec;
 	ctl->callback = cb;
 	ctl->callback_data = cb_data;
 
@@ -829,7 +834,7 @@ struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route)
 	req->response_size = sizeof(reply);
 	req->response_type = TB_CFG_PKG_RESET;
 
-	res = tb_cfg_request_sync(ctl, req, TB_CFG_DEFAULT_TIMEOUT);
+	res = tb_cfg_request_sync(ctl, req, ctl->timeout_msec);
 
 	tb_cfg_request_put(req);
 
@@ -1005,7 +1010,7 @@ int tb_cfg_read(struct tb_ctl *ctl, void *buffer, u64 route, u32 port,
 		enum tb_cfg_space space, u32 offset, u32 length)
 {
 	struct tb_cfg_result res = tb_cfg_read_raw(ctl, buffer, route, port,
-			space, offset, length, TB_CFG_DEFAULT_TIMEOUT);
+			space, offset, length, ctl->timeout_msec);
 	switch (res.err) {
 	case 0:
 		/* Success */
@@ -1031,7 +1036,7 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 		 enum tb_cfg_space space, u32 offset, u32 length)
 {
 	struct tb_cfg_result res = tb_cfg_write_raw(ctl, buffer, route, port,
-			space, offset, length, TB_CFG_DEFAULT_TIMEOUT);
+			space, offset, length, ctl->timeout_msec);
 	switch (res.err) {
 	case 0:
 		/* Success */
@@ -1069,7 +1074,7 @@ int tb_cfg_get_upstream_port(struct tb_ctl *ctl, u64 route)
 	u32 dummy;
 	struct tb_cfg_result res = tb_cfg_read_raw(ctl, &dummy, route, 0,
 						   TB_CFG_SWITCH, 0, 1,
-						   TB_CFG_DEFAULT_TIMEOUT);
+						   ctl->timeout_msec);
 	if (res.err == 1)
 		return -EIO;
 	if (res.err)
diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index 2eafbfea5dff..e8c64898dfce 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -21,15 +21,14 @@ struct tb_ctl;
 typedef bool (*event_cb)(void *data, enum tb_cfg_pkg_type type,
 			 const void *buf, size_t size);
 
-struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, event_cb cb, void *cb_data);
+struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int timeout_msec, event_cb cb,
+			    void *cb_data);
 void tb_ctl_start(struct tb_ctl *ctl);
 void tb_ctl_stop(struct tb_ctl *ctl);
 void tb_ctl_free(struct tb_ctl *ctl);
 
 /* configuration commands */
 
-#define TB_CFG_DEFAULT_TIMEOUT 5000 /* msec */
-
 struct tb_cfg_result {
 	u64 response_route;
 	u32 response_port; /*
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 89ae614eaba2..039486b61b6a 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -341,9 +341,34 @@ struct device_type tb_domain_type = {
 	.release = tb_domain_release,
 };
 
+static bool tb_domain_event_cb(void *data, enum tb_cfg_pkg_type type,
+			       const void *buf, size_t size)
+{
+	struct tb *tb = data;
+
+	if (!tb->cm_ops->handle_event) {
+		tb_warn(tb, "domain does not have event handler\n");
+		return true;
+	}
+
+	switch (type) {
+	case TB_CFG_PKG_XDOMAIN_REQ:
+	case TB_CFG_PKG_XDOMAIN_RESP:
+		if (tb_is_xdomain_enabled())
+			return tb_xdomain_handle_request(tb, type, buf, size);
+		break;
+
+	default:
+		tb->cm_ops->handle_event(tb, type, buf, size);
+	}
+
+	return true;
+}
+
 /**
  * tb_domain_alloc() - Allocate a domain
  * @nhi: Pointer to the host controller
+ * @timeout_msec: Control channel timeout for non-raw messages
  * @privsize: Size of the connection manager private data
  *
  * Allocates and initializes a new Thunderbolt domain. Connection
@@ -355,7 +380,7 @@ struct device_type tb_domain_type = {
  *
  * Return: allocated domain structure on %NULL in case of error
  */
-struct tb *tb_domain_alloc(struct tb_nhi *nhi, size_t privsize)
+struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize)
 {
 	struct tb *tb;
 
@@ -382,6 +407,10 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, size_t privsize)
 	if (!tb->wq)
 		goto err_remove_ida;
 
+	tb->ctl = tb_ctl_alloc(nhi, timeout_msec, tb_domain_event_cb, tb);
+	if (!tb->ctl)
+		goto err_destroy_wq;
+
 	tb->dev.parent = &nhi->pdev->dev;
 	tb->dev.bus = &tb_bus_type;
 	tb->dev.type = &tb_domain_type;
@@ -391,6 +420,8 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, size_t privsize)
 
 	return tb;
 
+err_destroy_wq:
+	destroy_workqueue(tb->wq);
 err_remove_ida:
 	ida_simple_remove(&tb_domain_ida, tb->index);
 err_free:
@@ -399,30 +430,6 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, size_t privsize)
 	return NULL;
 }
 
-static bool tb_domain_event_cb(void *data, enum tb_cfg_pkg_type type,
-			       const void *buf, size_t size)
-{
-	struct tb *tb = data;
-
-	if (!tb->cm_ops->handle_event) {
-		tb_warn(tb, "domain does not have event handler\n");
-		return true;
-	}
-
-	switch (type) {
-	case TB_CFG_PKG_XDOMAIN_REQ:
-	case TB_CFG_PKG_XDOMAIN_RESP:
-		if (tb_is_xdomain_enabled())
-			return tb_xdomain_handle_request(tb, type, buf, size);
-		break;
-
-	default:
-		tb->cm_ops->handle_event(tb, type, buf, size);
-	}
-
-	return true;
-}
-
 /**
  * tb_domain_add() - Add domain to the system
  * @tb: Domain to add
@@ -442,13 +449,6 @@ int tb_domain_add(struct tb *tb)
 		return -EINVAL;
 
 	mutex_lock(&tb->lock);
-
-	tb->ctl = tb_ctl_alloc(tb->nhi, tb_domain_event_cb, tb);
-	if (!tb->ctl) {
-		ret = -ENOMEM;
-		goto err_unlock;
-	}
-
 	/*
 	 * tb_schedule_hotplug_handler may be called as soon as the config
 	 * channel is started. Thats why we have to hold the lock here.
@@ -493,8 +493,6 @@ int tb_domain_add(struct tb *tb)
 	device_del(&tb->dev);
 err_ctl_stop:
 	tb_ctl_stop(tb->ctl);
-err_unlock:
-	mutex_unlock(&tb->lock);
 
 	return ret;
 }
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index f6f605d48371..c111b946c64d 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2416,7 +2416,7 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 	struct icm *icm;
 	struct tb *tb;
 
-	tb = tb_domain_alloc(nhi, sizeof(struct icm));
+	tb = tb_domain_alloc(nhi, ICM_TIMEOUT, sizeof(struct icm));
 	if (!tb)
 		return NULL;
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c348b1fc0efc..4b3947965856 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -15,6 +15,8 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
+#define TB_TIMEOUT	100 /* ms */
+
 /**
  * struct tb_cm - Simple Thunderbolt connection manager
  * @tunnel_list: List of active tunnels
@@ -1562,7 +1564,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	struct tb_cm *tcm;
 	struct tb *tb;
 
-	tb = tb_domain_alloc(nhi, sizeof(*tcm));
+	tb = tb_domain_alloc(nhi, TB_TIMEOUT, sizeof(*tcm));
 	if (!tb)
 		return NULL;
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index beea88c34c0f..d6ad45686488 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -625,7 +625,7 @@ void tb_domain_exit(void);
 int tb_xdomain_init(void);
 void tb_xdomain_exit(void);
 
-struct tb *tb_domain_alloc(struct tb_nhi *nhi, size_t privsize);
+struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize);
 int tb_domain_add(struct tb *tb);
 void tb_domain_remove(struct tb *tb);
 int tb_domain_suspend_noirq(struct tb *tb);
-- 
2.30.1


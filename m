Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C410D3088A5
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 12:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhA2Ly2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 06:54:28 -0500
Received: from mga14.intel.com ([192.55.52.115]:19271 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232109AbhA2K0S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Jan 2021 05:26:18 -0500
IronPort-SDR: pkrHSNmBuJDJGvPEjaWzjSymThCU/x1/wFHt6espIElXApWdcrX9LJUH+sADir6WQU5ML35kxI
 g0TVn3+5z0MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="179606838"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="179606838"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 00:32:46 -0800
IronPort-SDR: utZ0SjJOclrME2v02nVNELV19iZ+n05EkDwphomRpzn+S1QGsIQ7nGaAQhIrvjY7cS3xXyOu+r
 NabEQYuh367w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="575444604"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jan 2021 00:32:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id AE5302534; Fri, 29 Jan 2021 10:32:41 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Christian Kellner <christian@kellner.me>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org
Subject: [PATCH v2 2/5] thunderbolt: Allow disabling XDomain protocol
Date:   Fri, 29 Jan 2021 11:32:38 +0300
Message-Id: <20210129083241.72497-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129083241.72497-1-mika.westerberg@linux.intel.com>
References: <20210129083241.72497-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This allows disabling XDomain protocol completely if the user does not
plan to use the USB4/Thunderbolt peer-to-peer functionality, or for
security reasons.

XDomain protocol is enabled by default but with this commit it is
possible to disable it by passing "xdomain=0" as module parameter (or
through the kernel command line).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>
---
 drivers/thunderbolt/domain.c  | 4 +++-
 drivers/thunderbolt/icm.c     | 6 ++++--
 drivers/thunderbolt/tb.c      | 3 +++
 drivers/thunderbolt/tb.h      | 1 +
 drivers/thunderbolt/xdomain.c | 9 +++++++++
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a1c79c9c4f66..89ae614eaba2 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -412,7 +412,9 @@ static bool tb_domain_event_cb(void *data, enum tb_cfg_pkg_type type,
 	switch (type) {
 	case TB_CFG_PKG_XDOMAIN_REQ:
 	case TB_CFG_PKG_XDOMAIN_RESP:
-		return tb_xdomain_handle_request(tb, type, buf, size);
+		if (tb_is_xdomain_enabled())
+			return tb_xdomain_handle_request(tb, type, buf, size);
+		break;
 
 	default:
 		tb->cm_ops->handle_event(tb, type, buf, size);
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 14340ec61703..8cd7b3054d14 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -1701,10 +1701,12 @@ static void icm_handle_notification(struct work_struct *work)
 			icm->device_disconnected(tb, n->pkg);
 			break;
 		case ICM_EVENT_XDOMAIN_CONNECTED:
-			icm->xdomain_connected(tb, n->pkg);
+			if (tb_is_xdomain_enabled())
+				icm->xdomain_connected(tb, n->pkg);
 			break;
 		case ICM_EVENT_XDOMAIN_DISCONNECTED:
-			icm->xdomain_disconnected(tb, n->pkg);
+			if (tb_is_xdomain_enabled())
+				icm->xdomain_disconnected(tb, n->pkg);
 			break;
 		case ICM_EVENT_RTD3_VETO:
 			icm->rtd3_veto(tb, n->pkg);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 413955aa6a94..ad3c285026d5 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -179,6 +179,9 @@ static void tb_scan_xdomain(struct tb_port *port)
 	struct tb_xdomain *xd;
 	u64 route;
 
+	if (!tb_is_xdomain_enabled())
+		return;
+
 	route = tb_downstream_route(port);
 	xd = tb_xdomain_find_by_route(tb, route);
 	if (xd) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 31468de658e4..01fe849e9d4c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -953,6 +953,7 @@ static inline u64 tb_downstream_route(struct tb_port *port)
 	       | ((u64) port->port << (port->sw->config.depth * 8));
 }
 
+bool tb_is_xdomain_enabled(void);
 bool tb_xdomain_handle_request(struct tb *tb, enum tb_cfg_pkg_type type,
 			       const void *buf, size_t size);
 struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 6e8bea6a7d39..b242161868c2 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -30,6 +30,10 @@ struct xdomain_request_work {
 	struct tb *tb;
 };
 
+static bool tb_xdomain_enabled = true;
+module_param_named(xdomain, tb_xdomain_enabled, bool, 0444);
+MODULE_PARM_DESC(xdomain, "allow XDomain protocol (default: true)");
+
 /* Serializes access to the properties and protocol handlers below */
 static DEFINE_MUTEX(xdomain_lock);
 
@@ -47,6 +51,11 @@ static const uuid_t tb_xdp_uuid =
 	UUID_INIT(0xb638d70e, 0x42ff, 0x40bb,
 		  0x97, 0xc2, 0x90, 0xe2, 0xc0, 0xb2, 0xff, 0x07);
 
+bool tb_is_xdomain_enabled(void)
+{
+	return tb_xdomain_enabled;
+}
+
 static bool tb_xdomain_match(const struct tb_cfg_request *req,
 			     const struct ctl_pkg *pkg)
 {
-- 
2.29.2


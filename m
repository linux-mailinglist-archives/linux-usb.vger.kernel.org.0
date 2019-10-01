Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2509BC3297
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 13:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732490AbfJALig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 07:38:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:39070 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732423AbfJALif (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 07:38:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="205047686"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2019 04:38:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E2182EB; Tue,  1 Oct 2019 14:38:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 01/22] thunderbolt: Introduce tb_switch_is_icm()
Date:   Tue,  1 Oct 2019 14:38:09 +0300
Message-Id: <20191001113830.13028-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We currently differentiate between SW CM and ICM by looking directly at
the sw->config.enabled field which may be rather hard to understand for
the casual reader. For this reason introduce a wrapper function with
documentation that should make the intention more clear.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c     |  4 ++--
 drivers/thunderbolt/switch.c |  4 ++--
 drivers/thunderbolt/tb.h     | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index ae1e92611c3e..af38076088f6 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -94,7 +94,7 @@ int tb_lc_configure_link(struct tb_switch *sw)
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!sw->config.enabled || !tb_route(sw))
+	if (!tb_route(sw) || tb_switch_is_icm(sw))
 		return 0;
 
 	up = tb_upstream_port(sw);
@@ -124,7 +124,7 @@ void tb_lc_unconfigure_link(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 
-	if (sw->is_unplugged || !sw->config.enabled || !tb_route(sw))
+	if (sw->is_unplugged || !tb_route(sw) || tb_switch_is_icm(sw))
 		return;
 
 	up = tb_upstream_port(sw);
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 5ea8db667e83..f9efd670d032 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -986,7 +986,7 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
 	u32 data;
 	int res;
 
-	if (!sw->config.enabled)
+	if (tb_switch_is_icm(sw))
 		return 0;
 
 	sw->config.plug_events_delay = 0xff;
@@ -1710,7 +1710,7 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 	}
 
 	/* Root switch DMA port requires running firmware */
-	if (!tb_route(sw) && sw->config.enabled)
+	if (!tb_route(sw) && !tb_switch_is_icm(sw))
 		return 0;
 
 	sw->dma_port = dma_port_alloc(sw);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6407d529871d..1565af2e48cb 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -591,6 +591,20 @@ static inline bool tb_switch_is_fr(const struct tb_switch *sw)
 	}
 }
 
+/**
+ * tb_switch_is_icm() - Is the switch handled by ICM firmware
+ * @sw: Switch to check
+ *
+ * In case there is a need to differentiate whether ICM firmware or SW CM
+ * is handling @sw this function can be called. It is valid to call this
+ * after tb_switch_alloc() and tb_switch_configure() has been called
+ * (latter only for SW CM case).
+ */
+static inline bool tb_switch_is_icm(const struct tb_switch *sw)
+{
+	return !sw->config.enabled;
+}
+
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_set_initial_credits(struct tb_port *port, u32 credits);
-- 
2.23.0


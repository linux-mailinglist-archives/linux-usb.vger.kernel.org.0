Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F65387ABB
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349813AbhEROLR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:2005 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349812AbhEROLN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:13 -0400
IronPort-SDR: IPmlcFWQxF3cfFbEtYxafgdcxc1as7NsOu3wlZu5pu5fru+rqvwr7YWz5JKC6PfCjxWsbfsmDP
 tHLj1rBZGCQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="200775185"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="200775185"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:46 -0700
IronPort-SDR: WEHCQRWc3PSnfl+JSRSeJQGGf/Tjm5IKUnDdSsRNIGLnlLZV2e5eRE2/tYUJQH8AN3EgnQuOik
 KE5y92uNzO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="541985210"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 May 2021 07:09:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BB0058AD; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/8] thunderbolt: Add quirk for Intel Goshen Ridge DP credits
Date:   Tue, 18 May 2021 17:10:01 +0300
Message-Id: <20210518141002.63616-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Goshen Ridge reports wrong DP main credits in NVM 27 and earlier,
so add a quirk that fixes it. We also need to expand the quirk table to
match on hardware vendor/device IDs too.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 57e2978a3c21..8d73bd7fce15 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -12,7 +12,17 @@ static void quirk_force_power_link(struct tb_switch *sw)
 	sw->quirks |= QUIRK_FORCE_POWER_LINK_CONTROLLER;
 }
 
+static void quirk_dp_credit_allocation(struct tb_switch *sw)
+{
+	if (sw->credit_allocation && sw->min_dp_main_credits == 56) {
+		sw->min_dp_main_credits = 18;
+		tb_sw_dbg(sw, "quirked DP main: %u\n", sw->min_dp_main_credits);
+	}
+}
+
 struct tb_quirk {
+	u16 hw_vendor_id;
+	u16 hw_device_id;
 	u16 vendor;
 	u16 device;
 	void (*hook)(struct tb_switch *sw);
@@ -20,7 +30,12 @@ struct tb_quirk {
 
 static const struct tb_quirk tb_quirks[] = {
 	/* Dell WD19TB supports self-authentication on unplug */
-	{ 0x00d4, 0xb070, quirk_force_power_link },
+	{ 0x0000, 0x0000, 0x00d4, 0xb070, quirk_force_power_link },
+	/*
+	 * Intel Goshen Ridge NVM 27 and before report wrong number of
+	 * DP buffers.
+	 */
+	{ 0x8087, 0x0b26, 0x0000, 0x0000, quirk_dp_credit_allocation },
 };
 
 /**
@@ -36,7 +51,15 @@ void tb_check_quirks(struct tb_switch *sw)
 	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
 		const struct tb_quirk *q = &tb_quirks[i];
 
-		if (sw->device == q->device && sw->vendor == q->vendor)
-			q->hook(sw);
+		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
+			continue;
+		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
+			continue;
+		if (q->vendor && q->vendor != sw->vendor)
+			continue;
+		if (q->device && q->device != sw->device)
+			continue;
+
+		q->hook(sw);
 	}
 }
-- 
2.30.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFED2B7E6B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 14:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgKRNiG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 08:38:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:41354 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgKRNiG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 08:38:06 -0500
IronPort-SDR: j0bSVpWCzEPYzoMwzM4u5ofuGndkx7mMiBgkrw0/otJkg+e1RziXxHNoodNq1o9SWR2dOSi2kk
 krf5ykSAomrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158888395"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="158888395"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:37:50 -0800
IronPort-SDR: v7cTrv/KjhrAmyqlfQpl7rik/QWaJy2ivBss1qvxOAI2EnZK1fS5dnXRoamcDgq7RQsfka7XuC
 dYhsd0MsGxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="341285756"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Nov 2020 05:37:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id F3CB911E; Wed, 18 Nov 2020 15:37:45 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Paulian Bogdan Marinca <paulian@marinca.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix use-after-free in remove_unplugged_switch()
Date:   Wed, 18 Nov 2020 16:37:45 +0300
Message-Id: <20201118133745.65628-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Paulian reported a crash that happens when a dock is unplugged during
hibernation:

[78436.228217] thunderbolt 0-1: device disconnected
[78436.228365] BUG: kernel NULL pointer dereference, address: 00000000000001e0
...
[78436.228397] RIP: 0010:icm_free_unplugged_children+0x109/0x1a0
...
[78436.228432] Call Trace:
[78436.228439]  icm_rescan_work+0x24/0x30
[78436.228444]  process_one_work+0x1a3/0x3a0
[78436.228449]  worker_thread+0x30/0x370
[78436.228454]  ? process_one_work+0x3a0/0x3a0
[78436.228457]  kthread+0x13d/0x160
[78436.228461]  ? kthread_park+0x90/0x90
[78436.228465]  ret_from_fork+0x1f/0x30

This happens because remove_unplugged_switch() calls tb_switch_remove()
that releases the memory pointed by sw so the following lines reference
to a memory that might be released already.

Fix this by saving pointer to the parent device before calling
tb_switch_remove().

Reported-by: Paulian Bogdan Marinca <paulian@marinca.net>
Fixes: 4f7c2e0d8765 ("thunderbolt: Make sure device runtime resume completes before taking domain lock")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index b51fc3f62b1f..05323c442b56 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -1976,7 +1976,9 @@ static int complete_rpm(struct device *dev, void *data)
 
 static void remove_unplugged_switch(struct tb_switch *sw)
 {
-	pm_runtime_get_sync(sw->dev.parent);
+	struct device *parent = sw->dev.parent;
+
+	pm_runtime_get_sync(parent);
 
 	/*
 	 * Signal this and switches below for rpm_complete because
@@ -1987,8 +1989,8 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
 	tb_switch_remove(sw);
 
-	pm_runtime_mark_last_busy(sw->dev.parent);
-	pm_runtime_put_autosuspend(sw->dev.parent);
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
 }
 
 static void icm_free_unplugged_children(struct tb_switch *sw)
-- 
2.29.2


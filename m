Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4546F307632
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 13:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhA1Mbb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 07:31:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:61580 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231501AbhA1MbZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 07:31:25 -0500
IronPort-SDR: WCsyBhynHjXt32ptPCFDDuLrs4ei0W4IDCiITS5iHPA+N4FxkBfxgWKLlDsp65ouPsvv0CzcyZ
 p04KPGZmr9pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="177661078"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="177661078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 04:29:40 -0800
IronPort-SDR: B5qohV48LdfMs4CVGhCnWF2if26Q+p90ViX5q3qPMP83ehzYmM0fdUzmSg9MhnvGk/BwflbeRi
 09NlDIn65ZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="363712203"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2021 04:29:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 04B222D5; Thu, 28 Jan 2021 14:29:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/5] thunderbolt: switch: Fix kernel-doc descriptions of non-static functions
Date:   Thu, 28 Jan 2021 15:29:34 +0300
Message-Id: <20210128122934.36897-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of all non-static functions. This also gets
rid of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6ca3efba4520..6e2ca8f066f5 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -525,6 +525,8 @@ int tb_port_state(struct tb_port *port)
 
 /**
  * tb_wait_for_port() - wait for a port to become ready
+ * @port: Port to wait
+ * @wait_if_unplugged: Wait also when @port is unplugged
  *
  * Wait up to 1 second for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
@@ -589,6 +591,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 
 /**
  * tb_port_add_nfc_credits() - add/remove non flow controlled credits to port
+ * @port: Port to add/remove NFC credits
+ * @credits: Credits to add/remove
  *
  * Change the number of NFC credits allocated to @port by @credits. To remove
  * NFC credits pass a negative amount of credits.
@@ -646,6 +650,8 @@ int tb_port_set_initial_credits(struct tb_port *port, u32 credits)
 
 /**
  * tb_port_clear_counter() - clear a counter in TB_CFG_COUNTER
+ * @port: Port whose counters to clear
+ * @counter: Counter index to clear
  *
  * Return: Returns 0 on success or an error code on failure.
  */
@@ -2649,6 +2655,7 @@ void tb_switch_remove(struct tb_switch *sw)
 
 /**
  * tb_sw_set_unplugged() - set is_unplugged on switch and downstream switches
+ * @sw: Router to mark unplugged
  */
 void tb_sw_set_unplugged(struct tb_switch *sw)
 {
-- 
2.29.2


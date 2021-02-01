Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EC130A76E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhBAMSY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:18:24 -0500
Received: from mga17.intel.com ([192.55.52.151]:14235 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231334AbhBAMSU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:18:20 -0500
IronPort-SDR: /fTikA1suLIZlTbsSbCiPMO7tQOqrJMrBToMK5rxiBr2PFpFXJzrBKRXLZX5ZfmkKc1KCODAN1
 GJKBPpplobOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="160440872"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="160440872"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:16:34 -0800
IronPort-SDR: l+nim+WbcNsbB/cTJ/Owqb0cRab+QKhCjNpn7sid25YKeORQWfYs93e1M8BdE5nHVa2t4kGePl
 0yTeTWtiCaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="412400472"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2021 04:16:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id AAAB7346; Mon,  1 Feb 2021 14:16:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 5/6] thunderbolt: switch: Fix kernel-doc descriptions of non-static functions
Date:   Mon,  1 Feb 2021 15:16:28 +0300
Message-Id: <20210201121629.76969-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
References: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of all non-static functions. This also gets
rid of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/thunderbolt/switch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6ca3efba4520..5377d0a3390f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -525,6 +525,8 @@ int tb_port_state(struct tb_port *port)
 
 /**
  * tb_wait_for_port() - wait for a port to become ready
+ * @port: Port to wait
+ * @wait_if_unplugged: Wait also when port is unplugged
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


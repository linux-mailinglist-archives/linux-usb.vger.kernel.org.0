Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82EA307631
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 13:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhA1Mb0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 07:31:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:56700 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231448AbhA1MbX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 07:31:23 -0500
IronPort-SDR: Q5Q73ZClmkK0gFvO2D59teZlvlH0vQY7seC2tTHP6jAd2Esy3O58xX/4GZEQcSUTWhxZBcTJBp
 0k7MbsR18Kww==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="265056733"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="265056733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 04:29:37 -0800
IronPort-SDR: kHDYAJCNAWWXwt4nwbrJic5iP5BwVBHjxiYkkVtCJQJFh7X8rKdszhRqW0hivPZxMs/OFRpsev
 8hjLvtEEhrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="473620448"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2021 04:29:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C5076143; Thu, 28 Jan 2021 14:29:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/5] thunderbolt: ctl: Fix kernel-doc descriptions of non-static functions
Date:   Thu, 28 Jan 2021 15:29:30 +0300
Message-Id: <20210128122934.36897-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of all non-static functions and struct
tb_cfg. Gets rid of several warnings on W=1 builds too.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 47 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 2f9d4fc8aa23..f1aeaff9f368 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -20,7 +20,17 @@
 #define TB_CTL_RETRIES		4
 
 /**
- * struct tb_cfg - thunderbolt control channel
+ * struct tb_ctl - Thunderbolt control channel
+ * @nhi: Pointer to the NHI structure
+ * @tx: Transmit ring
+ * @rx: Receive ring
+ * @frame_pool: DMA pool for control messages
+ * @rx_packets: Received control messages
+ * @request_queue_lock: Lock protecting @request_queue
+ * @request_queue: List of outstanding requests
+ * @running: Is the control channel running at the moment
+ * @callback: Callback called when hotplug message is received
+ * @callback_data: Data passed to @callback
  */
 struct tb_ctl {
 	struct tb_nhi *nhi;
@@ -602,6 +612,9 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 
 /**
  * tb_ctl_alloc() - allocate a control channel
+ * @nhi: Pointer to NHI
+ * @cb: Callback called for plug events
+ * @cb_data: Data passed to @cb
  *
  * cb will be invoked once for every hot plug event.
  *
@@ -649,6 +662,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, event_cb cb, void *cb_data)
 
 /**
  * tb_ctl_free() - free a control channel
+ * @ctl: Control channel to free
  *
  * Must be called after tb_ctl_stop.
  *
@@ -677,6 +691,7 @@ void tb_ctl_free(struct tb_ctl *ctl)
 
 /**
  * tb_cfg_start() - start/resume the control channel
+ * @ctl: Control channel to start
  */
 void tb_ctl_start(struct tb_ctl *ctl)
 {
@@ -691,7 +706,8 @@ void tb_ctl_start(struct tb_ctl *ctl)
 }
 
 /**
- * control() - pause the control channel
+ * tb_ctrl_stop() - pause the control channel
+ * @ctl: Control channel to stop
  *
  * All invocations of ctl->callback will have finished after this method
  * returns.
@@ -784,6 +800,9 @@ static bool tb_cfg_copy(struct tb_cfg_request *req, const struct ctl_pkg *pkg)
 
 /**
  * tb_cfg_reset() - send a reset packet and wait for a response
+ * @ctl: Control channel pointer
+ * @route: Router string for the router to send reset
+ * @timeout_msec: Timeout in ms how long to wait for the response
  *
  * If the switch at route is incorrectly configured then we will not receive a
  * reply (even though the switch will reset). The caller should check for
@@ -820,9 +839,17 @@ struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route,
 }
 
 /**
- * tb_cfg_read() - read from config space into buffer
+ * tb_cfg_read_raw() - read from config space into buffer
+ * @ctl: Pointer to the control channel
+ * @buffer: Buffer where the data is read
+ * @route: Route string of the router
+ * @port: Port number when reading from %TB_CFG_PORT, %0 otherwise
+ * @space: Config space selector
+ * @offset: Dword word offset of the register to start reading
+ * @length: Number of dwords to read
+ * @timeout_msec: Timeout in ms how long to wait for the response
  *
- * Offset and length are in dwords.
+ * Reads from router config space without translating the possible error.
  */
 struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 		u64 route, u32 port, enum tb_cfg_space space,
@@ -884,8 +911,16 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 
 /**
  * tb_cfg_write() - write from buffer into config space
+ * @ctl: Pointer to the control channel
+ * @buffer: Data to write
+ * @route: Route string of the router
+ * @port: Port number when writing to %TB_CFG_PORT, %0 otherwise
+ * @space: Config space selector
+ * @offset: Dword word offset of the register to start writing
+ * @length: Number of dwords to write
+ * @timeout_msec: Timeout in ms how long to wait for the response
  *
- * Offset and length are in dwords.
+ * Writes to router config space without translating the possible error.
  */
 struct tb_cfg_result tb_cfg_write_raw(struct tb_ctl *ctl, const void *buffer,
 		u64 route, u32 port, enum tb_cfg_space space,
@@ -1022,6 +1057,8 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 
 /**
  * tb_cfg_get_upstream_port() - get upstream port number of switch at route
+ * @ctl: Pointer to the control channel
+ * @route: Route string of the router
  *
  * Reads the first dword from the switches TB_CFG_SWITCH config area and
  * returns the port number from which the reply originated.
-- 
2.29.2


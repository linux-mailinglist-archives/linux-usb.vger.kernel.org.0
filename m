Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B3E1F9A14
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730439AbgFOO0v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:15839 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729825AbgFOO0t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:49 -0400
IronPort-SDR: SRHa5vuIZ6Tbul+D76ayd+NowyP8Lqp/AYeHs3FObanRhzl83/kVBa9hxSz79kHY8jdLc10fyf
 9wF5KxzAbfsA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:48 -0700
IronPort-SDR: JSuHXRT6dMlkJlFZ66BKyIDfnGFPy7GfhvcybaG2UgTthRYEEBkfTagFVyOpBmZYfr8TpPOR7g
 sJFUz/3vFJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="420389593"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2020 07:26:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BBA2914E; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 01/17] thunderbolt: Fix path indices used in USB3 tunnel discovery
Date:   Mon, 15 Jun 2020 17:26:29 +0300
Message-Id: <20200615142645.56209-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB3 discovery used wrong indices when tunnel is discovered. It
should use TB_USB3_PATH_DOWN for path that flows downstream and
TB_USB3_PATH_UP when it flows upstream. This should not affect the
functionality but better to fix it.

Fixes: e6f818585713 ("thunderbolt: Add support for USB 3.x tunnels")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: stable@vger.kernel.org # v5.6+
---
 drivers/thunderbolt/tunnel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index dbe90bcf4ad4..c144ca9b032c 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -913,21 +913,21 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down)
 	 * case.
 	 */
 	path = tb_path_discover(down, TB_USB3_HOPID, NULL, -1,
-				&tunnel->dst_port, "USB3 Up");
+				&tunnel->dst_port, "USB3 Down");
 	if (!path) {
 		/* Just disable the downstream port */
 		tb_usb3_port_enable(down, false);
 		goto err_free;
 	}
-	tunnel->paths[TB_USB3_PATH_UP] = path;
-	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_UP]);
+	tunnel->paths[TB_USB3_PATH_DOWN] = path;
+	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_DOWN]);
 
 	path = tb_path_discover(tunnel->dst_port, -1, down, TB_USB3_HOPID, NULL,
-				"USB3 Down");
+				"USB3 Up");
 	if (!path)
 		goto err_deactivate;
-	tunnel->paths[TB_USB3_PATH_DOWN] = path;
-	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_DOWN]);
+	tunnel->paths[TB_USB3_PATH_UP] = path;
+	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_UP]);
 
 	/* Validate that the tunnel is complete */
 	if (!tb_port_is_usb3_up(tunnel->dst_port)) {
-- 
2.27.0.rc2


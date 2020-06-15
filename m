Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA0D1F9A16
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730538AbgFOO0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:59953 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730476AbgFOO0w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:52 -0400
IronPort-SDR: gDGctaOU9w4mnI91Cuct5GRpYcUM3kPR8S4RlfpGYK/m2BbIE5hXdpK1udjQFkfuNHX818fz96
 5Q6vJr9VSWDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:52 -0700
IronPort-SDR: f9w5m0gOl7vC45VQWoUg4lEAWx4ajvtAUuJBHyxPXzILcyf4Dklx3YS0rZIpfl3FGBF9hSPvmL
 4tJYTcnqR6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="308143465"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 15 Jun 2020 07:26:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 170256D6; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 10/17] thunderbolt: Make usb4_switch_map_usb3_down() also return enabled ports
Date:   Mon, 15 Jun 2020 17:26:38 +0300
Message-Id: <20200615142645.56209-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We need to call this on enabled ports in order to find the mapping from
host router USB4 port to a USB 3.x downstream adapter, so make the
function return enabled ports as well.

While there fix parameter alignment in tb_find_usb3_down().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c   | 14 +++-----------
 drivers/thunderbolt/usb4.c |  2 +-
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 2da82259e77c..82f62a023a4b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -206,22 +206,14 @@ static struct tb_port *tb_find_unused_port(struct tb_switch *sw,
 }
 
 static struct tb_port *tb_find_usb3_down(struct tb_switch *sw,
-					const struct tb_port *port)
+					 const struct tb_port *port)
 {
 	struct tb_port *down;
 
 	down = usb4_switch_map_usb3_down(sw, port);
-	if (down) {
-		if (WARN_ON(!tb_port_is_usb3_down(down)))
-			goto out;
-		if (WARN_ON(tb_usb3_port_is_enabled(down)))
-			goto out;
-
+	if (down && !tb_usb3_port_is_enabled(down))
 		return down;
-	}
-
-out:
-	return tb_find_unused_port(sw, TB_TYPE_USB3_DOWN);
+	return NULL;
 }
 
 static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 393771d50962..375a8c459201 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -759,7 +759,7 @@ struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 		if (!tb_port_is_usb3_down(p))
 			continue;
 
-		if (usb_idx == usb4_idx && !tb_usb3_port_is_enabled(p))
+		if (usb_idx == usb4_idx)
 			return p;
 
 		usb_idx++;
-- 
2.27.0.rc2


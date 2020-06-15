Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D43D1F9A1C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbgFOO05 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:59958 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730490AbgFOO0y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:54 -0400
IronPort-SDR: xg1ZQCQWhTShDqTXdzNakTUJMSm3CotljZGZByz7nFMQEUEyoDWYLAV782dW/Fw6eOdUWIP5OC
 H5K/YWTdc6cQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:52 -0700
IronPort-SDR: ZXfObPn9r75jlt36TUblFb5yhaowmj6Z472RBHAJD8Rhgb4hG6NCgJ3+50OXlMq/YYo9gDNcua
 hQ/BstIc4WgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="262736097"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2020 07:26:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1181B707; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 09/17] thunderbolt: Do not tunnel USB3 if link is not USB4
Date:   Mon, 15 Jun 2020 17:26:37 +0300
Message-Id: <20200615142645.56209-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB3 tunneling is possible only over USB4 link so don't create USB3
tunnels if that's not the case.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c      |  3 +++
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/tb_regs.h |  1 +
 drivers/thunderbolt/usb4.c    | 24 +++++++++++++++++++++---
 4 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 55daa7f1a87d..2da82259e77c 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -235,6 +235,9 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 	if (!up)
 		return 0;
 
+	if (!sw->link_usb4)
+		return 0;
+
 	/*
 	 * Look up available down port. Since we are chaining it should
 	 * be found right above this switch.
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b53ef5be7263..de8124949eaf 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -97,6 +97,7 @@ struct tb_switch_tmu {
  * @device_name: Name of the device (or %NULL if not known)
  * @link_speed: Speed of the link in Gb/s
  * @link_width: Width of the link (1 or 2)
+ * @link_usb4: Upstream link is USB4
  * @generation: Switch Thunderbolt generation
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
  * @cap_lc: Offset to the link controller capability (%0 if not found)
@@ -136,6 +137,7 @@ struct tb_switch {
 	const char *device_name;
 	unsigned int link_speed;
 	unsigned int link_width;
+	bool link_usb4;
 	unsigned int generation;
 	int cap_plug_events;
 	int cap_lc;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c29c5075525a..77d4b8598835 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -290,6 +290,7 @@ struct tb_regs_port_header {
 /* USB4 port registers */
 #define PORT_CS_18				0x12
 #define PORT_CS_18_BE				BIT(8)
+#define PORT_CS_18_TCM				BIT(9)
 #define PORT_CS_19				0x13
 #define PORT_CS_19_PC				BIT(3)
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 50c7534ba31e..393771d50962 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -192,6 +192,20 @@ static int usb4_switch_op(struct tb_switch *sw, u16 opcode, u8 *status)
 	return 0;
 }
 
+static bool link_is_usb4(struct tb_port *port)
+{
+	u32 val;
+
+	if (!port->cap_usb4)
+		return false;
+
+	if (tb_port_read(port, &val, TB_CFG_PORT,
+			 port->cap_usb4 + PORT_CS_18, 1))
+		return false;
+
+	return !(val & PORT_CS_18_TCM);
+}
+
 /**
  * usb4_switch_setup() - Additional setup for USB4 device
  * @sw: USB4 router to setup
@@ -205,6 +219,7 @@ static int usb4_switch_op(struct tb_switch *sw, u16 opcode, u8 *status)
  */
 int usb4_switch_setup(struct tb_switch *sw)
 {
+	struct tb_port *downstream_port;
 	struct tb_switch *parent;
 	bool tbt3, xhci;
 	u32 val = 0;
@@ -217,6 +232,11 @@ int usb4_switch_setup(struct tb_switch *sw)
 	if (ret)
 		return ret;
 
+	parent = tb_switch_parent(sw);
+	downstream_port = tb_port_at(tb_route(sw), parent);
+	sw->link_usb4 = link_is_usb4(downstream_port);
+	tb_sw_dbg(sw, "link: %s\n", sw->link_usb4 ? "USB4" : "TBT3");
+
 	xhci = val & ROUTER_CS_6_HCI;
 	tbt3 = !(val & ROUTER_CS_6_TNS);
 
@@ -227,9 +247,7 @@ int usb4_switch_setup(struct tb_switch *sw)
 	if (ret)
 		return ret;
 
-	parent = tb_switch_parent(sw);
-
-	if (tb_switch_find_port(parent, TB_TYPE_USB3_DOWN)) {
+	if (sw->link_usb4 && tb_switch_find_port(parent, TB_TYPE_USB3_DOWN)) {
 		val |= ROUTER_CS_5_UTO;
 		xhci = false;
 	}
-- 
2.27.0.rc2


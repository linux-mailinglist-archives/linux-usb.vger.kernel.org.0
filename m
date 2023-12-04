Return-Path: <linux-usb+bounces-3651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2A803090
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0BF280ED9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B9822EEC;
	Mon,  4 Dec 2023 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ore0313q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19091AC
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686316; x=1733222316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u2CpmHTc9iVk0QgHKtfDzsAW0+tULMdoxgY0PeI5IT0=;
  b=Ore0313qlHveeRM+I4G4yH+M3s82DhWQnQ02g5WxycpcDLi80QXDjDxy
   0+6el5ACMkoJ4btTa4EaeNorzpXyruZLOj3a0k+W/5faYgW1FsDFvf+Ue
   rrE1jzQPNnkBQU5ojeKiqt49tgGN16/I68kD4mBB34iVpj1xteVp7dOxt
   hje/Bo+z+FXqgGp7n2vQlTGVHMJpgWNHd6m9oMNANwwoxPVop6Kl9kU15
   Y8uCse30bZlPzT+T0JEu0i6OvbuzPeMwQyTNVuOCgVbhURQZJjZ+2J7Lt
   /4rBlundIMLD6nphm1LuP5j33vxOGC1tzkezZ7wCVN8TIH5hRFKanD0UH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424880778"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424880778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763904027"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763904027"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 02:38:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8F29EA5F; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/11] thunderbolt: Disable CL states only when actually needed
Date: Mon,  4 Dec 2023 12:38:23 +0200
Message-ID: <20231204103828.1635531-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
References: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If there is not going to be an actual transition to asymmetric or
symmetric, there is no point to disable and re-enable CL states either.
So instead disable them only when we know that an actual transition is
going to take place.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 6c5e8ce95f8d..1308f7872f97 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1085,15 +1085,14 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			     struct tb_port *dst_port, int requested_up,
 			     int requested_down)
 {
+	bool clx = false, clx_disabled = false, downstream;
 	struct tb_switch *sw;
-	bool clx, downstream;
 	struct tb_port *up;
 	int ret = 0;
 
 	if (!asym_threshold)
 		return 0;
 
-	/* Disable CL states before doing any transitions */
 	downstream = tb_port_path_direction_downstream(src_port, dst_port);
 	/* Pick up router deepest in the hierarchy */
 	if (downstream)
@@ -1101,8 +1100,6 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 	else
 		sw = src_port->sw;
 
-	clx = tb_disable_clx(sw);
-
 	tb_for_each_upstream_port_on_path(src_port, dst_port, up) {
 		struct tb_port *down = tb_switch_downstream_port(up->sw);
 		enum tb_link_width width_up, width_down;
@@ -1149,6 +1146,16 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 		    !tb_port_width_supported(down, width_down))
 			continue;
 
+		/*
+		 * Disable CL states before doing any transitions. We
+		 * delayed it until now that we know there is a real
+		 * transition taking place.
+		 */
+		if (!clx_disabled) {
+			clx = tb_disable_clx(sw);
+			clx_disabled = true;
+		}
+
 		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
 
 		/*
@@ -1185,15 +1192,14 @@ static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 			    struct tb_port *dst_port, int requested_up,
 			    int requested_down)
 {
+	bool clx = false, clx_disabled = false, downstream;
 	struct tb_switch *sw;
-	bool clx, downstream;
 	struct tb_port *up;
 	int ret = 0;
 
 	if (!asym_threshold)
 		return 0;
 
-	/* Disable CL states before doing any transitions */
 	downstream = tb_port_path_direction_downstream(src_port, dst_port);
 	/* Pick up router deepest in the hierarchy */
 	if (downstream)
@@ -1201,8 +1207,6 @@ static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 	else
 		sw = src_port->sw;
 
-	clx = tb_disable_clx(sw);
-
 	tb_for_each_upstream_port_on_path(src_port, dst_port, up) {
 		int consumed_up, consumed_down;
 
@@ -1235,6 +1239,12 @@ static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 		if (up->sw->link_width == TB_LINK_WIDTH_DUAL)
 			continue;
 
+		/* Disable CL states before doing any transitions */
+		if (!clx_disabled) {
+			clx = tb_disable_clx(sw);
+			clx_disabled = true;
+		}
+
 		tb_sw_dbg(up->sw, "configuring symmetric link\n");
 
 		ret = tb_switch_set_link_width(up->sw, TB_LINK_WIDTH_DUAL);
-- 
2.42.0



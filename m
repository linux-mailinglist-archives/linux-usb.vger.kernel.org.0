Return-Path: <linux-usb+bounces-3653-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF53803094
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA4CB20A9A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9905A22EFC;
	Mon,  4 Dec 2023 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfqQRos/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9510CD5
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686316; x=1733222316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DT/pm8ru+9oUbnj07DS0gnaO6C5H5aRB4M2I4E9Loyo=;
  b=LfqQRos/d6KTZfm8hQoMtnwjyBYRLKlJoBZl32YnYAKc+lPv2D3e1zBb
   f2RYaDy4ulfHZY05DdXYa8uiIqQSxIiuEvwy/QW8zvcK+aaD4C911vS2y
   kALNBXCidsPnDEvMjZoggLRm6/2JABu5tuUP0SvF1N5fOuDH57JE3gzRg
   0g79zMp1px/LOQOH5qSJPaI91jCqzftTwm9a7GRDh7dABLEu8qwBR5UO/
   vTJUivlHqRPoKTc+4ESmUX0KQzrLAmAwaGVHDyfHDIRgkH9RCE3oAsZVH
   KNso6oov5GvlNCr2B4rWmaJGbCuBBX3PITFZC5KjVCXFLLyv9myoIhqhH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424880782"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424880782"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763904028"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763904028"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 02:38:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 80849A02; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
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
Subject: [PATCH 05/11] thunderbolt: Transition link to asymmetric only when both sides support it
Date: Mon,  4 Dec 2023 12:38:22 +0200
Message-ID: <20231204103828.1635531-6-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

We can transition Gen 4 link to asymmetric only when both sides of the
link support it in the required direction. For this reason make sure
that the downstream adapter also supports asymmetric link before
starting the transition.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 3dabc1ac9ab3..6c5e8ce95f8d 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1104,8 +1104,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 	clx = tb_disable_clx(sw);
 
 	tb_for_each_upstream_port_on_path(src_port, dst_port, up) {
+		struct tb_port *down = tb_switch_downstream_port(up->sw);
+		enum tb_link_width width_up, width_down;
 		int consumed_up, consumed_down;
-		enum tb_link_width width;
 
 		ret = tb_consumed_dp_bandwidth(tb, src_port, dst_port, up,
 					       &consumed_up, &consumed_down);
@@ -1126,7 +1127,8 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			if (consumed_down + requested_down < asym_threshold)
 				continue;
 
-			width = TB_LINK_WIDTH_ASYM_RX;
+			width_up = TB_LINK_WIDTH_ASYM_RX;
+			width_down = TB_LINK_WIDTH_ASYM_TX;
 		} else {
 			/* Upstream, the opposite of above */
 			if (consumed_down + requested_down >= TB_ASYM_MIN) {
@@ -1136,13 +1138,15 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			if (consumed_up + requested_up < asym_threshold)
 				continue;
 
-			width = TB_LINK_WIDTH_ASYM_TX;
+			width_up = TB_LINK_WIDTH_ASYM_TX;
+			width_down = TB_LINK_WIDTH_ASYM_RX;
 		}
 
-		if (up->sw->link_width == width)
+		if (up->sw->link_width == width_up)
 			continue;
 
-		if (!tb_port_width_supported(up, width))
+		if (!tb_port_width_supported(up, width_up) ||
+		    !tb_port_width_supported(down, width_down))
 			continue;
 
 		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
@@ -1151,7 +1155,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 		 * Here requested + consumed > threshold so we need to
 		 * transtion the link into asymmetric now.
 		 */
-		ret = tb_switch_set_link_width(up->sw, width);
+		ret = tb_switch_set_link_width(up->sw, width_up);
 		if (ret) {
 			tb_sw_warn(up->sw, "failed to set link width\n");
 			break;
-- 
2.42.0



Return-Path: <linux-usb+bounces-3649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D92C80308D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C001F210DD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F1F224D9;
	Mon,  4 Dec 2023 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsUEB7IE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712CEB9
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686313; x=1733222313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zCrzdbuRai44mXVZLIKq7yNSksTeXxWhX20c3f6yTSc=;
  b=hsUEB7IEnMvs60xFXQaGNzJ3/Vu7vFVbM6I5CFQa3Z3x2AqQvjugioCU
   yQQy2G3AbE+Fbe+EEIG14JyyBJ32g46k0+EZ4AhaT6vP/EIbaf9B8AlK8
   SNN6rZVB0jsy4D6LmH+GbTfWSsw6LbmXCbgasFE710gMoL9r1mexmwx9n
   p/HzC0KTauQYtvwmCkzMVzXjDvz/Q/K/S62YOtaRyRfeCK8Ju0zOvW3QO
   qaeMGR3lfvLR3YFFevF4XLn9529Ajgy8Xnbp8dA139mrmkfi+aRBB5KVz
   X24lfzspRsUDx74go1ueUYKwg0PdNXBfsaMRUjdiH6xCRVSOaTE5W/peY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384116729"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384116729"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804861252"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="804861252"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2023 02:38:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5F209368; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
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
Subject: [PATCH 02/11] thunderbolt: Handle lane bonding of Gen 4 XDomain links properly
Date: Mon,  4 Dec 2023 12:38:19 +0200
Message-ID: <20231204103828.1635531-3-mika.westerberg@linux.intel.com>
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

Gen 4 links come up as bonded already so we are not supposed to initiate
lane bonding on them. However, we should still update the port
structures accordingly. Split these into their own functions to make it
easier to follow.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c      |  2 --
 drivers/thunderbolt/xdomain.c | 49 ++++++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index fd49f86e0353..3dabc1ac9ab3 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -513,8 +513,6 @@ static void tb_port_unconfigure_xdomain(struct tb_port *port)
 		usb4_port_unconfigure_xdomain(port);
 	else
 		tb_lc_unconfigure_xdomain(port);
-
-	tb_port_enable(port->dual_link_port);
 }
 
 static void tb_scan_xdomain(struct tb_port *port)
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 9803f0bbf20d..0a885ee5788d 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1895,6 +1895,50 @@ struct device_type tb_xdomain_type = {
 };
 EXPORT_SYMBOL_GPL(tb_xdomain_type);
 
+static void tb_xdomain_link_init(struct tb_xdomain *xd, struct tb_port *down)
+{
+	if (!down->dual_link_port)
+		return;
+
+	/*
+	 * Gen 4 links come up already as bonded so only update the port
+	 * structures here.
+	 */
+	if (tb_port_get_link_generation(down) >= 4) {
+		down->bonded = true;
+		down->dual_link_port->bonded = true;
+	} else {
+		xd->bonding_possible = true;
+	}
+}
+
+static void tb_xdomain_link_exit(struct tb_xdomain *xd)
+{
+	struct tb_port *down = tb_xdomain_downstream_port(xd);
+
+	if (!down->dual_link_port)
+		return;
+
+	if (tb_port_get_link_generation(down) >= 4) {
+		down->bonded = false;
+		down->dual_link_port->bonded = false;
+	} else if (xd->link_width > TB_LINK_WIDTH_SINGLE) {
+		/*
+		 * Just return port structures back to way they were and
+		 * update credits. No need to update userspace because
+		 * the XDomain is removed soon anyway.
+		 */
+		tb_port_lane_bonding_disable(down);
+		tb_port_update_credits(down);
+	} else if (down->dual_link_port) {
+		/*
+		 * Re-enable the lane 1 adapter we disabled at the end
+		 * of tb_xdomain_get_properties().
+		 */
+		tb_port_enable(down->dual_link_port);
+	}
+}
+
 /**
  * tb_xdomain_alloc() - Allocate new XDomain object
  * @tb: Domain where the XDomain belongs
@@ -1945,7 +1989,8 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 			goto err_free_local_uuid;
 	} else {
 		xd->needs_uuid = true;
-		xd->bonding_possible = !!down->dual_link_port;
+
+		tb_xdomain_link_init(xd, down);
 	}
 
 	device_initialize(&xd->dev);
@@ -2014,6 +2059,8 @@ void tb_xdomain_remove(struct tb_xdomain *xd)
 
 	device_for_each_child_reverse(&xd->dev, xd, unregister_service);
 
+	tb_xdomain_link_exit(xd);
+
 	/*
 	 * Undo runtime PM here explicitly because it is possible that
 	 * the XDomain was never added to the bus and thus device_del()
-- 
2.42.0



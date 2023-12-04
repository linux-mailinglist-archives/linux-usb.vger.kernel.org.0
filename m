Return-Path: <linux-usb+bounces-3652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0278C803091
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3438A1C20AA2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483B622EE9;
	Mon,  4 Dec 2023 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cnd0S1Ga"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC09CC
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686316; x=1733222316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=057mGHnVGGK8tKJutQgSFT1RqfxhyCB2cuy/qjbnvPI=;
  b=Cnd0S1GanBsqtfF8UObJE3wcsgSzpltFeupv4mnsBeDhYJEzjdv5NQk+
   teTA+oVhM5wQZIXZAOnyZYIN+id4INAbFbukdSgk6H8WUKbvbmhs891DZ
   rY+ZemC9yV/+92bfHY2ALs8CwbqeKYcaHU2gMqCIuzjow5YtLSzhKGF7v
   m1cjI9ogSsLlyQ1nCnH/jmcUP+g7h6o8Lev/cs1oPCmwpNZ12rPBCEard
   Skcpx8B4+ARWqf2wPGy0M+o6OznMxWqQOoLGLkkQ81GsmVeQBrl/05zMW
   rzydkFwSeE//fB1xm89yWoB2RzSDDAK0fHXRvRtiH9OXdrfbUUXOvDObR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384116748"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384116748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804861278"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="804861278"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2023 02:38:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BB5CAA9A; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
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
Subject: [PATCH 09/11] thunderbolt: Make PCIe tunnel setup and teardown follow CM guide
Date: Mon,  4 Dec 2023 12:38:26 +0200
Message-ID: <20231204103828.1635531-10-mika.westerberg@linux.intel.com>
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

The USB4 Connection Manager guide suggests that the PCIe paths are
enabled from the upstream adapter to the downstream adapter and vice
versa on disable so make the driver follows this sequence.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index a46ae3f598c5..f0fde79b3b02 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -199,14 +199,21 @@ static int tb_pci_activate(struct tb_tunnel *tunnel, bool activate)
 			return res;
 	}
 
-	res = tb_pci_port_enable(tunnel->src_port, activate);
+	if (activate)
+		res = tb_pci_port_enable(tunnel->dst_port, activate);
+	else
+		res = tb_pci_port_enable(tunnel->src_port, activate);
 	if (res)
 		return res;
 
-	if (tb_port_is_pcie_up(tunnel->dst_port)) {
-		res = tb_pci_port_enable(tunnel->dst_port, activate);
+
+	if (activate) {
+		res = tb_pci_port_enable(tunnel->src_port, activate);
 		if (res)
 			return res;
+	} else {
+		/* Downstream router could be unplugged */
+		tb_pci_port_enable(tunnel->dst_port, activate);
 	}
 
 	return activate ? 0 : tb_pci_set_ext_encapsulation(tunnel, activate);
-- 
2.42.0



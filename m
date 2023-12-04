Return-Path: <linux-usb+bounces-3656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E69803099
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C65FBB20AB9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BBF2231B;
	Mon,  4 Dec 2023 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMFQahKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1294DDF
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686317; x=1733222317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JER1ZaMiU5C1NPyWlks3szx/4/+GqBAHpBzad4wCHtM=;
  b=fMFQahKpGMsctcM7FudI82mK33mox+pCNxnVHG6o6yESH5D0SR/i9k8p
   lLLV9LSSluKR73Or36PtxF9KHCbpPIa5PVq8/io8IQ1Q19Ll1VIoLWfXv
   6O+FKcO9mM8IswCRLr5P9lQOxFac5n98Cdq/o4uvoUhE0NuUkEmu8cmMi
   W0C0hCUNsyip4xQ6bpeun67oLFQMVXlbuygZzvLAO4Y14CAolnuKxYQ8T
   ZKFKj6JiiZvjWJzGEjCNh83vsihrXwD6d6DYvgJeqoQDItxlLOoIhBwee
   Fmi8qcHtB8gCnteksDLfkmW762fEkCRamTDQEHY0HsBPbV9zlPokIa4Du
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424880786"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424880786"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763904030"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763904030"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 02:38:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C0A2FA96; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
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
Subject: [PATCH 10/11] thunderbolt: Disable PCIe extended encapsulation upon teardown properly
Date: Mon,  4 Dec 2023 12:38:27 +0200
Message-ID: <20231204103828.1635531-11-mika.westerberg@linux.intel.com>
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

In case of PCIe tunnel teardown (including if caused by router unplug),
PCIe extended encapsulation bit should be cleared in downstream and
upstream routers accordingly.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index f0fde79b3b02..96b238b06f9d 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -173,16 +173,28 @@ static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 	int ret;
 
 	/* Only supported of both routers are at least USB4 v2 */
-	if (tb_port_get_link_generation(port) < 4)
+	if ((usb4_switch_version(tunnel->src_port->sw) < 2) ||
+	   (usb4_switch_version(tunnel->dst_port->sw) < 2))
+		return 0;
+
+	if (enable && tb_port_get_link_generation(port) < 4)
 		return 0;
 
 	ret = usb4_pci_port_set_ext_encapsulation(tunnel->src_port, enable);
 	if (ret)
 		return ret;
 
+	/*
+	 * Downstream router could be unplugged so disable of encapsulation
+	 * in upstream router is still possible.
+	 */
 	ret = usb4_pci_port_set_ext_encapsulation(tunnel->dst_port, enable);
-	if (ret)
-		return ret;
+	if (ret) {
+		if (enable)
+			return ret;
+		if (ret != -ENODEV)
+			return ret;
+	}
 
 	tb_tunnel_dbg(tunnel, "extended encapsulation %s\n",
 		      str_enabled_disabled(enable));
-- 
2.42.0



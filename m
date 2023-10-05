Return-Path: <linux-usb+bounces-1128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7CA7B9D9A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1B8BC282362
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E4E273F8;
	Thu,  5 Oct 2023 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArVlLLLU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C326E2B
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4BD1FCC
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513802; x=1728049802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lCbBCoXYP5VlwQiUuUYjFz3eu5xItYG7DR2tWXhGQzI=;
  b=ArVlLLLU60SM32nUteT1Zm/ggbQyofJF+NozCjuTIBY1wPlvEo29z0Cx
   kbI3hwgE46GSH3wz1gGFpNBcRq/rPbvk1RwU4ilmwGViYvYUA8KlFKBmA
   INd/PqSGWslMUlQ3RT9ho6XEQkQiBWwsGpDs+tiQDHgJfLy32dN7z1lG3
   vGl65ClszEsXY4f9yqARA6P5yry8cxXaWiI7gfDLFKDPlp7oerB5r5aN4
   /6xrmVFJYlgLlxMde175bg4h37Z/0NQwjYvGzlDAJlenF/nSCVhWmTPYN
   cL6VRjSvmrdY+55rkv84HUkaOQT4k+yzf/eZuVSQBQTnxqxob9oDroNM9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383355555"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383355555"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728369859"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728369859"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 02:27:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E5EFC456; Thu,  5 Oct 2023 12:27:29 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/10] thunderbolt: Use weight constants in tb_usb3_consumed_bandwidth()
Date: Thu,  5 Oct 2023 12:27:21 +0300
Message-Id: <20231005092729.3595447-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
References: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Instead of magic numbers use the constants we introduced in the previous
commit to make the code more readable. No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index c53df06dd5df..b77acda284d0 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1747,14 +1747,17 @@ static int tb_usb3_activate(struct tb_tunnel *tunnel, bool activate)
 static int tb_usb3_consumed_bandwidth(struct tb_tunnel *tunnel,
 		int *consumed_up, int *consumed_down)
 {
-	int pcie_enabled = tb_acpi_may_tunnel_pcie();
+	int pcie_weight = tb_acpi_may_tunnel_pcie() ? TB_PCI_WEIGHT : 0;
 
 	/*
 	 * PCIe tunneling, if enabled, affects the USB3 bandwidth so
 	 * take that it into account here.
 	 */
-	*consumed_up = tunnel->allocated_up * (3 + pcie_enabled) / 3;
-	*consumed_down = tunnel->allocated_down * (3 + pcie_enabled) / 3;
+	*consumed_up = tunnel->allocated_up *
+		(TB_USB3_WEIGHT + pcie_weight) / TB_USB3_WEIGHT;
+	*consumed_down = tunnel->allocated_down *
+		(TB_USB3_WEIGHT + pcie_weight) / TB_USB3_WEIGHT;
+
 	return 0;
 }
 
-- 
2.40.1



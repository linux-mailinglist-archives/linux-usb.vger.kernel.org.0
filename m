Return-Path: <linux-usb+bounces-1581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB657C8551
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F160B20954
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81914295;
	Fri, 13 Oct 2023 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaQhEugM"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C9125A0
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 12:06:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090E3C2
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697198805; x=1728734805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lCbBCoXYP5VlwQiUuUYjFz3eu5xItYG7DR2tWXhGQzI=;
  b=AaQhEugMC+nr8v5SsCdvRDlcGCnijHeUQssn4RKWconbqXfipXz0iVAM
   6iCdAGz7XGRaEjYZIbv6kpzlQZ3aFKDZcg4x5LRRoyNdhl3M63Bn0Mwe6
   EelTAmR2eMLeYuOhlkZmNPwJuDYivzMHxvRxrAVYJHsy74quM3ScUoYCP
   J0kQHb4alL7NxB0mg8YcJZSteGTvstunAnwaSDngK0FRLxjaB1z/8atyI
   NZwWCiBEIvgbyU8inmNy2CKsB/oaFNmCjZw/hRRC1UhC1gw7AylS/YZNP
   gXegqzD8dZf6jiUNSHgwgDnPi784qC0J+PWyB5b1pTYQnCiHTIbSzKZOO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="389033472"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="389033472"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820602041"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="820602041"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 05:06:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D4DAE6D3; Fri, 13 Oct 2023 15:06:40 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 02/10] thunderbolt: Use weight constants in tb_usb3_consumed_bandwidth()
Date: Fri, 13 Oct 2023 15:06:32 +0300
Message-Id: <20231013120640.709255-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
References: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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



Return-Path: <linux-usb+bounces-30269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49AC469A0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77FED1885042
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990A630F7F5;
	Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqX7kk9Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD130DD1A
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=QVTBaHfWHEoMhuiTQ963MFuxHYNqzt8eLFzQi8ZAs4Mr+atLm4x/NiDSge3jLrRXG4seibh+YNhisnVIBxfQxxe65IH0ODxeEPCuRq91aKJZLZL0E9sQwPA1ot9Agv2Mvbk5B/GPbJcc41G1Rl6gXck1STL/8cBvl7FsSi7SUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=GBrps3DlZWURYan320cqlqQWHE7PmAMl9dUuP3N5JuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Le2xavZSp9pctcR/sEqYvXRKIBzmFcJR8G+Il0wMOSEIO7MdliTqQxrI9bmHD4k33klG1/Ptle0gd7aKtEJc1j32VvLtXFhUy0Ii/MSGb4G6HtzHo9WUIxk5b394f71nOUyGTnSAxQ3IrYK+X71V2Fna5Ohpyclyp1bVRFXmSTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqX7kk9Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GBrps3DlZWURYan320cqlqQWHE7PmAMl9dUuP3N5JuY=;
  b=BqX7kk9Z4xjho14FHAD2SEiuduIVkX3USEUhrG9xETNDOEA4krLKy/0H
   hSKYMDxtU1Q6Wr72WkxNiQlppPCm9ppu78wlbrXcdCnp5+1agRM8yeQvt
   4fu5zGzb5yq3o+YgHXcQbMPgaCaMuwJW+QSYmH3OUoe1obFFO2QvsL4T7
   VA/NiMGdVv0Ka8wjwYRcJUrZvs1H8TxdxS4MzzAcCf4KMXL6JHcccJ73g
   oYguaN4k+zd9/H74N+TB/S9j4Aox+PMC5w0mzh/SaV5UXcPmUArY3RVGe
   VK6RU7LG0WGeM14l085zOfh12N8nWcyo9kPNs6nPk85g1mtbKL98JANPh
   w==;
X-CSE-ConnectionGUID: sOEpHaJoSTS6aqc2KUKhRg==
X-CSE-MsgGUID: 8TSod6s1Sy+FjKb3m9Y+LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64866248"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64866248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:54 -0800
X-CSE-ConnectionGUID: 6yykzkwoRCO8OtRba18C6w==
X-CSE-MsgGUID: SAl2BDg3SNqLlIKY29TtXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219317010"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 04:30:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7DD1094; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/16] thunderbolt: Fix typos in ctl.c
Date: Mon, 10 Nov 2025 13:30:35 +0100
Message-ID: <20251110123050.3959188-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in ctl.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index f92175ee3841..d7a535671404 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -412,7 +412,7 @@ static void tb_ctl_rx_submit(struct ctl_pkg *pkg)
 					     * We ignore failures during stop.
 					     * All rx packets are referenced
 					     * from ctl->rx_packets, so we do
-					     * not loose them.
+					     * not lose them.
 					     */
 }
 
-- 
2.50.1



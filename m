Return-Path: <linux-usb+bounces-26735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107BAB21DA5
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 07:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638496E0510
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 05:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6ED2C21F6;
	Tue, 12 Aug 2025 05:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWeJlXqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210729BDA9
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977636; cv=none; b=X8iQGiiY5NYq95J0Pd/JSZi6N0JxFpL1rsKiXFVxpddHhTNmv49AyfbfH5jOOy03yWHUE5HkkmgsMVsO9U3W4Ep3pkyYk4zNnvHYI2xvXCxwE9IHb0agdS7IarkLnObzXIgcEnBMFJaIbzh2lTohBVOguPJZY0B7aYvLqNImDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977636; c=relaxed/simple;
	bh=/Bqm8vOtJ/F3bWuwhAT5uCQDJlwY87RE7S7+McZmGFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HH3IjNN5hNSQoVM99nC3fw3Xs476k14dzZm7MT5swsLdznoUBwRtIZRmS4xve0IBEQpCYqZZ1Bs7g0H9Qv5wvaqlmSueYKdHc6yXwTLFzoFWy22GuTw+5SKbBsQAu014DyDSZrq++/wD8gXjJXffrWx4Kt/MVTVh6TYyD/2r6ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWeJlXqF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754977634; x=1786513634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Bqm8vOtJ/F3bWuwhAT5uCQDJlwY87RE7S7+McZmGFM=;
  b=MWeJlXqFAaiuGoeHrnXD1eKS/FSbDmRq+kAtaeGqWE2+DV7ozF1J0Ug4
   0CoYcsqLXq7OYdLKMXPTiwMZYWtANQESMqXQuMrHSJLSk7rym7QO9MFwL
   c8LoyQzT9it4Cry2OXUv46LRj0VEmAM+OADJKzsZ62VEqpelMe4PN6ykN
   B6EYMUWnga9F/clx0aSJot2hWS7fMmL0TE+2kUu7TQfyzCx9uz31rJvM5
   /nfVCdoLOWJxvexroINlklshNmUzJalTHrAVY3d1gj8FwnCGK2Vgd3vDL
   StEBb4ve6ILF1I8Yp2Yfo/NGGQ5rMwppHyqBBz9r0ANfx0v9xYsF9NTpm
   A==;
X-CSE-ConnectionGUID: 1+ZIfvV3RQCYIWVDGXuAEQ==
X-CSE-MsgGUID: 9J2IbGUhRjKeFM6S9b+7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59855398"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="59855398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 22:47:13 -0700
X-CSE-ConnectionGUID: l15I7z4PQy6HU5fb/Wyplw==
X-CSE-MsgGUID: XkFrv7oNQBKFJQmVYwg36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="197107498"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 22:47:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0B60994; Tue, 12 Aug 2025 07:47:10 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Use Linux Foundation IDs for XDomain discovery
Date: Tue, 12 Aug 2025 07:47:09 +0200
Message-ID: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are other vendors now that have their own USB4 host router
hardware so using the Intel donated IDs may confuse users. For this
reason switch to use USB IDs provided by the Linux Foundation for
XDomain discovery.

Link: https://lore.kernel.org/linux-usb/20250722175026.1994846-1-Raju.Rangoju@amd.com/
Cc: Raju Rangoju <Raju.Rangoju@amd.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index b0630e6d9472..fffa28cc491d 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -2562,10 +2562,9 @@ int tb_xdomain_init(void)
 	 * Rest of the properties are filled dynamically based on these
 	 * when the P2P connection is made.
 	 */
-	tb_property_add_immediate(xdomain_property_dir, "vendorid",
-				  PCI_VENDOR_ID_INTEL);
-	tb_property_add_text(xdomain_property_dir, "vendorid", "Intel Corp.");
-	tb_property_add_immediate(xdomain_property_dir, "deviceid", 0x1);
+	tb_property_add_immediate(xdomain_property_dir, "vendorid", 0x1d6b);
+	tb_property_add_text(xdomain_property_dir, "vendorid", "Linux");
+	tb_property_add_immediate(xdomain_property_dir, "deviceid", 0x0004);
 	tb_property_add_immediate(xdomain_property_dir, "devicerv", 0x80000100);
 
 	xdomain_property_block_gen = get_random_u32();
-- 
2.50.0



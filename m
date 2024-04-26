Return-Path: <linux-usb+bounces-9832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B258B2FCC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 07:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E3E3B223A8
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 05:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F2113A3E1;
	Fri, 26 Apr 2024 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iti3LQzM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D51EBE
	for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2024 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714110185; cv=none; b=HhCMiYWDqoinoZ6NC6CLvqr+WWmdnp/ofcxfSfpJhEimI1gmvcF3cztc4UOFvWdUO192ENRf8C+Ipb7OvjwbbdB6xaDXyPnEHFmZ15l12IrLfKunirakn+x0WnXYh9zL0IHFE/EWaKdcpYJeRZDukHQXRw7FP6275Wqvg9oF32E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714110185; c=relaxed/simple;
	bh=O/kDLpIwLjdn4SMpaMchjKNKiCmv0WnwoiO5zqdK7C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lp/SXgw2DJaMOh44xL5Los/NqPiKSL62/tAnPZzv6Ri4D0i/Wx8YX3hNEiUW6DqOa6XZWhmDnZEokKio6EHnIkssF4PfsxP56UFDoqjh5g7GPsJz+5CTi3B2/OZNmUD60qkIH51QJc65A3RCqY9wgAW8P8kQIa/spVHzzN7Yc2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iti3LQzM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714110184; x=1745646184;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O/kDLpIwLjdn4SMpaMchjKNKiCmv0WnwoiO5zqdK7C8=;
  b=iti3LQzMbHH3pY042OHhBbpQP+iOpce7NI46+AqfoMPpD1o9mDYyKU43
   WNbxvcb7X+14KaVjL7/Me5CwUWzAyENUlk+WD0HvwSdhPey1fyvYJbvc6
   PD4SQzleyVTmPsduQyUr8WdnuNfosGBs75O7xXI+yECwSqpuqoI77cjAs
   bF6k15FY4+RLNbBsZ+uKwpZpYOskDHKPR6THUhc91oILKuFM3aZE8sl2y
   sWxZjWz9HlcLYUClu18VqxSf5cbBEBuVX+DZYu0fqgNmPYrsHdTYcvBfR
   vcUnjGfRQ/a4YL+UbKts5SZmETiCluorBb7l8AyJLHW0jnbjXNAhGXXbw
   g==;
X-CSE-ConnectionGUID: ya6RevVoQnq0OaEvE/y52g==
X-CSE-MsgGUID: kSKngMeEQ6qbhq6eF8qztA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9704338"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9704338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 22:43:03 -0700
X-CSE-ConnectionGUID: 8EwWiL8DQleuHT5U2+z9Dg==
X-CSE-MsgGUID: XTPTwAdJS52aSJzpmdz6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="25314018"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 22:43:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 203ED1C5; Fri, 26 Apr 2024 08:43:00 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Correct trace output of firmware connection manager packets
Date: Fri, 26 Apr 2024 08:42:59 +0300
Message-ID: <20240426054300.3827052-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are special packets that the drivers sends directly to the
firmware connection manager (ICM). These do not have route string
because they are always consumed by the firmware connection manager
running on the host router, so hard-code that in the output accordingly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/trace.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/trace.h b/drivers/thunderbolt/trace.h
index 4dccfcf7af6a..6d0776514d12 100644
--- a/drivers/thunderbolt/trace.h
+++ b/drivers/thunderbolt/trace.h
@@ -87,23 +87,32 @@ static inline const char *show_data(struct trace_seq *p, u8 type,
 	const char *prefix = "";
 	int i;
 
-	show_route(p, data);
-
 	switch (type) {
 	case TB_CFG_PKG_READ:
 	case TB_CFG_PKG_WRITE:
+		show_route(p, data);
 		show_data_read_write(p, data);
 		break;
 
 	case TB_CFG_PKG_ERROR:
+		show_route(p, data);
 		show_data_error(p, data);
 		break;
 
 	case TB_CFG_PKG_EVENT:
+		show_route(p, data);
 		show_data_event(p, data);
 		break;
 
+	case TB_CFG_PKG_ICM_EVENT:
+	case TB_CFG_PKG_ICM_CMD:
+	case TB_CFG_PKG_ICM_RESP:
+		/* ICM messages always target the host router */
+		trace_seq_puts(p, "route=0, ");
+		break;
+
 	default:
+		show_route(p, data);
 		break;
 	}
 
-- 
2.43.0



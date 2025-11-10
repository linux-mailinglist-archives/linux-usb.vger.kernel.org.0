Return-Path: <linux-usb+bounces-30281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 249CAC469CA
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F6AD18881F6
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF981311583;
	Mon, 10 Nov 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rb9P9r7u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C226930F7FE
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777859; cv=none; b=n+Pyv7N0JzpuEbi5wNLU3opMFu5lgKpdZ/prGpjR4smygCgNsHyrqkOvK2zgp7giw9yxeEWTS+xQ4z3YI/jbuMGeEmiSEnHy9hZ2BCBl6Mkk/o7YMs2sH1wZA6hmGy+5OI4zA+ETedyWXjSVZ3LTILVGnkMytQcK5YFmpPMl1gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777859; c=relaxed/simple;
	bh=9qiDyPTF645un1m03xwVwlzOIu1EcwuRElpuM9de0nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjfLmwxJnp4x7WKCbamN5ViJQpL4DDej8cskxXor/yrd8xogy2vhrPch+LtbVppIzgSZ9N8IB4rUIc3+25+Vn6HWI577wiVxi0VIq3mg6COa8FKTsgI01yqI6PvXYcDPKGbImLzPWEksaT/vm0yOHY4Vv581DMqGRJ6EIOBCHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rb9P9r7u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777858; x=1794313858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9qiDyPTF645un1m03xwVwlzOIu1EcwuRElpuM9de0nU=;
  b=Rb9P9r7uOxENsxgMu70cXIKIx5XdaaEPgcZ4bhZq7qlFppDIpEVP3i0Y
   BVJEjQLgLQVhqz+tRxi8WBGGUop16et1MU6ZodAUdO/BfK9DW69e6Iqqx
   1CJJe2YAtWn7Z/5mI5TDW/56hAPQumO3ljk5LnzEqed2VYOTVMdkBJ/SD
   bJ/vxjqZImS/+M45Q9aQK1nsnQ2vxVCQMQqlyezd+5/Mlu6OerRkjpJds
   SsPWl+eD3HqL7Y0Yn3n7QHu3xD+pGUY9vx9ycp6aBu2imaGyFH1eAGYie
   rHXClaE4TPm6BUD6vkjoKZAnZfDX/NMIhKWlNMqtMjtVgn8E4zu1MG3up
   w==;
X-CSE-ConnectionGUID: v2BJp09rQQKAW9kVWHDPHw==
X-CSE-MsgGUID: v0XlerAISw+ZysBdatFY+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75511668"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75511668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:57 -0800
X-CSE-ConnectionGUID: mZ14nXAZQvWTuOoOHxYgIQ==
X-CSE-MsgGUID: bPY04fC4Sc2mCqyqHSRfCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="189103482"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2025 04:30:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AC996A5; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 16/16] thunderbolt: Fix typos in xdomain.c
Date: Mon, 10 Nov 2025 13:30:50 +0100
Message-ID: <20251110123050.3959188-17-mika.westerberg@linux.intel.com>
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

Fix typos in xdomain.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 9d220ba544ec..63c7be818b2c 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1951,8 +1951,8 @@ static void tb_xdomain_link_exit(struct tb_xdomain *xd)
 /**
  * tb_xdomain_alloc() - Allocate new XDomain object
  * @tb: Domain where the XDomain belongs
- * @parent: Parent device (the switch through the connection to the
- *	    other domain is reached).
+ * @parent: Parent device (the switch through which the other domain
+ *	    is reached).
  * @route: Route string used to reach the other domain
  * @local_uuid: Our local domain UUID
  * @remote_uuid: UUID of the other domain (optional)
-- 
2.50.1



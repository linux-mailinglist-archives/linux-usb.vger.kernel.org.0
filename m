Return-Path: <linux-usb+bounces-2875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C367EAFAC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 13:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3992811A1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891A03D984;
	Tue, 14 Nov 2023 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5RVN4dg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58613E476
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 12:12:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778D6184
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 04:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699963929; x=1731499929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/0zQaq2B5Ejy364nV20zrd8ckkQZEyY4NKv4xvdtqQ=;
  b=O5RVN4dg6zsbjAU93Jx/tTN53mIsbzcPMg4IrNPXahKyOicYgZBZvnzC
   OMrHVD0e/I7SvXPUsy1jKJxjEmaLTahv8/Z8PXZXRjX6W/IvWRK13qRk9
   +kxU3Fpxag6DQJYHmLuYB7BvrxG1uyHSXq25o5/Oj5SoBh27D8d4ExKBe
   US5G/X4qhnXZA03z4gsypbv3KltEIv91ZQZcMuEvrdbUfm94uuarZCCl5
   GngITa3xML2I/es1uGM13C+PepVaIwGId/v4vYzpcnrcYJ4fgzcHmYxIv
   LJPuyFqMoG4F1odpYzu0xVSS/KmBIHojdZeddqaJvgLHWs7vinP/+WtGD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="390436940"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="390436940"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799508553"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="799508553"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 14 Nov 2023 04:12:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BCAC45E2; Tue, 14 Nov 2023 14:12:03 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Only add device router DP IN to the head of the DP resource list
Date: Tue, 14 Nov 2023 14:12:03 +0200
Message-ID: <20231114121203.203762-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114121203.203762-1-mika.westerberg@linux.intel.com>
References: <20231114121203.203762-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pairing DP IN and DP OUT adapters for DisplayPort tunneling, we
should prioritize the possible external GPU DP IN adapters to take
advantage of the its capabilities. However the commit in question did
this for host router DP IN adapters too and that changes ordering of the
initial DP IN resources in such way that resuming from suspend may end
up using different resource and that may confuse the user.

Fix this so that we only put DP IN adapters of device routers to the top
of the resource list and leave host routers as is.

Fixes: 274baf695b08 ("thunderbolt: Add DP IN added last in the head of the list of DP resources")
Reported-by: Pengfei Xu <pengfei.xu@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 5acdeb766860..fd49f86e0353 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -213,7 +213,17 @@ static void tb_add_dp_resources(struct tb_switch *sw)
 		if (!tb_switch_query_dp_resource(sw, port))
 			continue;
 
-		list_add(&port->list, &tcm->dp_resources);
+		/*
+		 * If DP IN on device router exist, position it at the
+		 * beginning of the DP resources list, so that it is used
+		 * before DP IN of the host router. This way external GPU(s)
+		 * will be prioritized when pairing DP IN to a DP OUT.
+		 */
+		if (tb_route(sw))
+			list_add(&port->list, &tcm->dp_resources);
+		else
+			list_add_tail(&port->list, &tcm->dp_resources);
+
 		tb_port_dbg(port, "DP IN resource available\n");
 	}
 }
-- 
2.42.0



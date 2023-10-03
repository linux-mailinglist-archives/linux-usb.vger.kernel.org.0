Return-Path: <linux-usb+bounces-1008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C37B65A3
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CAB4628178A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDA4101C4;
	Tue,  3 Oct 2023 09:40:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B8DF4F
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33742AD
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326010; x=1727862010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XcvFZeey7KMj1LGG+afzDB8vX1hLjpVnPR588TZ6Sus=;
  b=Q7mS54WCC/XAumQIYJTBfIsr5bCVBl/TKg/0bW8SKUjbbC+xjBQa8RjE
   OQApW0hK17AVqwh9ehRTKjZt4gWBHG22p37gXA+tQa99nn3AJytNwcNhT
   n2ncxD6tTpvFaG54VYDmu37Bm2XW3cq/9GxX6KLKRJB4zjj45AD3z+3Ig
   5MGHP9U2gbApzVoMWtxj1TdFhBEhyJynppVn4JHwCbG7DR/0WmvS/xuF3
   V0I/unk2pUSzFVKgzqhyYbH9iJz8xv2rOBsRlKE2v40Z9oz2QRtCrh7Xz
   AXpM4HrYCyugmQZuNaqTWp2foMwTsSxPNzJUEQ8JHED7lPsTbZVtciFNV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362204834"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362204834"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727558486"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="727558486"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 02:40:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9A2F0194A; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/13] thunderbolt: Check for unplugged router in tb_switch_clx_disable()
Date: Tue,  3 Oct 2023 12:39:56 +0300
Message-Id: <20231003094005.2676823-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
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

There is no point disabling CL states if the router is unplugged so in
that case return early.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index c08b9cf0371e..787dfd1550e5 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -405,6 +405,9 @@ int tb_switch_clx_disable(struct tb_switch *sw)
 	if (!clx)
 		return 0;
 
+	if (sw->is_unplugged)
+		return clx;
+
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
 
-- 
2.40.1



Return-Path: <linux-usb+bounces-2874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972A7EAFAB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 13:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6EA1F23CB8
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC323E49A;
	Tue, 14 Nov 2023 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItETBIgC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2B43D984
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 12:12:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0002013A
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 04:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699963927; x=1731499927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iuosgsgdj4lr2656w0w8jzBRqkuJSTSKY1ft/oL1w48=;
  b=ItETBIgCklYvvpXa4saDUVTQNPYmpldRFhpdk0eFFLHYL4Wwy3LaE0JQ
   ojYiz6g+SXkAMBqKuduqsMLqimfhxr3BA4P5U+fGJbqnC+aZyLM/UJ2Mp
   ckngMYIe7eF8mYKhOZwGUi0ubRkNskSJ3xMDGPphHlAx6SjM2DPdVhas6
   itdJWt3Rmoew0loIx20W8HNsNVY28F7oFyf22BVkHVqxq0G3hwbyxq9vK
   9GW/l5HzeAshWiQSQDDttWIBb0ynTIVoK9vvsvL7+YP2PFr84kQLD/PP0
   kKcavyTBpQdRgOk7X3l7ACGwOGai8SMxnuMBlD2sXtTrSFhbfmY+NWNVZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="390436937"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="390436937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799508550"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="799508550"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 14 Nov 2023 04:12:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B6E3D125; Tue, 14 Nov 2023 14:12:03 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Send uevent after asymmetric/symmetric switch
Date: Tue, 14 Nov 2023 14:12:02 +0200
Message-ID: <20231114121203.203762-2-mika.westerberg@linux.intel.com>
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

We should send uevent to userspace whenever the link speed or width
changes but tb_switch_asym_enable() and tb_switch_asym_disable() set the
sw->link_width already so tb_switch_update_link_attributes() never
noticed the change.

Fix this so that we let tb_switch_update_link_attributes() update the
fields accordingly.

Fixes: 81af2952e606 ("thunderbolt: Add support for asymmetric link")
Reported-by: Pengfei Xu <pengfei.xu@intel.com>
Tested-by: Pengfei Xu <pengfei.xu@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 9e5cc285cc8d..44e9b09de47a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2880,6 +2880,7 @@ static int tb_switch_lane_bonding_disable(struct tb_switch *sw)
 	return tb_port_wait_for_link_width(down, TB_LINK_WIDTH_SINGLE, 100);
 }
 
+/* Note updating sw->link_width done in tb_switch_update_link_attributes() */
 static int tb_switch_asym_enable(struct tb_switch *sw, enum tb_link_width width)
 {
 	struct tb_port *up, *down, *port;
@@ -2919,10 +2920,10 @@ static int tb_switch_asym_enable(struct tb_switch *sw, enum tb_link_width width)
 			return ret;
 	}
 
-	sw->link_width = width;
 	return 0;
 }
 
+/* Note updating sw->link_width done in tb_switch_update_link_attributes() */
 static int tb_switch_asym_disable(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
@@ -2957,7 +2958,6 @@ static int tb_switch_asym_disable(struct tb_switch *sw)
 			return ret;
 	}
 
-	sw->link_width = TB_LINK_WIDTH_DUAL;
 	return 0;
 }
 
-- 
2.42.0



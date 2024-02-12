Return-Path: <linux-usb+bounces-6233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D18512A2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 12:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC7BF283733
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 11:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313BA39AC5;
	Mon, 12 Feb 2024 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMPry02n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1E39861
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707738698; cv=none; b=Y//svGRWclyBcvr1FoSke9hITfve17A1ZuPStjf5l/p5XBCkaC+dYOWyorRB4Qhba9fChQlAS2T87TnrChUDTMmC56YAUuSria2dPBAUep2Jnok5JhSCSvrx7SgdpBJ49VtsP08WsBF5MG6YWzpPT2jpDDsTcqAFe3OOhAJySxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707738698; c=relaxed/simple;
	bh=ap6Q4FmmcA3zavwA86d/9G7AcEfjzTRp/BD0evnCoKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fFf+9jQOt3z+C9UMdpW/8ZPGTUXMIbzhBKDkYcSZ3O7mwnT74mMhsjuY9jVkqIJq4vBWTlWz+PpT4th4FtKEWmu3/U6iffonYflibkfwGbHzaYNOPkZvwARMyHTnpEH3uTLtBJare+9IcDOoLmKqWL69m9A48DR57bsuHZWXWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMPry02n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707738697; x=1739274697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ap6Q4FmmcA3zavwA86d/9G7AcEfjzTRp/BD0evnCoKA=;
  b=FMPry02n8tA9JY10V3EgGFGVDPuFm84F/7/FNNdSSNlrdbOr0ZZr/dOD
   Fh/2GVwy4makxNYoR9uOkYO0Kqt92e02BVI6u2wT1J2dYKGQltb6vz5DP
   uY0tVqtGAxz66/gQjrt6sXH7noiXxGozgDi5Z5g1FRjtASWiYdxDYeaDW
   jvXx4vRhTo+BMJl3EJTHwKz/37WC6jeS1OI4e8St9VwcKitPcptHD3czm
   QmmbrJ6mwwXG35zy/9vhc8phHD4OyiVSOtk9vO/1VxALpB54rD3T531ck
   +bN0KNWUQgCDwqDGlcTzeDWuEJCHLQrXFrjcV8yxAwgCx1g3kWgRnbSy8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="24182227"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="24182227"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 03:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935045767"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="935045767"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2024 03:51:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B7BAFF7; Mon, 12 Feb 2024 13:51:32 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Olliver Schinagl <oliver@schinagl.nl>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix NULL pointer dereference in tb_port_update_credits()
Date: Mon, 12 Feb 2024 13:51:32 +0200
Message-ID: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Olliver reported that his system crashes when plugging in Thunderbolt 1
device:

 BUG: kernel NULL pointer dereference, address: 0000000000000020
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
 Call Trace:
  <TASK>
  ? __die+0x23/0x70
  ? page_fault_oops+0x171/0x4e0
  ? exc_page_fault+0x7f/0x180
  ? asm_exc_page_fault+0x26/0x30
  ? tb_port_do_update_credits+0x1b/0x130
  ? tb_switch_update_link_attributes+0x83/0xd0
  tb_switch_add+0x7a2/0xfe0
  tb_scan_port+0x236/0x6f0
  tb_handle_hotplug+0x6db/0x900
  process_one_work+0x171/0x340
  worker_thread+0x27b/0x3a0
  ? __pfx_worker_thread+0x10/0x10
  kthread+0xe5/0x120
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x31/0x50
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1b/0x30
  </TASK>

This is due the fact that some Thunderbolt 1 devices only have one lane
adapter. Fix this by checking for the lane 1 before we read its credits.

Reported-by: Olliver Schinagl <oliver@schinagl.nl>
Closes: https://lore.kernel.org/linux-usb/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
Fixes: 81af2952e606 ("thunderbolt: Add support for asymmetric link")
Cc: stable@vger.kernel.org
Cc: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Hi Olliver,

I managed to reproduce this with a Thunderbolt 1 device. I wonder if you
can try this patch and see if it fixes your issue too?

 drivers/thunderbolt/switch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index bca6f28c553b..72ebde0e34d7 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1256,6 +1256,9 @@ int tb_port_update_credits(struct tb_port *port)
 	ret = tb_port_do_update_credits(port);
 	if (ret)
 		return ret;
+
+	if (!port->dual_link_port)
+		return 0;
 	return tb_port_do_update_credits(port->dual_link_port);
 }
 
-- 
2.43.0



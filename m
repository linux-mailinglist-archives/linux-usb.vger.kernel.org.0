Return-Path: <linux-usb+bounces-25123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9827AE9E14
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 15:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070981C41486
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 13:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F412E5415;
	Thu, 26 Jun 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvZO9t20"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794A2E542A
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942883; cv=none; b=kFCIpvxPJT/LnPngDmKb/jVZZ4w269PPhqfyMEZJLfsVRNS6ZRu4zwK0fjyy7QmabcNxwJpzAKl9JFqRC1K05op6UMUk258laEjfZInsbxfhV12H+9vPAdl6K3rdQiIAiLVSwi86UBihMAc8DXPGS0wBYhPNgKbRqaKDKK5i3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942883; c=relaxed/simple;
	bh=2pwhL79UNhV6oCkVxGhU+JshiEqJlhHcOvlIKSXtxjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQMfNPnGCLboahu1ge/kTr7yYhD3QQlRcV3XUnuZFG0ickl2YRxN6eCJOYhgjaN8iDO0yy7jAMGOffWfLg7PCy+nFZRLXvNj8uDDxozetUNBOnZcTIDtfmIS+OBUqFClb2nD9qMHEvlDplMEq39lUlh1h0vhHL/67sW2Lz5n8Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvZO9t20; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750942882; x=1782478882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2pwhL79UNhV6oCkVxGhU+JshiEqJlhHcOvlIKSXtxjo=;
  b=NvZO9t20YJMya8g+DO/lecL/rwgoNS7ViGTjk5uIqtT5WhyR1Ntiw0T+
   lRQWknUHeDhP+yrpHVUfh3FXF8ur6xRD2cPsXiyAGjeAxk+Vw0FzeSECB
   i3gBf2iIxk2wC8ubvAZo+C44DNJTeuMb0GkpK9LEGNrql+Q6qSyoL4F3j
   xIOhIY0o8BQr2lB5UNcI1U2CGo2d/ITN7+Ld7AWwd2CWP3A8REQV+T7qy
   7tnaQ1qp0ERwHGqF+qzIrIh8bYa/cd5mpZJjoi0QIQfaoG0P03SorZFM0
   L8BWd/+Jzbx992qLH5cEujw6Ht84j8cwNEGEIyXKZJprZgN8+EUrRTX7E
   A==;
X-CSE-ConnectionGUID: Rbwdh/ahRBu7WnDeTOgFZg==
X-CSE-MsgGUID: Jhnuoc+ZRpSTLnI2uPSiVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53370677"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53370677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:01:22 -0700
X-CSE-ConnectionGUID: 8haN3QllQSOtMZMGoLyEKg==
X-CSE-MsgGUID: rtX5brB4QBak58FAabLwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152140065"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 06:01:19 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	stable@kernel.org
Subject: [PATCH 1/1] usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm
Date: Thu, 26 Jun 2025 16:01:02 +0300
Message-ID: <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delayed work to prevent USB3 hubs from runtime-suspending immediately
after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
of high tier USB3 devices behind suspended hubs").

This delayed work needs be flushed if system suspends, or hub needs to
be quiesced for other reasons right after resume. Not flushing it
triggered issues on QC SC8280XP CRD board during suspend/resume testing.

Fix it by flushing the delayed resume work in hub_quiesce()

The delayed work item that allow hub runtime suspend is also scheduled
just before calling autopm get. Alan pointed out there is a small risk
that work is run before autopm get, which would call autopm put before
get, and mess up the runtime pm usage order.
Swap the order of work sheduling and calling autopm get to solve this.

Cc: stable@kernel.org
Fixes: 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-usb/acaaa928-832c-48ca-b0ea-d202d5cd3d6c@oss.qualcomm.com
Reported-by: Alan Stern <stern@rowland.harvard.edu>
Closes: https://lore.kernel.org/linux-usb/c73fbead-66d7-497a-8fa1-75ea4761090a@rowland.harvard.edu
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6bb6e92cb0a4..08562711dcf2 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1359,11 +1359,12 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 	if (type == HUB_RESUME && hub_is_superspeed(hub->hdev)) {
 		/* give usb3 downstream links training time after hub resume */
+		usb_autopm_get_interface_no_resume(
+			to_usb_interface(hub->intfdev));
+
 		INIT_DELAYED_WORK(&hub->init_work, hub_post_resume);
 		queue_delayed_work(system_power_efficient_wq, &hub->init_work,
 				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
-		usb_autopm_get_interface_no_resume(
-			to_usb_interface(hub->intfdev));
 		return;
 	}
 
@@ -1417,6 +1418,7 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
 
 	/* Stop hub_wq and related activity */
 	timer_delete_sync(&hub->irq_urb_retry);
+	flush_delayed_work(&hub->init_work);
 	usb_kill_urb(hub->urb);
 	if (hub->has_indicators)
 		cancel_delayed_work_sync(&hub->leds);
-- 
2.43.0



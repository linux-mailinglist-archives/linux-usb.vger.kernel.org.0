Return-Path: <linux-usb+bounces-25171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6AAEB9AB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0272188E665
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6E92E2664;
	Fri, 27 Jun 2025 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nskIupWX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F142E2640
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034063; cv=none; b=JazP8KnfI9EyffJnNjLPxhOHiaOh8NRX+eAFgy/7t37v3q2HxMBFSHdB13FOgxYw+1NQeiT0Oq0eWmiewvoIwQyCTIOLm7E6PAWbJ+DQFnOkffBmaa2/OXhObo0hvKIUiHQBXZBUIGaz2IeV5EQMSkMfbZTEXz3wp2QMQKtlcDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034063; c=relaxed/simple;
	bh=QxlBxxkMBz7Ra57R0fk4UEt/l15AUbR0yvi8R3eyZvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=le34hwneofM+3SGLHbIa29Y3e+NIJvZFXhxZ8f8cvT4NBToy0p7uSvjOQQ8/LfCfirdpivrdhCRUYXzziOqn61F0wCHwdZvOaELu+N6hbQaLRZfiJOdqPZSz5IworR9gM1m2lqiPP1uU3ldTpkQc3yiTWKif+//4L5rWlMGecMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nskIupWX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751034062; x=1782570062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QxlBxxkMBz7Ra57R0fk4UEt/l15AUbR0yvi8R3eyZvU=;
  b=nskIupWX2GSW9s1Dz84xSQb2dLcnhhuRVeLaVTMVs8AJLF5qaMghySq1
   lautVUt/FC++7LfluBV9LDBbt0pI8izFIHsfSTWH9IVkTfppQcbcrCg4r
   rAgdE4A8diDLm5Ubol8y541G1Vk+NhJ39dvY9oG+IT7dwS7gRB8RgZE2s
   g+gHPdwK9jvfl1sRrraPJ/idfZrZhIRLMC/jMYb/io3TxuvJjJ806noIL
   XysOkpYUt3CgQac/MYlmifXVCQ2V5h6mLmX3tdQPRfVzvIWgZr3veA1hj
   jF+C5eBBMFmKF2L3jhDeaW42B5ZlHZScR53J8XOHmfEA9I57KTq1pWEt2
   A==;
X-CSE-ConnectionGUID: RYRWfM2cSoaRlvE8LPUplA==
X-CSE-MsgGUID: Z7VaixnrRcy7ByHZ1JmypA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53500565"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53500565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:21:00 -0700
X-CSE-ConnectionGUID: p/eMKuQWTiue4+wSzP776w==
X-CSE-MsgGUID: NDfQthWjRkypkpCrGB7asw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153531219"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 07:20:58 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com,
	broonie@kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	stable@kernel.org
Subject: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of delayed work tuning runtime pm
Date: Fri, 27 Jun 2025 17:20:44 +0300
Message-ID: <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
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

The same hub->init_work delayed work item is used for several purposes,
and simply fushing it in hub_quiesce() causes other issues, so fix
this by creating a dedicated work item for post resume work, and flush
that in hub_quiesce()

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
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 v2:
 - Add and use dedicated delayed work struct for post resume work
 - Add commit message section about dedicated work

 drivers/usb/core/hub.c | 23 ++++++++++-------------
 drivers/usb/core/hub.h |  1 +
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index f981e365be36..256fe8c86828 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1074,12 +1074,11 @@ int usb_remove_device(struct usb_device *udev)
 
 enum hub_activation_type {
 	HUB_INIT, HUB_INIT2, HUB_INIT3,		/* INITs must come first */
-	HUB_POST_RESET, HUB_RESUME, HUB_RESET_RESUME, HUB_POST_RESUME,
+	HUB_POST_RESET, HUB_RESUME, HUB_RESET_RESUME,
 };
 
 static void hub_init_func2(struct work_struct *ws);
 static void hub_init_func3(struct work_struct *ws);
-static void hub_post_resume(struct work_struct *ws);
 
 static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 {
@@ -1103,12 +1102,6 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 		goto init3;
 	}
 
-	if (type == HUB_POST_RESUME) {
-		usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
-		hub_put(hub);
-		return;
-	}
-
 	hub_get(hub);
 
 	/* The superspeed hub except for root hub has to use Hub Depth
@@ -1359,11 +1352,12 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 	if (type == HUB_RESUME && hub_is_superspeed(hub->hdev)) {
 		/* give usb3 downstream links training time after hub resume */
-		INIT_DELAYED_WORK(&hub->init_work, hub_post_resume);
-		queue_delayed_work(system_power_efficient_wq, &hub->init_work,
-				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
 		usb_autopm_get_interface_no_resume(
 			to_usb_interface(hub->intfdev));
+
+		queue_delayed_work(system_power_efficient_wq,
+				   &hub->post_resume_work,
+				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
 		return;
 	}
 
@@ -1387,9 +1381,10 @@ static void hub_init_func3(struct work_struct *ws)
 
 static void hub_post_resume(struct work_struct *ws)
 {
-	struct usb_hub *hub = container_of(ws, struct usb_hub, init_work.work);
+	struct usb_hub *hub = container_of(ws, struct usb_hub, post_resume_work.work);
 
-	hub_activate(hub, HUB_POST_RESUME);
+	usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
+	hub_put(hub);
 }
 
 enum hub_quiescing_type {
@@ -1417,6 +1412,7 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
 
 	/* Stop hub_wq and related activity */
 	timer_delete_sync(&hub->irq_urb_retry);
+	flush_delayed_work(&hub->post_resume_work);
 	usb_kill_urb(hub->urb);
 	if (hub->has_indicators)
 		cancel_delayed_work_sync(&hub->leds);
@@ -1975,6 +1971,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	hub->hdev = hdev;
 	INIT_DELAYED_WORK(&hub->leds, led_work);
 	INIT_DELAYED_WORK(&hub->init_work, NULL);
+	INIT_DELAYED_WORK(&hub->post_resume_work, hub_post_resume);
 	INIT_WORK(&hub->events, hub_event);
 	INIT_LIST_HEAD(&hub->onboard_devs);
 	spin_lock_init(&hub->irq_urb_lock);
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index e6ae73f8a95d..9ebc5ef54a32 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -70,6 +70,7 @@ struct usb_hub {
 	u8			indicator[USB_MAXCHILDREN];
 	struct delayed_work	leds;
 	struct delayed_work	init_work;
+	struct delayed_work	post_resume_work;
 	struct work_struct      events;
 	spinlock_t		irq_urb_lock;
 	struct timer_list	irq_urb_retry;
-- 
2.43.0



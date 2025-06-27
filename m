Return-Path: <linux-usb+bounces-25190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C91AEBDB8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 757CE3AD83D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100A72EA174;
	Fri, 27 Jun 2025 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVI4XaKN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124752E92C8
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042646; cv=none; b=HdHbgYb9XwnJKq8IhxywV9VnYKW/cNlybB6h5CrxT1c9clXNiMlnknp44yMJkMO7Sy6kHO5q60zT1ROruapB6zoUBj0fMlHX05wxE1E4reSg76aBPeXU5Eu8Wz2fHX/sFMLoQBbexxJWmA0PNgN1oBE73gmui/aAM7SBwEZ7Dls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042646; c=relaxed/simple;
	bh=S/4h9gSljGc5TsZnh4Pfw00dcKMVI293rhLPJwmN95s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnIN2deAQZy8xFn2Pc+ACL/l6EVorvyEx9dGjAVKD0R6N5yoPDqrKRF7g8JYyMJnVbsGciJJcN6O8AWEDGlNylIAP/0HU4LF0X1+jhqVCSyJHkLIFUxZXmZ1EMOET9iH+UEZZ2HxlnAiSWv5oJo4zut0XqO/ySyVylshjCPoq0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVI4XaKN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042645; x=1782578645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S/4h9gSljGc5TsZnh4Pfw00dcKMVI293rhLPJwmN95s=;
  b=JVI4XaKNd2tAyyo15R9JxlMh9Ht8ybQ/402yMv6iF6cJ6OiiNfYKKNFu
   ZwKc24maIlFzs65Yf1YJrpTEllSfZbBTy4fkitK0TyNryYYm1qetZVi2m
   BGAhs/JX6uMuX2YFYdSgEll6NBjp9BJRp24Z66y5dVuw7KSN0B9mnrCpK
   KkYIDCrBuv1hdJQ92AwmcTsCFl3S42xF98jw7M972mA3nows1PP3npB3i
   /lNe2M2BoMx1Y3b6peVKfUdPWXCGCThLNqCUOytESOZJlBkVCwBrn9q0H
   fs97UqlFZVtA6y6z/axas0ug9ZsxPKwwugmD0ZDUMONkdjF73EBqSDc5Z
   A==;
X-CSE-ConnectionGUID: LWe0VpudTrOxDZtiGF7w8Q==
X-CSE-MsgGUID: H239tsbSQI6OjQZWKBfEjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57142550"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57142550"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:44:05 -0700
X-CSE-ConnectionGUID: GO4LFhZyTQqN8GsiNs3n5g==
X-CSE-MsgGUID: VV0wiR83RJSM7pjD7My9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152951896"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2025 09:44:03 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com,
	broonie@kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	stable@kernel.org
Subject: [RFT PATCH v3 1/1] usb: hub: Fix flushing of delayed work used for post resume purposes
Date: Fri, 27 Jun 2025 19:43:48 +0300
Message-ID: <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
References: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delayed work that prevents USB3 hubs from runtime-suspending too early
needed to be flushed in hub_quiesce() to resolve issues detected on
QC SC8280XP CRD board during suspend resume testing.

This flushing did however trigger new issues on Raspberry Pi 3B+, which
doesn't have USB3 ports, and doesn't queue any post resume delayed work.

The flushed 'hub->init_work' item is used for several purposes, and
is originally initialized with a 'NULL' work function. The work function
is also changed on the fly, which may contribute to the issue.

Solve this by creating a dedicated delayed work item for post resume work,
and flush that delayed work in hub_quiesce()

Cc: stable@kernel.org
Fixes: a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v3:
 - Rebase on top of a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
 - Rewrite commit message 

v2:
 - Add and use dedicated delayed work struct for post resume work
 - Add commit message section about dedicated work


 drivers/usb/core/hub.c | 21 ++++++++-------------
 drivers/usb/core/hub.h |  1 +
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 08562711dcf2..3e1215f7a9a0 100644
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
@@ -1362,8 +1355,8 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 		usb_autopm_get_interface_no_resume(
 			to_usb_interface(hub->intfdev));
 
-		INIT_DELAYED_WORK(&hub->init_work, hub_post_resume);
-		queue_delayed_work(system_power_efficient_wq, &hub->init_work,
+		queue_delayed_work(system_power_efficient_wq,
+				   &hub->post_resume_work,
 				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
 		return;
 	}
@@ -1388,9 +1381,10 @@ static void hub_init_func3(struct work_struct *ws)
 
 static void hub_post_resume(struct work_struct *ws)
 {
-	struct usb_hub *hub = container_of(ws, struct usb_hub, init_work.work);
+	struct usb_hub *hub = container_of(ws, struct usb_hub, post_resume_work.work);
 
-	hub_activate(hub, HUB_POST_RESUME);
+	usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
+	hub_put(hub);
 }
 
 enum hub_quiescing_type {
@@ -1418,7 +1412,7 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
 
 	/* Stop hub_wq and related activity */
 	timer_delete_sync(&hub->irq_urb_retry);
-	flush_delayed_work(&hub->init_work);
+	flush_delayed_work(&hub->post_resume_work);
 	usb_kill_urb(hub->urb);
 	if (hub->has_indicators)
 		cancel_delayed_work_sync(&hub->leds);
@@ -1977,6 +1971,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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



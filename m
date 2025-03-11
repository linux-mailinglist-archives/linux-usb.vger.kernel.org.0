Return-Path: <linux-usb+bounces-21649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD2A5C8A9
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 16:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09FF816568B
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 15:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7D725F7A9;
	Tue, 11 Mar 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3bC0hG+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9525E82C
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707896; cv=none; b=o5HGvDopYF/sTh4q5N0WYzAdfHNAfM879U1MXAbKgC8LiSdrE0auStlPD9t8ZTgBODrZYQqpB2snMFhItFsj6FLXybjftDJgJ1BKn6yHRSBKCvkdIe1ctzpmKIK/ztuUCukXramOeoCYap/rsb7K47/82pdyxuXd9wt+f1eCVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707896; c=relaxed/simple;
	bh=gGLGqJ7cUb/dd9OgBck1p3Qpbvuhqs4s8+m6HjQPNDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qs1JuRiq9DZqk/Lj7ISPRygCMKF2cGQqiWmuLVE+0JviTxUjgE8xJnrsrQfhWaWjLZhQM8dJZ3xCl2nxBr728WK5SGzhMrJVtIf/r1g74tlmxYsR7knEjYw3YqqykpQSlyR3R1ZwmlkmsXQ+UKzBo6XS32+O1LHD4Uzki71+9nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3bC0hG+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741707895; x=1773243895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gGLGqJ7cUb/dd9OgBck1p3Qpbvuhqs4s8+m6HjQPNDE=;
  b=h3bC0hG+ootOGtjwVJyOOJtMoK3H7Qr7fKXBDuwKOa3kX8aMBMSiapJ7
   Q+A4pdLMxycgG6Cw7+oZYZ6SgOSVzvvETju2AGPDw/ZsKRMRM2swLkTOA
   BHT1YfMOgtQCHq9tjmoSgDLqunVclCOC6dlaYCw5sEfglcO/KQI1yAHkA
   x0tumExK3pshCSfeNifXc6woAOqSOtGdsmFmAgOAVJvRkMkhV16zfiVMG
   1ZMfQJGj0QUbLbVAyIaLPxmK0QlcnQoYRma3sp1P9FQJE5lfEOxMbNnd7
   bkHRNpjrsiA1RNQPXo106LPmrgM3Kyoc58t173sVVK80QKj8VPWyfNytl
   w==;
X-CSE-ConnectionGUID: mHccSzCuSKaWyLiaoSFxxQ==
X-CSE-MsgGUID: Oly+fOeWSpu/hNzltYwodw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30327908"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="30327908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 08:44:55 -0700
X-CSE-ConnectionGUID: CxoGEE06T0Or4oOyVe9yfw==
X-CSE-MsgGUID: 8k1BvkLRRGu1vYtUNXWiVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125396707"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2025 08:44:54 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/3] usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running
Date: Tue, 11 Mar 2025 17:45:51 +0200
Message-ID: <20250311154551.4035726-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
References: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Nothing prevents a broken HC from claiming that an endpoint is Running
and repeatedly rejecting Stop Endpoint with Context State Error.

Avoid infinite retries and give back cancelled TDs.

No such cases known so far, but HCs have bugs.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 303d66df271e..5d64c297721c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1264,16 +1264,19 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			 * Stopped state, but it will soon change to Running.
 			 *
 			 * Assume this bug on unexpected Stop Endpoint failures.
-			 * Keep retrying until the EP starts and stops again, on
-			 * chips where this is known to help. Wait for 100ms.
+			 * Keep retrying until the EP starts and stops again.
 			 */
-			if (time_is_before_jiffies(ep->stop_time + msecs_to_jiffies(100)))
-				break;
 			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ctx_state %d\n",
 					GET_EP_CTX_STATE(ep_ctx));
+			/*
+			 * Don't retry forever if we guessed wrong or a defective HC never starts
+			 * the EP or says 'Running' but fails the command. We must give back TDs.
+			 */
+			if (time_is_before_jiffies(ep->stop_time + msecs_to_jiffies(100)))
+				break;
 
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command) {
-- 
2.43.0



Return-Path: <linux-usb+bounces-28239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF634B81E48
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19F457A5526
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41402D8DCF;
	Wed, 17 Sep 2025 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCDkYP6D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F334BA4A
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143293; cv=none; b=WGreYK7JQ7OqE52kBoKVe7xmh78yh3+iXue1Bxm4nuf3qur4aFy5eGmnVC3lBwPjl+OrHQa+ktpqeOJKuI99jTDluQvyKEgrLLKeY8IMj4kturW7TCIpr61qcYDLX2DhKoXyHYr8opEUfKer+ijyGgZdayKyysbvBSFc6NKemW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143293; c=relaxed/simple;
	bh=/5q+z5+yiW4DtT0I4+rloX4rxj2okc+9h00OS0n8j4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIdPLsYlKX8A3KlzLmc1oUTMqnJ9JwKA3+cifa172U8ofIbZBUMheAQXY0DcAH24uUOFVycacaYG/yIlgkS2DYZB4Qx6S2mJjUUFxklNC2idEopoPA1cs0ZTXeuJyKodR3CTsZKY4bnUf1MqconBcHh7RhujHb3jZ85G1CYMQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCDkYP6D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143292; x=1789679292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/5q+z5+yiW4DtT0I4+rloX4rxj2okc+9h00OS0n8j4A=;
  b=TCDkYP6Db9OhjjzVucjEG2miLkmCs9fCu45M0RClTUw6U1lPqW6q1aKJ
   u5GboSSG/QO5mPvoHDmdG+vnaRYWPHtQFI1M5G7NsqI7CugaJP0R/IMXx
   64w5w/AhB4Ka49Sc99+N4MUgOUEvHDKnFWH/xmsdT6T2iRm+IKw6kcQE2
   Qs919FVOC5gVTl7TIp5Z4Rg1VYnHa/dIm7VB0qx4EfcDV6JzN/Q4HjLW9
   5M+0q1uTxnTvxvbVErd/djBeoN9tEKfhXxaXQWCK5OpcIGwd//CIJVqki
   dJVVoq+WSBIthf3ihtzqZy711BQqrjc27IxAfXLFFzko+bnXMdA/AipXT
   g==;
X-CSE-ConnectionGUID: LF4axIthTCS50HOOzHXRug==
X-CSE-MsgGUID: jKC8tDYWTLyXQSC+phCylg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038202"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:11 -0700
X-CSE-ConnectionGUID: vH5Tck2lRDS9C/ZSLr1NEw==
X-CSE-MsgGUID: vBFdsCTATFm9E78EUf2YXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800187"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:10 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/6] Revert "usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running"
Date: Thu, 18 Sep 2025 00:07:20 +0300
Message-ID: <20250917210726.97100-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

This reverts commit 28a76fcc4c85dd39633fb96edb643c91820133e3.

No actual HW bugs are known where Endpoint Context shows Running state
but Stop Endpoint fails repeatedly with Context State Error and leaves
the endpoint state unchanged. Stop Endpoint retries on Running EPs have
been performed since early 2021 with no such issues reported so far.

Trying to handle this hypothetical case brings a more realistic danger:
if Stop Endpoint fails on an endpoint which hasn't yet started after a
doorbell ring and enough latency occurs before this completion event is
handled, the driver may time out and begin removing cancelled TDs from
a running endpoint, even though one more retry would stop it reliably.

Such high latency is rare but not impossible, and removing TDs from a
running endpoint can cause more damage than not giving back a cancelled
URB (which wasn't happening anyway). So err on the side of caution and
revert to the old policy of always retrying if the EP appears running.

[Remove stable tag as we are dealing with theoretical cases -Mathias]

Fixes: 28a76fcc4c85d ("usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f8f5aab109d..6309200e93dc 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1262,19 +1262,16 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			 * Stopped state, but it will soon change to Running.
 			 *
 			 * Assume this bug on unexpected Stop Endpoint failures.
-			 * Keep retrying until the EP starts and stops again.
+			 * Keep retrying until the EP starts and stops again, on
+			 * chips where this is known to help. Wait for 100ms.
 			 */
+			if (time_is_before_jiffies(ep->stop_time + msecs_to_jiffies(100)))
+				break;
 			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ctx_state %d\n",
 					GET_EP_CTX_STATE(ep_ctx));
-			/*
-			 * Don't retry forever if we guessed wrong or a defective HC never starts
-			 * the EP or says 'Running' but fails the command. We must give back TDs.
-			 */
-			if (time_is_before_jiffies(ep->stop_time + msecs_to_jiffies(100)))
-				break;
 
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command) {
-- 
2.43.0



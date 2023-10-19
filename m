Return-Path: <linux-usb+bounces-1914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A138C7CF54D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BFCD281FD3
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BAB18AF0;
	Thu, 19 Oct 2023 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0Bo2Lml"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D31DFF4
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE1D12A
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711316; x=1729247316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQoOchUdvFoITCqiVz39zKqJmrugtOuqtfYoFPQVAL8=;
  b=V0Bo2LmlcWQ3ZxRyKwidXy3U4VueEDoftViBQgX6H80CGvCSrPE6/Iyo
   EYE8DlmIVn3JU7Ltoy44r0vDGAB2GRN9Gqtl91N7VOk5+F8pamSy87Bdz
   R1o3nefrm/cSSPQbEdQFNwDWW4eO+L4t6/MrYUijd/eMDSkwVakV5D9+w
   0Uth2SUQ95BlYnxRsq3a6EukjJuB09/8+qHneiG91v1gMkg+akkBxs5Zm
   AFPQTvi+ZTFl3Hxy0z81tswJz9N+G5A75qzupz7ozF0pTLy9/44mTV9d2
   re2SB4dEVXvheZdZe/tF7IRQgAEb708nHwYtmmDuTqjXkz2PbUGRLZbKo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075987"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075987"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557928"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557928"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:34 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 19/19] usb: host: xhci: Avoid XHCI resume delay if SSUSB device is not present
Date: Thu, 19 Oct 2023 13:29:24 +0300
Message-Id: <20231019102924.2797346-20-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wesley Cheng <quic_wcheng@quicinc.com>

There is a 120ms delay implemented for allowing the XHCI host controller to
detect a U3 wakeup pulse.  The intention is to wait for the device to retry
the wakeup event if the USB3 PORTSC doesn't reflect the RESUME link status
by the time it is checked.  As per the USB3 specification:

  tU3WakeupRetryDelay ("Table 7-12. LTSSM State Transition Timeouts")

This would allow the XHCI resume sequence to determine if the root hub
needs to be also resumed.  However, in case there is no device connected,
or if there is only a HSUSB device connected, this delay would still affect
the overall resume timing.

Since this delay is solely for detecting U3 wake events (USB3 specific)
then ignore this delay for the disconnected case and the HSUSB connected
only case.

[skip helper function, rename usb3_connected variable -Mathias ]

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 119cbe2a3d65..884b0898d9c9 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -992,6 +992,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 	int			retval = 0;
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
+	bool			suspended_usb3_devs = false;
 	bool			reinit_xhc = false;
 
 	if (!hcd->state)
@@ -1139,10 +1140,17 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 		/*
 		 * Resume roothubs only if there are pending events.
 		 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
-		 * the first wake signalling failed, give it that chance.
+		 * the first wake signalling failed, give it that chance if
+		 * there are suspended USB 3 devices.
 		 */
+		if (xhci->usb3_rhub.bus_state.suspended_ports ||
+		    xhci->usb3_rhub.bus_state.bus_suspended)
+			suspended_usb3_devs = true;
+
 		pending_portevent = xhci_pending_portevent(xhci);
-		if (!pending_portevent && msg.event == PM_EVENT_AUTO_RESUME) {
+
+		if (suspended_usb3_devs && !pending_portevent &&
+		    msg.event == PM_EVENT_AUTO_RESUME) {
 			msleep(120);
 			pending_portevent = xhci_pending_portevent(xhci);
 		}
-- 
2.25.1



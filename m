Return-Path: <linux-usb+bounces-2652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56A7E4CE2
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 00:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA04B281169
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 23:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452CA34546;
	Tue,  7 Nov 2023 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqiHDXk5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F07834540
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 23:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C39C433C8;
	Tue,  7 Nov 2023 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399443;
	bh=spoou1fQGxcmL1A5+u2uQy123FFjHiyb6mxfu4lt4q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gqiHDXk5pZAE0ujAe1KGNsu+qUtz2M2LCfAEZT+SCC7LvcvcDskDtAGn5cG0aeFck
	 a0FBBQGOjcR4NNfM6chFYFd9mH5g6Zn5/Wvs/TpNG+Q7NFzEXqytkYm8A5+kzBJ2Lh
	 D6XjyENCZApGEzPdK5LYSHXKwtAybaOtWuYf00d0TIkNRYQLl/jteM6j2ntk7TE4xy
	 lef85NLJX+IxSIpQd/C1caI82dJPFOzMNRu1KKuv+PpvepAXHR/3A30wgW++mHY1/H
	 aGXWISYvzeL9zYjzS8KxPxKhy1RcxvdEjq8F0RlQe2HU4OlMuXeXDm6HfgA3qMVSxH
	 nSZj+I/wWH4Hg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 15/18] usb: host: xhci: Avoid XHCI resume delay if SSUSB device is not present
Date: Tue,  7 Nov 2023 18:23:10 -0500
Message-ID: <20231107232330.3776001-15-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: Wesley Cheng <quic_wcheng@quicinc.com>

[ Upstream commit 6add6dd345cb754ce18ff992c7264cabf31e59f6 ]

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
Link: https://lore.kernel.org/r/20231019102924.2797346-20-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xhci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fae994f679d45..82aab2f9adbb8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -968,6 +968,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 	int			retval = 0;
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
+	bool			suspended_usb3_devs = false;
 	bool			reinit_xhc = false;
 
 	if (!hcd->state)
@@ -1115,10 +1116,17 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
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
2.42.0



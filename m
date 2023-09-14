Return-Path: <linux-usb+bounces-33-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381F79FFF2
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 11:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A43DDB20B75
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 09:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEE820B36;
	Thu, 14 Sep 2023 09:26:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294A101D5
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 09:26:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377B0BB
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694683581; x=1726219581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uubMJJ6PQ3sJK+4F09w/iSHkauFGFpyf4Za+/r9St6s=;
  b=UbWAAqD0BBTb7vq+HN+49vffKyalOdaUNWSDBS/De8fj4RuO7XO2bbcY
   5xUvfjM+kBmyPhJ2CTgdqJ/rOHVaJzSYs5yCxqV4CL/rBErUsSJxKQR6D
   UCM6kQ1iWQqA9AXEg4e03AAx8jmecSXXJQPhkXu9hC/WfZ10Tc3F0mF2n
   MCK4WFolE7kgmziJy7oFwXkW21JHFWO2my8QoVlxT5tI9AGGHo91/YVEo
   ezxU4chTD8AbzqAE4ho8puLkQbg3qI9ypiraATC+FC1wbi9iGLc1N3Fdo
   zUHJ+4xcPA/RFMLif0RLHckJIwedRSCQvJmYk60Pmytkhc0ob3T/ZTqWm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358327644"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="358327644"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 02:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="737861979"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="737861979"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 14 Sep 2023 02:26:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: quic_wcheng@quicinc.com
Cc: quic_jackp@quicinc.com,
	linux-usb@vger.kernel.org,
	<gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] xhci: track port suspend state correctly in unsuccessful resume cases
Date: Thu, 14 Sep 2023 12:27:24 +0300
Message-Id: <20230914092724.1469813-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <291f2270-5afc-7570-91cd-049c590b704f@quicinc.com>
References: <291f2270-5afc-7570-91cd-049c590b704f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci-hub.c tracks suspended ports in a suspended_port bitfield.
This is checked when responding to a Get_Status(PORT) request to see if a
port in running U0 state was recently resumed, and adds the required
USB_PORT_STAT_C_SUSPEND change bit in those cases.

The suspended_port bit was left uncleared if a device is disconnected
during suspend. The bit remained set even when a new device was connected
and enumerated. The set bit resulted in a incorrect Get_Status(PORT)
response with a bogus USB_PORT_STAT_C_SUSPEND change
bit set once the new device reached U0 link state.

USB_PORT_STAT_C_SUSPEND change bit is only used for USB2 ports, but
xhci-hub keeps track of both USB2 and USB3 suspended ports.

Reported-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 0054d02239e2..0df5d807a77e 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1062,19 +1062,19 @@ static void xhci_get_usb3_port_status(struct xhci_port *port, u32 *status,
 		*status |= USB_PORT_STAT_C_CONFIG_ERROR << 16;
 
 	/* USB3 specific wPortStatus bits */
-	if (portsc & PORT_POWER) {
+	if (portsc & PORT_POWER)
 		*status |= USB_SS_PORT_STAT_POWER;
-		/* link state handling */
-		if (link_state == XDEV_U0)
-			bus_state->suspended_ports &= ~(1 << portnum);
-	}
 
-	/* remote wake resume signaling complete */
-	if (bus_state->port_remote_wakeup & (1 << portnum) &&
+	/* no longer suspended or resuming */
+	if (link_state != XDEV_U3 &&
 	    link_state != XDEV_RESUME &&
 	    link_state != XDEV_RECOVERY) {
-		bus_state->port_remote_wakeup &= ~(1 << portnum);
-		usb_hcd_end_port_resume(&hcd->self, portnum);
+		/* remote wake resume signaling complete */
+		if (bus_state->port_remote_wakeup & (1 << portnum)) {
+			bus_state->port_remote_wakeup &= ~(1 << portnum);
+			usb_hcd_end_port_resume(&hcd->self, portnum);
+		}
+		bus_state->suspended_ports &= ~(1 << portnum);
 	}
 
 	xhci_hub_report_usb3_link_state(xhci, status, portsc);
@@ -1131,6 +1131,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 			usb_hcd_end_port_resume(&port->rhub->hcd->self, portnum);
 		}
 		port->rexit_active = 0;
+		bus_state->suspended_ports &= ~(1 << portnum);
 	}
 }
 
-- 
2.25.1



Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C0B30B5FA
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhBBDnb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:43:31 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36102 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229621AbhBBDn2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:28 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E6EEC008C;
        Tue,  2 Feb 2021 03:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237348; bh=mzYoA3OuE9tA+wg/ep4FQSq0uQq2/R8W58LnupIYsss=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=F4SK1670PcFzKJAJ8VkKw/yIeX7QfxoKgMWM8coLP/DX4267qlLqPYEgW1yGj6QcY
         xFC7v1ZaC1GMSQDHx1eA+y2U+1NMsz4wVMFXoXqYSCsWgIa54bm70nZog4HlISjl6F
         QDymRwtfeGdNS7RQsKZNjEHefyICWpbLgOYQbn34rozC07WCk2CcU+YzdpuAWcNrdY
         JnXxUMnPUewNVxJ1HDIXmY1DX0aptnTNDgGcQ+AQJxTSnfnQoIJU/adTj0keynRnPG
         uuRDsLJtwFyYiwv248O738/rUrZbL8KpzIUabBB1QyVTYUpYO4uUbyulhM2sx8k8SU
         jH7SZdPCCLrcg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0D8E2A007C;
        Tue,  2 Feb 2021 03:42:27 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:27 -0800
Date:   Mon, 01 Feb 2021 19:42:27 -0800
Message-Id: <6b8c24bdb10552ae8029b4b2828ba3a1c6e57dac.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 2/8] usb: core: hub: Remove port_speed_is_ssp()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The get_port_ssp_rate() can replace port_speed_is_ssp(). If the port
speed is detected to be in gen2x1, gen1x2, or gen2x2, then the port is
operating at SuperSpeed Plus.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/core/hub.c | 31 +------------------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index e78b2dd7801a..823470607d58 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2744,33 +2744,6 @@ static enum usb_ssp_rate get_port_ssp_rate(struct usb_device *hdev,
 	return USB_SSP_GEN_UNKNOWN;
 }
 
-/*
- * Return 1 if port speed is SuperSpeedPlus, 0 otherwise
- * check it from the link protocol field of the current speed ID attribute.
- * current speed ID is got from ext port status request. Sublink speed attribute
- * table is returned with the hub BOS SSP device capability descriptor
- */
-static int port_speed_is_ssp(struct usb_device *hdev, int speed_id)
-{
-	int ssa_count;
-	u32 ss_attr;
-	int i;
-	struct usb_ssp_cap_descriptor *ssp_cap = hdev->bos->ssp_cap;
-
-	if (!ssp_cap)
-		return 0;
-
-	ssa_count = le32_to_cpu(ssp_cap->bmAttributes) &
-		USB_SSP_SUBLINK_SPEED_ATTRIBS;
-
-	for (i = 0; i <= ssa_count; i++) {
-		ss_attr = le32_to_cpu(ssp_cap->bmSublinkSpeedAttr[i]);
-		if (speed_id == (ss_attr & USB_SSP_SUBLINK_SPEED_SSID))
-			return !!(ss_attr & USB_SSP_SUBLINK_SPEED_LP);
-	}
-	return 0;
-}
-
 /* Returns 1 if @hub is a WUSB root hub, 0 otherwise */
 static unsigned hub_is_wusb(struct usb_hub *hub)
 {
@@ -2934,9 +2907,7 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
 	}
 	if (hub_is_wusb(hub))
 		udev->speed = USB_SPEED_WIRELESS;
-	else if (hub_is_superspeedplus(hub->hdev) &&
-		 port_speed_is_ssp(hub->hdev, ext_portstatus &
-				   USB_EXT_PORT_STAT_RX_SPEED_ID))
+	else if (udev->ssp_rate != USB_SSP_GEN_UNKNOWN)
 		udev->speed = USB_SPEED_SUPER_PLUS;
 	else if (hub_is_superspeed(hub->hdev))
 		udev->speed = USB_SPEED_SUPER;
-- 
2.28.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9508C30EB72
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhBDELo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:11:44 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43654 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhBDELn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:11:43 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A0CF4066B;
        Thu,  4 Feb 2021 04:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612411843; bh=guQ/YD9BQxqyIX/WXBgRDLa4vTmH9055SsA93yHRDLk=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=RXb/LssIQ7wlg80gpSkiwENFMfj0vZGFHi35g0Ck5ugGJwE7HBAwnJwYZeSLzeimc
         DXJGb0bl1VZafozjemIUyUu2P1IkWVGZCfQhWL4QX1M8us5C9WcSS2BNkzWZz31Fdy
         XRUYiHIM5bOA9Dhkmi0uNu5QGWBUfHN0MBIfeEXR0p3sOQj4gC/6N4CkdStaJOtgUO
         5XXlnCktuSrWKi450S1GDymNIlzMamnrNBqxtYO4cYdtJmkxaPSstzl8wAFlitYgNd
         AqweI6dzI9A5/jUaEfoNxEty5tE59+UmsZP81cnZC/WZTDN/5Kf/cCZItKVj+9ErU5
         Yf16iqJW0sElQ==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 69C20A006F;
        Thu,  4 Feb 2021 04:10:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:10:41 -0800
Date:   Wed, 03 Feb 2021 20:10:41 -0800
Message-Id: <bdcf64decc6fef34feda9c0cbf370cbc0284b719.1612410491.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/8] usb: core: hub: Remove port_speed_is_ssp()
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
 Changes in v2:
 - None

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


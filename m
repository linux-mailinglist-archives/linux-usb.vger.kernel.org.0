Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9D2222E44
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgGPV6v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:58:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45396 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726201AbgGPV6v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:58:51 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D63EEC03D2;
        Thu, 16 Jul 2020 21:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936730; bh=JhVSUI4P0dPupPmwf9vt8wUoXqVGCGOuYZTTZ1bRYDk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=B7DIpUyrJppxpUvSm2mhmJpond27g8pbE54LlMQGEZ1uF6LE/KHdW5AfcDd/j1ZTE
         hJf5gpd+a1frEOMbyg6tBeAE6GDTwd7ARn0JRNU/ibPB8RiWfCbVYddEnyrdhRtbwy
         A5SSFEqrjYm48MO2WnSfXybAbbthhbUsXFzRChZe0h8GCq8Qbg0X8YBeWfkWpIhp7b
         iYveq4cHDHZBHMKSVasThw5KoaH4bt7gVusGSWNaJNIhZzGrL+lNrtmQavs8H0J5EY
         On6vAKhNr7FsQqBcQj+F4m5TsIkVr310QPbcmTuZpfOUFk3KK9OD/lAl/kiNHdaRUp
         PYcl49rE62Hgg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A5B65A022C;
        Thu, 16 Jul 2020 21:58:49 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:58:49 -0700
Date:   Thu, 16 Jul 2020 14:58:49 -0700
Message-Id: <7cb319578d430c35783d8d3f64ae1c1fa883ddb4.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 03/11] usb: gadget: Expose sublink speed attributes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB 3.2 specification supports dual-lane and different transfer
rates for super-speed-plus. Devices operating in super-speed-plus can
be gen2x1, gen1x2, or gen2x2.

A gadget driver may need to know the gadget's sublink speeds to properly
setup its transfer requests and describe its capability in its
descriptors. To describe the transfer rate in super-speed-plus fully,
let's expose the lane count and sublink speed attributes when operating
in super-speed-plus.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 include/linux/usb/gadget.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 6a178177e4c9..2ab929eed928 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -338,6 +338,15 @@ struct usb_gadget_ops {
  * @speed: Speed of current connection to USB host.
  * @max_speed: Maximal speed the UDC can handle.  UDC must support this
  *      and all slower speeds.
+ * @num_lanes: Number of lanes in use.
+ * @max_num_lanes: Maximum number of lanes the UDC supports.
+ * @ssac: Sublink speed attribute count. The number of sublink speed
+ *	attributes is ssac + 1.
+ * @sublink_speed: Array of sublink speed attributes the UDC supports. Sublink
+ *	speed attributes are paired, and an RX followed by a TX attribute.
+ * @speed_ssid: Current sublink speed attribute ID in use.
+ * @min_speed_ssid: Sublink speed attribute ID with the minimum speed.
+ * @max_speed_ssid: Sublink speed attribute ID with the maximum speed.
  * @state: the state we are now (attached, suspended, configured, etc)
  * @name: Identifies the controller hardware type.  Used in diagnostics
  *	and sometimes configuration.
@@ -405,6 +414,17 @@ struct usb_gadget {
 	struct list_head		ep_list;	/* of usb_ep */
 	enum usb_device_speed		speed;
 	enum usb_device_speed		max_speed;
+
+	/* SSP only */
+	unsigned			num_lanes;
+	unsigned			max_num_lanes;
+	unsigned			ssac;
+#define USB_GADGET_MAX_SSAC 3
+	struct usb_sublink_speed	sublink_speed[USB_GADGET_MAX_SSAC + 1];
+	unsigned			speed_ssid;
+	unsigned			min_speed_ssid;
+	unsigned			max_speed_ssid;
+
 	enum usb_device_state		state;
 	const char			*name;
 	struct device			dev;
-- 
2.11.0


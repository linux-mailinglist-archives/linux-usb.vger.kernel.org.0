Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58A822A51B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 04:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387744AbgGWCMW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 22:12:22 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34900 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCMW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 22:12:22 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 33167C0086;
        Thu, 23 Jul 2020 02:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470342; bh=8T8xqGrW4BMn3q3RIGcfSf9fegmHzZ9Lpul9Gyr55Eg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=gm4EW48eCR/7ueNhdwGAPfWWl2QLU+dtqUhdA36uG5ZBYclzK//ihL3C0/f7OvzCK
         QvK1bnJxXXiOMgiPPGefrDus+9CWa4H9CTFzEu1ObqFqv0r0dP71U1I8Whc5nHi3Ix
         mCpgRC1xCqQnKjgoW1dNWMQuFUoFc7kDgtWQcr4zVKdz7nBoZToeKuerMLdyuIS0XN
         TwWjO/4p5cVBJ27tbbeZ7XNBosf/r3rsbsCvsvxG1aDWcbB/CGHJDepT7I90QAYDlZ
         +rBTeQaI3ZXcESYJBj99rEbuGB2iAJjTx7TsVUgw2rVV27AXLjt0WFHd67PHxxQGiu
         TjdSuKKjWeYSA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 02F0DA009A;
        Thu, 23 Jul 2020 02:12:21 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:12:20 -0700
Date:   Wed, 22 Jul 2020 19:12:20 -0700
Message-Id: <ebd3be6051371f3cc217504a866bf5fb412a3dbe.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 03/12] usb: gadget: Expose sublink speed attributes
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
 Changes in v2:
 - None

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


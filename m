Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF46277E12
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIYCmD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:03 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49582 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726990AbgIYCmD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:03 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B27D2C0A93;
        Fri, 25 Sep 2020 02:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001722; bh=77dUfacIhRN8HDEa/BFL/KRuRVFdCOUodZT/srfGE1s=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=TmH8f4hmxh0ID/5B5DfVQNdzPVBGvbZ4X5hHm3xNDXr5L0itsezF9MAnrN6WI2HCH
         DVW01zK1x9yrIYgvTxI++byBnGkdjSD2UOFLmEijlG/3oUebX/rA7IhfNEQx/tcXCP
         XqFd1fes5hnYLDy4ozGpI3MqfZnDHmWtgi3vkswy7Eg1m0HTiZlgj2wtMPj5VX07ms
         VKbIJlPGCK735AJypJG0PQHiJbaCLSNBRuGHfvz26UfudX9eu1Swd72MVIMB5RGFH2
         6HUOpROjWNH6UvQqObF/YFvD1bm+g/nzHNtSc0wLy4v3DvH7Jyf/bDh1XSjPlbQx5g
         8EAreieTc9Q1Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 82DF4A0072;
        Fri, 25 Sep 2020 02:42:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:01 -0700
Date:   Thu, 24 Sep 2020 19:42:01 -0700
Message-Id: <ca985984991f471acdf4be4e99bce8eb2820d9e6.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 03/12] usb: gadget: Expose sublink speed attributes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
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

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- Change unsigned fields to unsigned int
Changes in v3:
- None
Changes in v2:
- None

 include/linux/usb/gadget.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index e7351d64f11f..cd9433f5a602 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -339,6 +339,15 @@ struct usb_gadget_ops {
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
@@ -406,6 +415,17 @@ struct usb_gadget {
 	struct list_head		ep_list;	/* of usb_ep */
 	enum usb_device_speed		speed;
 	enum usb_device_speed		max_speed;
+
+	/* SSP only */
+	unsigned int			num_lanes;
+	unsigned int			max_num_lanes;
+	unsigned int			ssac;
+#define USB_GADGET_MAX_SSAC 3
+	struct usb_sublink_speed	sublink_speed[USB_GADGET_MAX_SSAC + 1];
+	unsigned int			speed_ssid;
+	unsigned int			min_speed_ssid;
+	unsigned int			max_speed_ssid;
+
 	enum usb_device_state		state;
 	const char			*name;
 	struct device			dev;
-- 
2.28.0


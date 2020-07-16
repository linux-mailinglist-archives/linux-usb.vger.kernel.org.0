Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843EC222E40
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgGPV6j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:58:39 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45384 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726007AbgGPV6j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:58:39 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 538CCC0446;
        Thu, 16 Jul 2020 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936718; bh=dnHNiYs8zH+83BgaxZg3b1MKrwJcrshVY5E2h79a9ng=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Omr4gQqNalA0UpROew8T2m9ED9rC/s+jXiGIbdHHB4dGuD+GPXPZroZzt8fPmo/oi
         zpdLOseybQorwCbQw+7bbxv0GgNSIl9AW1AE7OJybrBdsfjdy4SgPh32nn/gw0lgrG
         2WLayr+62Osd3x72Tnt+y/+XmO2F7k1eY8ak/c+lTjT/l4Hc7AJwwTa/cBzfSSyptS
         FQuAwHSvYQYaSdX3Q4vUv6X+9GWgAb2TPy9A3KoYpxBs41p1spVluYjag3OzG8/1Br
         qF2gvepx3i5/Us1Q/5qRaM65oVkO/NGqrwgtrkgZ5FGYvTnQaAPCaqtaa8dP0gqj4E
         w6A/XoDEXonVg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 908D2A00A9;
        Thu, 16 Jul 2020 21:58:36 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:58:36 -0700
Date:   Thu, 16 Jul 2020 14:58:36 -0700
Message-Id: <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 01/11] usb: ch9: Add sublink speed struct
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB 3.2 specification supports dual-lane for super-speed-plus. USB
devices may operate at different sublink speeds. To avoid using magic
numbers and capture the sublink speed better, introduce the
usb_sublink_speed structure and various sublink speed attribute enum.

See SSP BOS descriptor in USB 3.2 specification section 9.6.2.5

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 include/uapi/linux/usb/ch9.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 2b623f36af6b..d4fd403a3664 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -1145,6 +1145,48 @@ enum usb_device_speed {
 	USB_SPEED_SUPER_PLUS,			/* usb 3.1 */
 };
 
+/* USB 3.2 sublink speed attributes */
+
+enum usb_lane_speed_exponent {
+	USB_LSE_BPS = 0,
+	USB_LSE_KBPS = 1,
+	USB_LSE_MBPS = 2,
+	USB_LSE_GBPS = 3,
+};
+
+enum usb_sublink_type {
+	USB_ST_SYMMETRIC_RX = 0,
+	USB_ST_ASYMMETRIC_RX = 1,
+	USB_ST_SYMMETRIC_TX = 2,
+	USB_ST_ASYMMETRIC_TX = 3,
+};
+
+enum usb_link_protocol {
+	USB_LP_SS = 0,
+	USB_LP_SSP = 1,
+};
+
+/**
+ * struct usb_sublink_speed - sublink speed attribute
+ * @id: sublink speed attribute ID (SSID)
+ * @mantissa: lane speed mantissa
+ * @exponent: lane speed exponent
+ * @sublink type: sublink type
+ * @protocol: sublink protocol
+ *
+ * Super-speed-plus supports multiple lanes. Use the sublink speed attributes to
+ * describe the sublink speed.
+ *
+ * See USB 3.2 spec section 9.6.2.6 for super-speed-plus capability for more
+ * information.
+ */
+struct usb_sublink_speed {
+	u8				id;
+	u16				mantissa;
+	enum usb_lane_speed_exponent	exponent;
+	enum usb_sublink_type		type;
+	enum usb_link_protocol		protocol;
+};
 
 enum usb_device_state {
 	/* NOTATTACHED isn't in the USB spec, and this state acts
-- 
2.11.0


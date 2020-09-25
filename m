Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575E8277E0E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgIYClv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:41:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49576 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726676AbgIYClv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:41:51 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B098DC0A93;
        Fri, 25 Sep 2020 02:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001710; bh=M+AmUbNU7VbWo3dsrgXe6QQWS3ueocNRiQDwfiq0WLE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=hN6DhMb7Co/fTjPbaVDTV1M7lA/4W8sQmNYVLJdGHfuz7l27E8TqYks6oTZwoJ3C5
         bqjOy7sz7IfQLmeqyjBy55AJiRrI9sB5nKGHhtIZa2KiG0e4gA3gf4R6CCgS1rVL7Z
         BfiZqPJko8oIyZQHjrNX76xusWmN/SoJHnvL1KsYquF0yRPH5HI0IXlbbsQzWmsy4Y
         6E5Zza9WJo+pKrNLBlO8/GO7ORNfHBjV3xZpNQlFuGmPGHniZfnlrqV+UJttZW1Uui
         3+kzj+PaVXDVTzL7m6EFQY2/CcuKHowd7dEAllJkGCzRIqnxn8kq/zsI8+FxYH+y9M
         Gp4WKn3syKSzA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2DD91A01F2;
        Fri, 25 Sep 2020 02:41:49 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:41:49 -0700
Date:   Thu, 24 Sep 2020 19:41:49 -0700
Message-Id: <069433c7c7dc08220cc4a4a2154cf36c57b411af.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 01/12] usb: ch9: Add sublink speed struct
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB 3.2 specification supports dual-lane for super-speed-plus. USB
devices may operate at different sublink speeds. To avoid using magic
numbers and capture the sublink speed better, introduce the
usb_sublink_speed structure and various sublink speed attribute enum.

See SSP BOS descriptor in USB 3.2 specification section 9.6.2.5

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- Move to include/linux/usb/ch9.h instead of under uapi

 include/linux/usb/ch9.h | 43 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 604c6c514a50..01191649a0ad 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -36,6 +36,49 @@
 #include <linux/device.h>
 #include <uapi/linux/usb/ch9.h>
 
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
+ * @type: sublink type
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
+
 /**
  * usb_ep_type_string() - Returns human readable-name of the endpoint type.
  * @ep_type: The endpoint type to return human-readable name for.  If it's not
-- 
2.28.0


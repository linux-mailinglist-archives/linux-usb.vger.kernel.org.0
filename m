Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEC422D246
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgGXXif (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:38:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52786 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726552AbgGXXif (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:38:35 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3EEBB4016D;
        Fri, 24 Jul 2020 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633915; bh=RIqbNtUTmWGowsa6DyoYrPDkkEtSkQm/US/pCJGPOII=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=cEvbU1hCYmYaFhOQmydzPInk+CVVmI7xvFyrTJha72w3lou7OsbnPMryOhLvZAsCO
         592n121vO0xm7zCauU+VJhRdeeIz7SQe5jhxjnPQIUdlJptgWwpHRbNp2enHqCg9Of
         m6cUb3P+9bgOK5yZQ+WrnLDMVehz8qj09K+mPaY0U/Z11TlpvMo4APXr1gz4peXPVn
         01cJQ4YlrUdQzaNPS3BJKQWQ4qgHSLPvOzyDZAzQf5BSsVXxkJPRIm0MJQTGtvIFqp
         r92hx89OkTJHXKq3cFvY1hagKuv5tcyqNCymIssEr+6bs+BWSMdg+VhvcVPodjOvcb
         Rjzpw/7bN3c+A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E6BDCA009A;
        Fri, 24 Jul 2020 23:38:33 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:38:33 -0700
Date:   Fri, 24 Jul 2020 16:38:33 -0700
Message-Id: <5f8678d0ea2be09137b28914a3bd757f034a9fa6.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 01/12] usb: ch9: Add sublink speed struct
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
Changes in v3:
- None
Changes in v2:
- Move to include/linux/usb/ch9.h instead of under uapi

 include/linux/usb/ch9.h | 43 +++++++++++++++++++++++++++++++++++++++++++
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
2.11.0


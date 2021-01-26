Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D53C303853
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 09:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390232AbhAZIsY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 03:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390547AbhAZIr3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 03:47:29 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AF0C061793
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 00:46:01 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id z8so8848489qva.23
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 00:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=13RTRRkuJBA1iS7bzOjv8CDTQaS3ruEs+RukYe640Ag=;
        b=ltdXf/8CWegN4aNEm3Qv64DdKvxQ6NjblvbaRNZOQKTRepQsCCU5pE3q3qDttLI5Hc
         Bi8armxZm1149Vgs6y2mmLKfa7BjfScoc/3mQGL6n3/tgl9kODx5vLL9ZTMvsLaFevy/
         zwUTH0y3WjW7Dpa/ZThusgOQFXsEOlDULmL80l00NucCVqixWx1/HWRjblTxSjwhkSnt
         pl6aEb7cEmL/xWeJwHSzXmTMvFbLpzaD/PLxHeCcjVsnZImyU9gAevj0xUxdQEyOTm0y
         SzGgYa9lhr9cKZiT79jxlYKIQZFXgs+cu5xnsgrtZoW3sbNq4W/4vx/ssNZ164/Tinw0
         3f/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=13RTRRkuJBA1iS7bzOjv8CDTQaS3ruEs+RukYe640Ag=;
        b=kjIkaWiD3+vuXAjf1NlbitdQ3esd4w+qbKj204SAdyLFgSHqsZrSmApaBuE/KMssoV
         AA2ikVOpA50YMpaJtkYtM9uxvX7/4+keFuj+a0gO+YM7HF0JhwgjEne8x2BhUcm0tkVZ
         9CGTkRnoTHVrVDlSwVpT2IvRpcQObxHZmQHL1OhMsYQ0Ro7Tw+zEpz/tLgV4uHA65wD3
         tI/SnBrtIClpxGHShRVzexBFlIM4dbA45yId1yD8v0hAgAuJDGSnHAb6YCQIiLqlRoS0
         dfVL1BMQ/2og+qUCr8MvoAFhnm1bQSH+gLn333dfKQE9toEUXHy6XDc70zFVlzN2ilYg
         zzdw==
X-Gm-Message-State: AOAM530oPc+em7gDnaPCtO+4SQ0L/C1Ywmh/GbZE1sQLgI3m7RXdHLGp
        peUYMKPQEnyI8TjBV7XK+gqg1ZLKse5L
X-Google-Smtp-Source: ABdhPJwzo95+gApcUFFb4G8JVDYACZBRI9FkC+KW93AO8mtcr584+2UBXFHEMh5J5ITd+wqZt3a63Fu3yDub
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:4430:c29c:1e76:3e65])
 (user=kyletso job=sendgmr) by 2002:a0c:a8e0:: with SMTP id
 h32mr4572012qvc.30.1611650761077; Tue, 26 Jan 2021 00:46:01 -0800 (PST)
Date:   Tue, 26 Jan 2021 16:45:43 +0800
In-Reply-To: <20210126084544.682641-1-kyletso@google.com>
Message-Id: <20210126084544.682641-3-kyletso@google.com>
Mime-Version: 1.0
References: <20210126084544.682641-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 2/3] dt-bindings: connector: Add SVDM VDO properties
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        hdegoede@redhat.com, badhri@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add bindings of VDO properties of USB PD SVDM so that they can be
defined in device tree.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 include/dt-bindings/usb/pd.h | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 0352893697f0..b99cb4a0cd12 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -93,4 +93,55 @@
 #define FRS_DEFAULT_POWER      1
 #define FRS_5V_1P5A            2
 #define FRS_5V_3A              3
- #endif /* __DT_POWER_DELIVERY_H */
+
+/*
+ * SVDM Identity Header
+ * --------------------
+ * <31>     :: data capable as a USB host
+ * <30>     :: data capable as a USB device
+ * <29:27>  :: product type (UFP / Cable / VPD)
+ * <26>     :: modal operation supported (1b == yes)
+ * <25:23>  :: product type (DFP) (SVDM version 2.0+ only; set to zero in version 1.0)
+ * <22:21>  :: connector type (SVDM version 2.0+ only; set to zero in version 1.0)
+ * <20:16>  :: Reserved, Shall be set to zero
+ * <15:0>   :: USB-IF assigned VID for this cable vendor
+ */
+/* SOP Product Type (UFP) */
+#define IDH_PTYPE_NOT_UFP       0
+#define IDH_PTYPE_HUB           1
+#define IDH_PTYPE_PERIPH        2
+#define IDH_PTYPE_PSD           3
+#define IDH_PTYPE_AMA           5
+
+/* SOP' Product Type (Cable Plug / VPD) */
+#define IDH_PTYPE_NOT_CABLE     0
+#define IDH_PTYPE_PCABLE        3
+#define IDH_PTYPE_ACABLE        4
+#define IDH_PTYPE_VPD           6
+
+/* SOP Product Type (DFP) */
+#define IDH_PTYPE_NOT_DFP       0
+#define IDH_PTYPE_DFP_HUB       1
+#define IDH_PTYPE_DFP_HOST      2
+#define IDH_PTYPE_DFP_PB        3
+
+#define VDO_IDH(usbh, usbd, ufp_cable, is_modal, dfp, conn, vid)                \
+	((usbh) << 31 | (usbd) << 30 | ((ufp_cable) & 0x7) << 27                \
+	 | (is_modal) << 26 | ((dfp) & 0x7) << 23 | ((conn) & 0x3) << 21        \
+	 | ((vid) & 0xffff))
+
+/*
+ * Cert Stat VDO
+ * -------------
+ * <31:0>  : USB-IF assigned XID for this cable
+ */
+#define VDO_CERT(xid)		((xid) & 0xffffffff)
+
+/*
+ * Product VDO
+ * -----------
+ * <31:16> : USB Product ID
+ * <15:0>  : USB bcdDevice
+ */
+#define VDO_PRODUCT(pid, bcd)   (((pid) & 0xffff) << 16 | ((bcd) & 0xffff))
+#endif /* __DT_POWER_DELIVERY_H */
-- 
2.30.0.280.ga3ce27912f-goog


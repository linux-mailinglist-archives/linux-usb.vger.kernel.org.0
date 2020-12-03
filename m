Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3092CCD0C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 04:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbgLCDKN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 22:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgLCDKM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Dec 2020 22:10:12 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92333C061A4F
        for <linux-usb@vger.kernel.org>; Wed,  2 Dec 2020 19:09:32 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id z12so316041pjn.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Dec 2020 19:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HPjMiZ7r2vmNOesKbXHx10R/RkIYQVQPBYwT6NlQG0=;
        b=HYvUEoGI49+MPUkaFo90T8oSv8t7B1B2PHAwPzjXWy8nnUV00Ioup69H2B2Vnt4yaG
         EUON+5/nB36QJdMsrhFNnr47nFjhPBpBrrsEtK7Q3Nw6Uenez408SBlRqp5lrChHC4Ot
         n6yjmD0hXKg0UzAfOetXQoVKoJ3Pl/DBY68hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HPjMiZ7r2vmNOesKbXHx10R/RkIYQVQPBYwT6NlQG0=;
        b=EJrYHEDPwdoe1GB2RK590lakLV+m66wLhzs11tdbl6632R++wjDkFsXWZeCov6n477
         0Xc/TfssZi25warMF8U2QNKY6YUTY0M7hyI5t0MNnHfLChEC+UohaK7idH6Okm/vpOIZ
         K/elcOI3I2chV7yZQELPXcDR7GXWW7igMiT8COH4XUjFrDDj82FcO3jOcht2bfXG9uiS
         W1s+Zf2t1KI/znNbXqxyhPx3JB84BmnRPRP518LsCvoYApDICuMWcrWlgKbGpixUUl1p
         IEExucArp2K1Yd6j+ajX8Wln3MW1QrG3BEr5xpBK+QG2SjyJWs80zJSrVklONdQ1/bWg
         U2Sw==
X-Gm-Message-State: AOAM532Qp8nbtAlV6jmcz1omdY5XVyYETjOtaNyYN3SaNjXd2r8utlHd
        q7X4fmXYYlwev05nHSW0TMc0mOR1KtoBxQ==
X-Google-Smtp-Source: ABdhPJzs72jPCb9LAJ1dMuGsiqN51JYGYYwg3t/CRgNmlP43eFWmRBSPNyHjGxY6tO1qMFv17oK6RA==
X-Received: by 2002:a17:90a:9f98:: with SMTP id o24mr1032229pjp.207.1606964971450;
        Wed, 02 Dec 2020 19:09:31 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id 14sm437080pfz.54.2020.12.02.19.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 19:09:30 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: typec: Add bus type for plug alt modes
Date:   Wed,  2 Dec 2020 19:08:47 -0800
Message-Id: <20201203030846.51669-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the Type C bus for plug alternate modes which are being
registered via the Type C connector class. This ensures that udev events
get generated when plug alternate modes are registered (and not just for
partner/port alternate modes), even though the Type C bus doesn't link
plug alternate mode devices to alternate mode drivers.

Update the Type C bus documentation to mention that there
are alternate mode devices for plugs as well.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/driver-api/usb/typec_bus.rst | 6 +++---
 drivers/usb/typec/class.c                  | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/usb/typec_bus.rst b/Documentation/driver-api/usb/typec_bus.rst
index 21c890ae17e5..7874d2f37d9f 100644
--- a/Documentation/driver-api/usb/typec_bus.rst
+++ b/Documentation/driver-api/usb/typec_bus.rst
@@ -15,9 +15,9 @@ modes by using the SVID and the mode number.
 
 :ref:`USB Type-C Connector Class <typec>` provides a device for every alternate
 mode a port supports, and separate device for every alternate mode the partner
-supports. The drivers for the alternate modes are bound to the partner alternate
-mode devices, and the port alternate mode devices must be handled by the port
-drivers.
+or cable plug supports. The drivers for the alternate modes are bound to the
+partner alternate mode devices, and the port alternate mode devices must be
+handled by the port drivers.
 
 When a new partner alternate mode device is registered, it is linked to the
 alternate mode device of the port that the partner is attached to, that has
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 35eec707cb51..74061a699f16 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -478,8 +478,12 @@ typec_register_altmode(struct device *parent,
 	if (!is_port)
 		typec_altmode_set_partner(alt);
 
-	/* The partners are bind to drivers */
-	if (is_typec_partner(parent))
+	/*
+	 * The partners are bind to drivers.
+	 * Also set the bus field for plug alt modes so that the udev event occurs on device
+	 * registration.
+	 */
+	if (is_typec_partner(parent) || is_typec_plug(parent))
 		alt->adev.dev.bus = &typec_bus;
 
 	ret = device_register(&alt->adev.dev);
-- 
2.29.2.454.gaff20da3a2-goog


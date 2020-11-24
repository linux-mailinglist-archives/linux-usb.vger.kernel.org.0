Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EB12C31BB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 21:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbgKXUKz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 15:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgKXUKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 15:10:54 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0372C0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 12:10:54 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 62so144897pgg.12
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXHvK/OQdFwEWt5SUWJrJ46fQLspmFn83cqsVmqt1BU=;
        b=QI4PaxjxN2vAhg+OzzCQ3PFYhbDfg+UyTEIH05ZVPaLO+VFkql2G49d7KjxHPh0DVr
         dHSj0/uqq/wUKuf0sXmdr1PhJTiPl0jBPbEsp7gWk7D4CR+bPsHmTne9lUxJ2LnrCAFp
         mdZfRng7zT84SNt6cFYbE0Mbym9csg7h41+oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXHvK/OQdFwEWt5SUWJrJ46fQLspmFn83cqsVmqt1BU=;
        b=GT/l0qsHHNjJu30XgooIxqOTQzngqf4mEgj3OyOeIAEvt5jSM76UJKdK5hdIXum0xp
         xaa1Du/WSW3RSXtqFqDI1ocIfOGzL99x7Ahj9g2m0b8RlZFLhq+ESnvoLY+MegXPU3Y1
         MIPRKFPlJq4qGsBTkElaQzJUEYvbEzYquuwnGfBrleElfG9haPbrG4LXy+L+hSwjdb6y
         6S60KE0ZBPwlMjIFwoqCZxddcpJgVGDM9/HIK0Fb5Qk+RTbDgtB17Ik6Dlo2xGVTUokj
         rkcdRbGfCfoi5qVR0FtfBvx9iAchFe1Q57Xyxw2bsT39SQ4kTC23MwBSbqH6na0zbJJn
         kSgA==
X-Gm-Message-State: AOAM532uX4VIJcppFm/QldDSi9gQTSqRcBS24z2/iNJOShv3GHC7rdJI
        yBi0k4cbh/sAJvtt1/2lqumxQQ==
X-Google-Smtp-Source: ABdhPJzPGPrQl2aSBij6Hx6yq12Sn9GBxXrDqrwMG1AIB4kaN8wEn2FP5uO73YdJKhnEeqofk/l5zA==
X-Received: by 2002:a63:554b:: with SMTP id f11mr67878pgm.81.1606248654164;
        Tue, 24 Nov 2020 12:10:54 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id w15sm53800pjy.47.2020.11.24.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 12:10:53 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Heikki Krogerus <heikki.krogeurus@linux.intel.com>
Subject: [PATCH v4 1/2] usb: typec: Consolidate sysfs ABI documentation
Date:   Tue, 24 Nov 2020 12:10:31 -0800
Message-Id: <20201124201033.592576-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Both partner and cable have identity VDOs. These are listed separately
in the Documentation/ABI/testing/sysfs-class-typec. Factor these out
into a common location to avoid the duplication.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Acked-by: Heikki Krogerus <heikki.krogeurus@linux.intel.com>
---

Changes in v4:
- Rebased on top of the usb-next tree.
- Added Acked-by tag from pevious version's review.
- Corrected a typo ('syfs' -> 'sysfs') in the subject line.

Patch first introduced in v3.

 Documentation/ABI/testing/sysfs-class-typec | 59 ++++++---------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 4eccb343fc7b..88ffc14d4cd2 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -147,42 +147,6 @@ Description:
 		during Power Delivery discovery. This file remains hidden until a value
 		greater than or equal to 0 is set by Type C port driver.
 
-What:		/sys/class/typec/<port>-partner>/identity/
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		This directory appears only if the port device driver is capable
-		of showing the result of Discover Identity USB power delivery
-		command. That will not always be possible even when USB power
-		delivery is supported, for example when USB power delivery
-		communication for the port is mostly handled in firmware. If the
-		directory exists, it will have an attribute file for every VDO
-		in Discover Identity command result.
-
-What:		/sys/class/typec/<port>-partner/identity/id_header
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		ID Header VDO part of Discover Identity command result. The
-		value will show 0 until Discover Identity command result becomes
-		available. The value can be polled.
-
-What:		/sys/class/typec/<port>-partner/identity/cert_stat
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		Cert Stat VDO part of Discover Identity command result. The
-		value will show 0 until Discover Identity command result becomes
-		available. The value can be polled.
-
-What:		/sys/class/typec/<port>-partner/identity/product
-Date:		April 2017
-Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-Description:
-		Product VDO part of Discover Identity command result. The value
-		will show 0 until Discover Identity command result becomes
-		available. The value can be polled.
-
 
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
@@ -219,17 +183,28 @@ Description:
 		This file remains hidden until a value greater than or equal to 0
 		is set by Type C port driver.
 
-What:		/sys/class/typec/<port>-cable/identity/
+
+USB Type-C partner/cable Power Delivery Identity objects
+
+NOTE: The following attributes will be applicable to both
+partner (e.g /sys/class/typec/port0-partner/) and
+cable (e.g /sys/class/typec/port0-cable/) devices. Consequently, the example file
+paths below are prefixed with "/sys/class/typec/<port>-{partner|cable}/" to
+reflect this.
+
+What:		/sys/class/typec/<port>-{partner|cable}/identity/
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		This directory appears only if the port device driver is capable
 		of showing the result of Discover Identity USB power delivery
 		command. That will not always be possible even when USB power
-		delivery is supported. If the directory exists, it will have an
-		attribute for every VDO returned by Discover Identity command.
+		delivery is supported, for example when USB power delivery
+		communication for the port is mostly handled in firmware. If the
+		directory exists, it will have an attribute file for every VDO
+		in Discover Identity command result.
 
-What:		/sys/class/typec/<port>-cable/identity/id_header
+What:		/sys/class/typec/<port>-{partner|cable}/identity/id_header
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
@@ -237,7 +212,7 @@ Description:
 		value will show 0 until Discover Identity command result becomes
 		available. The value can be polled.
 
-What:		/sys/class/typec/<port>-cable/identity/cert_stat
+What:		/sys/class/typec/<port>-{partner|cable}/identity/cert_stat
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
@@ -245,7 +220,7 @@ Description:
 		value will show 0 until Discover Identity command result becomes
 		available. The value can be polled.
 
-What:		/sys/class/typec/<port>-cable/identity/product
+What:		/sys/class/typec/<port>-{partner|cable}/identity/product
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
-- 
2.29.2.454.gaff20da3a2-goog


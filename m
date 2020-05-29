Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8577C1E7AD5
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 12:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2Kmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 06:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgE2Kmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 06:42:45 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FECC03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 03:42:45 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id w1so1715028qkw.5
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EKil22N1MzKOkPh60zy5RZ5ixiaoVZEB8mwF4KswgsA=;
        b=k5kPx+hcsWrda0uJS4ZJ8yzGQv8Y/5oMdVXI7/1RYGC/OmmmeR0MEqL6uqJqoBVdXS
         RFAZB5PIpBQeNdMG15sVv28yAGlEOJTSqDE42ldGK0N6uQLAQP44sbO5Mf08eB9LuKq/
         Tc2Dkp1jQ96PlnuNtOU3g8GCsXebbqnHMCUti0+q5MfOtFuiEiwVeAZ2visL2e2mPk6/
         QhE7BEaczAy49SvV7QybOD/+N7XePYvbg4OVdvCYMFBHpSYWwGOe5T6cORpMlpuL4fUp
         w6RuJeJ5Xr4E9L8QuP9PNO7ZCJlXONVPk+CQQ29PuPzPaB5p/hBXqAdyGfE4Z9dGlM94
         EsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EKil22N1MzKOkPh60zy5RZ5ixiaoVZEB8mwF4KswgsA=;
        b=nm1GswyhcYjGQjMW+n+VeKpa5xrNxIJRsbtimvxM74096iziCyffTqOmY2r9X5r4vf
         7H+eWHS4taRawe/cPvpNy/ZocAUJEdnPLVjIYBkk+Wdde/Q284THwloBc3Mn+8irpvbG
         n8zxWVo1w//Te3zUMUQJ6jEyvqt5W9yybAUyDDxoGHDbLn02NTH3fSxicGQKVIX8KgH1
         ghfaNq458qjU3dWHio1Tb6vpiS/+vsTEXrY/xt+iq1ImhYz5/EPXuGWEN2UxTYVLfXz2
         UcdroEpd0b6f9H3HEZjBvbuOgu1dOiMgUFnQI0noZTFi4YtFVl8x5BxKFGySuRSJYrFe
         vU8A==
X-Gm-Message-State: AOAM5332Gg/dkitzwSN7wd9ZDp0p2dIEJOiUcrU8zr6cCR4urAZDENiO
        2ptwxLbQhjSgVQu/8fvcNzY=
X-Google-Smtp-Source: ABdhPJyLzF2AhaQ+qvkZioenqucU77uPa6R0L6WRPsC5BujPf+ZU6q4B5JVxRgZ4n4e43KoynqYshQ==
X-Received: by 2002:a37:63c2:: with SMTP id x185mr7292276qkb.82.1590748964617;
        Fri, 29 May 2020 03:42:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:c59f:ab7e:918f:53a3])
        by smtp.gmail.com with ESMTPSA id d193sm3066048qke.124.2020.05.29.03.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 03:42:43 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     peter.chen@nxp.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] Documentation: ABI: usb: chipidea: Update Li Jun's e-mail
Date:   Fri, 29 May 2020 07:42:34 -0300
Message-Id: <20200529104234.25136-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The freescale.com e-mail domain is no longer active for quite some
time. Switch Li Jun's e-mail address to the NXP domain.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg b/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg
index 151c59578db4..f58cfb06b160 100644
--- a/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg
+++ b/Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg
@@ -1,6 +1,6 @@
 What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
 Date:		Feb 2014
-Contact:	Li Jun <b47624@freescale.com>
+Contact:	Li Jun <jun.li@nxp.com>
 Description:
 		Can be set and read.
 		Set a_bus_req(A-device bus request) input to be 1 if
@@ -17,7 +17,7 @@ Description:
 
 What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
 Date:		Feb 2014
-Contact:	Li Jun <b47624@freescale.com>
+Contact:	Li Jun <jun.li@nxp.com>
 Description:
 		Can be set and read
 		The a_bus_drop(A-device bus drop) input is 1 when the
@@ -32,7 +32,7 @@ Description:
 
 What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
 Date:		Feb 2014
-Contact:	Li Jun <b47624@freescale.com>
+Contact:	Li Jun <jun.li@nxp.com>
 Description:
 		Can be set and read.
 		The b_bus_req(B-device bus request) input is 1 during the time
@@ -47,7 +47,7 @@ Description:
 
 What:		/sys/bus/platform/devices/ci_hdrc.0/inputs/a_clr_err
 Date:		Feb 2014
-Contact:	Li Jun <b47624@freescale.com>
+Contact:	Li Jun <jun.li@nxp.com>
 Description:
 		Only can be set.
 		The a_clr_err(A-device Vbus error clear) input is used to clear
-- 
2.17.1


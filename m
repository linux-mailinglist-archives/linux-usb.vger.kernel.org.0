Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1BBD19E455
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2020 11:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgDDJqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Apr 2020 05:46:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44231 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgDDJqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Apr 2020 05:46:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id h11so3815091plr.11;
        Sat, 04 Apr 2020 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=7GDPmcK6SJHRuf12SL7H5kks1bkdILcC7vA7ejas/BI=;
        b=Fu+71osxmBa4Pi4TAUAFCefneyfNuFc6lMXThG8RWB8m1nG4GM86saiHEJDRjo+pzr
         JI1m8vE6u6oYIcvuIWHTRqDuJadA41+YlpsH1XYTLimoupz4ol7MziXZoFy/cMFBDkNX
         W9HFdyAOqwl57IwUynVUa0YAChrMOX6UQwlB4fF4PtIlWw2WimKEnAC87LQMcitsY6+/
         IxVAg0topsI4Ji5q+1O9gZwqCnfIVxMjsRrZZfpPgZgQmJbM9UYO9Qu5GO0VS2TlKs9i
         v0vW4JFEM+v4s92lNVCgPdq/vBl75YkvzV9v5MpeHELuFcruyb9nka95DSHD2Z7XoC5u
         amww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=7GDPmcK6SJHRuf12SL7H5kks1bkdILcC7vA7ejas/BI=;
        b=iWRvLJcYH05CzUMJog5QMk7dxdpzzGfzFujObvGr6kbUlc6PqV5rW/NG+i+hW7UhPt
         jHMsiJ7oiRxfbHUdliAXkjakM2zB0eteJgMqweZlGMoXP253DPKlNfrMb4K1a8mGxzaV
         Xm2x0cP/mCE+AFjv8EeY6RFAyj/s6YCTIhdKYhrW+Ae5HFki5PEX9TgD+Kn97zzP7WXB
         GazGkdijeQxgcUOvNT4Jr6jvKSZN9Ny30B8eWj5fJI5DjYRH6TywFRW+451ZY4oG6I6/
         O+wL6m/UI6Tn74nUrK0x7W9VPdUlXT/CSKUf7ajrLsVpQ2zqG0uFeUYSWNEmHCWieO8s
         0HmA==
X-Gm-Message-State: AGi0PuYZg1E0xe2Ysj5im4TYnXxjaikIGAPwD9Dkft7RlbfLQQJWrYAE
        bVIWDh2fO3poxmWuY3bKQzT6yD00io0=
X-Google-Smtp-Source: APiQypKlJqFw5oLJaP3DJtFrcGkMX6zh/o/z3j1IX+UszO2IgqlnUHMYe5xaOyUBTmXkReCqzE7z6Q==
X-Received: by 2002:a17:90a:2601:: with SMTP id l1mr15063331pje.74.1585993610826;
        Sat, 04 Apr 2020 02:46:50 -0700 (PDT)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id 3sm3681088pfd.140.2020.04.04.02.46.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 02:46:50 -0700 (PDT)
Date:   Sat, 4 Apr 2020 15:16:43 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Thomas Winischhofer <thomas@winischhofer.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Joe Perches <joe@perches.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: misc: Use the correct style for SPDX License Identifier
Message-ID: <20200404094638.GA5319@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch corrects the SPDX License Identifier style in
header files related to USB Miscellaneous drivers.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/usb/misc/sisusbvga/sisusb.h        | 2 +-
 drivers/usb/misc/sisusbvga/sisusb_init.h   | 2 +-
 drivers/usb/misc/sisusbvga/sisusb_struct.h | 2 +-
 drivers/usb/misc/usb_u132.h                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.h b/drivers/usb/misc/sisusbvga/sisusb.h
index 8a5e6bb07d05..c0fb9e1c5361 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.h
+++ b/drivers/usb/misc/sisusbvga/sisusb.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
 /*
  * sisusb - usb kernel driver for Net2280/SiS315 based USB2VGA dongles
  *
diff --git a/drivers/usb/misc/sisusbvga/sisusb_init.h b/drivers/usb/misc/sisusbvga/sisusb_init.h
index 1782c759c4ad..24c2e71d06e7 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_init.h
+++ b/drivers/usb/misc/sisusbvga/sisusb_init.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 /* $XFree86$ */
 /* $XdotOrg$ */
 /*
diff --git a/drivers/usb/misc/sisusbvga/sisusb_struct.h b/drivers/usb/misc/sisusbvga/sisusb_struct.h
index 706d77090e00..3df64d2a9d43 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_struct.h
+++ b/drivers/usb/misc/sisusbvga/sisusb_struct.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 /*
  * General structure definitions for universal mode switching modules
  *
diff --git a/drivers/usb/misc/usb_u132.h b/drivers/usb/misc/usb_u132.h
index 4bf77736914f..1584efbbd704 100644
--- a/drivers/usb/misc/usb_u132.h
+++ b/drivers/usb/misc/usb_u132.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
 * Common Header File for the Elan Digital Systems U132 adapter
 * this file should be included by both the "ftdi-u132" and
-- 
2.17.1


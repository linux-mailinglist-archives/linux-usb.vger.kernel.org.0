Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882AF218E6D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 19:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgGHRjY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 13:39:24 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:46244 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgGHRjY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 13:39:24 -0400
X-Greylist: delayed 27855 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jul 2020 13:39:23 EDT
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 810A7BC117;
        Wed,  8 Jul 2020 17:39:21 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     b-liu@ti.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER
Date:   Wed,  8 Jul 2020 19:39:14 +0200
Message-Id: <20200708173914.15470-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/usb/musb/musb_trace.c | 2 +-
 drivers/usb/musb/musb_trace.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_trace.c b/drivers/usb/musb/musb_trace.c
index 476872adce80..03ccf573eb63 100644
--- a/drivers/usb/musb/musb_trace.c
+++ b/drivers/usb/musb/musb_trace.c
@@ -2,7 +2,7 @@
 /*
  * musb_trace.c - MUSB Controller Trace Support
  *
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Bin Liu <b-liu@ti.com>
  */
diff --git a/drivers/usb/musb/musb_trace.h b/drivers/usb/musb/musb_trace.h
index 380ebc77eab1..e302c219aa7c 100644
--- a/drivers/usb/musb/musb_trace.h
+++ b/drivers/usb/musb/musb_trace.h
@@ -2,7 +2,7 @@
 /*
  * musb_trace.h - MUSB Controller Trace Support
  *
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Bin Liu <b-liu@ti.com>
  */
-- 
2.27.0


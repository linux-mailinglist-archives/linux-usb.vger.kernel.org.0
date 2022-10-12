Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDDD5FC310
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 11:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiJLJ20 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 05:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiJLJ2Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 05:28:24 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B269B0B2D
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 02:28:23 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id jr1so1791899qtb.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fK/rDsfC9R18gaul5pzPGDBDFf8RfLZpXj5fFzrGc+4=;
        b=f8FeCbiadspZ2MA50ytZyoyHfekF4W9y2LuH5n0tRt1lxpZpwa9EAs3cJCaE5VXq9m
         jsy9sVg8zPs7sIjXrTnVAhOxVYFU2N0wIfY/813d5p+DZEWmPbrezxBFkqLNqWszqktj
         GyvzeT27OQxwd3t5vm4AkQAT3NlSKQQBjNLdweUG/tGNlc9ZpGltdt6XigqW26C4j2hk
         oNWl4IiIIA2hS1LVb1OLgRS7wLQta/YBqF5QQc2naR8KQ0p1c3ipXSlVsuDUjJgJswRP
         6GNtKO1YcgPa2Rw3/7yIi2hMNFYfolc3UgXtAZZIMlOxZJCWTb2R1FJHoDhMXMloPH9s
         3w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK/rDsfC9R18gaul5pzPGDBDFf8RfLZpXj5fFzrGc+4=;
        b=obYRW3g2KhncmJzqrXvUPAtgBYN5XZNjK3k0iontphCcKWhPHn3lBqOIMAQ6QgTWKw
         fDV1Fl4p0Y8kuTiqPT8BzHfCrJcdekFsQDX2PGwBwNABKv3fgNTIS5Qqdh9g4E+PUz25
         N3wkJAG4otryVUabR5STYpMiJ/k6tEeJI5ox/R+nIyb/+7qnB4zYz31cLHfvYJqeeml0
         dFpwCWwpC7JLTBivNKkPtmn4HLVLM2uTl3jAINl2Pz1fYBjgKk1nYqoD0GQ3dLu30tlZ
         QseckJarATo6en4kHmHjXXRChPktghd5qBiiBBWswjf6HWlIhjehMdCY0bZNO4m0t5uo
         EwQg==
X-Gm-Message-State: ACrzQf1T71grLNSdI3i7GnGNneS/F4g6kryHWI8AGRv6TmKUuVCi9hIT
        MN4x265Knum1lcuES1swI6Q=
X-Google-Smtp-Source: AMsMyM6Wat86XQcwYpPBW8+htP0PfpghHKkOV+XRlky10O0Ysklql8ELnNT7tNRkOabYZ3Mff8BGkg==
X-Received: by 2002:ac8:5e0a:0:b0:39a:2960:d4a6 with SMTP id h10-20020ac85e0a000000b0039a2960d4a6mr11746609qtx.448.1665566902146;
        Wed, 12 Oct 2022 02:28:22 -0700 (PDT)
Received: from testvm.ubxad.u-blox.com (mob-37-176-103-131.net.vodafone.it. [37.176.103.131])
        by smtp.googlemail.com with ESMTPSA id d21-20020ac84e35000000b003431446588fsm7348304qtw.5.2022.10.12.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 02:28:21 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, larsm17@gmail.com, johan@kernel.org,
        marco.demarco@posteo.net,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH v3] USB: serial: option: the patch is meant to support LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Date:   Wed, 12 Oct 2022 11:27:52 +0200
Message-Id: <20221012092752.6033-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
0x90fa) has been removed since is not used anymore by the u-blox 
LARA-R6 modules. The new LARA-R6 (00B) definition uses 0x908b PID
and the reservation of port 3 is not needed anymore.
LARA-R6 00B does not implement a QMI interface on port 4,
the reservation (RSVD(4)) has been added to meet other
companies that implement QMI on that interface.

LARA-R6 00B USB composition exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions

LARA-L6 module can be configured in three different USB modes:
* Default mode (Vendor  ID: 0x1546 Product ID: 0x1341) with 4 serial
interfaces
* RmNet mode (Vendor  ID: 0x1546 Product ID: 0x1342) with 4 serial
interfaces and 1 RmNet virtual network interface
* CDC-ECM mode (Vendor  ID: 0x1546 Product ID: 0x1343) with 4 serial
interface and 1 CDC-ECM virtual network interface

In default mode LARA-L6 exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions

In RmNet mode LARA-L6 exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parset/alternative functions
If 4: RMNET interface

In CDC-ECM mode LARA-L6 exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parset/alternative functions
If 4: CDC-ECM interface

Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
---

V2 -> V3: added this section to tracking changes with previous versions.
Added some explanations about the RSVD(4) in the description session.
Added reservation to port 4 of VID:PID 0x05C6:0x908B to meet other
companies QMI net interface implementation.

V1 -> V2: define UBLOX_PRODUCT_LARA_R6 0x908b has been deleted together
with the previosly provided definition of USB_DEVICE since the PID 
is used by another vendor.
The LARA-L6 patch part is the same of the previosly provided one.

 drivers/usb/serial/option.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 697683e3f..07915e661 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -240,7 +240,6 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
-#define UBLOX_PRODUCT_R6XX			0x90fa
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
 
@@ -581,6 +580,11 @@ static void option_instat_callback(struct urb *urb);
 #define OPPO_VENDOR_ID				0x22d9
 #define OPPO_PRODUCT_R11			0x276c
 
+/* These u-blox products use u-blox's vendor ID */
+#define UBLOX_VENDOR_ID				0x1546
+#define UBLOX_PRODUCT_LARA_L6			0x1341
+#define UBLOX_PRODUCT_LARA_L6_RMNET		0x1342
+#define UBLOX_PRODUCT_LARA_L6_ECM		0x1343
 
 /* Device flags */
 
@@ -1124,8 +1128,15 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
-	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
-	  .driver_info = RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B*/
+	  .driver_info = RSVD(4) },
+	/* u-blox products using u-blox vendor ID */
+	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6),
+	  .driver_info = RSVD(4) },
+	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_RMNET),
+	  .driver_info = RSVD(4) },
+	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_ECM),
+	  .driver_info = RSVD(4) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
-- 
2.34.1


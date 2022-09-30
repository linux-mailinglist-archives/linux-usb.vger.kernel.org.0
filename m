Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2845F0EBC
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 17:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiI3PYH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 11:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiI3PYG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 11:24:06 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8C51730FE
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 08:24:05 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id s13so2981106qvq.10
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 08:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=s15YNbMr4rvjRmdVuXGAAFOph0GV1QzLXzSQOmccJe8=;
        b=Ql1+2GDZMPAt8DpkobQyS1yrIXYRglRnBhlt61OvBEYbJ5nHKX/eEgHofqAmgLbZQe
         Gcdls1nTIWjXqWi+wcW0taGFNu7DrfivZJZ9yZIQnozD2on1NwoicpAwWB5uaPfG0TE5
         5OHZQwqJHxHAgPQ/rkmdm6tMq7estRaG6No0LeG0mEo0WisZ3L9TjrubUpkaLMgNu3ss
         oZp1H2mEqkT1z33t1G+1GCvqOPD7p1yGm1z6A1zlGxFLYAtWtIAOTCTy+gn+WPGnRI64
         QWCM2eIlKBo4thmxIFf2XS+M0/Dk0yU3wZAimnvNJEXLMP/AaemJu4Rc1PEUywM6vl+Z
         UTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=s15YNbMr4rvjRmdVuXGAAFOph0GV1QzLXzSQOmccJe8=;
        b=PPzCY0WdSX3t6KjNUQqjROBKNV9idTHAO1iCDZuBswwz5myFrrXscgI6Bx2n599FPd
         XppORFndlf1d3MmMtsGjtYd5JYI0QBCKU7fAG3/1B5oQA55xp/DD5qQxuiOlQJMaygEX
         7iPLRALAV3iXzxBarrHfCibK4H/Uwvpvm4FIJGBMJ2Tb+T+2NMoEqPyl9vokSKAA8rSx
         Lc9jhMBJpSgCG/Wayq8P5MS1yuscGvwQlJ75dOVVMVf0rqRDKAl7KoGgRhp0VMVkvo/d
         5Se0dCt88ARYfUnUb3bBbIPyK/essYDq4KkQuPGSxp56ZVm7nfQiz2VhFisbkCFCVmkM
         cqxg==
X-Gm-Message-State: ACrzQf3XR69qQJWQsyXhnyhZ4iZEZ6yY1i4nCtM7Z6k1ChKlYlDUnFU4
        hvXnptpCkgUbUsLsfJwLI9xKj082WvJtOQ==
X-Google-Smtp-Source: AMsMyM5AyRJsD57zrt33Wt5AvaJVPGrYdxW7yMiU+hTCBwUlG9psh+vje1jkL9TiUqL5V7bnfbig7w==
X-Received: by 2002:a05:6214:1c8e:b0:4af:8570:8878 with SMTP id ib14-20020a0562141c8e00b004af85708878mr7201416qvb.33.1664551444352;
        Fri, 30 Sep 2022 08:24:04 -0700 (PDT)
Received: from testvm.ubxad.u-blox.net ([185.215.195.17])
        by smtp.googlemail.com with ESMTPSA id fu6-20020a05622a5d8600b0035d08c1da35sm2129345qtb.45.2022.09.30.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:24:03 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH] USB: serial: option: the patch is meant to support LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Date:   Fri, 30 Sep 2022 17:23:44 +0200
Message-Id: <20220930152344.7877-1-davide.tronchin.94@gmail.com>
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

The LARA-R6 module has the following USB identifiers:
Vendor  ID: 0x05c6
Product ID: 0x908b

The USB composition exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions

The LARA-L6 module can be configured in three different USB modes: 
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

Signed-off-by: Davide Tronchin  <davide.tronchin.94@gmail.com>
---
 drivers/usb/serial/option.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 697683e3f..fc0403891 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -240,7 +240,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
-#define UBLOX_PRODUCT_R6XX			0x90fa
+#define UBLOX_PRODUCT_LARA_R6		0x908b
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
 
@@ -581,6 +581,11 @@ static void option_instat_callback(struct urb *urb);
 #define OPPO_VENDOR_ID				0x22d9
 #define OPPO_PRODUCT_R11			0x276c
 
+/* These u-blox products use u-blox's vendor ID */
+#define UBLOX_VENDOR_ID				0x1546
+#define UBLOX_PRODUCT_LARA_L6			0x1341
+#define UBLOX_PRODUCT_LARA_L6_RMNET		0x1342
+#define UBLOX_PRODUCT_LARA_L6_ECM		0x1343
 
 /* Device flags */
 
@@ -1124,8 +1129,14 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
-	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
-	  .driver_info = RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_LARA_R6) },
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


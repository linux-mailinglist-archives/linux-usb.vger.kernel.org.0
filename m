Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D505FB470
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 16:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJKOUZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 10:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJKOUY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 10:20:24 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B8510542
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 07:20:23 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id b25so2684118qkk.7
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYPM8gPmgaFXCN/BvjSuc61/Hglm3tHup+4vefMDzq8=;
        b=I3TSvKEzcbFd5A0fZjFxDZo3RxzalHGe8JD4FNhZZw+O5mZ1RZlsSOlzhqQNUJbyPt
         fHWPwFvr2z3NCr+kwKivK9X4vYjY9v2RkhLdQuELEidiT7nHCN+Sf7qMUOY6mO9FFoAb
         yjG8o1c3Sec2jOPTd+ZhRR+cfQH7j/FqL988SkcJeQSHnz4WBfBzjZlNL3uJb5zbAU9C
         XH69/wqIRPHW5BAL8zzMp220mHG90PawUAKjbJy0rxkQIHuYyIOjiwACym4ARJzY8KcQ
         +Mp0drQhseeBVwle/nJSrKpnSVZi61vSngrCzGalZRJw6P2d3KahXinDDQb5lYjtUgL7
         ElCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYPM8gPmgaFXCN/BvjSuc61/Hglm3tHup+4vefMDzq8=;
        b=LeLp59mb5CN2Q9/l0Y1jfRlCI4Fzhe13XuLR4tDQHOEwmiz3JzAlWjCc1ry1SNYx4r
         RVX+SC+IjfH/ee4hm5ZmnabLPpYmPnCtd5VdSMRn1MFMgfQI7dn8xfIJCdufHGXi4wjv
         U2NV6GWaE4jGsctwwLNpewwaEjjzCHT6UKBK3IcVtQKX4LRetqgdCDEPEEOljCilt8LK
         zhCxlbbibYgvQINRvBH7cr8dgSqTis/PC55NaTapYQ047o8wakVwhUKkd+P2sbd8IFjm
         vfkzjPW7xzUPKQedCOoe/e1T+ptrbs+/TPBrVrzv0oiRIfJb841AM7kdxcR7qPvPGZJc
         cvMg==
X-Gm-Message-State: ACrzQf1eWuay2kUoKI5EbntdRTnB741nStBewiM+fO8ZzkFMzlDtrOQW
        zkie1wxSpvQCObvko2S0GkU=
X-Google-Smtp-Source: AMsMyM4aisJxfZQgQNZGkXns9lPIgTbFiKXG0QKEw3rZemHVYciLHcPSOfl7xd5IX7jAVKz61zJjVA==
X-Received: by 2002:a05:620a:2584:b0:6ca:bf8e:5e2a with SMTP id x4-20020a05620a258400b006cabf8e5e2amr16688084qko.390.1665498022225;
        Tue, 11 Oct 2022 07:20:22 -0700 (PDT)
Received: from testvm.ubxad.u-blox.com (mob-37-176-77-176.net.vodafone.it. [37.176.77.176])
        by smtp.googlemail.com with ESMTPSA id f14-20020a05620a280e00b006be8713f742sm13010627qkp.38.2022.10.11.07.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:20:21 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH v2] USB: serial: option: the patch is meant to support LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Date:   Tue, 11 Oct 2022 16:20:08 +0200
Message-Id: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
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
0x90fa) has been removed. The new LARA-R6 (00B) definition uses 0x908b PID
and the reservation of port 3 is not needed anymore.

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
 drivers/usb/serial/option.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 697683e3f..018f924b0 100644
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
 
@@ -1124,8 +1128,14 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
-	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
-	  .driver_info = RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b) }, /* u-blox LARA-R6 00B*/
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


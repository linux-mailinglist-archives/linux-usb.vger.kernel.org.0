Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAF2622FFF
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 17:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiKIQRi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 11:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbiKIQRh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 11:17:37 -0500
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657D1641F
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 08:17:36 -0800 (PST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-13c2cfd1126so20135503fac.10
        for <linux-usb@vger.kernel.org>; Wed, 09 Nov 2022 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Vdw8qoD8HbAPHku+DdQ7wvvSARX4HrvjWTbg9dpFA=;
        b=UsqALXkmzu8W3ISGTd9x+iHPuRSpnq0mIdg64ejPGOofbuw4IEEzrHpMlGD3ZZXl2q
         rE3Kb9tl7dewnfvdg3ofgXiAX+LVGRGge1EWVkgLLuk+vJ6hn2V/4UAKmX0nvrG6BVPM
         7NXZ8+DOegNFFoX6zZ5zo19UfzbQs8etjh8aNmW7nXcleQ4b8pFXbCs0F/ZztXLPNalU
         a0hgs0XIKdXxZHNy3ttG/56iy9YOs2x7Qx/4Z9swP297zAMbtGKU3Zr4JieI7+bcmL/D
         1AdvNGQNyc3D5xBCv1RLtVsaLFzFSm7wE/EUG4Bmp9f+FMOxYHPOceGMRD45fnr9K4u6
         N+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Vdw8qoD8HbAPHku+DdQ7wvvSARX4HrvjWTbg9dpFA=;
        b=d8Zj+oI8jqHQg7f8194agzeb94c3wLoX8uX5GTjMQAbLwffUbYW6y99r8WGogbEJuP
         hVHYbi2pclENhjWupSUVckQrI2PBpu8l3zSSO9TQhOec3ZNbTuqOzRo5ajANUvFZB6S0
         euvQ+chOgHqM6ZJGmum7xVUZbT+KJs80K/tKtkXUwLVVYsKhKCxmDoDUPV7fAbWIWfrY
         KkQCPHrg6ZCf02WvvJKjJu2lVipbslEY4JgEeL0GLLh1BqLFH1+TeLqoqvyRp+MqAK2b
         /OMxeHRjVXgP/SwD6WlPLZ43hDmw+svFH3ILSBYAC/DMcn1oVwiUQtiSAiSOX2Vw7cNe
         wVZg==
X-Gm-Message-State: ACrzQf0l3ia3uC0v/Eed6eQXCI7yEd7dPkcjhCv4/1pmxFBvCb3bctcV
        g6b8SnAPmD0NduHtFZJlhjE=
X-Google-Smtp-Source: AMsMyM7uDgkzz3GUmZa9yI4WmlGO2QIH0Q1IBQbDHW7fXz06plYcxvFEzwozq33zylx4MPl8AOYTBQ==
X-Received: by 2002:a05:6871:4399:b0:13b:5ffe:ff70 with SMTP id lv25-20020a056871439900b0013b5ffeff70mr782656oab.171.1668010655522;
        Wed, 09 Nov 2022 08:17:35 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id i5-20020a4aab05000000b0049ded99501bsm4302578oon.40.2022.11.09.08.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 08:17:35 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     larsm17@gmail.com
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: [PATCH v5 1/3] USB: serial: option: remove old LARA-R6 PID
Date:   Wed,  9 Nov 2022 17:17:11 +0100
Message-Id: <20221109161713.31723-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com>
References: <6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com>
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
0x90fa) has been removed since is no longer used by the
current u-blox LARA-R6 product. However, PID 0x90fa has been
kept to maintain the support to other products that use the
same VID/PID.

Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
---

V4 -> V5: kept PID 0x90fa to maintain the support for other products
which use VID:PID 0x05c6:0x90fa. Remove interface 4 from blacklist
for LARA-L6 default mode since it is not needed.

V3 -> V4: as requested, the patch has been split to 3 sub-patches.
Fix comment format.

V2 -> V3: added this section to tracking changes with previous versions.
Added some explanations about the RSVD(4) in the description session.
Added reservation to port 4 of VID:PID 0x05C6:0x908B to meet other
companies QMI net interface implementation.

V1 -> V2: define UBLOX_PRODUCT_LARA_R6 0x908b has been deleted together
with the previosly provided definition of USB_DEVICE since the PID
is used by another vendor.
The LARA-L6 patch part is the same of the previosly provided one.

 drivers/usb/serial/option.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 697683e3fbff..b93285b5175b 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -240,7 +240,6 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
-#define UBLOX_PRODUCT_R6XX			0x90fa
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
 
@@ -1124,7 +1123,7 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
-	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x90fa),
 	  .driver_info = RSVD(3) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
-- 
2.34.1


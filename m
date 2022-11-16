Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF36A62C348
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 17:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbiKPQAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 11:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbiKPQAh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 11:00:37 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA234D5CC
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:00:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so1943862wma.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqnN+HwKF3yOXWIqEca3FS0DaVbgfsnsprqsCj3gozc=;
        b=YIYmnvgJhpkA9r73b4Nkt81d0RElDCRyIxF22hnQM+rdc+1XtoCcUlQ/bgLvURbWuQ
         dXzYwY16FkCruarThfxqo5ZCgF+iXHP/R/pwXCdpLuDFfVmLYR7qwXzjUd68fHi44xor
         I8EF+12gM7Pu4mPW87chWKg/RU2ViCgxV2TefyzvlOcrM1lzU7LI/0/3R2Hx/3/GCUFw
         oczpT4hBAqX/6xjiOk3fihh6yFhr/PTp/a33+G6KshNKSPyNao8f4RecPvS9wgWfVUXQ
         5TvPJr/poZjU2m/zTljhS1Ktz7zyxk4FzWvYkK+eAE7mcwNBmZwZWgnvImZntK/DN5En
         EacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqnN+HwKF3yOXWIqEca3FS0DaVbgfsnsprqsCj3gozc=;
        b=Tpk3aldICc/ujyknRutMtd+Us6mxMzJF2I7zhVEj7XEtciW2Ti/2jVfna+Ze+6+xNb
         MkGtq+sDVCHIm1NGowoDP4ZXLVu4GEunXESc6/IMdDkmTy6XL3zw9AzIb2bpr+MqeVV3
         rRK9BLo4ZtHI8jtKfUTiT1ZnAuvORbjr3Cq5nu4nHhYtbAoJs4K6sR/kSDynunA4jY0+
         xbceO+5o0pJa35i1zZHDE3KluRGDQPfR1xPloojsUBAD52xeuFP9IJ87vqH7LK5AET78
         Rw5fo+WjzZNDFudD73sEU+myu3V52sK3Ykk4Ppd2pUlhPyQrnsVm2lgOh/WcLRbQwOGd
         tqGA==
X-Gm-Message-State: ANoB5pmDu1zkye4PPYdzgg0H17XSklpGRbr615V24A50iqaU0NLRBQS/
        sO496SX1dLGrwpRWA9KS9no=
X-Google-Smtp-Source: AA0mqf5xuOQClU2F712+h3aoy8rhP9aPbqLUlapJLmZhzhzOmkXrDeZweMeSmgqkvSLD1SmP+tXqAQ==
X-Received: by 2002:a05:600c:6890:b0:3c5:dbf4:baaf with SMTP id fn16-20020a05600c689000b003c5dbf4baafmr2489369wmb.105.1668614434426;
        Wed, 16 Nov 2022 08:00:34 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id z4-20020a5d4c84000000b00236733f0f98sm15298795wrs.107.2022.11.16.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:00:33 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, larsm17@gmail.com,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: [PATCH v6 1/3] USB: serial: option: remove old LARA-R6 PID
Date:   Wed, 16 Nov 2022 16:59:48 +0100
Message-Id: <20221116155950.59609-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y3SzfG9ljTbeQyWU@hovoldconsulting.com>
References: <Y3SzfG9ljTbeQyWU@hovoldconsulting.com>
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

Remove the UBLOX_PRODUCT_R6XX 0x90fa association since LARA-R6 00B final
product uses a new USB composition with different PID. 0x90fa PID used
only by LARA-R6 internal prototypes.

Move 0x90fa PID directly in the option_ids array since used by other
Qualcomm based modem vendors as pointed in:
https://lore.kernel.org/all/6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com

Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
---

V5 -> V6: change the commit message and text wrapped correctly.

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


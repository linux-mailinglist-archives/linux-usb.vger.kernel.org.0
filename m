Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A438D62196C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Nov 2022 17:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbiKHQcC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Nov 2022 11:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbiKHQcB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 11:32:01 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C762A1C401
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 08:32:00 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id t62so16025456oib.12
        for <linux-usb@vger.kernel.org>; Tue, 08 Nov 2022 08:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9AsNF0vhXSTY/5zm1gn+1Vq724Od58JoAr4hbjBQZ4=;
        b=a98VZ9QyL2laarTHIMp5C52TALfqV+MlqZteonpdMrl0FrZbrMltnvEkqTxySXjQaF
         llQ1SCmURuLVrzAl+ozaLAQDGlZhxWDpnuillZaRD+cnwHNc0DVgg1ON+PkailkYzg0U
         NgF4Sh4LYLWaOgGOgqn0W9779b/6oeZ3tkyUwPImr62aHyji8BsvWTSZCcAkiBqAH3Uk
         sHSq999lIs8im2D8uoS/9go1X13b8nzZDNH7kmbcuJGipNaaanLcCUDWoQ9ti4wH4YBr
         iAC47S/UJ8PG4FlQ9E0dTAR4+A4yXGpDH0SEA+fDQ68kb1qp17rKJKqpQdwUnS3YYFPf
         rcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9AsNF0vhXSTY/5zm1gn+1Vq724Od58JoAr4hbjBQZ4=;
        b=CJHEA4KsZlgL5CbZ/Js1nAp1oEiVncZUhbk81plYLLgG+4ztAjU8f1jPxY4EsR+hVa
         v7+UQXnEot+g8PJUC1UYIn9VJ6Uodj5AvLDr70GoVOWQo2jVlAx3SuZ5gg/rR0+nXbrz
         ePUidA1pfEaTJ10zpeD2+AzxiockVZ5rZ1r6ecyjZiDgsmdC1d4uPPH+4gRcIBAkuQLk
         74e72ySm6eW28ROVXqTI/GPv/WIznYWyS4qUt9GkvWwRrjuMiwgMc1tNvvvjg9QJ5BdV
         Px/Vci84CzJi7qsdqmo1fjca+oMWt+B+dXHXj+tcSUP4qqNnGfL8otOh/6D51+bY0RHx
         G50w==
X-Gm-Message-State: ACrzQf37jyHgSu8GdyWbT2xXrHyhup2bBy6zfd+jLB0whki+CNFiN8We
        9JEp1JFOgz+aUc3oZVodXX8=
X-Google-Smtp-Source: AMsMyM62NQm3z8IYklR50GKMAc7reCFeBWAlG7o54K4MNwcxWvwwo5naEDxJep+mxi87Czhay5e9VA==
X-Received: by 2002:aca:b655:0:b0:35a:4fb4:c3d2 with SMTP id g82-20020acab655000000b0035a4fb4c3d2mr16058544oif.96.1667925120075;
        Tue, 08 Nov 2022 08:32:00 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id w21-20020a056870e2d500b0013b9ee734dcsm4809511oad.35.2022.11.08.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 08:31:59 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com, marco.demarco@posteo.net,
        cesare.marzano@gmail.com,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH v4 1/3] USB: serial: option: remove old LARA-R6 PID
Date:   Tue,  8 Nov 2022 17:29:59 +0100
Message-Id: <20221108163001.18454-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
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
current u-blox LARA-R6 product.

The USB composition has been changed by u-blox to meet new
requirements (3 serial ports over USB).

Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
---

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

 drivers/usb/serial/option.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 697683e3fbff..068c65228d4d 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -240,7 +240,6 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
-#define UBLOX_PRODUCT_R6XX			0x90fa
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
 
@@ -1124,8 +1123,6 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
-	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
-	  .driver_info = RSVD(3) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
-- 
2.34.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0AB623001
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 17:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiKIQRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 11:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiKIQRk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 11:17:40 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5E52676
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 08:17:39 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id q2-20020a4a3302000000b0049ee5fe3ab7so1371105ooq.8
        for <linux-usb@vger.kernel.org>; Wed, 09 Nov 2022 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FmYf45xjQQkMKsVb2S7TiROHUYOEAUm5y4vYdSAAQg=;
        b=iBKwGJcmiBfQ7gJm0FAU56YcPzLtkhX2BxWqsSHTrbzHUmKFCrdCpTBT7IprVAGFGd
         A3OCM27+7oe+JqT/pzyN0EjbcXbUKvbHmmd8jo/2HqwxWuSAsFRoX78vO/kSX8sTpZOe
         2Oj1xV3eT8p7ByETJ3lBt9fsP7i+MUvHk4Zg1Jl19VFec5ag3j22RZqMo1y0zt/lvNXw
         Fmz9V7W9WTOWVeH/5olB/W1RWOzeuyy6CSYRo1ZfZdR2X5Pnz6+YLm62rd85WP3LhkAn
         yvNfH7cX4bI9ZvnQagtG/OtjUtKRKXQ0C8bqGDsKvvkEC4OMnd/4tN2uFivmHOLNWyWT
         fGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FmYf45xjQQkMKsVb2S7TiROHUYOEAUm5y4vYdSAAQg=;
        b=Tr4uUIVTlB8z3RrNqT4O5aEyvq7skLQcIv2WkHoxQnibwKNkNfVg73UfFJHsxmNdJa
         BM97DEuPltmiKHNcCq8HTUXJcbOlFWaSXKbqYYpUU5n9JZUNFHrqChWoKsaNcEYT6jWp
         er6EGUqEh0iT1Gai/5zDts+1qF7ol+YRVVg90nKbzuHdAE20cahORcrieuMI7hJ2Zb/K
         kurJQ1kA/X/hWOIa7TOYW4742fKteigvxNsUp9xsnEVA3vB9B77DDRBQHYzyJ2lgJK/G
         jN4z337g69aXyu86ycMNH1vBqrvXcrqC1rxIQ5GxIRyA2eErrSAiSAj++DH8wkG/fDSj
         UGJQ==
X-Gm-Message-State: ACrzQf0scLICMu4b461iwOM6vAL5NRzisjWml/IJCO+Xc8hft+RH5dqy
        gvWz654lKvtVhC9Ontr6Ptw=
X-Google-Smtp-Source: AMsMyM6aPp8D6LRq6RB6031NYzi2zlVldHD9RkWUpyRg829FpPr8Vnt3xwmCqTSXysTedsBYtqUPnw==
X-Received: by 2002:a4a:58c7:0:b0:49e:9fd1:2610 with SMTP id f190-20020a4a58c7000000b0049e9fd12610mr13395490oob.89.1668010659003;
        Wed, 09 Nov 2022 08:17:39 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id i5-20020a4aab05000000b0049ded99501bsm4302578oon.40.2022.11.09.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 08:17:38 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     larsm17@gmail.com
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: [PATCH v5 3/3] USB: serial: option: add u-blox LARA-L6 modem
Date:   Wed,  9 Nov 2022 17:17:13 +0100
Message-Id: <20221109161713.31723-3-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109161713.31723-1-davide.tronchin.94@gmail.com>
References: <6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com>
 <20221109161713.31723-1-davide.tronchin.94@gmail.com>
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

Add LARA-L6 PIDs for three different USB compositions.

LARA-L6 module can be configured (by AT interface) in three different
USB modes:
* Default mode (Vendor ID: 0x1546 Product ID: 0x1341) with 4 serial
interfaces
* RmNet mode (Vendor ID: 0x1546 Product ID: 0x1342) with 4 serial
interfaces and 1 RmNet virtual network interface
* CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1343) with 4 serial
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

 drivers/usb/serial/option.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 011b9a3b7571..f892a3c80cf1 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -580,6 +580,11 @@ static void option_instat_callback(struct urb *urb);
 #define OPPO_VENDOR_ID				0x22d9
 #define OPPO_PRODUCT_R11			0x276c
 
+/* These u-blox products use u-blox's vendor ID */
+#define UBLOX_VENDOR_ID				0x1546
+#define UBLOX_PRODUCT_LARA_L6			0x1341
+#define UBLOX_PRODUCT_LARA_L6_RMNET		0x1342
+#define UBLOX_PRODUCT_LARA_L6_ECM		0x1343
 
 /* Device flags */
 
@@ -1127,6 +1132,12 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(3) },
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B */
 	  .driver_info = RSVD(4) },
+	/* u-blox products using u-blox vendor ID */
+	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6) },
+	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_RMNET),
+	  .driver_info = RSVD(4) },
+	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_ECM),
+	  .driver_info = RSVD(4) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
-- 
2.34.1


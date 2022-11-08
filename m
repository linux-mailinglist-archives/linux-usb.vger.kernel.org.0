Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341A862196E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Nov 2022 17:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbiKHQcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Nov 2022 11:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbiKHQcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 11:32:11 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B4A5801B
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 08:32:10 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id n186so16060843oih.7
        for <linux-usb@vger.kernel.org>; Tue, 08 Nov 2022 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVKfTg+B1VSTWYUPN6tKjoz1wz6ia7aaYVMEUP6i4Rk=;
        b=UA+ZUP0a3ooG1ydZCWHIKei64gHkFWXZd2BkbGM2AuBXpAcQjB/wDfLJXY3reJtpAT
         6ciD6ZXLEtRWGE8bn4HHtouwdXXyd2PPXO+7Le/k7w+rhqsfV27GFji+hlAyxfe+Uo8C
         2uUvK3cqKaEAwa3zqjJDGEMst85VzQo3eQrzI5ZQp/ubpvrogViYmREjAYoBiVrDak7n
         FRDUM/mt2tiiyx3Iid1HmM7x9GGbbwMx52ZA4iuOVjVlTy8NwQwYz0Yh5l1+jSOnU5e3
         3ekHMJ3XuphZx7Pa6nrEulogWNJX1l3Z61mDLwdFp1SumSYHtBtxqMt0RXYlsCkBlcjx
         n9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVKfTg+B1VSTWYUPN6tKjoz1wz6ia7aaYVMEUP6i4Rk=;
        b=agwp0lYvKmUIJtZbfxurcwUR46ZtNr6X8LstCYs7mH+SuRVTYQxYDrtCPMgWVfkByL
         N77Tcl6Iwyx2XEnQEHaPdxE7TNbTnO6+WFbMFS9O3/5Dep7UlxXWSqdCLynB9Y05oYn9
         lJoLPk+L/ZrwrZRoMtd1yccuFIdBsGdi7DjMXhX8fCsNpI4fvcNyoesrEiojXQAaDNnu
         hykrTiKiZUNh1NsiLIIYPfr/8aWfspIvs4k4dVEg/a7oHwdQopU3XZTZI3Rw6iDMNPrq
         /s/4CWJ6z+SXndzWUvLqVBsqsUHzG9yA/CCZvPBUxNm2OCzA3P1wxmhonlMxvO+gI5Fh
         oCxg==
X-Gm-Message-State: ACrzQf3QNtMRC8g6zkpBduZirzh80g52uEgO0t2Dgtzco/svbePro945
        VQKwLBZcINOroz1ru0E+Cd0=
X-Google-Smtp-Source: AMsMyM6V12edjWPo9oJFRhZWBJf4bU9MFXH1B8aWIyv6g/fOB/5ajz2OzxMNsvcVzxSnKGQyptGRGg==
X-Received: by 2002:a05:6808:1491:b0:35a:64cd:6b59 with SMTP id e17-20020a056808149100b0035a64cd6b59mr12080696oiw.45.1667925129950;
        Tue, 08 Nov 2022 08:32:09 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id w21-20020a056870e2d500b0013b9ee734dcsm4809511oad.35.2022.11.08.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 08:32:09 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com, marco.demarco@posteo.net,
        cesare.marzano@gmail.com,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH v4 3/3] USB: serial: option: add u-blox LARA-L6 modem
Date:   Tue,  8 Nov 2022 17:30:01 +0100
Message-Id: <20221108163001.18454-3-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108163001.18454-1-davide.tronchin.94@gmail.com>
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
 <20221108163001.18454-1-davide.tronchin.94@gmail.com>
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

 drivers/usb/serial/option.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5ff1b8e1e453..cbc2ba27f74f 100644
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
 
@@ -1125,6 +1130,13 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B */
 	  .driver_info = RSVD(4) },
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


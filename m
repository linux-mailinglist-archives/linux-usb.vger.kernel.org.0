Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521E862C34B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 17:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiKPQAm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 11:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbiKPQAl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 11:00:41 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7D453EF0
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:00:38 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so3087713wmi.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/BF5PL3tMarYSladvLAUAdbHJa8XKRhmvy0pGOiheE=;
        b=pIbGRIzB8p/7/nDoZK1kLmPdHHEq4sGNav0hy8MMoy7BL/oJZyaUDrZuLv9n0fT57/
         ZcknoQvMB9Bc755z8jSt/CTlc7yC+PZjqN/bdWF27nXdYGhI4Uh76pqmmcL4bls4Fuad
         nzfReHBGFjWS0+mMqYdY12MSi8Je+b42V5fslZXAgGEtsBATSRcmnnCruBirEz+mscvA
         4PIc25pmmS0ZFTvuku6SjCZrP4ljF4fT/y6EOE3OdGE/rPLoONmgopK3aNecBAKMlOty
         qbmp+jS/IwQSwMdewmHQJIQVSwaly1ql1+wd1B9r+xWRpcynXdLIFTXmmI8oIConMNRy
         9XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/BF5PL3tMarYSladvLAUAdbHJa8XKRhmvy0pGOiheE=;
        b=LXkkZwCMl4OHQynf0NCQYy7nk3pgOoNJ5S8chEzpNGhe4RfAPptd5/Q0hYWFN/VGY5
         9mKZfZ301Sc3LK77CRSDBp98G2BYJXSMxb4VzpsPDO9Pwc8Sd/g1CcrE0oqrdNLvZ86X
         v8NUdnxzDaSbjzNHJK0Fx+brYZW01TAYijYk3g8EHAar8YF/8K5KMucc9SzBa3Lp+JLx
         BHIZVOh0yx1p1qNER3YkLZUMka+jgS0xTIZid4emDHB56G9dPV9hK7eTdvtqS/anLu0I
         ETWfVHUONwgyQLkdf5BMLLjzqoJ4KjMdBDa9nHqZPTSDrnaQmKtQE+Ssknf5cHQ8IUaf
         Gffg==
X-Gm-Message-State: ANoB5plytEEQz+F4DVD5hK36bLceT2WjdTXln7FaQ+l1gQRIJ7WUlOX/
        kxt+6/jVoOalbtHS5XAa2mI=
X-Google-Smtp-Source: AA0mqf6jOWDWzJmsMevH6gQar0VFxBFMmNAN4WLvzYO2VoFTZ7hjG1S9uCHtnzEeSOGdoF+LDB87Kg==
X-Received: by 2002:a05:600c:3110:b0:3cf:b07a:cd56 with SMTP id g16-20020a05600c311000b003cfb07acd56mr2474350wmo.143.1668614436899;
        Wed, 16 Nov 2022 08:00:36 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id z4-20020a5d4c84000000b00236733f0f98sm15298795wrs.107.2022.11.16.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:00:36 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, larsm17@gmail.com,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: [PATCH v6 3/3] USB: serial: option: add u-blox LARA-L6 modem
Date:   Wed, 16 Nov 2022 16:59:50 +0100
Message-Id: <20221116155950.59609-3-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116155950.59609-1-davide.tronchin.94@gmail.com>
References: <Y3SzfG9ljTbeQyWU@hovoldconsulting.com>
 <20221116155950.59609-1-davide.tronchin.94@gmail.com>
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

V5 -> V6: no changes.

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


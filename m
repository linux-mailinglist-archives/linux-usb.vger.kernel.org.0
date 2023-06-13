Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 598F772E564
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240541AbjFMOPn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 10:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242553AbjFMOPl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 10:15:41 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97003183
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 07:15:39 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f8d5262dc8so3617825e9.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686665738; x=1689257738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWaS+CJma4v2PEuYwDJCWobBb+tqXF9A/d4+Thba9TA=;
        b=oRnTLydP/Q8f0OKPdNtZq1x2lcT34DGTbAM1Wzf8g8ofrBtq7hjt8q2SzMgoXb1mSE
         dA//wdDkNETs5PKvv4hgAKptaYChURorpHZcbx5/TyDz0xC/fhKNyyMQTgCp1HlGfWx8
         1u5pAd4+vnfMdkZiq3Y4MB2mLbeoJ6kdp9xX2FYXjm1lDCllbJs/TUSu8cokqWrgNjVS
         PgcztTvLmEzjLJWHQ7ICx8pjAunmiwomZfjuw5G6W6VTE0SjLz21sAtcGy2HpZGuRd2V
         Hq6w95bP/qRmgKXx2F+5QW/GIDKdjZf27hiEc2qQPVs8mO/vvW+VtAiSlv1UkW+MwuIt
         MrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665738; x=1689257738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWaS+CJma4v2PEuYwDJCWobBb+tqXF9A/d4+Thba9TA=;
        b=cjV0ddkWe5ZStF/MDc3fJAg1ckZAFPYCDAD1G7b0LX1OAxGVSguhJlEiOy/s6G0iwC
         PS38SOLCNuAf7wa2JL7CxPnPlkyhn49wuhHq3IKQAF+2+tZnCVrNoEw9BkHaAMJjh7la
         D/DJjUgPzpVuABoByGOTJzAZcQ8iiFFFc6rFSId8Bkcx2QXnfm+E5PUf1onUusUTKgTf
         ubtuugUrrdrRMmMPCpCkSQ1UslRT6Kf6+m9s6FANiIbRCaNVhEBt7c/Zx0IoWONSflsM
         ubQzvbCs89G0giJVNBGq4v8FC9sBJzBN32xuznY2z5Mb9sf/Nk7YkjPh72322+s9NkAU
         KI5w==
X-Gm-Message-State: AC+VfDxg+tFi85+MIBcVKXjPw5rX8Uc+1WehmZhSjHwmVLZuu+fRxgMH
        gpa5PRJr3L1+TSS0mdKveJ8=
X-Google-Smtp-Source: ACHHUZ6Pc6QHSTD3WsEEG+qzLJxIkmMeTenEPiEVnVWFkDzHX+InKzKOkz6uhJlllk8dRpDa2vvtMg==
X-Received: by 2002:a7b:c44d:0:b0:3f6:774:fdc with SMTP id l13-20020a7bc44d000000b003f607740fdcmr10864509wmi.18.1686665737834;
        Tue, 13 Jun 2023 07:15:37 -0700 (PDT)
Received: from testvm.ubxad.u-blox.com ([176.201.28.4])
        by smtp.googlemail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm15548072wrq.43.2023.06.13.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:15:37 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH] USB: serial: option: add u-blox LARA-R6 01B modem
Date:   Tue, 13 Jun 2023 16:14:41 +0200
Message-Id: <20230613141441.35866-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The new LARA-R6 product variant identified by the "01B" string can be
configured (by AT interface) in three different USB modes:
* Default mode (Vendor ID: 0x1546 Product ID: 0x1311) with 4 serial
interfaces
* RmNet mode (Vendor ID: 0x1546 Product ID: 0x1312) with 4 serial
interfaces and 1 RmNet virtual network interface
* CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1313) with 4 serial
interface and 1 CDC-ECM virtual network interface

In default mode LARA-R6 01B exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions

In RmNet mode LARA-R6 01B exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions
If 4: RMNET interface

In CDC-ECM mode LARA-R6 01B exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions
If 4: CDC-ECM interface

Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>

---
 drivers/usb/serial/option.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 644a55447fd7..5b684b6f5969 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1152,6 +1152,11 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) },
 	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1343),		/* u-blox LARA-L6 (ECM) */
 	  .driver_info = RSVD(4) },
+	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1311) },	/* u-blox LARA-R6 01B */
+	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1312),		/* u-blox LARA-R6 01B (RMNET) */
+	  .driver_info = RSVD(4) },
+	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1313),		/* u-blox LARA-R6 01B (ECM) */
+	  .driver_info = RSVD(4) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
-- 
2.34.1


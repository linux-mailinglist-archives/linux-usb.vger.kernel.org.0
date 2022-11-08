Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0EE162196D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Nov 2022 17:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbiKHQcJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Nov 2022 11:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbiKHQcI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 11:32:08 -0500
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FCC5801B
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 08:32:06 -0800 (PST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13b103a3e5dso16821193fac.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Nov 2022 08:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xUydB8ozGRsYrtjyMvCmLoNR8fpkfFh1yhDp6+Qbso=;
        b=qlgIpwDdS1ntMFE2fJ3hLSP7xRszaEtbT5SUcUAFu4M2hsFFR5x6qhEUdtVakF6EuK
         J1O4m0qHjPCOmnNbpXcegou950ZIxxDI8+i8DQbBzYDGJFhFmXKfQ8JmByDQaxf2TYY7
         Z4LuSUp7fG3x4l501PNKE1TK8QrGE6M2JNQOHx7jURBE0zkbPYJBlE3d1F+kzwVddYrm
         BYHFrrZfcSlyETow/tKSTQKeMp/Jt7Y6BMMM0j4EPwRwrmBGjdmcCdKUyUx3pVEijmEZ
         Vki8lx+mYjbFFqZHOqF5TWr7BUy8vla7wGPyOxv6jXaHagD/0a/3/oHP/YJ8Mbiziuhi
         ZoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xUydB8ozGRsYrtjyMvCmLoNR8fpkfFh1yhDp6+Qbso=;
        b=eS3Lxon/Ob8mvugmBiszqwJ4mk51E1Gb62NVzBC3zV7ihwMBHPGyR57QPPwalBFhiF
         FjZSoishL1ECVPznpRLAk9cfyQiVbQST8fAsc4WBFdVlUX6c1orZd8OfMmeo0l0ypLBj
         BH69j1rsgmIFCH0zQe9djArjlpxIu11/1iUmffIQLfxnUX8/44J1hlExC+YeAKOTspbi
         a0ylZkaSrVxR4gH7/NsQKv7dKEGsRh7xQK9ElVfj+Ji+yPkXjL7l+M7LQfaBBSNbyC8P
         eU1iyV51FhfeZe2kCNOxoIj8CpMVNL3KI7qN7jlASWWTmG1owouvaXcu5fP5pYg7+ga7
         I56g==
X-Gm-Message-State: ACrzQf2g6QMJ3sWThj4/QGJ9LA7MBtPNF8SL4NxDJERZ+/h9Uh9VoFZQ
        hnTcecqlV4ycyQFWnHI+AVnZhvveUTSI6g==
X-Google-Smtp-Source: AMsMyM7kZ527yGzXCloLr+rZgvsDIqcnSvLfcpPnedvJ0gdrYpRC/l3T1Yddfy3DXHwaWQZBqdttlg==
X-Received: by 2002:a05:6870:a924:b0:136:faab:a730 with SMTP id eq36-20020a056870a92400b00136faaba730mr33419543oab.289.1667925126097;
        Tue, 08 Nov 2022 08:32:06 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id w21-20020a056870e2d500b0013b9ee734dcsm4809511oad.35.2022.11.08.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 08:32:05 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com, marco.demarco@posteo.net,
        cesare.marzano@gmail.com,
        Davide Tronchin <davide.tronchin.94@gmail.com>
Subject: [PATCH v4 2/3] USB: serial: option: add u-blox LARA-R6 00B modem
Date:   Tue,  8 Nov 2022 17:30:00 +0100
Message-Id: <20221108163001.18454-2-davide.tronchin.94@gmail.com>
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

The official LARA-R6 (00B) modem uses 0x908b PID.
LARA-R6 00B does not implement a QMI interface on port 4,
the reservation (RSVD(4)) has been added to meet other
companies that implement QMI on that interface.

LARA-R6 00B USB composition exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions

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

 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 068c65228d4d..5ff1b8e1e453 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1123,6 +1123,8 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B */
+	  .driver_info = RSVD(4) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
-- 
2.34.1


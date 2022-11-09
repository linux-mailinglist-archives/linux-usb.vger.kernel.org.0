Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4FD623000
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 17:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbiKIQRj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 11:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiKIQRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 11:17:38 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31C326E6
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 08:17:37 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id r76-20020a4a374f000000b004988a70de2eso2528819oor.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Nov 2022 08:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96b5it/rsfCLhVTC3MwhIcgPFmRjvtLLHqS3PUyf24U=;
        b=fK/1YonAcE24inhPk2nnKEUO1j+HmvZsYDF0RbK8njM0cldqY8+rE8sa5/iW3nUm+B
         +gxjZaKoBKTLXFKUqxO7Ow1X9TQlSFMKLJLnWkNhoq3KvbC+qk1INZjfbE/pwArWOFLP
         IuBtPZxMjmaG8J2fdz3aaRrg6zyP7h1niezmf0i0XBd2RTFGGpXeAgBdW+OztGSXS/DI
         CE1qa69a87UK0hFQM8dOJvQjQkwjx4dsuD9n2FweB4CaYrvZg9Mny9GIrnEqajI5q8vr
         gZBgRO9y/XfEJYdCvLZ3V5X/RRBOKwJeKPpl5a68x36jBX+hYPveRmXlRvP/k6zzy4kn
         s22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96b5it/rsfCLhVTC3MwhIcgPFmRjvtLLHqS3PUyf24U=;
        b=pAkIcQ8C6JKAY9rx965iORDcBwoxH3uiAA6KBAqPi7U7du6lx1N0zDyxgbnTajKaPm
         gFG9Ir/anQk2+k6zarZGhBVFZAg+ueP55RI+rTmwjEIikdoSwHbp7/XknYqk4XH9XZuX
         DB+uAHl7xf6oCoJdf1PG1k6N9ATkifGKTA6FgrPM8vBrhzdo6D3RqdCsOTY7dYQd1Zy4
         caAd47KK32YWWp0oBdHMpbX9H2PJ7PDSmzah6VB5xWvyNNzvC6Qyzfk+6SB8jiDWduiz
         Tz+AazU84pOyvr4+1RJzUxzVPeTZfu+4J5r5D+qkpxuN161cks4wjUrFhGfQyoczCMLY
         aSrQ==
X-Gm-Message-State: ACrzQf00HVQyQ+ZLH+8VL16TSm3jlpYp+wXBE7w6mUNrqQsPZ+9w4C1Z
        E7B04okniijusxw1Vv7oHl0qJ5NJYMfbrQ==
X-Google-Smtp-Source: AMsMyM4vDOBP0PeGcndfrdg18zsB+IySgWKf1Qv69W4XGazJZkyeF2+hUV+4S2YP9iSmVfXMNM0sHw==
X-Received: by 2002:a4a:d18b:0:b0:48b:f37a:c28f with SMTP id j11-20020a4ad18b000000b0048bf37ac28fmr836787oor.36.1668010657256;
        Wed, 09 Nov 2022 08:17:37 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id i5-20020a4aab05000000b0049ded99501bsm4302578oon.40.2022.11.09.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 08:17:36 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     larsm17@gmail.com
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: [PATCH v5 2/3] USB: serial: option: add u-blox LARA-R6 00B modem
Date:   Wed,  9 Nov 2022 17:17:12 +0100
Message-Id: <20221109161713.31723-2-davide.tronchin.94@gmail.com>
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

 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index b93285b5175b..011b9a3b7571 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1125,6 +1125,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x90fa),
 	  .driver_info = RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B */
+	  .driver_info = RSVD(4) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
-- 
2.34.1


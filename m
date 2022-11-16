Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9967562C349
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 17:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbiKPQAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 11:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbiKPQAi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 11:00:38 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFC754B12
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:00:37 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1792759wmi.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99iN2muXf3LYHGvj1LvW8cBY3gJlJH9QBzqMI5gm9A8=;
        b=Gb5IIO8tFL3CRunh5R9w7s6AQ9NedcM3dHnv38y9cGXwnOE+QMLedKFUB38Ji7D4ur
         gSjM+vudV+DA36V968tvXQabYQaXYScnAkxio8iRZBFdvpUkO8MTzOjCTagL/0nX4sFM
         riW9dBAIea0gposOBV+lpNLjZ4iAX6Nu6sz+Eqo67bEw76euu0W2oZfe6k8Tyy7Oakrc
         +rZxTmJz1+2sPt9+7ER91viPiXKgt/8/uPxHYU8vRg7/WOS+WV73LXEAkRa0ma9YnqhJ
         53AbxVezino8Mktlytmu/pj6oGJMsw2yAal1mzI58l/u7p/YbO7gL48ZwN1ikOqIrCrR
         SSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99iN2muXf3LYHGvj1LvW8cBY3gJlJH9QBzqMI5gm9A8=;
        b=ZwI0MgdCQ2diPY434CNPFK5EzInjG8sAvwz8vzBBWwQYc8gFOaSGI3y91Ac8IMhBI+
         npLVUES1H3EHju6DuT1FGwNnDPM8z64ZOAVREHinKOQcSM1Nq3hmiY9VAwu/SHDRjux7
         jusKpoNDXgqgnQMZq2PPzqo89RYdtHCliZwbFJ5h46QUJSPqYI3DhA/e2ZeWYqDwI5h+
         60V8fs4ZEKRdlgbGnvortIxqHpxXs2EPPyGhrjjaGAKVMfKpM07Ne/9/EpruVeLSlTX6
         XXa1/3VX3isghaC9z5fw3MWmT+GRuG7dZivdttm9EgTJaD3AObE/YWfjZwW2EjPols7w
         9bfQ==
X-Gm-Message-State: ANoB5pkKhDG2tRlvufL5nfaUKHjzovSXhTrRZZpot+dsuQ2WsYXWgNnZ
        SN1JZfzdKeDjx0zFQhpnyVY=
X-Google-Smtp-Source: AA0mqf5y+1VXXVLau1bOIvpo4i8Q5OVfZ0RSVd6Uf96FmL1t0+sQJ2a3mW9BUoMmolkqG87kXYCc9Q==
X-Received: by 2002:a05:600c:43ca:b0:3c6:7abb:9d2b with SMTP id f10-20020a05600c43ca00b003c67abb9d2bmr2453985wmn.182.1668614435643;
        Wed, 16 Nov 2022 08:00:35 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id z4-20020a5d4c84000000b00236733f0f98sm15298795wrs.107.2022.11.16.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:00:35 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, larsm17@gmail.com,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: [PATCH v6 2/3] USB: serial: option: add u-blox LARA-R6 00B modem
Date:   Wed, 16 Nov 2022 16:59:49 +0100
Message-Id: <20221116155950.59609-2-davide.tronchin.94@gmail.com>
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

The official LARA-R6 (00B) modem uses 0x908b PID. LARA-R6 00B does not
implement a QMI interface on port 4, the reservation (RSVD(4)) has been
added to meet other companies that implement QMI on that interface.

LARA-R6 00B USB composition exposes the following interfaces:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: AT parser/alternative functions

Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
---

V5 -> V6: text wrapped correctly.

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


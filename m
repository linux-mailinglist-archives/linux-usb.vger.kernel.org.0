Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D25500809
	for <lists+linux-usb@lfdr.de>; Thu, 14 Apr 2022 10:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbiDNIO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Apr 2022 04:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiDNIO5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Apr 2022 04:14:57 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAF94DF62
        for <linux-usb@vger.kernel.org>; Thu, 14 Apr 2022 01:12:33 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id r13so8563186ejd.5
        for <linux-usb@vger.kernel.org>; Thu, 14 Apr 2022 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v2n+GjG01xa9HRFegeiofvxkOclmikMIqrENwF7ZyPc=;
        b=nvIQDTYIyRhlvA1eGhH94ZDI+5IOHNF8/mQsnevR5HUAYoONm/UzfmeQb/+I6bP8w4
         eIOEdaCToXdzuKTfOL1kLlzCyfBCsphVnYfcTmEXI6QHKvynQvBuGrUHfG2DMx0+9PMG
         3m5P0t5kskTuPZACbnADQgbQIym/NtPzWJRD0XzLK+VFoC7Js+MBkVo2uGYasuFXOmx6
         eFnZT0FOx3bipvNJDcdboaO4VsXfKOMdYp2RD8aewTGfo53+soUfm6cj/m62nkHlAIWu
         vCbN4bKVKNMt83UFlkiXPCXBbLaUlrCx6Fw+wRYRd/agUiyeWne9nlJEwz9D3jyshFzK
         4NFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v2n+GjG01xa9HRFegeiofvxkOclmikMIqrENwF7ZyPc=;
        b=IjZpXTSMdeqZLCfEtrAbqoZzdcKqnHEVSR1mFByjMakK2OzHwg1tptfHd/Rho9XZSh
         /0qphCqJiZXDshMQTE1lSmdkTuy4aDlXVyN+oUvZK9K3GrvMtoIDuimDqYNuSU6wBmdv
         2wqBWZXfHppcs6MAmCujfeBmMQiZVS8jN3XBuyIVhy/TjVzbGZz6N+FzyZbFWpCSup+S
         bGPAHOwGBCnmSWM3f8+U+z1wpOi3EN/3W9Dx1dA/rLudZJY4qnPIQImbgcS8ELtoERBi
         FIshDaR0Cy5HU6N28VXZves16XXboyAZmMa3ILUvgv20KdBad6RqJgiFS69J8pP9WiE3
         JcxQ==
X-Gm-Message-State: AOAM533D0JC9vpvtlp0Vt3Bi0GtB1cv7pcDwO5E+Rrm0E3Fh93/ldflz
        8eE1h4cnfAzHaHmRO6m7bZO1BE28HQ0=
X-Google-Smtp-Source: ABdhPJyePrJp9zsHv4h2GxCubdv222UREzl4xBWq5SgjG6kud9qtDopIRJEJ43QBA25aa327BSBj9A==
X-Received: by 2002:a17:906:40da:b0:6ce:51b:a593 with SMTP id a26-20020a17090640da00b006ce051ba593mr1357077ejk.604.1649923951502;
        Thu, 14 Apr 2022 01:12:31 -0700 (PDT)
Received: from localhost.localdomain (3e6b100e.rev.stofanet.dk. [62.107.16.14])
        by smtp.gmail.com with ESMTPSA id eg12-20020a056402288c00b0041fb0f2e155sm688171edb.20.2022.04.14.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:12:30 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH] USB: serial: cp210x: add PIDs for Kamstrup USB Meter Reader
Date:   Thu, 14 Apr 2022 10:12:02 +0200
Message-Id: <20220414081202.5591-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Wireless reading of water and heat meters using 868MHz wM-Bus mode C1.

The two different product IDs allow detection of dongle antenna
solution:
- Internal antenna
- External antenna using SMA connector

https://www.kamstrup.com/en-en/water-solutions/water-meter-reading/usb-meter-reader

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/usb/serial/cp210x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index a27f7efcec6a..ef36942f0acc 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -194,6 +194,8 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x16DC, 0x0015) }, /* W-IE-NE-R Plein & Baus GmbH CML Control, Monitoring and Data Logger */
 	{ USB_DEVICE(0x17A8, 0x0001) }, /* Kamstrup Optical Eye/3-wire */
 	{ USB_DEVICE(0x17A8, 0x0005) }, /* Kamstrup M-Bus Master MultiPort 250D */
+	{ USB_DEVICE(0x17A8, 0x0101) }, /* Kamstrup 868MHz wM-Bus C-Mode Meter Reader (Int Ant) */
+	{ USB_DEVICE(0x17A8, 0x0102) }, /* Kamstrup 868MHz wM-Bus C-Mode Meter Reader (Ext Ant) */
 	{ USB_DEVICE(0x17F4, 0xAAAA) }, /* Wavesense Jazz blood glucose meter */
 	{ USB_DEVICE(0x1843, 0x0200) }, /* Vaisala USB Instrument Cable */
 	{ USB_DEVICE(0x18EF, 0xE00F) }, /* ELV USB-I2C-Interface */

base-commit: a19944809fe9942e6a96292490717904d0690c21
-- 
2.35.1


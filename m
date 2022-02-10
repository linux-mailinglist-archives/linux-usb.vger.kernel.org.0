Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADC54B133F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 17:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244599AbiBJQme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 11:42:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244605AbiBJQmd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 11:42:33 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80645EB3
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 08:42:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k13so11517224lfg.9
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lh4ofncWXT6TD1R3xVW4trQeOONfJi5pHo5hLIr/Iq0=;
        b=VBrDoXqyzSH1F+EPhcikZrT01VBce5i99sJ0D6FN+Nr934UZ9a0r/t7EDJENSVU4dR
         hV+b+EN/CL9CD5cEGzsiVdyU2sZg67WLt4yrCNy4K6aLGa8MUdVVt5hnGXV3sN8mUjBQ
         Wz5V8hqrrmjA2GuITDCksHLnP8r6PCjsrS+bPUjoCQYFhsq87SN86jI6cJ31+JuGL3wo
         9uxM6mdyAfHZwJ+IfYh/K6NwYPwJS3MsIByyeANxIuGL0SzxAWap7vMCNoKwnK6SLcRF
         0fKMa6hlRCLKPtunis3iRQv1j87Op2PyQ0LZAsl+ZORi1qg7gX/80bvaVbrSCCgfywGJ
         5uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lh4ofncWXT6TD1R3xVW4trQeOONfJi5pHo5hLIr/Iq0=;
        b=6SvQE+1sSWG9sDSFNLdUFV7GdQgpI4ST0uhSUD7uShatsmE+zsqdUyvIPLs6/JZiV4
         nMcLSrUwXYVlNbBDfbmPW6PPY4e/MOWO0zp5FE7Jtba4e6oayM0pZkw/9B2Iegin/4qN
         HQR80YDopjA0ZjYkeeeAH7Errwytm+R8cOvR/vdy9hGm82cC1XgqlGT/xjyqlWy4x1wu
         8d8mqS2/LyBP1mVFKom1S/WG6Tk0LPS0LyLlgTigchdnIILs5xaEA/DR7ymo7Hgmq9gP
         fOE4H71yZEP8W5O946QvTxCSjeb1cJUvwpPr7xZJyoaAvAcTAaUrxO/lLaEJ1CZrkstF
         BIdA==
X-Gm-Message-State: AOAM531jeuMYVxXa/HKWtb3qm2bLEESSLd0r9dVe2mCqvU5OWeIyFBeY
        Y9/qcnXST7SOgHfeQ4s+Ve/C1xmQemaenw==
X-Google-Smtp-Source: ABdhPJzcLYKUj8hWUDrbd+LptZF//ECtRI2uMa1S6jepSBD+Eku1168wcEcIdiGE5t7rd4WSMer/VA==
X-Received: by 2002:a05:6512:3b27:: with SMTP id f39mr5892198lfv.659.1644511324013;
        Thu, 10 Feb 2022 08:42:04 -0800 (PST)
Received: from dimich.home ([159.224.14.39])
        by smtp.gmail.com with ESMTPSA id s26sm2941622ljo.117.2022.02.10.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 08:42:03 -0800 (PST)
From:   Dmytro Bagrii <dimich.dmb@gmail.com>
To:     linux-usb@vger.kernel.org, johan@kernel.org
Cc:     gregkh@linuxfoundation.org, kernel@aiyionpri.me,
        Dmytro Bagrii <dimich.dmb@gmail.com>
Subject: [PATCH v2] Revert "USB: serial: ch341: add new Product ID for CH341A"
Date:   Thu, 10 Feb 2022 18:41:37 +0200
Message-Id: <20220210164137.4376-1-dimich.dmb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YgJHRKQHQheKTwjU@kroah.com>
References: <YgJHRKQHQheKTwjU@kroah.com>
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

This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.

CH341 has Product ID 0x5512 in EPP/MEM mode which is used for
I2C/SPI/GPIO interfaces. In asynchronous serial interface mode
CH341 has PID 0x5523 which is already in the table.

Mode is selected by corresponding jumper setting.

Signed-off-by: Dmytro Bagrii <dimich.dmb@gmail.com>
---
 drivers/usb/serial/ch341.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 29f4b87a9e74..65f1286f7905 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -81,7 +81,6 @@
 #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
 
 static const struct usb_device_id id_table[] = {
-	{ USB_DEVICE(0x1a86, 0x5512) },
 	{ USB_DEVICE(0x1a86, 0x5523) },
 	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
-- 
2.35.1


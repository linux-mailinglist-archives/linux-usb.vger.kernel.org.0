Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D60674AB2E8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Feb 2022 01:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiBGAMG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Feb 2022 19:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiBGAMF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Feb 2022 19:12:05 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236EDC06173B
        for <linux-usb@vger.kernel.org>; Sun,  6 Feb 2022 16:12:04 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z19so23599727lfq.13
        for <linux-usb@vger.kernel.org>; Sun, 06 Feb 2022 16:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+kvHqZzoPoV0HMi03Ju1t/2vTzq3AtQspm04nXEZWxA=;
        b=qNPw2v4bVoFhfnwygm6tpno/NNovHATu/vazAEdN5UeHCbWT7ng+BxjMfWs1wZKQ7Z
         Ob2dNss39uKkaeS59okaIcJ5V39qxzY1axolFvIIS5Lu98MlOpsBh7s3ks/E/2UUYvVZ
         CKJdV9AiQ3j+fVW4AyAWwzWpcIYZ0nTNSXwxZctQf3GrIrDUXlDC0mAwbaqBiF03yiCJ
         mrEEsDHS5T4nV/H98FCFl+ZrAedaksQGwqwoTAHcbRFQp6i3p9m1lln8+GhLqBgiOQM+
         CmPoeFfGZxzmpgS8LeeYTSd3xWlD+C2fL5LMFcBhsLxbuHhix0PMsxSNZ3Np8IuDpsYh
         B4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+kvHqZzoPoV0HMi03Ju1t/2vTzq3AtQspm04nXEZWxA=;
        b=dsGHfuYyspYv9FhyGe8bqO3tsOxlIwdYXKglfbAHvEnf9oCvvaYqO8q++oz57ui6IY
         mzqDPr1nbYSaEKXHO36RqL/dEeppRBJijKo3oUfHRbgg0q0r6v7KYf8RjqinAAbZ+gh1
         6qC1R7h0L4ZEVxeZeTbyAeS52Pgi3+zZ0DGVGG1kTGCDy8UWC7pYnPiRIHgUU9jMUVkk
         0bowUcLQvWjc0N0qznXnsMozs+J/I43t3+AICf89a9vCnJGuO+wRc+qZvv/eWd4oIAGh
         xN29U7DO+c++MfYVkSdlw1xK9ef8bB4ER2TH0rF0wp2pe0qz8ifItn8uMJWR502rDCqn
         Zeng==
X-Gm-Message-State: AOAM533zBaDhB/tdfKpPcs0qnpeM3z6so+WOMzIbrxk/eHfDaNwKZLrr
        Y7jAPNPALZwB6QR6eLpYI1YCyIHm1lg=
X-Google-Smtp-Source: ABdhPJyCYp2+O4n+JfITj9J3VtAvUp/93nk6M7YIQK6iiK2vF6BVRiPlFLyQpfVI17SEmkw/tLjXLA==
X-Received: by 2002:a05:6512:1192:: with SMTP id g18mr6359624lfr.405.1644192721856;
        Sun, 06 Feb 2022 16:12:01 -0800 (PST)
Received: from dimich.home ([159.224.14.39])
        by smtp.gmail.com with ESMTPSA id n12sm1390540ljg.87.2022.02.06.16.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 16:12:01 -0800 (PST)
From:   Dmytro Bagrii <dimich.dmb@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Dmytro Bagrii <dimich.dmb@gmail.com>
Subject: [PATCH] Revert "USB: serial: ch341: add new Product ID for CH341A"
Date:   Mon,  7 Feb 2022 02:08:23 +0200
Message-Id: <20220207000822.697343-1-dimich.dmb@gmail.com>
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

This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.

CH341A has three different modes of operation selectable either by
hardware pin connections or by external EEPROM configuration. Each
mode is represented by corresponding product ID:

0x5523: Asyncronous Serial Interface
0x5584: Parallel Printer Interface
0x5512: EPP/MEM Interface

(See "5.3.Function configuration" in datasheet at wch-ic.com/downloads/CH341DS1_PDF.html)

When CH341A is configured as EPP/MEM Interface it appears as 1a86:5512 and being mistakenly
handled by ch341 USB serial driver.

It is possible to use CH341A in EPP/MEM mode only if ch341 module is blacklisted, but it must be
unblacklisted every time to use CH341A as a serial converter. Also obviously it is impossible
to use two CH341A boards in different modes simoultaneously.

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


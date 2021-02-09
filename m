Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7331C314EEF
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 13:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhBIMdD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 07:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhBIMdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 07:33:03 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7829C061786
        for <linux-usb@vger.kernel.org>; Tue,  9 Feb 2021 04:32:22 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id y9so30962149ejp.10
        for <linux-usb@vger.kernel.org>; Tue, 09 Feb 2021 04:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CWVbWMy02aiBxLkPLcMyfNOVERNn6cRPM0WaMpYN58=;
        b=ZkeuW7GCbZb+mqOTc1rDs0fFr192DetmmFEuKYFD1Sg7O4oYHIAiXM/OQHDvIQicuq
         Ug7fChg1iqXrDKH2mwUxxYXG6ITnT3ZxE7nwTAfW2s77eFTSw+hymgmj23bfADAExKQ9
         +teoZeE0l4Sp7FUBQzg12CtP3FVKtQktx5bQMkopngVR7BNeCCvWZb7zwq1CH8QBLwBT
         xqux0qv8UhUS0kBkyXIx79XaPTUCi2wKnDt5+6RmH41n7GrE28u/Wrt/uJdiLS6ii3Uv
         ci4AnJin+8dK+18oKnmm8F3QA80itqebNDXAgEhjJb0TdOE7NmvbGOd/g0OUKX2Jyzke
         cvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=1CWVbWMy02aiBxLkPLcMyfNOVERNn6cRPM0WaMpYN58=;
        b=g800BlUFL4b9lrup+QfcxfjoO3u3wn12PsZ9BoBeOVMfVXY1TIq7XqJnR7opXZBu3l
         NHL1ot3eZXwjjsuVbTwZDMGuunmABmEi4XBtlOP089cA2I1303aAiLyP8rezZEFISmf/
         eAUasz+pfLbW8ORwPqM7nGPYvF0E1lQcdbAhAaSlxsiKj5JHqLK8GK+6SHIoRPY3VZV+
         exLI8SiWIbhjxZ0lg3jgyEfN77P6ERpjDRjaL9fZLmIKfx41aONL9xrxwXxFseF+VTSc
         KTF2ZiyHcqECQUkzya4kGEsuDhI5gWD5cXzrUEy+fAMgwNrTh9H3O0NA0nBqacoxJa+A
         jLiw==
X-Gm-Message-State: AOAM532/KYW3P/cDFsbsnGev3FSr/Oueq93Xsw2JYhup7ANYKQ2a/HY/
        GdNV4joEHaELmNamQEIHeooUbQ==
X-Google-Smtp-Source: ABdhPJxrml0k+smViydxGYN1l4mfREZt00owdYjiBWzlGWr0xpLAVoXDqabbN1aAB7c7SPB5bX3olQ==
X-Received: by 2002:a17:907:2130:: with SMTP id qo16mr21250551ejb.537.1612873941381;
        Tue, 09 Feb 2021 04:32:21 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id a25sm8522252edt.16.2021.02.09.04.32.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 04:32:20 -0800 (PST)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com,
        Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: misc: usb3503: Fix logic in usb3503_init()
Date:   Tue,  9 Feb 2021 13:32:19 +0100
Message-Id: <a8547f6fe698014df08cad3bcc9c5d9a7137d8b8.1612873935.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Based on
https://lore.kernel.org/linux-arm-kernel/YCJv59g3Tq2haDSa@kroah.com/
initialization should fail if any registration fails.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Also remove i2c driver when platform driver registration failed.

 drivers/usb/misc/usb3503.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 48099c6bf04c..330f494cd158 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -409,13 +409,18 @@ static int __init usb3503_init(void)
 	int err;
 
 	err = i2c_add_driver(&usb3503_i2c_driver);
-	if (err != 0)
+	if (err) {
 		pr_err("usb3503: Failed to register I2C driver: %d\n", err);
+		return err;
+	}
 
 	err = platform_driver_register(&usb3503_platform_driver);
-	if (err != 0)
+	if (err) {
 		pr_err("usb3503: Failed to register platform driver: %d\n",
 		       err);
+		i2c_del_driver(&usb3503_i2c_driver);
+		return err;
+	}
 
 	return 0;
 }
-- 
2.30.0


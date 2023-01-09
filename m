Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1846624CC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 12:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236907AbjAIL4j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 06:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237134AbjAIL4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 06:56:14 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEF113F71
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 03:56:05 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id dw9so7047099pjb.5
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 03:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Vznj+13ypsaoc19aLWfxS3PvpF+FOZcecypmoCNgo=;
        b=QZxwtDxPI5BTGi7OGpvHy1y1wUAR1yhBtFesrRgWJR1aKff+S8crmVm9MMNUTa5B5u
         vR5zIeHlbMBr3wUMwKzVDXVJg8KiUXykN5gY0tju+Oxtc8QCFqvVKmXPCI0yTcUjkdAo
         +k+8FTxftvhKGBkwbv5qdDBe4Vil28XNzX9HoyvHUadqvEWqV5DmSlfPCC6src/B7Y9Q
         1J6tHG2sLfrtvNPSxXcJNafuHxqZhgkCskprSzsZzgJiMTbYg3MQVPLEeK1vIZZ5NuE3
         jCojbkPR8rO4Clj3XuKiirDddmaoT18MFeH8xGqSo2HcsF2LPgtDNwyxDTIjkez0Vajv
         MFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2Vznj+13ypsaoc19aLWfxS3PvpF+FOZcecypmoCNgo=;
        b=A5shkX+pXdklcB3JZgkkmwMOuUoy/tht7IIfJT/zv5GmOlciTdDw58zrPOmYDo9sGW
         2XkUPtS5pIjxrQxn/brTljkDslSH0m6W5nPMlztoasYuahj2CWrszqvzzATRvRVGSD+N
         plMr4QBmEEqnF2bSW9a1Ltaueo/PFd2odEt341vZbGb+M14EtFNqqyO3ZPHdI44GjiL0
         NkfOnOgBK62rcoszo48FNgQIJfBsituH4je4+6d5/d0r6l0xpM2cZa1Z7szLdf4o54N7
         FX2hkhllEWdevEQnEkRQFykY9XDSJdR2r+tIfMUKi3AhTWrwI/Rx13+RoxlBS+fQ9SqD
         WjuA==
X-Gm-Message-State: AFqh2koKGmP3akKEBdtfbeyWBnl8CKhpRkgvy5XNiHJbPpXLIj44zdig
        XsicJbgwk3yfaIM5LDzFPZz03RMXrYxBDA==
X-Google-Smtp-Source: AMrXdXu/jPpFHoy+IRD3B/lr9RdK1JzQSMZdvIK0xyxhZYN0ZbKq9XHaQvrILKtQrZKh5isuJgyqug==
X-Received: by 2002:a17:902:d584:b0:193:23b6:d23b with SMTP id k4-20020a170902d58400b0019323b6d23bmr7342333plh.16.1673265364049;
        Mon, 09 Jan 2023 03:56:04 -0800 (PST)
Received: from localhost.localdomain ([218.150.75.42])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902680700b001895f7c8a71sm5998518plk.97.2023.01.09.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:56:03 -0800 (PST)
From:   Juhyung Park <qkrwngud825@gmail.com>
To:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, zenghongling@kylinos.cn,
        zhongling0719@126.com, Juhyung Park <qkrwngud825@gmail.com>
Subject: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
Date:   Mon,  9 Jan 2023 20:55:50 +0900
Message-Id: <20230109115550.71688-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit e00b488e813f0f1ad9f778e771b7cd2fe2877023.

The commit e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
blacklists UAS for the entire RTL9210 enclosures. Realtek's VendorId is 0x0bda
and RTL9210 enclosures reports 0x9210 for its ProductId.

The RTL9210 controller was advertised with UAS since its release back in 2019
and was shipped with a lot of enclosure products with different firmware
combinations.

If UAS blacklisting is really required said product (Hiksemi USB3-FW), it
should be done without blacklisting the entire RTL9210 products.

Fixes: e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hongling Zeng <zenghongling@kylinos.cn>
Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 drivers/usb/storage/unusual_uas.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 251778d14e2d..c7b763d6d102 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -83,13 +83,6 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_LUNS),
 
-/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
-UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
-		"Hiksemi",
-		"External HDD",
-		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
-		US_FL_IGNORE_UAS),
-
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
-- 
2.39.0


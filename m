Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC62766D5EF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 07:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbjAQGK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 01:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235641AbjAQGK5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 01:10:57 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88594ED4
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 22:10:54 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id dw9so29891601pjb.5
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 22:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4POQ/7RyVtitf5QxGrFAfHpoXo0SBtVp/9V8qpMpoDg=;
        b=T47i/krfvTQ7D39inYNArZm8Xpt5vSz0paNvC+IoC9+pGV+RfrilgvHqbE2PlpwIbE
         4b6sSsGq0YvKYsINwwGw6SELQVMv7gAZsFePEF2mjOSqhQ53/yHef2axDEbSEAwUj/kZ
         wdL114m1sh3uJ5p4SAJ6F61arnctDOb2EywaJ+K2K/u6eOfl97hP8Hm79TH4oIEh2jPL
         bKmrLvfJ6hluJez75YJZ/AFOzYCIpkdx68UoTL3hvUisQpxOGMjaMgvAYgsIvsIh9jUU
         L78SHPj8vFDgsuY76A21ZTHBAAE40689a7siom9lU8menMTh5FEVgUTSY6ZN3RNzm2go
         Ck8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4POQ/7RyVtitf5QxGrFAfHpoXo0SBtVp/9V8qpMpoDg=;
        b=8AqGvXz+8Gd/tu42XmNgege5v355B6hHahDnRFQaLvxzkxGEo1Yt3EfhonFuywb4AB
         rkSxqGgEYHDQYFoIZ59li39K3fIdv/or3MsCLNUB5oQhBqedYYQsbAPnEZko1HjykxOo
         hXWJI6N2bhCmTvz6TGXOGG0bj50VVPEvRzUIab2Vi11Y6ii7LrZC4zr4RsWZhwWC+iGa
         QqyPJpafIvWgGo8xiwsr8TFBSwCT0EK8qSrjcyyluNF9VXZFDFbbC3unphjaz/rxr6Lu
         x9rO2A7dh3rHQMWABuQ5t8ATlsMuygK3xuhSLx+co0JcWg2zVmBxAlBksWyGz8XRkkmE
         fX+A==
X-Gm-Message-State: AFqh2kogLL5/GA/mzb1gEh2gZSFEO9tBqLQVnoWE1eznRFHr6UNhw3Wg
        Ibxg8l22/ZoXn0GVXCDB54sGEYrs9Suqpw==
X-Google-Smtp-Source: AMrXdXvLg9Fv/SQS0AkazdSyVndI0qcartL9XUFAtZcl+Ik62ly48TaiCT7xfApA3Qo8wy32LTjYrg==
X-Received: by 2002:a17:902:cf8e:b0:192:6464:f433 with SMTP id l14-20020a170902cf8e00b001926464f433mr26291443ply.1.1673935853637;
        Mon, 16 Jan 2023 22:10:53 -0800 (PST)
Received: from localhost.localdomain ([218.150.75.42])
        by smtp.gmail.com with ESMTPSA id u20-20020a170902e21400b0019311ec72e8sm4617287plb.253.2023.01.16.22.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 22:10:52 -0800 (PST)
From:   Juhyung Park <qkrwngud825@gmail.com>
To:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, zenghongling@kylinos.cn,
        zhongling0719@126.com, Juhyung Park <qkrwngud825@gmail.com>
Subject: [PATCH] usb-storage: apply IGNORE_UAS only for HIKSEMI MD202 on RTL9210
Date:   Tue, 17 Jan 2023 15:10:46 +0900
Message-Id: <20230117061046.114145-1-qkrwngud825@gmail.com>
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

The commit e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
blacklists UAS for all of RTL9210 enclosures.

The RTL9210 controller was advertised with UAS since its release back in
2019 and was shipped with a lot of enclosure products with different
firmware combinations.

Blacklist UAS only for HIKSEMI MD202.

Fixes: e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hongling Zeng <zenghongling@kylinos.cn>
Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 drivers/usb/storage/uas-detect.h  | 13 +++++++++++++
 drivers/usb/storage/unusual_uas.h |  7 -------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
index 3f720faa6f97..d73282c0ec50 100644
--- a/drivers/usb/storage/uas-detect.h
+++ b/drivers/usb/storage/uas-detect.h
@@ -116,6 +116,19 @@ static int uas_use_uas_driver(struct usb_interface *intf,
 	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
 		flags |= US_FL_NO_ATA_1X;
 
+	/*
+	 * RTL9210-based enclosure from HIKSEMI, MD202 reportedly have issues
+	 * with UAS.  This isn't distinguishable with just idVendor and
+	 * idProduct, use manufacturer and product too.
+	 *
+	 * Reported-by: Hongling Zeng <zenghongling@kylinos.cn>
+	 */
+	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bda &&
+			le16_to_cpu(udev->descriptor.idProduct) == 0x9210 &&
+			(udev->manufacturer && !strcmp(udev->manufacturer, "HIKSEMI")) &&
+			(udev->product && !strcmp(udev->product, "MD202")))
+		flags |= US_FL_IGNORE_UAS;
+
 	usb_stor_adjust_quirks(udev, &flags);
 
 	if (flags & US_FL_IGNORE_UAS) {
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


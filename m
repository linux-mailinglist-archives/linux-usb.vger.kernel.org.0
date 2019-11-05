Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C766BEF770
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730596AbfKEImV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:21 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41341 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEImU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:20 -0500
Received: by mail-lf1-f65.google.com with SMTP id j14so14437890lfb.8
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+y8cUxoGzN6GT+mRGiWu/EU5YAXI4AEu0RK/ayv8Mzo=;
        b=lSalObbKrUQfZXLOHSbPUC8a9TyjTxoHX7biwrXi9Q+pQX1tYdIbkwC5ok16y7gsvV
         QSF9ZosCq4JptmRMGCCsY5/2wBoBnWMM2HDllLNwWBSAe2PakGciKrlILcqrRlY0rpEZ
         PZrgBKur6p79wRCtLmbwImPLke52eVTYkqL46LAfWGB7D56pXy6HnijhoZT7wpYn6fXd
         M5xY3Np9Tmwm7E5z8B4WaoUTAwhMbFTqkO4Y8aEXwz6ajw96HctzlemcHaOm63HzgnYa
         v5wf88HMgqSiiUp3f52oihdNARw+bCtxJiY0Gif8SLSwkv7FeP8POyMIK55gdRxL9I9I
         MO+g==
X-Gm-Message-State: APjAAAVpb0LUdh0VX5v9fAF3cu0hLVsafDGs6xqXg4AB1//syiLvLxL9
        E1qzESWNo72zhCnlIkQ84c0=
X-Google-Smtp-Source: APXvYqw+/uLoaa+YyTOAY/EWNxbzIl84fDJlAXanBGZYbfmO549ozVBy6Qvfz9xutpXHFpm1SZYyEQ==
X-Received: by 2002:a19:7511:: with SMTP id y17mr20371577lfe.19.1572943338023;
        Tue, 05 Nov 2019 00:42:18 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id f30sm7766470ljp.66.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004Gt-Kr; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 05/14] USB: legousbtower: drop noisy disconnect messages
Date:   Tue,  5 Nov 2019 09:41:43 +0100
Message-Id: <20191105084152.16322-6-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

User space already sees -ENODEV in case it tries to do I/O post
disconnect, no need to spam the logs with printk messages that don't
even include any device-id information.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 1626a0d2b12b..937bce23adf0 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -540,7 +540,6 @@ static ssize_t tower_read (struct file *file, char __user *buffer, size_t count,
 	/* verify that the device wasn't unplugged */
 	if (dev->disconnected) {
 		retval = -ENODEV;
-		pr_err("No device or device unplugged %d\n", retval);
 		goto unlock_exit;
 	}
 
@@ -626,7 +625,6 @@ static ssize_t tower_write (struct file *file, const char __user *buffer, size_t
 	/* verify that the device wasn't unplugged */
 	if (dev->disconnected) {
 		retval = -ENODEV;
-		pr_err("No device or device unplugged %d\n", retval);
 		goto unlock_exit;
 	}
 
-- 
2.23.0


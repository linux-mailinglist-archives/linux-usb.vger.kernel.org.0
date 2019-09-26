Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45637BEE23
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 11:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbfIZJMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 05:12:48 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34158 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfIZJMs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:48 -0400
Received: by mail-lj1-f195.google.com with SMTP id j19so1381425lja.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6g3+KXN9nBLb0Uwpf/8bB5Xk3DTcHgFK/ix1KLsES8=;
        b=cMWIUG9fPcDIv0Q0dNfnDkPnzOpv62Iuuo/SK++uGeP0e1MpuhSahTArR5QZMd9gt0
         1ngDoK1cE+H1ugd0flgrOhMNDR5EhIMCeQI7IBiXXf09s/a/3s9zQN24kvwWPhv2RRo/
         ZJmwLtlHgF+j9nvxr/uR4jjl9HX517rmAcKKRibq0+rXSrvIS5EcAvMhLVxfNHrNjsf6
         +GWambXRiddEUC0IGXB7J+ugkBuX/fWteWmCgU5ONXBDS5Dg2hTF1Dcu1vvCqjpmtF8Y
         4xBP9MymVzbr8nHFieoLyiBN0tOkXP1WIyQFpGPWTQZ3yHEXZuTuPaJ9/uy4Q130ZTHB
         Trsg==
X-Gm-Message-State: APjAAAViIt3OOgvVs9tOsS4Q4oJFxdhZAGXWUjtCJv4jRal2FVsATpcS
        k4ew4EzOfm0pRFI3vPMtjDw=
X-Google-Smtp-Source: APXvYqw5dMZVsW8yNFIQFj+NnGn3cFsfJHwP4p2b86XFTNdgGD0MCXPA67FFKhgdzdCudWbf9o6RMg==
X-Received: by 2002:a2e:90d9:: with SMTP id o25mr1764802ljg.94.1569489166480;
        Thu, 26 Sep 2019 02:12:46 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r6sm405549lfn.29.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpS-0006Qg-0o; Thu, 26 Sep 2019 11:12:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] USB: usblcd: use pr_err()
Date:   Thu, 26 Sep 2019 11:12:23 +0200
Message-Id: <20190926091228.24634-5-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926091228.24634-1-johan@kernel.org>
References: <20190926091228.24634-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replace the one remaining printk with pr_err().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/usblcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usblcd.c b/drivers/usb/misc/usblcd.c
index 732eb1f81368..61e9e987fe4a 100644
--- a/drivers/usb/misc/usblcd.c
+++ b/drivers/usb/misc/usblcd.c
@@ -84,7 +84,7 @@ static int lcd_open(struct inode *inode, struct file *file)
 
 	interface = usb_find_interface(&lcd_driver, subminor);
 	if (!interface) {
-		printk(KERN_ERR "USBLCD: %s - error, can't find device for minor %d\n",
+		pr_err("USBLCD: %s - error, can't find device for minor %d\n",
 		       __func__, subminor);
 		return -ENODEV;
 	}
-- 
2.23.0


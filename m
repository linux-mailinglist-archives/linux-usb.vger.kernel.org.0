Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF6FBEE29
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 11:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbfIZJMx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 05:12:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45952 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729167AbfIZJMw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:52 -0400
Received: by mail-lf1-f65.google.com with SMTP id r134so1105675lff.12
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6g3+KXN9nBLb0Uwpf/8bB5Xk3DTcHgFK/ix1KLsES8=;
        b=r2hvidtQn0wnv7s+FTNtQeh2KDL41v8gfyW/iTlFd9rSBwWM3zg5EkUtOJHqDD/qej
         7saLPJsOck0uO3bwiPHLA6HhBud3GxVjXWxSO9FSgPOen1FS4SO1p2AZo29+2dMAwOEt
         luvBKXw+YW4yF8UPgdpGQ2aEpORZxPT32kYjI/N8YLAbecl6yXMHWFz5XbuRhNJcMAKf
         Dh8z7fr/R9D3fiyU+gKsxmWX0pPgMp60KOtIVLLYISHHs26z3q4O6ltLbqYJQIKfzuMl
         ZLS++Y9ijLgkngrvIxoY8yfWpHxWiYskdGWa7ynYnZKi0R7umsjAb9THHnA0bAj54bku
         yBmQ==
X-Gm-Message-State: APjAAAXJ2iHGQCa+hLHpjVDlga7DdZK9fwBa9h7mpP3KisWmJ21PL2RS
        s0fNNB3JQOkS7MrLNPx3Qrj+L4gh
X-Google-Smtp-Source: APXvYqy9V8KtRhhgRRKU/Oehvs/pafWUqHDY8nkdogzkUfJSd1HTDXqZ8trhUhP5FjM8KJPMk13U8A==
X-Received: by 2002:ac2:4ad9:: with SMTP id m25mr1515269lfp.89.1569489168648;
        Thu, 26 Sep 2019 02:12:48 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id i6sm401519lfc.37.2019.09.26.02.12.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpS-0006R7-Gv; Thu, 26 Sep 2019 11:12:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] USB: usblcd: use pr_err()
Date:   Thu, 26 Sep 2019 11:12:28 +0200
Message-Id: <20190926091228.24634-10-johan@kernel.org>
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


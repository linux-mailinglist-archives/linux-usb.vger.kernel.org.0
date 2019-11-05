Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909CFEF76D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730569AbfKEImR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:17 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36597 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbfKEImR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:17 -0500
Received: by mail-lf1-f67.google.com with SMTP id a6so11042228lfo.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pBKLGAEBn3bFo9v8fZaHn5v0bK1Fmv0opJnZ/q6PGn4=;
        b=GpSEBIP6Ja+w0KtRS5M6Oe0Op5ZKKIn83LqSoDQTRdXFbiO4Ihn4BEnm/ivOewLt5V
         rwiNu8/JUoP//VseLQJz8vpV+9bL4919NNfLljbvBL2kxifwlAKBI3d0Rrprhd3lmAF9
         7SPkasJpirieHDE7wgYa56Bv3NF1kp78TisxtVIDrUAC5VpPngTO85GSfDFhQrUzNP5I
         rEM22qutr420P+M+3PdEwtSu8Ug4hUaSYI6hZX8T8u2IxjEfLmpSY3+BE8OCXKXdUZFs
         6uwSTMw3hs9rgc07JPW9PaOgT+/pbvieghVlvJMyJpltbV73VTIoX6R43KumxenolMNo
         22fA==
X-Gm-Message-State: APjAAAWjZ240rLTqZcn/eG0X/rFgXECJcZZ1+dD7xkISaShnrMbxuovc
        nr/DcHjxjnQHcc8++P1C5/M=
X-Google-Smtp-Source: APXvYqxFh5G7YO8VnyTtbKEgNIzRKRsL93c+ZWFpTomh31gQzN9EXmXECNSi0Ln8q/1CMOlEXlY09g==
X-Received: by 2002:a19:2356:: with SMTP id j83mr19632749lfj.103.1572943334993;
        Tue, 05 Nov 2019 00:42:14 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id f1sm7522068ljk.77.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:14 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004Go-Hq; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 04/14] USB: legousbtower: drop redundant open_count check
Date:   Tue,  5 Nov 2019 09:41:42 +0100
Message-Id: <20191105084152.16322-5-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop redundant open_count check in release; the open count is used as a
flag and is only set to 0 or 1.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index c880d58e8683..1626a0d2b12b 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -421,13 +421,6 @@ static int tower_release (struct inode *inode, struct file *file)
 
 	mutex_lock(&dev->lock);
 
-	if (dev->open_count != 1) {
-		dev_dbg(&dev->udev->dev, "%s: device not opened exactly once\n",
-			__func__);
-		retval = -ENODEV;
-		goto unlock_exit;
-	}
-
 	if (dev->disconnected) {
 		/* the device was unplugged before the file was released */
 
@@ -444,7 +437,6 @@ static int tower_release (struct inode *inode, struct file *file)
 	tower_abort_transfers (dev);
 	dev->open_count = 0;
 
-unlock_exit:
 	mutex_unlock(&dev->lock);
 exit:
 	return retval;
-- 
2.23.0


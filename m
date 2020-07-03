Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97F2213EE3
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgGCRnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgGCRmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D22C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:46 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k6so33581471wrn.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BRma9lRqEYDVOCUnxuxL1ar6KYSuaKRVNlo6MvalKh8=;
        b=mWYGekfinDDvmP/iCmqV/aGkYJf6TP1fCPcz7wB25vsA8+FLckg8N9Orh4YU9GBn/J
         LnXRemGrce3PfQHQ02bLqOsJwHZSgzTTaFULUBk7HNn6wHu/7bJM2WWusHZKqVQseNTF
         TUmfsyRjzeqzo7RG5Arncs7yNnvFLUcMyADe7l3VoDzFTFRXeCc/P4bBM/NE4J9N4xRz
         uiuCZAVBHkjJ2NG1VnhYVRhKfwuMfIFpsty3kYsap8/Aa7O5rfvZCED2Jpn+WZsIuk/n
         6huQcc3LZJY6QqbtVD/W7yN5yad9GobhUVi6igXsbAQcfy04fJ1fVqcE1mmm/UtI1ixZ
         B7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BRma9lRqEYDVOCUnxuxL1ar6KYSuaKRVNlo6MvalKh8=;
        b=thEdA1OPeUeoyeHuzeS8l7lQnzt3yu0SfFJpGYhZ29livbMLYe2cqxM7/r1QignM6T
         PlN1olxSxxTkosipaAUtVytQB1QpQRlqLWNC4Oqe/nCzD+G6ISPlslPJkfo7zwla8BkF
         c060Ow3NPGMKKtmkQLqHJJCxnE+suRz1Vo0FNlAovPkxPt9Jc/CVRTNGBxNxrYFxravK
         2X04sgmOmRNfrqXIBnlp2JB5NVQ/fo1OoyUdAkC/GdtMiu0zFXC3UDZKWyYgNMCVqZpj
         hlUqdbU8kU0flsb+WYZ2tVNALp0d7ytgDAa+SB88hFQ6mW+32yhxdpB4X6lnSwVZO+An
         2cyQ==
X-Gm-Message-State: AOAM533OkPJxMFCOW9aU4pAGYGRA5bxJaJSuByMPtm0oq2kaB4YbcnkF
        H7MekglPYPI/PhM8rLu+48PybmLgY64=
X-Google-Smtp-Source: ABdhPJyONWDFPwyDvztIk4FcoSOK/rZ5PGRPGACL6sxaodQwaxlQC+PL+MLJ6JrU2yDAbU41YE1QXA==
X-Received: by 2002:a05:6000:d0:: with SMTP id q16mr4673145wrx.166.1593798165048;
        Fri, 03 Jul 2020 10:42:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:44 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Daniel Drake <dsd@gentoo.org>,
        usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 19/30] usb: storage: alauda: Remove set but unchecked variable
Date:   Fri,  3 Jul 2020 18:41:37 +0100
Message-Id: <20200703174148.2749969-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The return value of alauda_get_media_status() hasn't been checked
since the driver's inception back in 2005.  If nothing have gone
wrong/been detected until this point, it's probably safe to just
remove the variable.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/storage/alauda.c: In function ‘alauda_check_media’:
 drivers/usb/storage/alauda.c:456:6: warning: variable ‘rc’ set but not used [-Wunused-but-set-variable]
 456 | int rc;
 | ^~

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Daniel Drake <dsd@gentoo.org>
Cc: usb-storage@lists.one-eyed-alien.net
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/storage/alauda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index ddab2cd3d2e75..20b857e97e60c 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -453,9 +453,8 @@ static int alauda_check_media(struct us_data *us)
 {
 	struct alauda_info *info = (struct alauda_info *) us->extra;
 	unsigned char status[2];
-	int rc;
 
-	rc = alauda_get_media_status(us, status);
+	alauda_get_media_status(us, status);
 
 	/* Check for no media or door open */
 	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
-- 
2.25.1


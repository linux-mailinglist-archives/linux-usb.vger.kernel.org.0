Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8AD3E448F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 13:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhHILWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 07:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbhHILWQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 07:22:16 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C11C0613D3
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 04:21:55 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id oa17so2460577pjb.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Aug 2021 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rtst-co-kr.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=EYzmb24oO7kORuQLhjfqCmnqc8pvZHlXH9eI7yhHiBw=;
        b=YHWTslJOxVAlF/QdmEawCacCLPEoNYsZAuaYSbBEimHNxWDvF9o+8CciewOoc/ZmZb
         WPy6B/9gGw6j6K8TotQ/YCx9YniYNI7/mU26Mhr+5humcZTpCzcg5vhfBG7qDZbnc8oL
         VlFDrdyHte0Xid5O+37KsAUrYEqXeqXFpjL/BveDXe2a8vS+aI6O8qq7PP+iWrCHKkRE
         QD8JAbWZc5npRq8ngsXxupB7nQHxW7LdB1/sKX/jxN4Kf/phoZ+oQm9c/oY6KhzbEIMN
         j9TuxysNhTf+57h47z7a6r0/lsL4S3eBw0+pt4Hm9xaNM9iSdUsyB8ndHB4YVs9t8Nys
         P7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=EYzmb24oO7kORuQLhjfqCmnqc8pvZHlXH9eI7yhHiBw=;
        b=qVRTiZnj+3fu8P5Q88ToUTlgdZUWJbsZmPmd003QG/iABwenIf3T77C+l6J1+KUerB
         HKIvxycN8tgJfnAp6k56RZtPoa/NJJPbVdIY4NZOIHemN0n4bLNX/UwXatCk1kIbsE5/
         lRPkYOpj1od80clx8AmXT8lsQfqomvTjiBpnhCoTUe+0g37mvRXfA4VZSaW/5o3jKM71
         fKu8ok0jiWNYdCAhIU/SQojEWpFuxiLQbqh+FGw3pRhm0nt+z5C/qr68C51u9reo+wF+
         c2JbF4dH7V3kM9Dp/SuQlqo4e5xg/xytnizgCd4DYB+04xZN8dTmMyPSQXZHa4iwIa3k
         7wOg==
X-Gm-Message-State: AOAM531jX41f0UzNh3F1gPzD2MnDmFJPE8mmCx4SKrl7lTEZvYACs5EQ
        RI23U55gyNTAApU1yu01iMG2KomqddAZ0A==
X-Google-Smtp-Source: ABdhPJxV096VLuX3ainMU9lCZ4pdriNo8Ca8f3hd1ru5/OHjGWWo70JyRvsMfAC5Cbqts6rPuAD87Q==
X-Received: by 2002:a65:5603:: with SMTP id l3mr26367pgs.281.1628508114846;
        Mon, 09 Aug 2021 04:21:54 -0700 (PDT)
Received: from ubuntu ([106.245.77.4])
        by smtp.gmail.com with ESMTPSA id y62sm19815607pfy.183.2021.08.09.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 04:21:54 -0700 (PDT)
Date:   Mon, 9 Aug 2021 20:20:48 +0900
From:   Jeaho Hwang <jhhwang@rtst.co.kr>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: chipidea: add loop timeout for hw_ep_set_halt()
Message-ID: <20210809112048.GA3319230@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If ctrl EP priming is failed (very rare case in standard linux),
hw_ep_set_halt goes infinite loop. 50 was enough for zynq7000.

Signed-off-by: Jeaho Hwang <jhhwang@rtst.co.kr>
---
 drivers/usb/chipidea/udc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d0cd1de1b6c7..92ca0b7e4310 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -210,6 +210,9 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
 	return 0;
 }
 
+/*will it be enough?*/
+#define HW_EP_SET_HALT_COUNT_MAX 100
+
 /**
  * hw_ep_set_halt: configures ep halt & resets data toggle after clear (execute
  *                 without interruption)
@@ -222,6 +225,7 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
  */
 static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int value)
 {
+	int count = HW_EP_SET_HALT_COUNT_MAX;
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
@@ -233,9 +237,9 @@ static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int value)
 		/* data toggle - reserved for EP0 but it's in ESS */
 		hw_write(ci, reg, mask_xs|mask_xr,
 			  value ? mask_xs : mask_xr);
-	} while (value != hw_ep_get_halt(ci, num, dir));
+	} while (value != hw_ep_get_halt(ci, num, dir) && --count > 0);
 
-	return 0;
+	return count ? 0 : -EAGAIN;
 }
 
 /**
-- 
2.25.1


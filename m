Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E203FCC85
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 19:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhHaRvB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 13:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhHaRvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 13:51:00 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E69C061575
        for <linux-usb@vger.kernel.org>; Tue, 31 Aug 2021 10:50:05 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id w8so17534888pgf.5
        for <linux-usb@vger.kernel.org>; Tue, 31 Aug 2021 10:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dicortech-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=foEB1hRDhRYxNRaBhXD8kAoguwl9nfjwqFNqqn1lMtg=;
        b=XuHwgrotBKwFvwsZZoMInCCe29GXzFB08t856QKsB1YLkyvBBqE1Fft0AmnrFn1y1y
         GfdUH8U8wajOb/5FgVMwDpKwwP2oEB0EKc/Pba1DBZARDaQEYSI8B6cg4MnleCMFqmhG
         eSuxz+tHwnbBsly2V6F7ORhSKf7cFbUD6KxB28tzlLdgb4wIgHlW1IVqd8QsoQJgY5PU
         UNnlMrYuui7TZilAz09evNo973/CCET3ueozCS+VELmZtKzcrD7FwRQMSaXyIboOrsbd
         4YJJYBF3azTlYI+lC5vazaBPob4oQRisErEsjlKy2+x1k8yN5jJIMX4hvb3IEmMMkR4v
         JOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=foEB1hRDhRYxNRaBhXD8kAoguwl9nfjwqFNqqn1lMtg=;
        b=qksK7tNkzmx3xQpcnh0G5XFJqZqOA3k7BAhhA86EwpOJdrJDSSBbwQKO1kG0J7ArkA
         OAwSk/w3xxlVd/pL+aIaprv75ACkouL2lmF2Yt6tOd/7tQzBcWt9MbbzvjEQq0kuy7OD
         FKsu2R+iFkjgBCFtrdoJaXXKqIBX8WtVcBq8saeCSJXVMV11ObYCrBoBQNsKQtSej7BR
         KH3O2ruvqQRuOKIwjBdGdzkTcD0GE0lDUuevkKyAQnbTrzdlP3VIz8MLIdADwOOZHCam
         8rDpC9hQGiCZOcjyqBsC5VjqRU6PECUnWzDU0xu640jVGwsXG2g1NEp2ZhVxJMZUsi9W
         Vm9g==
X-Gm-Message-State: AOAM533EpeoC8LvQmcByUl4zFwDewb2H3yS9+olGl8jYmfjm/nKtX0Yv
        UnB79N/hP5DzIeGwkTRZ37p48quvrrWqeQ==
X-Google-Smtp-Source: ABdhPJzcNM6e5yByRdCoyQ3eWggCVuzLQdT6fUxTPa6W+sXQt3wYt+4xLCtU+cb6xlw3jBPqmELfVQ==
X-Received: by 2002:a05:6a00:c91:b0:3ee:9bed:61be with SMTP id a17-20020a056a000c9100b003ee9bed61bemr28928472pfv.37.1630432204468;
        Tue, 31 Aug 2021 10:50:04 -0700 (PDT)
Received: from faizel.kb ([103.160.194.126])
        by smtp.gmail.com with ESMTPSA id j23sm3463763pjn.12.2021.08.31.10.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:50:02 -0700 (PDT)
From:   "faizel.kb" <faizel.kb@dicortech.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, "faizel.kb" <faizel.kb@dicortech.com>
Subject: [PATCH] usb: testusb: Fix for showing the connection speed
Date:   Tue, 31 Aug 2021 23:17:42 +0530
Message-Id: <20210831174742.105621-1-faizel.kb@dicortech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

'testusb' application which uses 'usbtest' driver reports 'unknown speed'
from the function 'find_testdev'. The variable 'entry->speed' was not
updated from  the application. The IOCTL mentioned in the FIXME comment can
only report whether the connection is low speed or not. Speed is read using
the IOCTL USBDEVFS_GET_SPEED which reports the proper speed grade.  The
call is implemented in the function 'handle_testdev' where the file
descriptor was availble locally. Sample output is given below where 'high
speed' is printed as the connected speed.

sudo ./testusb -a
high speed      /dev/bus/usb/001/011    0
/dev/bus/usb/001/011 test 0,    0.000015 secs
/dev/bus/usb/001/011 test 1,    0.194208 secs
/dev/bus/usb/001/011 test 2,    0.077289 secs
/dev/bus/usb/001/011 test 3,    0.170604 secs
/dev/bus/usb/001/011 test 4,    0.108335 secs
/dev/bus/usb/001/011 test 5,    2.788076 secs
/dev/bus/usb/001/011 test 6,    2.594610 secs
/dev/bus/usb/001/011 test 7,    2.905459 secs
/dev/bus/usb/001/011 test 8,    2.795193 secs
/dev/bus/usb/001/011 test 9,    8.372651 secs
/dev/bus/usb/001/011 test 10,    6.919731 secs
/dev/bus/usb/001/011 test 11,   16.372687 secs
/dev/bus/usb/001/011 test 12,   16.375233 secs
/dev/bus/usb/001/011 test 13,    2.977457 secs
/dev/bus/usb/001/011 test 14 --> 22 (Invalid argument)
/dev/bus/usb/001/011 test 17,    0.148826 secs
/dev/bus/usb/001/011 test 18,    0.068718 secs
/dev/bus/usb/001/011 test 19,    0.125992 secs
/dev/bus/usb/001/011 test 20,    0.127477 secs
/dev/bus/usb/001/011 test 21 --> 22 (Invalid argument)
/dev/bus/usb/001/011 test 24,    4.133763 secs
/dev/bus/usb/001/011 test 27,    2.140066 secs
/dev/bus/usb/001/011 test 28,    2.120713 secs
/dev/bus/usb/001/011 test 29,    0.507762 secs

Signed-off-by: faizel.kb <faizel.kb@dicortech.com>
---
 tools/usb/testusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
index ee8208b2f946..69c3ead25313 100644
--- a/tools/usb/testusb.c
+++ b/tools/usb/testusb.c
@@ -265,12 +265,6 @@ static int find_testdev(const char *name, const struct stat *sb, int flag)
 	}
 
 	entry->ifnum = ifnum;
-
-	/* FIXME update USBDEVFS_CONNECTINFO so it tells about high speed etc */
-
-	fprintf(stderr, "%s speed\t%s\t%u\n",
-		speed(entry->speed), entry->name, entry->ifnum);
-
 	entry->next = testdevs;
 	testdevs = entry;
 	return 0;
@@ -299,6 +293,14 @@ static void *handle_testdev (void *arg)
 		return 0;
 	}
 
+	status  =  ioctl(fd, USBDEVFS_GET_SPEED, NULL);
+	if (status < 0)
+		fprintf(stderr, "USBDEVFS_GET_SPEED failed %d\n", status);
+	else
+		dev->speed = status;
+	fprintf(stderr, "%s speed\t%s\t%u\n",
+			speed(dev->speed), dev->name, dev->ifnum);
+
 restart:
 	for (i = 0; i < TEST_CASES; i++) {
 		if (dev->test != -1 && dev->test != i)
-- 
2.25.1


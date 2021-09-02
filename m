Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D493FED1A
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 13:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbhIBLql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 07:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbhIBLqh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 07:46:37 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AA8C061575
        for <linux-usb@vger.kernel.org>; Thu,  2 Sep 2021 04:45:37 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id r13so1417913pff.7
        for <linux-usb@vger.kernel.org>; Thu, 02 Sep 2021 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dicortech-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=orgOBfN9wMaujURS4jB7SxvgMkHlpzpQGluThcA1zlo=;
        b=EWzkCuErzMern9CxzCoibAQbh9grKK95KRmaW8BvZ0NNmM3f/shrpkBMho+++hsDvb
         iUao9yVE2TT/Mq4SAMSg3CJw8jGuuBMejlMMsBDt5I4y534siifs1KL6UOo8RiVzMGy/
         YgKVbhgoMgXuiihmBmJ6sHOYE8RcIAXSmImM/7/IkHxMPui3zhv9skhfCuF7tw1Zb2UP
         7r27XvF1V23MqaJcrsFLLwZAmzecg31N4XdUrHx0+zuQn6/0fXeLHrx8M4p5zaerUHIW
         vXAkWgLaP1MhoZ2x/bRyuWlFwmFKqWkYpEqIE8my7dmAwvSmu/1UBSDTfArb8SChZmCK
         3Flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=orgOBfN9wMaujURS4jB7SxvgMkHlpzpQGluThcA1zlo=;
        b=lyxmR/88pav4EK/Kyeo8247lEpJeZQ6/lt88QxfftASX5WnvpaK1tpYz1vvghLFfgk
         T7ij8B9CLOVdeDBYOxT/ZI/tieE76N/G4Ca0x2YSAawc96UuMqkqeRhrdD3RxKXK6Z8A
         J1OYEumNFynvDS4D6730z++iInjye4mRa9zvgRrx2XMDoxV73KZSQjj1t+O61z6+FLgg
         0WanIIm6WWDE/mw8fAUhSLBxNdyCDuuIpqsAh+lAieZlcLHvXLMefOgkATnvKPCd7oNv
         Nl7jWMgRScSxjxVrRUNyUl2eGGEQ6g45FaQgsyid+Ex4MlVtnFU3mlzkRRJBujHzIMge
         3KqQ==
X-Gm-Message-State: AOAM530eqhKD0GHwxrnzfC4l+jmXZmE45Ghns+3CJ4tjU2W25NNb9hNV
        Z/hkXuYhQv0ikiP87njX2reQzCYoAcaSjQ==
X-Google-Smtp-Source: ABdhPJxe0rNNQL4gyrpvYcW2gm6w1GssoHZgcb7z2vL30gDqX24lMcalNEpW5Jsnfn0dFba7iSbaXw==
X-Received: by 2002:a65:6a46:: with SMTP id o6mr2812028pgu.139.1630583136942;
        Thu, 02 Sep 2021 04:45:36 -0700 (PDT)
Received: from faizel.kb ([122.165.156.14])
        by smtp.gmail.com with ESMTPSA id n14sm2614570pgd.48.2021.09.02.04.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 04:45:36 -0700 (PDT)
From:   Faizel K B <faizel.kb@dicortech.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Faizel K B <faizel.kb@dicortech.com>
Subject: [PATCH v2] usb: testusb: Fix for showing the connection speed
Date:   Thu,  2 Sep 2021 17:14:44 +0530
Message-Id: <20210902114444.15106-1-faizel.kb@dicortech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

testusb' application which uses 'usbtest' driver reports 'unknown speed'
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

Signed-off-by: Faizel K B <faizel.kb@dicortech.com>
---
Changes in v2:
   - Corrected 'real name' in 'Signed-off' and 'From' field

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


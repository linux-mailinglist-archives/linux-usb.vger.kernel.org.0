Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA32F25FD85
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 17:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgIGPva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 11:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730111AbgIGPvS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 11:51:18 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91B0C061573
        for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2020 08:51:17 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m8so2911372pgi.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2020 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VvY1GEzuf8T2kaF3CS/CkcCv0h1MLXohSCilQwaVKF8=;
        b=skkuWt3NnJwMYWD44M46Ohp+WuZnz1LTwyHrc7LdjQyRo7Q9Cplsbuy+dsWfykUIXh
         ZXXz26Vy7/Z/i+dPtPoU8WK/xXoVCx416Cwp5gtYc5LjCehSwfzYqEuGFUMDZl8r6Ren
         A3203DVA/aa2TGW66NZChHQ0CLBBxBzhRIlQevJTrvnm6lHDcnsMsAIwgXomXnT2AdS4
         2htSOX/MdtUc2VtURY2d3EyNnABdtcnz+MqJMuJbGYhBUKYWnjF0FRJOHVN0Eu7Pbevz
         nGKHi1eVfmrkCk/0hFFa450ltVslh2uFdeZEGC5TGS2G/kUMpINblSGt3+WI3Wh2HjKY
         ougQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VvY1GEzuf8T2kaF3CS/CkcCv0h1MLXohSCilQwaVKF8=;
        b=aCzf8CfLhbSOYSTCvHql+rGhT2/XZbgi+mTzAquaTOpQtwhwitv7GMkulhZv6/UR4v
         p99m25QQ1xlFb0TfY/9dERbHjK4+b9OnSzUx1UI197X6K/DUkCCjQvFoJHtAEVoIUUpz
         FGuGqvxh2HtfjcIuY6PAIcSP4Y3LJ0zrUGroAUuLNik6cDnATe7lHRLEZEsX/BYwGM+l
         ruc3FJPJNEJyVuNrKhrmHzwy2E3+KSnl6dBoYAcXDyufNOH7SIGhrX/OXt59Zl55Apqt
         Jtn9euv2oVlmsNGVALJoei3mEU4xzlcUoME3ry6DsZ/knMO23GlRkj9gr/zxiy1LpmOr
         CHuQ==
X-Gm-Message-State: AOAM531Zt/Q7SooNkMXeuoDSxo9cu4/aegItyANq16oFwZBq5kgis7D3
        GG7bC+4IdwKCbxmwXtz5UCE=
X-Google-Smtp-Source: ABdhPJzNXgz4QtMHkRwnfmvhxX6rI5Kx8c4cV38/v27gtDTmL0+G7KDfqLwhSgHwDyKOksWYwOEyeQ==
X-Received: by 2002:a62:e108:: with SMTP id q8mr3587860pfh.214.1599493877348;
        Mon, 07 Sep 2020 08:51:17 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id g17sm12745967pjl.30.2020.09.07.08.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 08:51:16 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com, kernel test robot <rong.a.chen@intel.com>
Subject: [PATCH v3] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Tue,  8 Sep 2020 00:50:52 +0900
Message-Id: <20200907155052.2450-2-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907155052.2450-1-yazzep@gmail.com>
References: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
 <20200907155052.2450-1-yazzep@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

According to 6.7.22 A-UUT "Device No Response" for connection timeout
of USB OTG and EH automated compliance plan v1.2, the enumeration
failure has to be detected within 30 seconds. However, the old and new
enumeration schemes made a total of 16 attempts, and each attempt can
take 5 seconds to timeout, so it failed with PET test. Modify it to
reduce the number of attempts to 5 and pass PET test.

in case of old_schene_first=N and use_both_schemes=Y
attempt 3 * new scheme, then 2 * old scheme
in case of old_schene_first=Y and use_both_schemes=Y
attempt 2 * old scheme, then 3 * new scheme

Before applying the patch. please see [2]-[1].
The PETtest fails during device enumeration procedure[3] because the device
enumeration failure[4] can not be detected within 30 seconds of starting
the test.

[   99.864751] *** Ready OK Test Start***
[  102.806542] usb 1-1.1: new full-speed USB device number 7 using ehci-platform ...[1]
[  118.608538] usb 1-1.1: device descriptor read/64, error -110
[  134.480542] usb 1-1.1: device descriptor read/64, error -110
[  134.669542] usb 1-1.1: new full-speed USB device number 8 using ehci-platform
[  150.352537] usb 1-1.1: device descriptor read/64, error -110                  ...[2]
[  152.071247] *** End of Test        ***                                        ...[3]
[  154.290867] usb 1-1-port1: unable to enumerate USB device                     ...[4]

After applying this patch. please see [6]-[5].
device enumeration failure[6] is detected within 30 seconds after
starting the PETtest. The test passed.

[  134.632165] *** Ready OK Test Start***
[  137.880705] usb 1-1.1: new full-speed USB device number 11 using ehci-platform ..[5]
[  143.184698] usb 1-1.1: device descriptor read/64, error -110
[  148.815699] usb 1-1.1: device descriptor read/64, error -110
[  149.005691] usb 1-1.1: new full-speed USB device number 12 using ehci-platform
[  154.448695] usb 1-1.1: device descriptor read/64, error -110
[  154.561696] usb 1-1.1: Invalid ep0 maxpacket: 0
[  154.567354] usb 1-1-port1: attempt power cycle
[  156.445704] usb 1-1.1: new full-speed USB device number 13 using ehci-platform
[  161.745697] usb 1-1.1: device not accepting address 13, error -110
[  161.827694] usb 1-1.1: new full-speed USB device number 14 using ehci-platform
[  167.377693] usb 1-1.1: device not accepting address 14, error -110
[  167.395415] usb 1-1-port1: unable to enumerate USB device                      ..[6]
[  176.678418] *** End of Test        ***

------
[7] https://www.usb.org/sites/default/files/otgeh_compliance_plan_1_2.pdf
6.7.22 A-UUT "Device No Response" for connection timeout
6.7.22.2 Test Procedure for A-UUT which does not support sessions

1. Start with cable still attached, PET applying 10 micro F capacitance and
   10K Ohm pull-down resistance between VBUS and ground, data lines not
   pulled up.
2. Wait 1s.
3. PET connects using D+.
4. Display Message "Click OK when 'Device No Response' indication
   displayed on UUT".
5. If operator clicks OK before 30s elapses since VBUS went on, then
   UUT passes test.
6. If 30s elapses first, then UUT fails test.
7. PET leaves 10 micro F capacitance and 10K Ohm pull-down resistance
   across VBUS.
8. PET disconnects D+.
9. Wait 2s. to allow disconnection to be recognized.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
---
 drivers/usb/core/hub.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 052d5ac..725e5b6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2706,7 +2706,6 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
 
 
 #define PORT_RESET_TRIES	5
-#define SET_ADDRESS_TRIES	2
 #define GET_DESCRIPTOR_TRIES	2
 #define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
 #define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
@@ -4539,7 +4538,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 	struct usb_device	*hdev = hub->hdev;
 	struct usb_hcd		*hcd = bus_to_hcd(hdev->bus);
 	struct usb_port		*port_dev = hub->ports[port1 - 1];
-	int			retries, operations, retval, i;
+	int			retries, retval, i;
 	unsigned		delay = HUB_SHORT_RESET_TIME;
 	enum usb_device_speed	oldspeed = udev->speed;
 	const char		*speed;
@@ -4684,7 +4683,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 			 * 255 is for WUSB devices, we actually need to use
 			 * 512 (WUSB1.0[4.8.1]).
 			 */
-			for (operations = 0; operations < 3; ++operations) {
+			if (!((retry_counter % 2 != 0) && (retries != 0))) {
 				buf->bMaxPacketSize0 = 0;
 				r = usb_control_msg(udev, usb_rcvaddr0pipe(),
 					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
@@ -4704,16 +4703,6 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 						r = -EPROTO;
 					break;
 				}
-				/*
-				 * Some devices time out if they are powered on
-				 * when already connected. They need a second
-				 * reset. But only on the first attempt,
-				 * lest we get into a time out/reset loop
-				 */
-				if (r == 0 || (r == -ETIMEDOUT &&
-						retries == 0 &&
-						udev->speed > USB_SPEED_FULL))
-					break;
 			}
 			udev->descriptor.bMaxPacketSize0 =
 					buf->bMaxPacketSize0;
@@ -4744,12 +4733,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 		 * authorization will assign the final address.
 		 */
 		if (udev->wusb == 0) {
-			for (operations = 0; operations < SET_ADDRESS_TRIES; ++operations) {
-				retval = hub_set_address(udev, devnum);
-				if (retval >= 0)
-					break;
-				msleep(200);
-			}
+			retval = hub_set_address(udev, devnum);
+			msleep(200);
 			if (retval < 0) {
 				if (retval != -ENODEV)
 					dev_err(&udev->dev, "device not accepting address %d, error %d\n",
-- 
2.7.4


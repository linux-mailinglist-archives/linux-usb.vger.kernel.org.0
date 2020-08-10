Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92346240083
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 02:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgHJAVg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 20:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgHJAVf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Aug 2020 20:21:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB205C061756
        for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2020 17:21:35 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bh1so3923225plb.12
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2020 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+c4auDqp8RpeASJXxH/AizaarCuV0OrD1i+o7+MYrvc=;
        b=Nh3fy18h5Plue4vRSSK2e88l8BoCD67vgK5/Rru4CveGvyWOOWQ0WYk2W2hj/yrXSg
         h7io5xfvmNdn5UqnQT1PMtvFk6QHN8FpwmqRjhttJJ2wwfS1wkltrin8VMADHFeNZFGF
         igqJB8/NvDOftsyG0lovU9nIhwewF+puNX6Gp3IUBf6YfvAXaAhPYb899d/8XVdodX0/
         gmLPKOLw432rXrKvSLc8cD+uHgTQYLntlqAijyyc1nDkCly/A5lHlWrEVI6vqN13/pM0
         5ytIbYln4HKC3U6cWEk6Q5GzrFZLCBMR65mEFtyuayGWM6xhYK+AWKJIWJP/qufLPvjT
         9riA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+c4auDqp8RpeASJXxH/AizaarCuV0OrD1i+o7+MYrvc=;
        b=Y9zLIS0WqSrLMrxipaRJRYGg5Qe2Fbeka5NyaWwWMjDXL8Pd3C/X3i5Ns21C3NcI4h
         WUK/rOF9g6n02xkgyp3EiNVqxNP8jmpWcx/r0Dl/LJbdJP2np6aPFgP/z/Zo23ODE8Hn
         IsVxUyql82LyVUGJodRxs3e5pqHAaGlgMtbeex1zLko2Y+F+Goz+yEyeXC6ZJ7WRdp8T
         I2DRnqyJwG6wKFPTeLNfFmgKm7MC0YKcNgLcXUeDinPW0wbefbYusw4t12vUyPswKlbn
         kVWw50qBz2z6qIBloFfwJ+Jkm1w3I0920j7EipNMmZB5V7LZe8R6C2A3Rywv7TgErjNx
         +5TQ==
X-Gm-Message-State: AOAM531nU0aLf5C2/5lBKtAEsbX7VqEZ0CUwUUVhgJKCAv+UO1E415XW
        pYe/Ik5T36CNZG/U1gJNQ/b+2pSCh3YWnQ==
X-Google-Smtp-Source: ABdhPJz0/ifUMwqKllqeroc1mRfjAOAzWdw8XbWwc5LCyzZaR+LL/fePQkXbDLE64wRPfFUglwMClQ==
X-Received: by 2002:a17:90a:eb0f:: with SMTP id j15mr22840267pjz.26.1597018895408;
        Sun, 09 Aug 2020 17:21:35 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id a17sm16483021pgw.60.2020.08.09.17.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 17:21:34 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH v2] [RFC] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Mon, 10 Aug 2020 09:19:35 +0900
Message-Id: <20200810001935.4489-2-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810001935.4489-1-yazzep@gmail.com>
References: <20200808151648.GC256751@rowland.harvard.edu>
 <20200810001935.4489-1-yazzep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

According to 6.7.22 A-UUT “Device No Response” for connection timeout
of USB OTG and EH automated compliance plan v1.2, the enumeration
failure has to be detected within 30 seconds. However, the old and new
enumeration schemes made a total of 16 attempts, and each attempt can
take 5 seconds to timeout, so it failed with PET test. Modify it to
reduce the number of attempts to 5 and pass PET test.

in case of old_schene_first=N and use_both_schemes=Y
attempt 3 * new scheme, then 2 * old scheme
in case of old_schene_first=Y and use_both_schemes=Y
attempt 2 * old scheme, then 3 * new scheme

Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
---
 drivers/usb/core/hub.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 052d5ac..5b15278c 100644
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
@@ -4714,7 +4713,10 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 						retries == 0 &&
 						udev->speed > USB_SPEED_FULL))
 					break;
+			} else {
+				break;
 			}
+
 			udev->descriptor.bMaxPacketSize0 =
 					buf->bMaxPacketSize0;
 			kfree(buf);
@@ -4744,12 +4746,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
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


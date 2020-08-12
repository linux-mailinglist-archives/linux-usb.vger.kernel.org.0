Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49931242DD9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 19:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgHLRJ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 13:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgHLRJ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Aug 2020 13:09:27 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02442C061383
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2020 10:09:26 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so1456678pjb.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2020 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+c4auDqp8RpeASJXxH/AizaarCuV0OrD1i+o7+MYrvc=;
        b=L4KYl4JTpj1ypBlNqBHGTEhXVZXvhVlSSoKUz+SRkCwtxnu9O9lpdwFe2i/5myp1RI
         CzpIQFqrFMQV1nA7ebayXXlSnGSWqOdsYVP/oaU+7lYqDL92qd1fup0BS6E1sptWgG3v
         t9Fok9wt92xZG2zvPAQ6azeYekkm5jMekduF24YjuCFAJ8HEBxf9HIsQM290Vr0g1Kxk
         XRXhz724k4zHhylwV99YqZ3BFJX2wA3U9ETEwDzNy+rogukG9uHCSQ6IsV8xVxAJTORK
         gbBopDLTvie+gCO2p8biYLTfZqX/cEirgFcmGo2M/BDqFS0Zng9QrR0yRRCrf2W3BZOw
         nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+c4auDqp8RpeASJXxH/AizaarCuV0OrD1i+o7+MYrvc=;
        b=GmHz6grD4lhY0jZKBkc/MVBAFHc1hQDTz+J1pnoVq7VlQ19hES6K8i/Zt/xL/PNgYo
         0sJEgTKfeAsB/tPr2mIFJTdo3VVDNX9+qXje8dfs2fIMmVx6aHM+dYth58sOQlx6eS7h
         nZFtdylMzMceNP3w7Bh0gJfuHqeeedE4/oTmvmkmneUU8CLGbBAzUNQBBR7P09mFvMDH
         SqxQfKKjmJ0/pE6s0+fb2ncslDIhl6OoSc6ZnLOa34q3i6jyfb+ljlW7nbPrpJQNlFHS
         inZ5zvE7H7H34tUuqFb2Y/NNzxy6l6aWcqFCPeAZSWdEZDkk5gi6hlIKeWwVRuDeH6oy
         RjwQ==
X-Gm-Message-State: AOAM530t/jG0g+5lhz4zBcOyMQ9fW5GMrBvR3SFlXBU/deioDZC40hGc
        MZav88LCvW+X14JJt14XzCM=
X-Google-Smtp-Source: ABdhPJyA2MGQZOfAI7ranUZ8nwCKuHeSPF00JFiLTI0HuRzoq00ZbparL3r2DBPl4QImdQGg9tM6vg==
X-Received: by 2002:a17:90b:1903:: with SMTP id mp3mr987457pjb.14.1597252166355;
        Wed, 12 Aug 2020 10:09:26 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id f6sm2940848pga.9.2020.08.12.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:09:25 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH v2] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Thu, 13 Aug 2020 02:09:08 +0900
Message-Id: <20200812170908.51199-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810074601.GC1529187@kroah.com>
References: <20200810074601.GC1529187@kroah.com>
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


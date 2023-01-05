Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E75265F771
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 00:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbjAEXDk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 18:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbjAEXDg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 18:03:36 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75ED1676C0
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 15:03:35 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id n63so20373991iod.7
        for <linux-usb@vger.kernel.org>; Thu, 05 Jan 2023 15:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIcjgq7EV1t47RYy2g4kttoekM/X5riyLaeE0K4reIU=;
        b=EiZIWN3/cZQxN8zkJGfY1CdZSallyOkhhJ7LnB6d5OXd1pFs+BjlMzijc5JFPAyDQc
         AdnjopK2UShOVUD+11NscnTezseDtQ0Ly8pVk+YVEcQpVAELfbXGg+BmauUKTtgc2SAh
         AdN9XLTCgFqBHJslPs32f9yqJ8jh+UsP/fK4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIcjgq7EV1t47RYy2g4kttoekM/X5riyLaeE0K4reIU=;
        b=LX9i2PRHC8Syg17yV25rqDe7HfppwVjnyrh5TmWc/J/x2yNtj++mi3wRhnaY+H3xWo
         BoblpdMa8s5Nu0kRGGuz7i24f6FLZFz6VDrxMFNyj9CUYT23BKKYyYf7GEZGFCaFbgGK
         9gDkfz07TVs/IZzlhfyQEnaG7MuXF2n4TWLR905p1Xi6pX0iOI9FbMkLCEN5yAScoJ4O
         V/IfMo7niJleqw/mBS9oMgiVIdtba8jp/g6PGw4GEX3sSkJtjyphsbXUnIED0FlKBVr0
         vruzNprxKfXh49eR1GgvIp/ZSxWaJ+726R60+ObnuuYBZ6BtNsu0ssA2MFlGaI6vCkjq
         KeuQ==
X-Gm-Message-State: AFqh2krnP/52DHSDNnOtc6u7nZE0SQeCeV2EDDNZh+Sov6484MaK5pZu
        aRRjy6w+ama+e4A04JyRMc3zvQ==
X-Google-Smtp-Source: AMrXdXv5xv2bS65P/x03tj+fBkixYcHj2lZ3Be6erKfreJVudXc2F1+WLGr09SBXObNQ8fGwIGyy4A==
X-Received: by 2002:a6b:8f82:0:b0:6eb:da60:be0b with SMTP id r124-20020a6b8f82000000b006ebda60be0bmr35981898iod.4.1672959814789;
        Thu, 05 Jan 2023 15:03:34 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id h16-20020a056638339000b0035678e2e175sm11886577jav.50.2023.01.05.15.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 15:03:34 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Icenowy Zheng <uwu@icenowy.me>,
        Douglas Anderson <dianders@chromium.org>,
        stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>
Subject: [PATCH 2/2] usb: misc: onboard_hub: Move 'attach' work to the driver
Date:   Thu,  5 Jan 2023 23:03:29 +0000
Message-Id: <20230105230119.2.I16b51f32db0c32f8a8532900bfe1c70c8572881a@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105230119.1.I75494ebee7027a50235ce4b1e930fa73a578fbe2@changeid>
References: <20230105230119.1.I75494ebee7027a50235ce4b1e930fa73a578fbe2@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently each onboard_hub platform device owns an 'attach' work,
which is scheduled when the device probes. With this deadlocks
have been reported on a Raspberry Pi 3 B+ [1], which has nested
onboard hubs.

The flow of the deadlock is something like this (with the onboard_hub
driver built as a module) [2]:

- USB root hub is instantiated
- core hub driver calls onboard_hub_create_pdevs(), which creates the
  'raw' platform device for the 1st level hub
- 1st level hub is probed by the core hub driver
- core hub driver calls onboard_hub_create_pdevs(), which creates
  the 'raw' platform device for the 2nd level hub

- onboard_hub platform driver is registered
- platform device for 1st level hub is probed
  - schedules 'attach' work
- platform device for 2nd level hub is probed
  - schedules 'attach' work

- onboard_hub USB driver is registered
- device (and parent) lock of hub is held while the device is
  re-probed with the onboard_hub driver

- 'attach' work (running in another thread) calls driver_attach(), which
   blocks on one of the hub device locks

- onboard_hub_destroy_pdevs() is called by the core hub driver when one
  of the hubs is detached
- destroying the pdevs invokes onboard_hub_remove(), which waits for the
  'attach' work to complete
  - waits forever, since the 'attach' work can't acquire the device lock

Use a single work struct for the driver instead of having a work struct
per onboard hub platform driver instance. With that it isn't necessary
to cancel the work in onboard_hub_remove(), which fixes the deadlock.
The work is only cancelled when the driver is unloaded.

[1] https://lore.kernel.org/r/d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com/
[2] https://lore.kernel.org/all/Y6OrGbqaMy2iVDWB@google.com/

Cc: stable@vger.kernel.org
Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Link: https://lore.kernel.org/r/d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com/
Link: https://lore.kernel.org/all/Y6OrGbqaMy2iVDWB@google.com/
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/usb/misc/onboard_usb_hub.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index db0844b30bbd..8bc4deb465f0 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -27,7 +27,10 @@
 
 #include "onboard_usb_hub.h"
 
+static void onboard_hub_attach_usb_driver(struct work_struct *work);
+
 static struct usb_device_driver onboard_hub_usbdev_driver;
+static DECLARE_WORK(attach_usb_driver_work, onboard_hub_attach_usb_driver);
 
 /************************** Platform driver **************************/
 
@@ -45,7 +48,6 @@ struct onboard_hub {
 	bool is_powered_on;
 	bool going_away;
 	struct list_head udev_list;
-	struct work_struct attach_usb_driver_work;
 	struct mutex lock;
 };
 
@@ -270,9 +272,15 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	 *
 	 * This needs to be done deferred to avoid self-deadlocks on systems
 	 * with nested onboard hubs.
+	 *
+	 * If the work is already running wait for it to complete, then
+	 * schedule it again to ensure that the USB devices of this onboard
+	 * hub instance are bound to the USB driver.
 	 */
-	INIT_WORK(&hub->attach_usb_driver_work, onboard_hub_attach_usb_driver);
-	schedule_work(&hub->attach_usb_driver_work);
+	while (work_busy(&attach_usb_driver_work) & WORK_BUSY_RUNNING)
+		msleep(10);
+
+	schedule_work(&attach_usb_driver_work);
 
 	return 0;
 }
@@ -285,9 +293,6 @@ static int onboard_hub_remove(struct platform_device *pdev)
 
 	hub->going_away = true;
 
-	if (&hub->attach_usb_driver_work != current_work())
-		cancel_work_sync(&hub->attach_usb_driver_work);
-
 	mutex_lock(&hub->lock);
 
 	/* unbind the USB devices to avoid dangling references to this device */
@@ -449,6 +454,8 @@ static void __exit onboard_hub_exit(void)
 {
 	usb_deregister_device_driver(&onboard_hub_usbdev_driver);
 	platform_driver_unregister(&onboard_hub_driver);
+
+	cancel_work_sync(&attach_usb_driver_work);
 }
 module_exit(onboard_hub_exit);
 
-- 
2.39.0.314.g84b9a713c41-goog


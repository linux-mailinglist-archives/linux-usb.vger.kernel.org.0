Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7755664776
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 18:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbjAJRdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 12:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbjAJRc7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 12:32:59 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D227059D09
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 09:32:57 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id 3so6416509iou.12
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 09:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtDNURmcpxSd4X5CvSSnrMvtckUZqJr40ZSleDNYRZs=;
        b=PSSbxEopop8onxh/vKdHAcgs4yAkwL1+Or4bv4hn/RAv/zJ7mJeuy4G8Fvq6/C6wFM
         qu8sY5piesWyr/yiuxpF39tJvv4fSSU9ne6kGhXfTFlbDTZ00kIXNjUuxI/flIJMuFx7
         +MdlVzkigYOHg8dZS1mM/rlisjpzcf0ju5PBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtDNURmcpxSd4X5CvSSnrMvtckUZqJr40ZSleDNYRZs=;
        b=s4gunx2CL7YsS7OXO7ViJH+4LNZuI76bMGvmpZFhKrTb9hDTgxmyFyEJB3xlpKJpqF
         Pe4xMYLg7zArWoK32J6yxC+SWNnTO3TvOZ/DfNm+GYAK0X0fd3UuXpUqIRvIRGsT1RYY
         jUhJTJbMpnz59S6r9mhamcYBiMU7zaP/ekT1q4mRlRhoJXOTIShU7FS3cjbJY/NkhqaG
         JY2lEzdzVRYy/1n+onaCKOpNvILMJQbvMbjt35i2Eli1JenLWrL7m0heo90VHYIS01Ce
         ysV2aU2QcvQaay14IFMGrucxA0OO/JNii+1hKanq9NaIEVSkCYeLSorG4T+9AvAT8H9u
         m/Zg==
X-Gm-Message-State: AFqh2krnEHwuIp1pt7p1SZcnClsIE4vLxGaF+hJDzo47eF5us7BbkfGB
        ORHMxS7Z0snxEu6KqHTBiX1gUg==
X-Google-Smtp-Source: AMrXdXvpXvMe09tsbZT3n43/sy0SmBNBMcGmUZYebCUw7PUGrhsQko+s/6SqyEcy5wClUoFKEktBcg==
X-Received: by 2002:a5e:8808:0:b0:6e2:af6e:3b58 with SMTP id l8-20020a5e8808000000b006e2af6e3b58mr46499475ioj.12.1673371977226;
        Tue, 10 Jan 2023 09:32:57 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id f3-20020a02a103000000b0039e91c28766sm1230804jag.167.2023.01.10.09.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 09:32:56 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Icenowy Zheng <uwu@icenowy.me>, stable@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        linux-kernel@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>
Subject: [PATCH v2 1/2] usb: misc: onboard_hub: Invert driver registration order
Date:   Tue, 10 Jan 2023 17:32:52 +0000
Message-Id: <20230110172954.v2.1.I75494ebee7027a50235ce4b1e930fa73a578fbe2@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The onboard_hub 'driver' consists of two drivers, a platform
driver and a USB driver. Currently when the onboard hub driver
is initialized it first registers the platform driver, then the
USB driver. This results in a race condition when the 'attach'
work is executed, which is scheduled when the platform device
is probed. The purpose of fhe 'attach' work is to bind elegible
USB hub devices to the onboard_hub USB driver. This fails if
the work runs before the USB driver has been registered.

Register the USB driver first, then the platform driver. This
increases the chances that the onboard_hub USB devices are probed
before their corresponding platform device, which the USB driver
tries to locate in _probe(). The driver already handles this
situation and defers probing if the onboard hub platform device
doesn't exist yet.

Cc: stable@vger.kernel.org
Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Link: https://lore.kernel.org/lkml/Y6W00vQm3jfLflUJ@hovoldconsulting.com/T/#m0d64295f017942fd988f7c53425db302d61952b4
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 drivers/usb/misc/onboard_usb_hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 94e7966e199d..db0844b30bbd 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -433,13 +433,13 @@ static int __init onboard_hub_init(void)
 {
 	int ret;
 
-	ret = platform_driver_register(&onboard_hub_driver);
+	ret = usb_register_device_driver(&onboard_hub_usbdev_driver, THIS_MODULE);
 	if (ret)
 		return ret;
 
-	ret = usb_register_device_driver(&onboard_hub_usbdev_driver, THIS_MODULE);
+	ret = platform_driver_register(&onboard_hub_driver);
 	if (ret)
-		platform_driver_unregister(&onboard_hub_driver);
+		usb_deregister_device_driver(&onboard_hub_usbdev_driver);
 
 	return ret;
 }
-- 
2.39.0.314.g84b9a713c41-goog


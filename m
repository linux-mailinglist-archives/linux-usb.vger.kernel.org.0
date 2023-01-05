Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C146565F773
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 00:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbjAEXDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 18:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbjAEXDf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 18:03:35 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B9B671A9
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 15:03:34 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id 3so20380439iou.12
        for <linux-usb@vger.kernel.org>; Thu, 05 Jan 2023 15:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PKtGdnj7K1nIf21o9CBuILUH/eT3WWN8YJ/Zsofy54=;
        b=e5xCzs9eHgOshb4PQlWO3g6CpcSTy9nAAbg6XfYg3NaRY9CT1M2YCGqM+0k2FbaRpp
         Up/kNOGwIxauumMuFVspQksn2rzRNaML5ce917OqicRwWAe5uUD8XleQAmXpRZ/+bXTB
         iAjBE1L+LjfhewIcoNlw8nYHwYIAfN7l4TpSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PKtGdnj7K1nIf21o9CBuILUH/eT3WWN8YJ/Zsofy54=;
        b=QIIicM7rgok7o5tkla9nBNhzQ78llk77MH8oSzlSLGKY6OHG02oImlsY8HMXfybGJh
         +jllUsq1Pe5v3Ennf+LuFeAKTgzh67SJO0nClcYcVqb9HOH2LygwACvzxxtsUegLL1Rj
         i50x9Azw7Lcy91Or23/OMZN6z+0Kgk86VB3kgjEanFD8qc4d6PHppRmISscViTfTXwDx
         1OPLfoBV85b82E/lnmiKC17vyVE6N/S+7kZ9Fhl/4ht0VOcsUz4hqroGk2tFZrEMp7Gt
         H2PdLsBv9nKilD7aiqDItW6jWFctAeKs0SE8cR+ydxp+me5K7mlYTeKS5rcIButTZqps
         Y3sQ==
X-Gm-Message-State: AFqh2konuEuKLndQBjbG0HnIjG4GNiic9GwmIE3q3mCZN1aXzwrtpT/P
        jSnYTJJoUguUivqmHC+1eeqzFA==
X-Google-Smtp-Source: AMrXdXvNqpk0qaKFu47wsvMYKArFyeWpcODyizy2Chp8AcYgv1sUOHof5qWgWoKG6yV5Jr3xYuFB2Q==
X-Received: by 2002:a05:6602:1785:b0:6e0:3930:244a with SMTP id y5-20020a056602178500b006e03930244amr34979590iox.9.1672959814020;
        Thu, 05 Jan 2023 15:03:34 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id i7-20020a02ca47000000b003740de9fb65sm12164782jal.46.2023.01.05.15.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 15:03:33 -0800 (PST)
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
Subject: [PATCH 1/2] usb: misc: onboard_hub: Invert driver registration order
Date:   Thu,  5 Jan 2023 23:03:28 +0000
Message-Id: <20230105230119.1.I75494ebee7027a50235ce4b1e930fa73a578fbe2@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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


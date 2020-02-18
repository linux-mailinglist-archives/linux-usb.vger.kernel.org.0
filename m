Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEDF616300C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgBRTdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42059 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgBRTdS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id k11so25371511wrd.9
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9nGneN4FF9FG4UqBBakQfwNSGfoHUIS33OCajZHkIHc=;
        b=OvB7KyfyEVZHQJfu/Zd/LprOMDUmwxj14FNKr6Qv5XAFcb22USOTj1kGcVyzSm2RXH
         GOHieY/yIwsFCWpLr7XeqeJFhQ2DHcc5hfwydTprXHOaUcga3Qr6pHSjYIrf/Q6XSqNs
         StC1ITm1/WWYjQjMd/IQgYHp8BYmvOMfPS8J4ma59IkWd4rpCEd0Uqlh8eApv6pRHK6L
         Am+CSNySXgEsH1c6DqlpNBEoavoJxGyRh4mZ2ettOdwynUmBA/cwJRYpCMtcG7mCrbWt
         I+x9br1lCHlQvuXWsY3Jxq1xXA6B97Pj2unGQN7+kNssu99Qej/NoUcH2bdCd8hY0V8+
         tEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9nGneN4FF9FG4UqBBakQfwNSGfoHUIS33OCajZHkIHc=;
        b=mMzcGnZDY6uAyqxCpcr8TQURoES5zCnfoI+aylLXBUhbt41SP8eEOuAEw8bDdvMIlo
         RhW970GWYkM8KyA/RcU5I6pltlYD8XT8+h/Hm0Ym65IKt/6Dy3h3aRVHwW05zkgHvxtf
         MaGqK9BVm93MAtFtBc+Sx9Hr4IMD9ZeV9P9wjr3XtoxbsmuyU3n5A6WIAMTNpKtM4Gqs
         PNE5FJB5T8ac4G3hQnIcCFqnYQiZp2KZj362DL5Gyfm7Aj9/tL2dE0rAooUjSWOj3tQN
         Ecq0KBH63x12oV5uF9e9joKVTKx40Ho6uS4A0nogVCApzBU5pn9/6Et/ktD+bZTWdYYe
         Z2gw==
X-Gm-Message-State: APjAAAXl528hdU+bTcNMzqlzhktcAlDTUYC/wEreIG96nbdQKSJHmPvr
        w5aZ6bCh/15X0ZrE0KEbhIWfRA==
X-Google-Smtp-Source: APXvYqw3rW1kRcZH/PRtRWgPRBFpvvRAhqVbY4TEosssX4QTBJn9TlTcWsGkj8OA5iYx8iCEg6BUZg==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr32891365wrx.153.1582054395840;
        Tue, 18 Feb 2020 11:33:15 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:15 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 01/20] usb: gadget: legacy: gmidi: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:44 +0000
Message-Id: <1582054383-35760-2-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_composite_driver name is const char pointer, so it not useful to cast
longname (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/gadget/legacy/gmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/gmidi.c b/drivers/usb/gadget/legacy/gmidi.c
index 9eea2d18f2bf..265c392810d7 100644
--- a/drivers/usb/gadget/legacy/gmidi.c
+++ b/drivers/usb/gadget/legacy/gmidi.c
@@ -174,7 +174,7 @@ static int midi_bind(struct usb_composite_dev *cdev)
 }
 
 static struct usb_composite_driver midi_driver = {
-	.name		= (char *) longname,
+	.name		= longname,
 	.dev		= &device_desc,
 	.strings	= dev_strings,
 	.max_speed	= USB_SPEED_HIGH,
-- 
2.24.1


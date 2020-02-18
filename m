Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A1516302E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbgBRTeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:34:05 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36899 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgBRTd3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:29 -0500
Received: by mail-wm1-f68.google.com with SMTP id a6so4208915wme.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fhwn2ZW4+Oeu69BMvqd1Amzh30rqArEOAoeVg6PmOWg=;
        b=x0+U/skHhXnfbCeAgDwjQ8qJmDqyWtwDQlK7yFyQgERkVEMatsfBRZLy22osPctvse
         3q/bu1g2a1LEB3zjxbu3vETUdfOTugPNK76akGMUrub/BXHMFAG4ytSUwarKnCwwvjpO
         JNM05lNSHeykBpxAZFmqERzbfjrpwHZUTPKfErl5MFcDqYgeXfT6Hy1uikV6IJG94m1v
         T8xnTTvkJoN5gpQom6SHVyZUlLtuo21m58D+APxd1ixlpSXrkhOiD1q5u9XfEJr0ySDX
         aEhqNTVRPMUET3PRSWjME5kMLFoH2qjYOGYOSIk2kfBHDdi+UxjnyTNb6Ch5+SEw8wnD
         XXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fhwn2ZW4+Oeu69BMvqd1Amzh30rqArEOAoeVg6PmOWg=;
        b=aj/C1mortFh2dkIZa9kX4xjZV4J3mvqv4sBcAiAr5jR38IgkJlioRE/nMZ2iYLDM0x
         3esch/mzoRGqXGIHaftJ2knUxmegmjv1Vhsq6nF7MyIc2t+QzHXkX4x/wWhGG3+jxKB0
         hwZXHyPDRIO8mcVHo4cjCOgReoLQnr8goiovD9Xsw9c67LI6YV/AN57s5WqA6Jet7raQ
         rt6sxD5R/4ffDNmXRlYT0g/rn188gpPcKPElFrH9pd8XFsWdt10a6V7EzyLw83Z2wXPv
         2xMqy4gYMpq2kGvZdU3JGHQopgzCm3Eg9rQrAMI/YniesSzlbqRsGdwBsN+cx6RkqA3t
         R7BQ==
X-Gm-Message-State: APjAAAVJZeW1muGc2ii9CMCpq+4Oymqvq4y9FdsCBHt0KM99vYM9Yljc
        ub5mPtf+DmaX00wlNqbfEAGeMg==
X-Google-Smtp-Source: APXvYqwU6LtJ+4yda1ST5mI7xKccXgYcyuYDViGv3r6yI47nRAJx8KQ7bO49LiFdYcP4+WBJfA7+AQ==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr4945747wmb.114.1582054407086;
        Tue, 18 Feb 2020 11:33:27 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:26 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 13/20] usb: gadget: r8a66597-udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:56 +0000
Message-Id: <1582054383-35760-14-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_driver name is const char pointer, so it not useful to cast
udc_name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/gadget/udc/r8a66597-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 582a16165ea9..537094b485bf 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1968,7 +1968,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 static struct platform_driver r8a66597_driver = {
 	.remove =	r8a66597_remove,
 	.driver		= {
-		.name =	(char *) udc_name,
+		.name =	udc_name,
 	},
 };
 
-- 
2.24.1


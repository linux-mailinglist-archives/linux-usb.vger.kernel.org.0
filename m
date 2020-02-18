Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B314163014
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgBRTdg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:36 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39175 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgBRTdf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:35 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so25380643wrt.6
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9BZxWx02OP4buIGB38mrXrqxMYCE34rX+OIKJheO44A=;
        b=vHu2+iekn6Oz45OTWnDlijL1xIyW4xkjqGKkztYOlh+VqZjEXxOUZogmPjm0uhL3/V
         gJav+pFLI7bnwITiXHYBTJOQCt1H18pQPE3Ji7+43gVecfGmcg27f+q5JhGAiwl9bXgb
         Qxll7KGR+q+tUJ9rBM2IMx6DMbSMEDNR4z+B4NQh9q+qvRk1d3gwZ0gN43pQkfCocdWP
         kSqpMOKEQC/fKZQ3XDc7jWmKUngekWsp8nTHflds91EXP+wpw1qdJg9DedOwHzg8ttPs
         6skwhW9aMZq16dU+dI+RSXH0UUh+6C3E1q1QvVPxYFSptHKzp4O6B0vVsRRgsjuOdTXG
         2hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9BZxWx02OP4buIGB38mrXrqxMYCE34rX+OIKJheO44A=;
        b=Tym9lmOyJa4wszoNSGNQLMlH4ke9wfk3lgERxOBMnbYgg0e0BrcrwE7OvXcj90DEro
         2Z4+r43x/mAfYAO9KRxTWVPK+x/+xXiMq+LH7lhCxeEnnFLXr7x0srYafLg7g88A4vFG
         c9twRNWivr15OLiAxJdln4kHIfojhf5JRfa6bk3ck8Kbc069WCBJOVVONCO1RWb61x5A
         vpADb168yBnk0xwkF15xDmpL4wU7LIxHKXKDegqe6201mdZ5MXftks3kOOjCJiJrqnQF
         CpvcoITgm5GmseOdUep2Qy6snk5FKBBM2Ly6Ri6A+c2zm85gWrkqaaFXqXpStRbJmihH
         DMfA==
X-Gm-Message-State: APjAAAVEQzZ4sYJ5JAN03TXEO3Jva1VrUJRuPEg5UKDZjL+kCvmU7pDT
        kFVdrFq6VkayV/855fEuvLqTvw==
X-Google-Smtp-Source: APXvYqxAXsDdhHT9Ljp22hJpRE2F0hVTr7iFO7n0ITXn4kLzmd5GWP72gHNUHkKcm9jzsYtEYezbWw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr32460635wrs.213.1582054413698;
        Tue, 18 Feb 2020 11:33:33 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:33 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 20/20] usb: musb: core: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:33:03 +0000
Message-Id: <1582054383-35760-21-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_driver name is const char pointer, so it not useful to cast
xx_driver_name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/musb/musb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index f616fb489542..d590110539ab 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2945,7 +2945,7 @@ static const struct dev_pm_ops musb_dev_pm_ops = {
 
 static struct platform_driver musb_driver = {
 	.driver = {
-		.name		= (char *)musb_driver_name,
+		.name		= musb_driver_name,
 		.bus		= &platform_bus_type,
 		.pm		= MUSB_DEV_PM_OPS,
 		.dev_groups	= musb_groups,
-- 
2.24.1


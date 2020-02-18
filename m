Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C705B163028
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgBRTd2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:28 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41727 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgBRTd2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:28 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so25421042wrw.8
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K6WHmT1Q8HUElfvFbGW9Dh3Pw5PPNoHiq3K4083/U04=;
        b=106kcsSZ4LU/10R3o2p3osg/GDCO9WirwxTaO3LgTuMSCiG6apeUuthE3ZI9gItity
         u3rzE4mWwKv5n+cW9tmSB7Ljv+JXMY7bKTrWbRycZSmP5ElaRG6v8N9oPitXuBHcCySp
         +NtWaIFwwI2D2ajZEPiV1vAf4U9PlAdEVAVPs7xXnu1LVK7OhvEbrD8Hahoczg9oGCsH
         EebqJfPXqOrchabWBFKUzzw7WwpKStIUtPc63sCOdzDmYqOrv0HhZFxD6vaG5KMAsD4u
         UQwtvBDEDgMYHK7UQ1hV+wnAB8qJkk6PjAyK4MEvTJz5X5AXC+emiuSSYN+EsbVu6yWS
         hXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K6WHmT1Q8HUElfvFbGW9Dh3Pw5PPNoHiq3K4083/U04=;
        b=KzbOOYbwXY7zGsESlv5+zhUuFmLY5UPNh3WiptrCwyOh1kevN2NAamoBHpOpf6iof1
         UFndiPlWKMHdUY355Q0xTTeziITfpTEAErRDHi94/GDUu7NV+tZ4AnZ3PUqmxAZ2vTB1
         NiPkJXAiLqsDP4oitl61I+iv/RnfNhWRgGZcKSU70iqcPiWw8kZQA2tsfTRkYmeSmpVt
         nlQnGr7cKSFp1RkMQSQ4uh3rNTNkWw1XvwbZfP5AJgTP6EnHUR1PA9fnLTVx88qam1w4
         GTJT+ZHzbvnpsQyj1JUeuipkHZo/p6ZfdTNrr0QaNfgwobbg/UktWUYHroZB1EqgW0dq
         iXeQ==
X-Gm-Message-State: APjAAAVKoF3xDGu7pWejSEJYEO6P3quge9JWlXn8X3jRhp/oxuKbEA9f
        PDBQXZfPCklVByPmcTQ9HeVvbA==
X-Google-Smtp-Source: APXvYqzvoP4MSFReUflySE73Nx02NzCW0jknJD3OEVLpu7rFICnkripQt1AiTb5uiiwG9a8GPfXtEA==
X-Received: by 2002:a5d:55c1:: with SMTP id i1mr32971190wrw.347.1582054406291;
        Tue, 18 Feb 2020 11:33:26 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:25 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 12/20] usb: gadget: omap_udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:55 +0000
Message-Id: <1582054383-35760-13-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_driver name is const char pointer, so it not useful to cast
driver_name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/gadget/udc/omap_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index bd12417996db..bf87c6c0d7f6 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -3001,7 +3001,7 @@ static struct platform_driver udc_driver = {
 	.suspend	= omap_udc_suspend,
 	.resume		= omap_udc_resume,
 	.driver		= {
-		.name	= (char *) driver_name,
+		.name	= driver_name,
 	},
 };
 
-- 
2.24.1


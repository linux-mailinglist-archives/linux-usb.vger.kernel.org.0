Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6391163031
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgBRTeV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:34:21 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33429 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgBRTdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:23 -0500
Received: by mail-wm1-f65.google.com with SMTP id m10so2910018wmc.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n2/6Go98pHaxpLCc5lRLRHeU4KxfdOQs2LuzJH/tK0k=;
        b=RRR7WIr1e0sQU9K3EdoR/DhnYIc4/rh3LiZbPMP3o7KsDxgcrnlOejN0fh/4Y8Rh3Q
         PlF1am3pvjHFriwsTGetrBUQ+vxK91j/cwtv861hpab+b7fFGhLBT/1KZMhBapKahvxp
         +cMVOJ9slgZWA9SfAfKhFxyCeQizK0oe1imzaUNU5ICbKQepRp+X3gthGa65xy6AG37M
         ymq1Q8iA1cfeopQSGsQ7Lq/TYulpxOdga90qXJW77ShQyoU3ip//MS9KhaqE7b4YUfaU
         qEBv7669Xyp3pbtXR46v9X4zfy/GYbkyjOTmFk4dvqifb81mNHbp5lBHfYnb+JVH61UU
         GZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=n2/6Go98pHaxpLCc5lRLRHeU4KxfdOQs2LuzJH/tK0k=;
        b=Ebdj0dyFEyyuWw/BvlzwHO5kfk4NHSr9B2LfNMxGggmn+IxcTFEy5CQiYlhrJtNoLX
         7aLN0nWXmZtmCs4Z1PrqRz1E8aCzJFC29VDWrdQcKDW0pmkEoy0Ww1iFHjNK6zNYSmqf
         nSALcnbKwLyxNuwh/eu8LRah+3s/XmlVj7buH5tRkJh54UUGaO9BrCo3EcHNtALBIXXW
         l+NMktiXlCfmMBN4+Xnjb2hvKxnybkKMkD8t9pBOnwZOgoCYsJorIjnf9dXHFweZuvQ/
         J1IWS7Gfi4tnCec/pwnS/vMU1/HehmfQtKHVhGH0rRwxQlBQ1pdiLcoY8TshjkTc9thu
         IhTQ==
X-Gm-Message-State: APjAAAU5RNKueI/ATiJQJGruIH3l4KSGVtNinYs5Q48L3nm+tysJCZPT
        CXPZhFxYeHtHAIEy2TrwiKcn2w==
X-Google-Smtp-Source: APXvYqyC6GjfeEE6nKgfSsSWz1/SSC2ZJpbMalzrWcB1oLvQHLfxW6Z17TFDIAS/YBVFDc1UIIhZ2w==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr4978411wmc.185.1582054401703;
        Tue, 18 Feb 2020 11:33:21 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:21 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 07/20] usb: gadget: fusb300_udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:50 +0000
Message-Id: <1582054383-35760-8-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/gadget/udc/fusb300_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index 00e3f66836a9..9af8b415f303 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1507,7 +1507,7 @@ static int fusb300_probe(struct platform_device *pdev)
 static struct platform_driver fusb300_driver = {
 	.remove =	fusb300_remove,
 	.driver		= {
-		.name =	(char *) udc_name,
+		.name =	udc_name,
 	},
 };
 
-- 
2.24.1


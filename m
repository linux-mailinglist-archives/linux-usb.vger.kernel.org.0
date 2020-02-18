Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D27D163025
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgBRTd0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:26 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34470 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgBRTdZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:25 -0500
Received: by mail-wr1-f68.google.com with SMTP id n10so23454389wrm.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a7GEUna4G5RbXgq36EEYG2D0rjG6W8XH0Dtowe6As9s=;
        b=uRA4WO9lmxzJnN8WEkKi9RYhzj9YdW4cC5DYKICsVnNVacaQ9MyMZEa4pfRD5PaLh7
         t4uQnDrN90AItIWNienqvMAEsi0QfgYojLqhX8Cslw43H772RfSWRJ2e2IUOeKoSUiiM
         OtNwNmQ1yt9Qi3fO3AzxzoO083OuTRvtSFYnV89VAeUEPm2yiBEL90t0H5mp8tvDunq9
         czQIqOIzmzh6a/+kyiMFY5A35uqoNv37t0TJjaC68C90dxdGaUNw4yEfDRJKsMpvQZ2q
         L7qW/evqTpfiokn5ukUW+9GLzuBhFPFF4K42xCrxbVB04kMD1D3VguZdnT74SrPzX5Ie
         LULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a7GEUna4G5RbXgq36EEYG2D0rjG6W8XH0Dtowe6As9s=;
        b=qvQgdSEZLtavJIZmznh17E7Zd0m6b7f5rfjU/lODVIhU2Gu5hxoDIuIhcPSC8SD52S
         KghFc6iDQYAMHfaxYStiAbcL2D/UoW0heNHCkUX4wWbo0/L1AZ4sMf75HWpMgQ9YcP1J
         ePKTGzLJDq3hI4CsGECFeuglPssOT4217/+owOmIs+2wBwK9NAfeaAcTiV2sl5F6P5j0
         gT+63hgsApLdaQLiczp+C3hM9nCQY17ccOJxocvwlGbLXj8vCmKcv+lDi+4p53D5Ql4i
         lTJXcSgv3i2FMKcpuvwx/F/aPwCLf5/8xUDIwOvwtyoJN679IdcQJC0N+kEkzzzE0yPP
         AFCw==
X-Gm-Message-State: APjAAAWNAL+a6WBkDChxOVUkaFrHTawXZGICnptXr08COC2MfNjneZIl
        03dvMc9BzdUs+GjLjXGr5P5IDg==
X-Google-Smtp-Source: APXvYqxjXR4su4Hv72/U7GmAiRCFdmARwCRra/TybDUrWP+GSOq0Tnw/N56bhpE0fdQ/pQE08M6Y+Q==
X-Received: by 2002:adf:f986:: with SMTP id f6mr31872129wrr.182.1582054403557;
        Tue, 18 Feb 2020 11:33:23 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:23 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 09/20] usb: gadget: lpc32xx_udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:52 +0000
Message-Id: <1582054383-35760-10-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index d14b2bb3f67c..cb997b82c008 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3267,7 +3267,7 @@ static struct platform_driver lpc32xx_udc_driver = {
 	.suspend	= lpc32xx_udc_suspend,
 	.resume		= lpc32xx_udc_resume,
 	.driver		= {
-		.name	= (char *) driver_name,
+		.name	= driver_name,
 		.of_match_table = of_match_ptr(lpc32xx_udc_of_match),
 	},
 };
-- 
2.24.1


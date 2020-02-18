Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDA4163027
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgBRTd1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:27 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34471 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgBRTd0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:26 -0500
Received: by mail-wr1-f66.google.com with SMTP id n10so23454428wrm.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VMhMCON8OuPufsG3ipSiCKDEgdVOYQVgnIzCUNgOnkY=;
        b=xB0Z0aPPPvTY5q59s/RiIVELERzjH2U8BFSMfOWfBxU2w29Zfc9KMc+U4jFuEPyX7a
         uJ/OxOvBnsGCSNGOJ9l5BqsfOc8Oj/HkX1E7JK95tLefzhDZYcFbWpgM+GTIYQaS0q+M
         6YAbCjlcGgapYWOvCKTdsoJaM0ekXgBQCiNgCLo9oFbtNOY4Dsj1VuZ0AHGF27Cn833s
         63gK3tlkEQbl61aBlFDS6LJAMCPYSQK+cU3iOdRmeuPsv5VXxNl9X/HL4nV1KMW4e2Kc
         wydsLep3EGtzxBHuZxoMEMPZ/DC7SefkXC4Mgh1lYfJgXyfXI2onhupUqgL/x2xFBL50
         NATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VMhMCON8OuPufsG3ipSiCKDEgdVOYQVgnIzCUNgOnkY=;
        b=hlBUKD3viRC8uuUrbM1YgBQPO3BRp/xqmWA13GqLVktIhAHE7uw47B9FZ8k1VWpK3S
         NBWYcqM49dAvzASeI0On1TW1UN1CvKXI2zlP2jCZa/RegXPcaoejb2X0+XXlheWnTmEW
         +Kw2lhsj7ly8O5D1/qvF9/iFo6oRiOx+O7+EIFUFYGO1uVG+6UTmBxYh8OWTheUtSedb
         Y6jpYA2FeqM9JX7X1xFAixSvtxn/3qY145SwfBxVSpM2TNh0C/hXugYHLuQdJnRlGcic
         8Uj6zcKnm1NepcEVhgvVrgse2R7hLzxmUUOenyg38dEeU31ufASSsUe6ESzH+UrEPunt
         WowQ==
X-Gm-Message-State: APjAAAXgH0Wfdaw3hSCa/gmEo/8RbjOhxX0R6+bUYnrU0fIMvbRzV+/w
        Serjjh3QAxmwHTd82SI1eN+wTA==
X-Google-Smtp-Source: APXvYqzckUIyriHGnsYfrHwscI3IStYXXWUqfYiWyMM7Rh4jYCpfpR1iboxY9wA3gVwPxIiNgFDTCA==
X-Received: by 2002:adf:dfc8:: with SMTP id q8mr30710027wrn.135.1582054404454;
        Tue, 18 Feb 2020 11:33:24 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:23 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 10/20] usb: gadget: m66592-udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:53 +0000
Message-Id: <1582054383-35760-11-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/gadget/udc/m66592-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index a8288df6aadf..75d16a8902e6 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1691,7 +1691,7 @@ static int m66592_probe(struct platform_device *pdev)
 static struct platform_driver m66592_driver = {
 	.remove =	m66592_remove,
 	.driver		= {
-		.name =	(char *) udc_name,
+		.name =	udc_name,
 	},
 };
 
-- 
2.24.1


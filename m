Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1025163036
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBRTdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54294 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgBRTdU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:20 -0500
Received: by mail-wm1-f66.google.com with SMTP id n3so1790952wmk.4
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MaLAtkjRxzJam7Y2UUkQL0f+cfe4YM8Rlep2oOYDR4k=;
        b=kAbhpKkW6Qgf8n1gsp1qpisZqrAfOgVqPywaJl9q0N7aQAo5i9LsHbxPp49sb2xW9A
         3UCjfTTxyQH8SLjFsjhp3xFTTml+jboMB1DqnvKg1zVl0HouT6gjFlC67xr5nYu1SaAw
         4d4lnUUHzNlYu4K0FkHR3WbjYIS9FAOCdZgsmIIclVEPxOtHXaJIphzy6XdFu2f1h0cp
         ilFXA8PK2zAUfhEGMkiouWb9K7PaU8ZbBf1h3DeM1hB0FWS4EBEAMvarMJsWWHESP6k+
         yT3FIhr53D1jIio5A0NQ4eg4suK2ojST4Xw0YGA2DUUTij0M9ku6ffuhTAShAqvW3CGU
         SYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MaLAtkjRxzJam7Y2UUkQL0f+cfe4YM8Rlep2oOYDR4k=;
        b=uPPUpsJjXKqdrmAT1xWAXp7Ny+lKvCvLYLv+QU2e1NnG2rYt97F/ct49/s64FeKI81
         Eg6/JdfR/IsbZ3j5w3+2DsxXOez5+VIDwlzl7qNPzvXJXlmXLgtm0AjYFpp7SUmWyFQf
         W/DWLzBVpNUJL5cDpr97PqAnJINZhLqZR3a3Lx5AJb5rJRIsZw9SMV6vQ8cBvvcn1AFE
         ugXCjWVXNvDL6WkwT1ISx7fCkO/ZP8goN0mLEHJtUZDEGSvA8xxy2bvHjK5wke2152/7
         JjLaaUzQMx6vkaRt1eqfAyPDTA7RHytlF2bAjqqhz7UTSMa36nTkKVqTsoR3wrU8ZNcd
         5LEA==
X-Gm-Message-State: APjAAAX/R2XiBPuFcvsNFptuTxpSYaHWKGJm7EaSt2OQVh2uTcHi05NM
        0bvk9p6fNd1KLrwRrjx2DZdu4A==
X-Google-Smtp-Source: APXvYqxcx1r+IcoGtXHd2hQV1AZzw6FglIgIvVP3Ij/NByDoGTZj5rYGpAki6fUvsL6Az9tGsFk0eA==
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr4836846wme.183.1582054398819;
        Tue, 18 Feb 2020 11:33:18 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:18 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 04/20] usb: gadget: at91_udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:47 +0000
Message-Id: <1582054383-35760-5-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/gadget/udc/at91_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 1b2b548c59a0..eede5cedacb4 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -2021,7 +2021,7 @@ static struct platform_driver at91_udc_driver = {
 	.suspend	= at91udc_suspend,
 	.resume		= at91udc_resume,
 	.driver		= {
-		.name	= (char *) driver_name,
+		.name	= driver_name,
 		.of_match_table	= at91_udc_dt_ids,
 	},
 };
-- 
2.24.1


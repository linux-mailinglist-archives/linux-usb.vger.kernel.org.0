Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6ED163034
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgBRTea (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:34:30 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36846 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgBRTdW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so25458285wru.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AOWCbHndeZPS5+byfbryCBkvxECGgsEdFqsZA/3IxRs=;
        b=uU2854W9t9Wy+R1PcnzelLtDSm00kguTfVv2dKnIl6fYk87418YBQyB44AvSD0Tv43
         7OJUIUpcXGYeEe6TRdeliUT0QK7jxD5wCt9BdXKfdHXqHtoKSO1T4C1Bi3r0BiGiwfSs
         BiPe35HKcbG5BK0ytQY4yWO/u7N7uU7AvsF9bmUFFooaBGFBrXRgQcUylWVA+G+Lkdp6
         fL3E05K9ryRVMePNm3y7zIaC/mtl99vU92cthki3SsP7I0GOcwUAV73zIT3pxQmuVZkM
         91rP90GL8c20fRjpWCesgQjtUzZS1Z0EFkphxUuKw7mrrAjeiI/JrkjRQyHLPOX17RSS
         2fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AOWCbHndeZPS5+byfbryCBkvxECGgsEdFqsZA/3IxRs=;
        b=ZBn1YZQJzb8dhYiYCwZd4FhhDy7nKdUld0m2L/IcL8VTYYfWKtiggH1atyy9eI/qsH
         xz2p/zK0wxsAGi4T0ewM/6/9MERJjBAVIHSUM0F+CI56O+92BAyf0Lwmz0BfzwGUemI0
         NeWd52efr6Mldy0Os8tFzrkM9gVZwM75gRr3yy2AcP99BtNmBHqB52VYQNxKcjcGddmF
         mibwPZ0BR/ncNTlTFM9ChLYh1IHXqW8WMXcy3lY3XMNMOAWWkVknSfD4ox6zUZ11mgE2
         2FTiBEcu/AwtaqRoFe6LT7jUB/m8vs/3Vq71Xc4nkBP8fR4HnHZxmp1WPlfHKo+pEDj5
         bElQ==
X-Gm-Message-State: APjAAAW2KduIDYQaELj7a/PgNI96JvBtsIqGGgXl9kd9fLxIyjnrZqIb
        r21dr2OQWLEUJ6/AanL4W+YJsQ==
X-Google-Smtp-Source: APXvYqxWwSnTlhW6CSi27BoAt02KsGM3sb4bgJm52rNZkiHzGKPso/pT/s28vLFiQQJ+HdZLVSIYhA==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr32598309wrh.371.1582054400814;
        Tue, 18 Feb 2020 11:33:20 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:20 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 06/20] usb: gadget: fotg210-udc: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:49 +0000
Message-Id: <1582054383-35760-7-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/gadget/udc/fotg210-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 21f3e6c4e4d6..d6ca50f01985 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -1199,7 +1199,7 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 
 static struct platform_driver fotg210_driver = {
 	.driver		= {
-		.name =	(char *)udc_name,
+		.name =	udc_name,
 	},
 	.probe		= fotg210_udc_probe,
 	.remove		= fotg210_udc_remove,
-- 
2.24.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB4FD163020
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgBRTdW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:22 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40937 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgBRTdV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:21 -0500
Received: by mail-wr1-f66.google.com with SMTP id t3so25385816wru.7
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MHonpuv7CKuPglJHIaWmpMCNHqnlw8BincncIn85484=;
        b=xPlX00MbtZPFdDI8x/pR7q0l1TZpqo2MP/MlI6syrVxWnNMq3POocxJWNitt2FlfxK
         ca40BfKAOFXHzRriPeTtPNg+bNr5ei/h3F2xMcHQwCEDcOb5WPV5mCq8naeI6ImybtU/
         bnVwuMQjNelohtlU4ihbZGDKOX6knBA76tIlFkcrBCXLkHOlGCLftfdvMEAZQ/Ba4aSD
         EqRICW1GkyQoFz0XWgtwU0MVv/use0zPoxumU8KbBonqUWBy7wfeVjZcjs+RqGiKuUVt
         p5gck6BIpA9G/WG4ZGueIPji09RD6jn5tBIZWSMjJsWk311ldnufMQtfArBWaKdpSykE
         pwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MHonpuv7CKuPglJHIaWmpMCNHqnlw8BincncIn85484=;
        b=Zkf+zWCZtfNen/4Qj5AoQikllrg7fM+XMIV6UO+vF0QxnLPLu+rdTJorzFoCInkNPA
         OXr3Hy4/1Pz++hQmziaEUm48M7mrMdKQjuqNpFNMNH9j5ZulNJf/6Hb4826hGXczoKVp
         fd6GiFtyxPDWTSuXXOFNagE3mPdxyGQC9w81dfYWHd2m6SPUffTRqM9PJG6CZqr93Wc2
         NhO8HvcneIlcQJSsFl17S+P4bSrhfWdO5Rhd+48d27Iz4Ps2m9z2VLDw7lj4SypRLcOH
         kDfdwWanUxRPHpSQ9YwIL/ugnkejr9w0yXMVMckN0vvs9D1FXN7YxEyRk5xGF+1v24BK
         l2Hw==
X-Gm-Message-State: APjAAAVVqeixQCbUzub5+omOhJo0TC2DnC0A0ElNdyRAnGcpY1OCjAZo
        MqHwFkKxskcP71hIf6Z8Awi+mBJxySY=
X-Google-Smtp-Source: APXvYqwDYnjVJED0t0uAAknTEyT+FlngUXNJYoICixbTq4qdRKzsb0cy22FB6lKxXU3H3aF+0ybUNw==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr32215756wrr.172.1582054399956;
        Tue, 18 Feb 2020 11:33:19 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:19 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 05/20] usb: gadget: dummy_hcd: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:48 +0000
Message-Id: <1582054383-35760-6-git-send-email-clabbe@baylibre.com>
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
 drivers/usb/gadget/udc/dummy_hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 4c9d1e49d5ed..6e3e3ebf715f 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1134,7 +1134,7 @@ static struct platform_driver dummy_udc_driver = {
 	.suspend	= dummy_udc_suspend,
 	.resume		= dummy_udc_resume,
 	.driver		= {
-		.name	= (char *) gadget_name,
+		.name	= gadget_name,
 	},
 };
 
@@ -2720,7 +2720,7 @@ static struct platform_driver dummy_hcd_driver = {
 	.suspend	= dummy_hcd_suspend,
 	.resume		= dummy_hcd_resume,
 	.driver		= {
-		.name	= (char *) driver_name,
+		.name	= driver_name,
 	},
 };
 
-- 
2.24.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771EC16301B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgBRTdt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:49 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35845 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgBRTdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so25458767wru.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kXwAGZwN4heqrm+yisZqSC1971kXzW7z7pJvBg5a/VA=;
        b=WXbdgkRzz5bJUy/h9WLUJEoNOZR/kJIuqcw8w2abFn6go/1ZB6+eLoDZIhb7ewUiWM
         437/g3AnYe/8BatYTAt1Npl6AlTSuHbHeV5fIky9gyMf45x3EKU/eO3ujlo3rIFRBjt3
         8RiafI6Khpn7vQWe39P71bMeZj0ZndEtYNEWgQnCswKehQpa7cBrhiA/sMm/VyLJAOh5
         aUzf36wvBk2vWJ6SQO6vQSqFu5d1P2k2GhCLLKhvQnbn7JPwOm5cyWWAU7PZca4plUzy
         7hnc8gmWXooxeFHIo5vduWgn2tHBbfg39iCWhn/F6BH1Ky9P4VFTVcnoAqZkT4v1SaEj
         hsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kXwAGZwN4heqrm+yisZqSC1971kXzW7z7pJvBg5a/VA=;
        b=uKVfw9D0pq5c16MgnMROixAI25VuqqABGtXgRPhMCWC0Ag6xsiHUN4tH2+SrBcdngJ
         /nuzLglav9Z49kxgP4a9bXT5Tu/hnInQhVhA7iiK4e4dmGNgvJYmVTR+ajOYVdU3iC/j
         v7fqIVPDZ6BdefxuKoFNdGoP060OtYtaF8VQSCYYXG6srZhuTBdKgQV0mH/Vye5a2VW2
         oI2Bsbfkz4uNlfZXt5vdXJAG4Mr20ZUZWdlo1hXzSjbjEm1i3PUppqPtZ5Xvwlu5sVSE
         QZQZD6/u6tpbwKYet9wwSbHlsMCBuJFa07FmJ6xPhzLQgjGLR08hEWE43ZWvyDhdTLh8
         8sPg==
X-Gm-Message-State: APjAAAVe+C0l1rmolaBlbC2QL59lgbViRrgY96eJ8z0DGRvd9xOisyF/
        kkntv5YTcHj1WrbRRD70lQqgvw==
X-Google-Smtp-Source: APXvYqz9QEapK+rHVfxz1jZEt08EcWoid6BWixbA5raOfT1UtuZhp2XypMaSFN4hipm9DH7zI+zXkA==
X-Received: by 2002:a5d:4d04:: with SMTP id z4mr33060983wrt.157.1582054410617;
        Tue, 18 Feb 2020 11:33:30 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:30 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 17/20] usb: host: sl811-hcd: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:33:00 +0000
Message-Id: <1582054383-35760-18-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_driver name is const char pointer, so it not useful to cast
hcd_name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/host/sl811-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 72a34a1eb618..adaf4063690a 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1792,7 +1792,7 @@ struct platform_driver sl811h_driver = {
 	.suspend =	sl811h_suspend,
 	.resume =	sl811h_resume,
 	.driver = {
-		.name =	(char *) hcd_name,
+		.name =	hcd_name,
 	},
 };
 EXPORT_SYMBOL(sl811h_driver);
-- 
2.24.1


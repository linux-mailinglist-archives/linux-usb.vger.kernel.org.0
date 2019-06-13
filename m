Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8877B438BD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 17:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732514AbfFMPIS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 11:08:18 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37826 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732381AbfFMPIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 11:08:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id 131so18911606ljf.4
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2019 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twuon1pV88N5w58du1ZMvPHHkTqfReQHTcWT0lfhbQ4=;
        b=i6UQnWpbKkfGTO3PpH/etcs9Sy7BCg5VFKySFn9Abg2OC7ZT/83jRSCfTFBys0PqMo
         m6T/0U0sfQIOnLI2MOz9YcFDzSegHoWZ/wqY4fLkOV+jj+FSkgoB78HmFaAwU0ROPvuo
         MGxBNNZYq/73OEB+V+8Y/kjDJ8NLmZFzuYEVRSHqUDUvDhiYC5yB7B/44o4Z9WJInivJ
         xC3h+oZynP0Evu2o+uvJyDWvLwvyebsq7Ht1C/ylwxNAceiPLb+I5Ua7ZGlz5pDwplHx
         Mr0tCeW73+bbhxfaneILccTTXIaXTR4RfE5eIwF67mtyz9h2yu/vdrm88SsgUqLdN6FC
         ePQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twuon1pV88N5w58du1ZMvPHHkTqfReQHTcWT0lfhbQ4=;
        b=AcoHs7f+30zF7XvmVcPSZ6/XMp1KUyjla0lKO0vwp5wLwHE3qPrRbd9xAz85lutWIQ
         lyqUs3irNImzydnaNqpqFEyaPbQzKPNAGZ04VhdPET50vN3OLwFXU6xb83zqpQrPVTmu
         ZjajP7jneThm1wXaVJRPLWiAhrGFNUmxJoCJgJm89Ch7CoiRXjpm2DxJDp0KJjSprWds
         RRKsuKdR1f3QxF0FPXS+oPE5Kr62y8SQ92vJFLjgNs1EHt7XsVneTZ0XB0X7WE2/qfvQ
         o8RgqQWR4v3mFk012Exlw7u26cjjM0Wp5N2a3UCTTs9zo0vG+EGMwoQGuikuO1Hc5ihi
         VGLQ==
X-Gm-Message-State: APjAAAWkpsdYuQ5Igj34CNNRMRSMm+ZsOYkv9ZnneUao0Gey5FXw8XF1
        gFU9T0wTTZGkvH6oZWkbgpYStW8DqVw=
X-Google-Smtp-Source: APXvYqwjR3wt2uNqTMYXdAu5zmxlWzSIqGVXVuuev2vRr8i1qGuokrmajON9xgk8Bo9k2V36JqQ4kQ==
X-Received: by 2002:a2e:994:: with SMTP id 142mr17315487ljj.130.1560438495686;
        Thu, 13 Jun 2019 08:08:15 -0700 (PDT)
Received: from linux.local (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
        by smtp.gmail.com with ESMTPSA id t3sm9114lfk.59.2019.06.13.08.08.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 08:08:14 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] usb: host: fotg2: add device tree probing
Date:   Thu, 13 Jun 2019 17:07:35 +0200
Message-Id: <20190613150735.27977-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Hans Ulli Kroll <ulli.kroll@googlemail.com>

Add device tree probing to the fotg2 driver.

Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
[Drop DMA mask coercion, drivers/of/platform.c does the job]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/host/fotg210-hcd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 0da68df259c8..e835a22b12af 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -10,6 +10,7 @@
  * Most of code borrowed from the Linux-3.7 EHCI driver
  */
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/device.h>
 #include <linux/dmapool.h>
 #include <linux/kernel.h>
@@ -5669,9 +5670,18 @@ static int fotg210_hcd_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id fotg210_of_match[] = {
+	{ .compatible = "faraday,fotg210" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, fotg210_of_match);
+#endif
+
 static struct platform_driver fotg210_hcd_driver = {
 	.driver = {
 		.name   = "fotg210-hcd",
+		.of_match_table = of_match_ptr(fotg210_of_match),
 	},
 	.probe  = fotg210_hcd_probe,
 	.remove = fotg210_hcd_remove,
-- 
2.21.0


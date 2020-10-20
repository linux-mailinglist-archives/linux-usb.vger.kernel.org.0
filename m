Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277EB29383C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 11:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405627AbgJTJgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 05:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405630AbgJTJgl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 05:36:41 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C5AC0613D1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:39 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id e8so1023120qtp.18
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=AbwKAlpRbBzxsSe5kAQOuBfb52JpqxZSOcBoGgGmeso=;
        b=sl1B9B4vv5eN+xZj8B9SY5vK28/8Nz1jwaPbrJE/msIPNNFFrSoEQqmU27cNWPsj7y
         Cyss5ayFY76AwKFLzGi94YERh8DiK3EOWwCSXg1atpnwpbZc2K4KfOT2WhTDHrlxoPYV
         QoE1lckmwc9BQVRE+r6PwlNae93PF0QRYcHcETgJwYKZ40VJLrSCR0Da/3+WEfNwYLtb
         LUy+A76xKqOuZ37h80XOimz++QLKGagjQR1UeM06nwzTRcoY6lIZJP7SnzCbVBUCj4eY
         UZe+MMDdbJ4TJ2MpI9eSuu6wWjp80QdchZ6TdsUmQ6JHRJ2T2EdCpe4IDuikDEWeV7pw
         g48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AbwKAlpRbBzxsSe5kAQOuBfb52JpqxZSOcBoGgGmeso=;
        b=RneHvYTLWO5NtP1uD4NCEzvbvvJNCwcNXTDq2K9J5VkCvJMT1nAKTqIQWih6QsTVAe
         aKykHlCEJLp9sEku5w+z43E/ODmNvJ6HzS+Umfh5E5Az6ZWbNkYcF8GyHeTXrfEfGW7a
         ISsIBcw7UAzx1G61Elgtqpwq45TcgaYLfyBNYnC9Y8C+KUyGlETpQLGAQJ5IYoT0S2s6
         qyy2ytNkIuiT8naP8gLR1L+f5UhMgahqlb6BV95rwNy0sjrwuaIZOb9FEIJhhUAxb9CF
         hZIhV5KbNiuT/2jIr9Yj36VohNZAAiRGw9Vq4XLoA5dMEaMAgD3wcKvMrxMcooP77K7Z
         2WFQ==
X-Gm-Message-State: AOAM533sRDUvr7r0TOReGEdvpxG8IbgLuxpISKeoNX7dLEWzi+ltjLkk
        aKRA9TG7fPqJm8kOHupHqKiDjs3ZqTw=
X-Google-Smtp-Source: ABdhPJzu69fZ64i2g+ZoQbQGoUr1mjfdEBTdPzFBtfaMMP+XumcOlSeSNGCvZcEGbNqKAO/YAfp54nsGZ/Q=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:ad4:5184:: with SMTP id b4mr2229953qvp.26.1603186598658;
 Tue, 20 Oct 2020 02:36:38 -0700 (PDT)
Date:   Tue, 20 Oct 2020 02:36:20 -0700
In-Reply-To: <20201020093627.256885-1-badhri@google.com>
Message-Id: <20201020093627.256885-4-badhri@google.com>
Mime-Version: 1.0
References: <20201020093627.256885-1-badhri@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v11 03/10] usb: typec: tcpci_maxim: Fix the compatible string
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changing compatible string to include the part number.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
V11 is the first version of the patch.
Introduced to add chip number to the compatible property to address
Rob Herring's comment on dt-binding patch.
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 723d7dd38f75..82cc257fefd4 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -481,7 +481,7 @@ MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id max_tcpci_of_match[] = {
-	{ .compatible = "maxim,tcpc", },
+	{ .compatible = "maxim,33359", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
-- 
2.29.0.rc1.297.gfa9743e501-goog


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB47C319D19
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 12:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhBLLKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 06:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhBLLKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Feb 2021 06:10:05 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B30C061756
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 03:09:25 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bl23so14856302ejb.5
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rlLh4//iWZyEBEZPRaomxRyEMiLXg3cCHY+JyO0G7JU=;
        b=SROUYIJxYKS6e9z/oKxHAxZIqn6akTZCOJjTZnNSvtUY9H5BuvlePhg9ZW3gU8K8oc
         vd6QEHk8Oo7GkN/TbDsUfyrHf1HJuSSECCDOeRxvlKE/9xotNvgRZrCmY0lT4ewrhY3r
         JIeZhQ44SFjdsCxYO4nIhacNVq0cKJT+gxbIc9aXzjcOYqvzazJFcXwMVR8/dJpt4rAe
         wD8hTuz9R+oZHmsnHgy7b0FfQ04X4MkE9wIsYDlnxAUyEPgvE8Kb5RY07XsvNZ2tv3gG
         4ohJ72yyaN+shb66k7oQclRwVf9/Jp9H7DAKLo6qaqOSdVpzj5jEHlvPnUjmb7ZObE+Q
         w3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rlLh4//iWZyEBEZPRaomxRyEMiLXg3cCHY+JyO0G7JU=;
        b=qMiG5NT17q8alr28zVnqrcWh4XMYISM3qPN64MIWB2FBwXrLg1OLJhbgRY36tp4mHA
         4eq9amPxJQCO2FfmK9R7d9elhBWwo+/3Uq5T1FaYNmCFBHcLnaOnbljKtcxs4HXVJppf
         xCpv//8CUvgc8yeKfbUukQKQIoXfvWkT9GZ/4YgXIVYUNBlw50XxlvtAuDAWAiKiFVub
         bi1zRBbB83IiAQpdiSQu9baD+usdnV4EkufcyQlIRz+GaDTXLljl8316wQQenNFk05Bo
         SwQYqUdDFThWNgKsq57PzzcJ1teRTd/pWu8+dMguv6Yr4it8xSxyQcL4j2WDhvwF25Jf
         LLuw==
X-Gm-Message-State: AOAM531PHrrbjXOIgVL4FddMeXaOtJYomsEwasnuwcXvKHlZFDnIuP2U
        lErpXukVEWO2YkY5VbfqiCMHtqaz0HJgAQ==
X-Google-Smtp-Source: ABdhPJyfsVHtXPC8OB68Ek9I1ZDiLmjIqItUZIhXmx7064b+FcaAscSD6fTFdP5LgOLxi6nDjp/e9g==
X-Received: by 2002:a17:906:f6c4:: with SMTP id jo4mr2421019ejb.67.1613128163881;
        Fri, 12 Feb 2021 03:09:23 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id bf8sm5573106edb.34.2021.02.12.03.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 03:09:23 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Cc:     Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH v2] Goodix Fingerprint device is not a modem
Date:   Fri, 12 Feb 2021 12:07:39 +0100
Message-Id: <20210212110738.169808-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210212104423.166197-1-ydewid@gmail.com>
References: <20210212104423.166197-1-ydewid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CDC ACM driver is false matching the Goodix Fingerprint device against
the USB_CDC_ACM_PROTO_AT_V25TER.

Keep the entries sorted on in VID/PID.

Signed-off-by: Yorick de Wid <ydewid@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 78190574581..41d20a44dc3 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1922,6 +1922,11 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = IGNORE_DEVICE,
 	},
 
+	/* Exclude Goodix Fingerprint Reader */
+	{ USB_DEVICE(0x27c6, 0x5395),
+	.driver_info = IGNORE_DEVICE,
+	},
+
 	{ USB_DEVICE(0x1bc7, 0x0021), /* Telit 3G ACM only composition */
 	.driver_info = SEND_ZERO_PACKET,
 	},
-- 
2.30.0


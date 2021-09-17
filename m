Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D8C40F4AF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbhIQJX2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:23:28 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53386
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245614AbhIQJVH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 05:21:07 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD3AF402D3
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631870369;
        bh=v3zufeUBr4GbgUChP1ldLnEXsCACG0UXT8IRgkTK7zc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pw0YB0dvK3j7xzia6WkuxoDpm7jJNwnmqEvQSNW5SCGj8so2C8h08p14Gwtz8oqlO
         sSju3TWJ4Ep5ueMvPO1sPTkQ7NJAY+RUXO2yNf76KoUeMS4WBXo5A/ejEMhCVYEV9D
         W5zDhKHJhNfheeePZjExhYRm66N88M5OER4XK9q+R1lfazpF/Tjjjouxg7x2UrPAI6
         Bhw9WGFntpOZPnNXBjOk98wt7P7GNWWSvM85bmYgS4TO8o/0PqJSAQ2whscbB9G9ht
         Daw8bujD5qKKIEzQ8y4FV3HV6dbdSZ/Vt3xgMzlZWr5j+YMC9MxA0XLvdzYkzOAwyd
         tuZESwdqx3c2w==
Received: by mail-wm1-f71.google.com with SMTP id g128-20020a1c2086000000b0030a1652fea8so991213wmg.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 02:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3zufeUBr4GbgUChP1ldLnEXsCACG0UXT8IRgkTK7zc=;
        b=TEJoJKdxVAZ5wRc+y8aZn1iZ6LT8lEwjD40xfjqhKU7VWvDbLj+s5NuzWQ1P/WGt6J
         QjzMKig7rXON+w3RmgIBncyBtwlk6Wp5UMm/l0yHMSSWnqh28X0Wz/ZRvbBDDIfV3Fsl
         QKKsjqpE8clXnNgqSM3GWvNHNSQ5MI6FC2yfRvt4d4okNMIxafAHa+LDkQfK1ZsKNAys
         Ft6ThVO6PVkg57duOj6wy79Y+/7uYsHwe3Ix8NWJSyHbXI53sZi5eVitf5f9QD/xeX7V
         6DwWxlnWZ2FGftkSefKRNw/3p1FeLiFKAWUx3ypGKIcTmUCeSECa7MR0A6P0HV4Qnm1j
         eMsA==
X-Gm-Message-State: AOAM530gzeaKDB91kMvodt60izee2nLNzQ+7T9oMNzMydNMWmp7ngcC4
        NQOoDwqsnYJQvfCbXRYjxh0+pF5MZ6D6610DLuQ7YxOSNUHfwsQ0+u6QSnT62D8LwIRs3gdwZgf
        0KdJU10TGOHEvLAz24R6og4OLAeFMnX/mA5AWYA==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr14022933wmi.113.1631870369639;
        Fri, 17 Sep 2021 02:19:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOgTUg0ILE+RdpToIOf3sMG9gWSaPzCluuUUN5YLTe+mASPOVCEmyvkPvgT4HprE0vldYWZw==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr14022917wmi.113.1631870369495;
        Fri, 17 Sep 2021 02:19:29 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p1sm5678354wmi.30.2021.09.17.02.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:19:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/3] USB: serial: option: remove duplicate USB device ID
Date:   Fri, 17 Sep 2021 11:18:48 +0200
Message-Id: <20210917091849.18692-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917091849.18692-1-krzysztof.kozlowski@canonical.com>
References: <20210917091849.18692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device ZTE 0x0094 is already on the list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/usb/serial/option.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 29c765cc8495..57c5a03a29c1 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1650,7 +1650,6 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0060, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0070, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0073, 0xff, 0xff, 0xff) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0094, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0130, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0133, 0xff, 0xff, 0xff),
-- 
2.30.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD6369BA62
	for <lists+linux-usb@lfdr.de>; Sat, 18 Feb 2023 15:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjBROSi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Feb 2023 09:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBROSh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Feb 2023 09:18:37 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2EF1717D
        for <linux-usb@vger.kernel.org>; Sat, 18 Feb 2023 06:18:35 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id fd2so3125447edb.2
        for <linux-usb@vger.kernel.org>; Sat, 18 Feb 2023 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kjkoster-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ0+iixyqVjR+IG4rGfbCPTS5oslaTSbKWc5ctXYZ1c=;
        b=w99nn+Y1hGbXsl0joO6c7QPMZtrB363mfCa55Y5+HraMKbWS5X/p08Ja/vopVG0Knx
         0V19iTqYlak1wjTs6PDE9BDbLASyxmuykCMYh556LaTn5egzhZeNPoatDxZ6MdNL/fR+
         p8I9bpQu65roZLtskUOmYECl/CjLQGShdOfHVxTo0zm8p+5ejZxamFySdJPC5jNFFOAm
         d2L2RWTkmfMl4mQVTnPeSq17ZYf7qDN9dAXbQbnF2LoWfy2NV9XKCtDlaPFbbMtt8LE2
         DQE7FpWvBEBayiEMmM40kVOyiRiQMstxJ0vfYQ5j35/HYY8ijQ8iZfA2u1z6BpzsYS4S
         rpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJ0+iixyqVjR+IG4rGfbCPTS5oslaTSbKWc5ctXYZ1c=;
        b=jBN3XFPW1v232DkULDhIB4kEDqxsy5OY0wPVZHVAZmjHC7IGXkOdofMSD9rdpRt1mz
         2U/RqHFrgjXFsolxYuW5is4xGx8fvbdnu/7DfJO0lmmYB3V8EJSsIRSAgtxqyVHc7brM
         HYNrhFTQ9d2rRKgOhxaRhvg+DzVazVD2NeiKPK/HsCiQNvhMU7wvFX51O5JNPJjdY8kU
         UD/wzfNNXllPQEkPvqJGg3gfLxUQ1Cej97QFy0zKRAEmLxTfuz7chCm6xXgJcWukFguH
         UIR7qu5/vQs4EgMhkOpAqdmKjbLCBoa9bu3XOTyFvnVUPdiem4W5AAXMp7W9gJF4FXka
         PNNA==
X-Gm-Message-State: AO0yUKUSyZOOYWP+8qDffqXdIMD1DguaC0vWcgasPT+6S/Em4rYHi0En
        YG75ETZdGDNOpIm00hQIWCwm7Q==
X-Google-Smtp-Source: AK7set81MOTg+XS0FbbYfh3FjFwGdKnzYMhvIKqfaV5OsZ475DR0zeMLP9Qw/QzpUkZ4PZYJI4vGLA==
X-Received: by 2002:a17:906:1999:b0:8b1:347c:85c8 with SMTP id g25-20020a170906199900b008b1347c85c8mr1459409ejd.17.1676729913573;
        Sat, 18 Feb 2023 06:18:33 -0800 (PST)
Received: from riverrain.fritz.box (2a02-a440-b68c-1-815c-3912-2163-f83a.fixed6.kpn.net. [2a02:a440:b68c:1:815c:3912:2163:f83a])
        by smtp.gmail.com with ESMTPSA id qx3-20020a170906fcc300b008b13a1c3322sm3464388ejb.149.2023.02.18.06.18.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 18 Feb 2023 06:18:32 -0800 (PST)
From:   Kees Jan Koster <kjkoster@kjkoster.org>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Kees Jan Koster <kjkoster@kjkoster.org>
Subject: [PATCH] USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE IDs
Date:   Sat, 18 Feb 2023 15:18:30 +0100
Message-Id: <20230218141830.5612-1-kjkoster@kjkoster.org>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Silicon Labs IFS-USB-DATACABLE is used in conjunction with for example
the Quint UPSes. It is used to enable Modbus communication with the UPS to
query configuration, power and battery status.

Signed-off-by: Kees Jan Koster <kjkoster@kjkoster.org>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 832ad592b7ef..cdea1bff3b70 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -120,6 +120,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x10C4, 0x826B) }, /* Cygnal Integrated Products, Inc., Fasttrax GPS demonstration module */
 	{ USB_DEVICE(0x10C4, 0x8281) }, /* Nanotec Plug & Drive */
 	{ USB_DEVICE(0x10C4, 0x8293) }, /* Telegesis ETRX2USB */
+	{ USB_DEVICE(0x10C4, 0x82AA) }, /* Silicon Labs IFS-USB-DATACABLE used with Quint UPS */
 	{ USB_DEVICE(0x10C4, 0x82EF) }, /* CESINEL FALCO 6105 AC Power Supply */
 	{ USB_DEVICE(0x10C4, 0x82F1) }, /* CESINEL MEDCAL EFD Earth Fault Detector */
 	{ USB_DEVICE(0x10C4, 0x82F2) }, /* CESINEL MEDCAL ST Network Analyzer */
-- 
2.37.1 (Apple Git-137.1)


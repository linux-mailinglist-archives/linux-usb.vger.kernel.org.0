Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFD33D0BE8
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 12:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbhGUIvN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 04:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237962AbhGUIos (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 04:44:48 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE86C061762
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 02:25:24 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r11so1392297wro.9
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w/FaWHb0i91yDSZNyn23ErYkJgUh4BBCPr1dM/7bd9I=;
        b=BfOA4Wcs+k0Z4DcPavHhymrT6AumK0v8Lb8Sdj8OyAhLhFPiC1vEibLtQAu+zqgNU0
         QauqmAqpPYvaQ5PUPCW8rIosG1nFNpX1Ap4GHQHx3MQG1U2TFOHPuSAIXRR08VrzcdrD
         YDR+sI0I4+cJYNEes0fYnERv9v/6uZZZeaqIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w/FaWHb0i91yDSZNyn23ErYkJgUh4BBCPr1dM/7bd9I=;
        b=PomDh/3qqzIOQoaaMm/Je41owaZaHJLzbfkCswsCWGehG+vYCrsDNeb4V0BUoZMd1T
         xvJ3PPYZTsiB/LTCnOQo8M8FzjS9d3RWwjgnRqdl4fgTx6FQ9GII2AEVFIATN2u9SyOd
         W9M7POirIAEk+owJYLswIR1l3cO77eI1yqxN2nZuuy31B19VK13GV+EGvo9eXMgR3dOw
         lPjlYWBWdDjfFFEQ+Q1e7MnFt7z+jpyNBk7uU/v20Ghe2YcTUH/p1/Ddnds4t6DFDHSZ
         oFlnRp550sSR9j6JE96rFnFgBWNtzjs29x6KkeH/kjNJnF2fTKKfD5Gzeb2QHAR8sCyD
         XQjQ==
X-Gm-Message-State: AOAM532ayBENYOsxeFXOz+asJVZivs6y5q8gacyBUaAcoJ1WNC4Dox/n
        o0HQ2/iFHTNvuWwqrYcaW3lAUu11UTKtXg==
X-Google-Smtp-Source: ABdhPJyBeZsQMDkAP569oKx1snJV0jHBiNd0XdDif7w0vfrWBFEjC/srQ8rA3CACvOEshtfJ/GzFfQ==
X-Received: by 2002:a5d:5589:: with SMTP id i9mr31520933wrv.8.1626859523300;
        Wed, 21 Jul 2021 02:25:23 -0700 (PDT)
Received: from vpa2.c.googlers.com.com (230.69.233.35.bc.googleusercontent.com. [35.233.69.230])
        by smtp.gmail.com with ESMTPSA id d14sm26467491wrs.49.2021.07.21.02.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 02:25:22 -0700 (PDT)
From:   Vincent Palatin <vpalatin@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Vincent Palatin <vpalatin@chromium.org>
Subject: [PATCH] Revert "USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem"
Date:   Wed, 21 Jul 2021 11:25:16 +0200
Message-Id: <20210721092516.2775971-1-vpalatin@chromium.org>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 0bd860493f81eb2a46173f6f5e44cc38331c8dbd.

While the patch was working as stated,ie preventing the L850-GL LTE modem
from crashing on some U3 wake-ups due to a race condition between the
host wake-up and the modem-side wake-up, when using the MBIM interface,
this would force disabling the USB runtime PM on the device.

The increased power consumption is significant for LTE laptops,
and given that with decently recent modem firmwares, when the modem hits
the bug, it automatically recovers (ie it drops from the bus, but
automatically re-enumerates after less than half a second, rather than being
stuck until a power cycle as it was doing with ancient firmware), for
most people, the trade-off now seems in favor of re-enabling it by
default.

For people with access to the platform code, the bug can also be worked-around
successfully by changing the USB3 LFPM polling off-time for the XHCI
controller in the BIOS code.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
---
 drivers/usb/core/quirks.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 6114cf83bb44..8239fe7129dd 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -501,10 +501,6 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* DJI CineSSD */
 	{ USB_DEVICE(0x2ca3, 0x0031), .driver_info = USB_QUIRK_NO_LPM },
 
-	/* Fibocom L850-GL LTE Modem */
-	{ USB_DEVICE(0x2cb7, 0x0007), .driver_info =
-			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
-
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
-- 
2.32.0.402.g57bb445576-goog


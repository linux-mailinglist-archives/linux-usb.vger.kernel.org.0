Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFAC31A092
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 15:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhBLOXI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 09:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbhBLOXG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Feb 2021 09:23:06 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F454C061574
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 06:22:24 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id jt13so3307041ejb.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8b8NtLpJGyjdMRkb8/Shw7wCZj+nOJ2H7WyC/FalLEs=;
        b=ZFadcQCPcIerg/2ABu8yc05hfJExteVvAi+UVpPKvpx2Lcg3n3Ud6F5rXj+eBYFEB1
         Tn4glzuhXV1/WJ5nJK4j+F52VlwvQ8YqR+UrTBOnV3UZvVQ9ZbsI0SnBNVLf4ChVb0Yl
         gSZULK/0oCnBKEYQSJ+hEpmA5cEaOQviAsEpNgyvR81LWOrGgBuZ8TC6ABHjb1fUxKC9
         zavmBE+GOM5LwfptJcapaI6N4wdFyVy4JKrbsWgF87V2BaOHfaMl2LaqsJX/cme5wa0f
         xrFj8seB3yZdcmp2PsfirCr5c/hs3tWeIZ9M/nmiEOm071FYcfa3r51Aeg1xRmTBZBwY
         ZJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8b8NtLpJGyjdMRkb8/Shw7wCZj+nOJ2H7WyC/FalLEs=;
        b=Y2kHvE8LPkLyCPs0T1i9hDgAwRSfsyKHhYQFvU7fkyeUYXQEaQK00zjOrVrvlvSzrp
         A6Cft7+1P4JD83/gc2de0uniQ5IKFrtP8zLrGUSCihv2tff6L96z2JeoOIWJnUWvM7iO
         nfz16npAtCeHepSQwgm/b751geh+BL36iRENTwlspIBFKLjQXFXFfUG9prkFDI1tSdD5
         l/DdFfQufLASdnRKTYKIi3xN7nVekg3B1YFVSUPH4WaXw9Td8bPByHFWwZD/yRph3fj8
         jHHmZjgx7foQkS1DBSlbQc5S6RqZ2rH3CrvoTN8q9XRs26TiOwhkZYI1Exw3upgSr1cQ
         dY0g==
X-Gm-Message-State: AOAM531xrrNU7GyGuWTN7CWGX9LInBxJ96L76I2Lx61VMnz+jJ+Z9Gkd
        UomBHs4UWOeStpKpvohQQr+QUEsRyUVERA==
X-Google-Smtp-Source: ABdhPJyvOtAogGV4XXIJpyByDBg3mXcxn9hM6T4R3ngoWSuAaH/PnfzrGY80JvFmdfIVCtbGlmi1/w==
X-Received: by 2002:a17:906:fc5:: with SMTP id c5mr3171754ejk.538.1613139743101;
        Fri, 12 Feb 2021 06:22:23 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id s16sm786798edr.14.2021.02.12.06.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 06:22:22 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Cc:     Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH v4] Goodix Fingerprint device is not a modem
Date:   Fri, 12 Feb 2021 15:08:39 +0100
Message-Id: <20210212140838.196763-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <6da4b774afccbd0ad2f9727800164728130a67f6.camel@suse.com>
References: <6da4b774afccbd0ad2f9727800164728130a67f6.camel@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CDC ACM driver is false matching the Goodix Fingerprint device against the USB_CDC_ACM_PROTO_AT_V25TER.

The Goodix Fingerprint device is a biometrics sensor that should be handled in user-space.
libfprint has some support for Goodix fingerprint sensors, although not for this particular one.
It is possible that the vendor allocates a PID per OEM (Lenovo, Dell etc).
If this happens to be the case then more devices from the same vendor could potentially match the ACM modem module table.

Signed-off-by: Yorick de Wid <ydewid@gmail.com>
---
v1 -> v3:
Moved the entry down to keep the VID/PID order.
v3 -> v4:
Patch description of device in question

 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 78190574581..2f4e5174e78 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1929,6 +1929,11 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = SEND_ZERO_PACKET,
 	},
 
+	/* Exclude Goodix Fingerprint Reader */
+	{ USB_DEVICE(0x27c6, 0x5395),
+	.driver_info = IGNORE_DEVICE,
+	},
+
 	/* control interfaces without any protocol set */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
 		USB_CDC_PROTO_NONE) },
-- 
2.30.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA7A31AC69
	for <lists+linux-usb@lfdr.de>; Sat, 13 Feb 2021 15:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBMOw1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Feb 2021 09:52:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBMOw0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Feb 2021 09:52:26 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CF4C061574
        for <linux-usb@vger.kernel.org>; Sat, 13 Feb 2021 06:51:44 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id f14so4182223ejc.8
        for <linux-usb@vger.kernel.org>; Sat, 13 Feb 2021 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m+0jd54fAPfu9VhnAlJqXSUucy/8kmZAEnMMufPy+ZA=;
        b=E82ydnZ9WVCK7sv/7JBXk9qsRSAqbyxGqsIrqnteqNGz23A9Z7p6PFvFRG6dc388+H
         nf63UBuIuUnqgt4mqZBOzdY/M/dzd+JXfR+FtKukEgDwfrj8T4nL42Am5YR7KVripLKg
         BoXUDJ7lBAOfj2DWkfF0rf3L0ro0AxJ2gNVvxl2wIFti99Xlf4+uzuQXJDG31yZe7YfG
         1FLq4NoaKKxIdY8ZQSQ5/MHSTg60p62gz46i0oO9yJ0bdioODlHZGyug6Q6609f1nuh4
         nZ/FUpl2q06Nxi9QlLRO1OCOxfdDljd6pNtvy/bFVWxRSg0LpMP2FmWlL7Db3c083DO9
         3ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m+0jd54fAPfu9VhnAlJqXSUucy/8kmZAEnMMufPy+ZA=;
        b=dKfc6ZgRk1EwNa6aqumW9Hvf3+sjGotcrW2VEBkr2EJx74jECPWn1fEY1i2z+FeMgk
         +Z8kMjyq87ZKbwkhWFBcTeVSR4Gyi1G0xSflyBGDsmYChOve8ULgmFtY7YiqZVNM8dzT
         /HTQgmj/bAvZk81+7V1/qbBIL/QHftTsMJ8DHXaUvOPxObXlDgXIEJ1KYzDjdWA0MleJ
         ecfgnNTipicMSOUjwbtI+4EIjm3Zg3UyXm4ufCIBllty6a+zwB+aY3B7gSRbGBYwKWOs
         HLz7HX1WTRK3CBNS5gF1+y9WmamxUI8Hg9lWrbPkg9SijXdfgPTRqXK92yk6SQz2ToTX
         E59A==
X-Gm-Message-State: AOAM53319oUk3SidKToApavBjWKFVJ7ovFJTnBmkT+h0NGBGLHcLcogN
        AFV/jXNthbL2CDDhU8o6hA4=
X-Google-Smtp-Source: ABdhPJz8ZiE91yG2fZuX17/ORBUIwd/7HtXgTldBnx6BXOkl/Ox4q+gAEz+IMn+3S+hM+he0BzU+MQ==
X-Received: by 2002:a17:906:2b11:: with SMTP id a17mr7670571ejg.203.1613227903227;
        Sat, 13 Feb 2021 06:51:43 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id bk2sm7598376ejb.98.2021.02.13.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 06:51:42 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
        Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH v4] Goodix Fingerprint device is not a modem
Date:   Sat, 13 Feb 2021 15:49:02 +0100
Message-Id: <20210213144901.53199-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <YCagIeWw3bNmSkhJ@kroah.com>
References: <YCagIeWw3bNmSkhJ@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CDC ACM driver is false matching the Goodix Fingerprint device
against the USB_CDC_ACM_PROTO_AT_V25TER.

The Goodix Fingerprint device is a biometrics sensor that should be
handled in user-space. libfprint has some support for Goodix
fingerprint sensors, although not for this particular one. It is
possible that the vendor allocates a PID per OEM (Lenovo, Dell etc).
If this happens to be the case then more devices from the same vendor
could potentially match the ACM modem module table.

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


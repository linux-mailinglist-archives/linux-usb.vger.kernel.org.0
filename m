Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612743B0736
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 16:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhFVOTh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Jun 2021 10:19:37 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:42812 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhFVOTh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Jun 2021 10:19:37 -0400
Received: by mail-lf1-f52.google.com with SMTP id j2so36259385lfg.9
        for <linux-usb@vger.kernel.org>; Tue, 22 Jun 2021 07:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hEcoyVMHcZa0SwNISKE49LScQwvkbXhr7D+wPOeWhzw=;
        b=GSUUKOEHnFCNL4O2pE+oEruQ/1M7U0TKR4J2MDIEViB0w/yzL03VMDJJ6LGcK5LaO3
         nv5WXIQ9FaLb1CMfo7lf1ToAwSUJHbrJ6u2pKHy5PYLQrJetTTSaQy2kjTFMspIicad5
         LPJg1zgu7wBoU1PrSnlCWhNhfUKzDxnAaKYqWfjty0yc78BS5GUi9Dc+T5Tr0sIBhVr1
         z4Uy8AMcRP3cx7ODg1p2za6ZdjMgroYeRr7upKnLlcScmIPKPlbroiQ9pFYPj9w/2fo1
         rkYL10lh+LTtg4X4FYdGIUjEkNqe+3lSF9/I+Zo1sjs2zizYXumUsUyxot5JHJPhRXAN
         FnQA==
X-Gm-Message-State: AOAM530T7CT2KeYp3bmXBH3MVP9J50m11BAcj8MYs63qFB1TN2Vv0e7e
        lHyJYXXcSSjBPhS/PpgFuHw7x9kOzYBwRw==
X-Google-Smtp-Source: ABdhPJzT84aA0Xq8kPQyvGhf22P4eSTF4FVLSI/mxuygGBJJ9UhonS/m8nSBAa0h06+tQ3x75ZdHBQ==
X-Received: by 2002:a05:6512:7a:: with SMTP id i26mr3055708lfo.2.1624371439531;
        Tue, 22 Jun 2021 07:17:19 -0700 (PDT)
Received: from localhost (88-112-11-80.elisa-laajakaista.fi. [88.112.11.80])
        by smtp.gmail.com with ESMTPSA id g12sm2229156lfu.48.2021.06.22.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 07:17:19 -0700 (PDT)
From:   Hannu Hartikainen <hannu@hrtk.in>
To:     linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>, Hannu Hartikainen <hannu@hrtk.in>
Subject: [PATCH] USB: cdc-acm: blacklist Heimann USB Appset device
Date:   Tue, 22 Jun 2021 17:14:54 +0300
Message-Id: <20210622141454.337948-1-hannu@hrtk.in>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device (32a7:0000 Heimann Sensor GmbH USB appset demo) claims to be
a CDC-ACM device in its descriptors but in fact is not. If it is run
with echo disabled it returns garbled data, probably due to something
that happens in the TTY layer. And when run with echo enabled (the
default), it will mess up the calibration data of the sensor the first
time any data is sent to the device.

In short, I had a bad time after connecting the sensor and trying to get
it to work. I hope blacklisting it in the cdc-acm driver will save
someone else a bit of trouble.

Signed-off-by: Hannu Hartikainen <hannu@hrtk.in>
---

This is my first time submitting a patch. I hope I'll be able to submit
a driver for this device later. The device is a microcontroller-based
USB implementation/converter for a thermal camera that communicates over
SPI.

 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index ca7a61190dd9..d50b606d09aa 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1959,6 +1959,11 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = IGNORE_DEVICE,
 	},
 
+	/* Exclude Heimann Sensor GmbH USB appset demo */
+	{ USB_DEVICE(0x32a7, 0x0000),
+	.driver_info = IGNORE_DEVICE,
+	},
+
 	/* control interfaces without any protocol set */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
 		USB_CDC_PROTO_NONE) },
-- 
2.32.0


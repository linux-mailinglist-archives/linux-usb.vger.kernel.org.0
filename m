Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C5A272670
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgIUOAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:00:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41462 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgIUOAE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:00:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id y17so14130991lfa.8
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4/FdGn9Ta2As0651L0QV5CW8c4e0Ma+q3GzcN2EtOes=;
        b=iA2LLwWOndAMnyXD07XLwyHBno8/jY55uVdgZf4Hrm7PN7kkTkJn9vEj7xTpeAWC/Q
         bXgN8vf6dnmYHj+yjnRZ6MQRUK672W4bSR+yGs/+jC30gt0hgRMnW2+5JB97F90AnCMo
         etSFogQm2d8rrz55sV66UUUu207w6LCO642dlTC6MxBHV8vwQUiw6qkmz/DNwh/rISU5
         mkfkspxZxaSPKyYtrJwKZksDx24FM/x1uwORaKb0NkPvEwHPfVUtOEyiRCCBiUqU8LCD
         rGsEB3N52uPb6QTCXZrfRdU79CLQDmKFc8NmM38g+Z4zO3tlKptRQiWskhTv3ImxGw9F
         d0EQ==
X-Gm-Message-State: AOAM531kTuhb9aBZL4T4QcTDGxKfcm+VEUGZ1I95/u2pS7feBEmnC/5S
        osu+pvOvBNwuvjTD1y5OwA4=
X-Google-Smtp-Source: ABdhPJywIhpbNWNU5CTb6hMjLaCsc2jG87gIS6zZ1reYA9Rb73VL4oVXy8Rbwm1NBQgyXYam34o/fA==
X-Received: by 2002:a19:8089:: with SMTP id b131mr38374lfd.390.1600696802344;
        Mon, 21 Sep 2020 07:00:02 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id w9sm2612350lfn.224.2020.09.21.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:00:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKMMF-0006Gy-4t; Mon, 21 Sep 2020 15:59:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 3/4] USB: cdc-acm: use common data-class define
Date:   Mon, 21 Sep 2020 15:59:50 +0200
Message-Id: <20200921135951.24045-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921135951.24045-1-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the data-class define provided by USB core and drop the
driver-specific one.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 6 ++----
 drivers/usb/class/cdc-acm.h | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index f42ade505569..a361b937684a 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1287,10 +1287,8 @@ static int acm_probe(struct usb_interface *intf,
 skip_normal_probe:
 
 	/*workaround for switched interfaces */
-	if (data_interface->cur_altsetting->desc.bInterfaceClass
-						!= CDC_DATA_INTERFACE_TYPE) {
-		if (control_interface->cur_altsetting->desc.bInterfaceClass
-						== CDC_DATA_INTERFACE_TYPE) {
+	if (data_interface->cur_altsetting->desc.bInterfaceClass != USB_CLASS_CDC_DATA) {
+		if (control_interface->cur_altsetting->desc.bInterfaceClass == USB_CLASS_CDC_DATA) {
 			dev_dbg(&intf->dev,
 				"Your device has switched interfaces.\n");
 			swap(control_interface, data_interface);
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index cd5e9d8ab237..b7174a0098a5 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -131,8 +131,6 @@ struct acm {
 	unsigned long quirks;
 };
 
-#define CDC_DATA_INTERFACE_TYPE	0x0a
-
 /* constants describing various quirks and errors */
 #define NO_UNION_NORMAL			BIT(0)
 #define SINGLE_RX_URB			BIT(1)
-- 
2.26.2


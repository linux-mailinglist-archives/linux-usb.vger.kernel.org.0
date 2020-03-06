Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B0917B491
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 03:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCFCmz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 21:42:55 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:52787 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgCFCmz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 21:42:55 -0500
Received: by mail-pj1-f67.google.com with SMTP id lt1so425713pjb.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2020 18:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labau-com-tw.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=X2iAqyMliBeJxX/WhSjVx//gMdFh6+oYc5QUw0Fxo34=;
        b=qLzIGmeBwnujzG/8YvCvI7zU1vM+wXG8Iv7KS5wYQ0Q3jgVd2Ze6/RCjKYbcBVDLog
         JHI8WYYo9LbJ6fLtaouJPTgPRoTSwMFEjUQ2kpniF6F0ZdxJFMLaYeVKAvdhbluo0UI0
         e9oMMF3odmsw+vd6A+rWIAmaJVfhxyuHq6eqnpguxelF9/Wl6kWfMEm8+RFNnzb0ylAi
         fIVtowr0XH5Bq61bJBtqe7nrDe6hW5f0jPl8TeHxIE/qvbDhWpnfYl1z1FxG1n0YK2zM
         h/ix3auQW+oeaHtDajSzQwDNNXPlOuqZvX6ylyXrdnrsQYFnArFj68GkGeKDJer+S39f
         IiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X2iAqyMliBeJxX/WhSjVx//gMdFh6+oYc5QUw0Fxo34=;
        b=aMFYzY/+NEPrKNc5T6/jZbrQS7VPFn+ESfqstrTdRXphSbhjbvNf7DGPqPx1T3ukki
         Cf8p90aiaWuVLuUAMvpBUdQBUSAzEba7+3OWy4rGxUxbHGZhYTqnN0qeS7VjRQReA7hW
         Mn4HKXtEvuvrLMJ4w5fNisfq0KUQ0AzzQIneyDbnIUVNh2XcO4YdMI/oOCamVzCDsPBV
         J8igPXjlPBM5AMdSkYYoTBuKSLR3sXABanA2iRILXLTjaNHtqvux/bfs/4Jjq/ROmMg7
         yOmH8HpqCZCBLNHi969JZtJIaYdeAmB3PaNV9xtqrh31vQoYYbiYK9afUWZGTvFKPS27
         VNNg==
X-Gm-Message-State: ANhLgQ1Wc/V9qLOCc0QsUmuqU3HDJ8xN45w5fcocbl/tTw4hf8VEfYcq
        SaBXJKSRY+LSbIom4Zb54YcmPQ==
X-Google-Smtp-Source: ADFU+vsk3liOQkmtNF2K7LUtaWRZwQMJJnfXKTuYjW511Ti2qEiKj2FfCJN00oqlB2pKWAXOhbwmMg==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id ng11mr1252999pjb.194.1583462573915;
        Thu, 05 Mar 2020 18:42:53 -0800 (PST)
Received: from localhost.localdomain (60-251-64-13.HINET-IP.hinet.net. [60.251.64.13])
        by smtp.gmail.com with ESMTPSA id q9sm32609064pgs.89.2020.03.05.18.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 18:42:53 -0800 (PST)
From:   Scott Chen <scott@labau.com.tw>
Cc:     young@labau.com.tw, jocelyn@labau.com.tw, roger@labau.com.tw,
        Scott Chen <scott@labau.com.tw>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Add a new PID for HP
Date:   Fri,  6 Mar 2020 10:40:47 +0800
Message-Id: <20200306024048.11408-1-scott@labau.com.tw>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a device id for HP LD381 Display
LD381:   03f0:0f7f

Signed-off-by: Scott Chen <scott@labau.com.tw>
---
 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index aab737e1e7b6..5cb1c63295f5 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -97,6 +97,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(COREGA_VENDOR_ID, COREGA_PRODUCT_ID) },
 	{ USB_DEVICE(YCCABLE_VENDOR_ID, YCCABLE_PRODUCT_ID) },
 	{ USB_DEVICE(SUPERIAL_VENDOR_ID, SUPERIAL_PRODUCT_ID) },
+	{ USB_DEVICE(HP_VENDOR_ID, HP_LD381_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD220_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD220TA_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD960_PRODUCT_ID) },
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index a019ea7e6e0e..80b20e980064 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -127,6 +127,7 @@
 
 /* Hewlett-Packard POS Pole Displays */
 #define HP_VENDOR_ID		0x03f0
+#define HP_LD381_PRODUCT_ID	0x0f7f
 #define HP_LM920_PRODUCT_ID	0x026b
 #define HP_TD620_PRODUCT_ID	0x0956
 #define HP_LD960_PRODUCT_ID	0x0b39
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CD02768FD
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 08:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgIXGfO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 02:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgIXGfN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 02:35:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D33C0613CE
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 23:35:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so1272762pff.6
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labau-com-tw.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=WdbXNUPD6MY2k7zfhudyHvM2eQJZTVebaDaCbQjjSc4=;
        b=R4ZRBj8YXWIGdZwMOechCKdR8uAv2fnfhQwdmfxjzpD1CjkGzjhKxac1qzn/LpOIsQ
         kzMuCcp3Q1QSx7fgXJ2H47e+BHVMvzTeRvR/cVyHyzGHEpcHm3qHHcaAdNlHeUxns+6E
         e5WTCqYUGcfnVEvTmUJq1cG7OW1smjI/ZDRITipA1GqH9APx6JLucfGeC6E9OFzHjUgQ
         Y9oMhUw4jewY845zC5Zu00ZmLv0Ndh8NikpTff+ungAF6alTS5na1cqZsJvvsWZXNsBl
         sTkwRw9jMUuSR8KqLnu2d8Ne1fPQAjmw+KeksySBlqLLGgYpiEiX8ehAR5M7L2/pAS9m
         ZCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WdbXNUPD6MY2k7zfhudyHvM2eQJZTVebaDaCbQjjSc4=;
        b=qRv0wyeAI/B6dLj9FKF6xeYINls5hzKcP1hyBXAgft7xwqIhj1ygUsq0L/RfaafxRm
         6FLBHAe13m/ioJsYPMiA5ZEqxR7DKExm4DGDW65/zzVLRdP4kE3ZKt2RgNpB8BOj+sRs
         wQ6Os2ylpGIQfg19FjVennIBRwq98maSLcHbjPhs16WOGfHo+L7nP5Bi1OoyzIAqnw3x
         Huz2ZgLQ61U2LixJWSQK/kjrfoO9uKZELT3LHot3WkQkbAB4w4fuMUlPBE00aV75gVF1
         Fwb7rE6A66KxXsi1TChPGS3HZyl4wrnEI7AoKlEx4r3zNWI3PMoAsIc/zBqZX9ss+wBz
         D3ww==
X-Gm-Message-State: AOAM532u+mhlovdoTllAS7vpqvLN3SGrtZVk00Lh3ATfHcQ3+WeLLs8H
        CCKERzHYmV3dllTU2fRiDZByNA==
X-Google-Smtp-Source: ABdhPJzikG7gxmnbljPjmCLOet8UO5lrllVUo0qfMOp0FRkGfzZZ/16CkCAL5dUv0RHCsC0TmnEMNg==
X-Received: by 2002:a63:4d5b:: with SMTP id n27mr2722132pgl.360.1600929313019;
        Wed, 23 Sep 2020 23:35:13 -0700 (PDT)
Received: from localhost.localdomain (60-251-64-13.HINET-IP.hinet.net. [60.251.64.13])
        by smtp.gmail.com with ESMTPSA id z9sm1493939pfk.118.2020.09.23.23.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 23:35:12 -0700 (PDT)
From:   Scott Chen <scott@labau.com.tw>
Cc:     young@labau.com.tw, jocelyn@labau.com.tw,
        Scott Chen <scott@labau.com.tw>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: pl2303: add device-id for HP GC device
Date:   Thu, 24 Sep 2020 14:27:45 +0800
Message-Id: <20200924062745.5791-1-scott@labau.com.tw>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is adds a device id for HP LD381 which is a pl2303GC-base device.

Signed-off-by: Scott Chen <scott@labau.com.tw>
---
 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 048452d8a4a4..be8067017eaa 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -100,6 +100,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD220_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD220TA_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD381_PRODUCT_ID) },
+	{ USB_DEVICE(HP_VENDOR_ID, HP_LD381GC_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD960_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD960TA_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LCM220_PRODUCT_ID) },
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index 7d3090ee7e0c..b0f399a8c628 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -127,6 +127,7 @@
 
 /* Hewlett-Packard POS Pole Displays */
 #define HP_VENDOR_ID		0x03f0
+#define HP_LD381GC_PRODUCT_ID   0x0183
 #define HP_LM920_PRODUCT_ID	0x026b
 #define HP_TD620_PRODUCT_ID	0x0956
 #define HP_LD960_PRODUCT_ID	0x0b39
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFC8BB22F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbfIWKXo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:23:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35230 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbfIWKXo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 06:23:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so13311283wrt.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oT/6d6LyFvtFqQTx4wJ6Tk0Y/dbk5rpXqbyqMul5pOU=;
        b=UKk5PkGqV3qCUeUkvj1PM4WSf7AuOcNVjgwy59tFTU4O2pYBWuDUN9zZ1KAsnbjf6c
         kciOGAibydNkdLIWyYAM9psq9Ml/SvzmZe2z6pvM3WaiHw4BdSV+f28hSHzl+ER5JPU/
         RIRrYvO8hr7TN0eRVr1nzsaamd7jCISqWbj7tCcHaY/WVAQNYpaum/6vY3Dlohi0KGgi
         LlujZRvcgwRdKCe2tT4yM+kyfnf5mWtYQB4pP110PU2u23YsooVlpGXJpt2butGyPpDB
         otxmVt5W4tQolAMndWwma7OLKqGA2v4laq4pkBZbnszUA75JPJMbYIb+6FjIcSxj5xj6
         ECNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oT/6d6LyFvtFqQTx4wJ6Tk0Y/dbk5rpXqbyqMul5pOU=;
        b=DWFpTk1Q0lLZ0Ad0nzhRhL+xErkat3XZWfHfR37Z7M0nNZs77GCjYI9R662xX928mg
         nl7tFn+5rjbWXyulhBZ/uZDBGW0iUbJz2FT4IyQz2HXwS9vrfTzywAs5h17UiKvxBr95
         4Dt1kSXwPDm0MmXR9eptC40ULDE7+W2/I31bgwBccz5/xWmltBx4LfLdLbIo6wKJt7f4
         59GRzvcvAMmdkIb9rYNTjHLGJ4weoCXiflpZDaV/8Cy13lmcUEmukXArEFEkBpvbzLne
         D109fa8ETFqKRLA7ZbFNGRTrvZEz/It4NVO+14ElTmNb8GMDPoPdqosKTfEF+aLq4ckl
         tddQ==
X-Gm-Message-State: APjAAAVknxgEstIMB2dT1UFeMJWaZvZWbcu8ssLek0kPGRBIdsDslvH+
        +D6mFegKHkh02BGJYHx/nPC24s0i
X-Google-Smtp-Source: APXvYqzh0qCiw6NfaBNKJwSb4gJ1H0Jg7yaoWdTiS8jjANco07znEszQP1qMd+RLg8NhU3KbgnBuzw==
X-Received: by 2002:a5d:4241:: with SMTP id s1mr20798998wrr.101.1569234220856;
        Mon, 23 Sep 2019 03:23:40 -0700 (PDT)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id l13sm8805534wmj.25.2019.09.23.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 03:23:40 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH v2 1/1] usb: serial: option: add Telit FN980 compositions
Date:   Mon, 23 Sep 2019 12:23:28 +0200
Message-Id: <20190923102328.10627-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the following Telit FN980 compositions:

0x1050: tty, adb, rmnet, tty, tty, tty, tty
0x1051: tty, adb, mbim, tty, tty, tty, tty
0x1052: rndis, tty, adb, tty, tty, tty, tty
0x1053: tty, adb, ecm, tty, tty, tty, tty

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Sorry, forgot to add Signed-off-by tag...

v2: added Signed-off-by tag

Following the output of usb-devices for the compositions

T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=02 Dev#= 10 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1050 Rev=04.14
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN980m
S:  SerialNumber=270b8241
C:  #Ifs= 7 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=02 Dev#= 11 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1051 Rev=04.14
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN980m
S:  SerialNumber=270b8241
C:  #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
I:  If#= 2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
I:  If#= 3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=02 Dev#=  9 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1052 Rev=04.14
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN980m
S:  SerialNumber=270b8241
C:  #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
I:  If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=02 Dev#= 12 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1053 Rev=04.14
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN980m
S:  SerialNumber=270b8241
C:  #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
I:  If#= 2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
I:  If#= 3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#= 7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

---
 drivers/usb/serial/option.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 38e920ac7f82..10ac3610d922 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1154,6 +1154,14 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG5, 0xff),
 	  .driver_info = RSVD(0) | RSVD(1) | NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1050, 0xff),	/* Telit FN980 (rmnet) */
+	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1051, 0xff),	/* Telit FN980 (MBIM) */
+	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1052, 0xff),	/* Telit FN980 (RNDIS) */
+	  .driver_info = NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1053, 0xff),	/* Telit FN980 (ECM) */
+	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
-- 
2.17.1


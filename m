Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48B29BB1B1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 11:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405498AbfIWJwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 05:52:13 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:50760 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387666AbfIWJwN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 05:52:13 -0400
Received: by mail-wm1-f50.google.com with SMTP id 5so9139987wmg.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jv5fnJZZvydpbob1OfdIDe6q9g6yflDvkmSBMxBte8c=;
        b=C/geEYfKP63S0SdihaZhxvhHoAx/3Jn1o4bbEoSEkca6lSEq/BCs7XlMZCo+85vw9+
         YlaTWTGenegh1lhaH14A3RnVYO+J/0tbNeMGdO/WfhbtN+lkwEYNtaKn0tTozb2kNXQC
         XcTfb3AY50/fFBLalD4hJEr9MBtqhwmG/TUyJRqGCOe6+5HnUuBEt8VOECWHDaqE2xkJ
         PDqD9YQzytqbcJ7qs4kI8WAxqbKX3mqEvewENjOmqZOQihPJvLOgiVAxUbV/G0Eo/0W7
         ONel4iOB5Wefjeke8VBc5ou186fnaCc/m07t6FAYt0Mlx5iSY03Imltep79CZriuTbb8
         31qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jv5fnJZZvydpbob1OfdIDe6q9g6yflDvkmSBMxBte8c=;
        b=bbvNaVOOGqmDeTifHA15y1Vh63ZXpO0PSVxtKdIkvldWSrljvOXfAgYxvO0iVVLYPS
         RcUkHeySDTKDWkzwbbryXFzew2hkUrNq7TEn6NHT2hMuSgnC8kYAlVZqZQhhYQXreFHH
         dEFuZ+EqeWYdCRD18GZAU38Rygv7j11HSwAGMh9HcZxIawvtA+5xXnYu6O0MXZiYBDWy
         Mw9YaTh1asOqbTcoI/EABzKzkwhVSjwHbPSByKvROZjOqGiTMWMXg4GMZG4g7Xj/3yBM
         6jhcHbsQ+BOdey+21Gvv0mlN8mD3IhlUDjEF+R/WgzKOTlOz/d9BYggdFxCe8dFNAaba
         zbmg==
X-Gm-Message-State: APjAAAU5QyrpJbmCsP53oCtbELaym3CQc5LWoOwdG0c2iUmk9tquvoA5
        /sP1zLkd9Q/5G57jOTJj2E0=
X-Google-Smtp-Source: APXvYqwQJPolFYVfvVbC+WttXRsvyoaXuSdslLz+LFZswg5ZqkF6GiSjgOb1FVW4vq4MCj+txcNCUg==
X-Received: by 2002:a7b:ce0a:: with SMTP id m10mr13846227wmc.167.1569232329993;
        Mon, 23 Sep 2019 02:52:09 -0700 (PDT)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id t13sm18611779wra.70.2019.09.23.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:52:09 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] usb: serial: option: add Telit FN980 compositions
Date:   Mon, 23 Sep 2019 11:51:42 +0200
Message-Id: <20190923095142.10047-1-dnlplm@gmail.com>
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
---
Hi Johan,

following the output of usb-devices for the compositions

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

Thanks,
Daniele
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


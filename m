Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E0D46FE73
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 11:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239976AbhLJKL1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 05:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239971AbhLJKL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 05:11:26 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1AEC061746
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 02:07:51 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id r11so27786393edd.9
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=m75YssoAZeEc3upnhOg8VXCQb/cRu7AqXUSmMlyeUMo=;
        b=cFIN1iE0tZMKTNeioEKaRR+pEs8KyLkZssffjjiX55OVHa+h0rw/x5HrZf2dzfoPSj
         RTK7pbVzYDrFJg/i14aK80GGsp5zJknLp88RxHqPW0KJtJB2cMahibDUP9fICJg73ZTT
         MZ0IxxemjE2m4SIBVYvNpV4+Y8aYz4sIbwSyO8wRybR84i5vZ/IW8L/4ZFXsFr5cQvnn
         89qDj678ZYzK/YXPaTR6kDi/DC/8Jc8fgBMQOo71eDANvGdfRAMR3kmTsRG7LN2fuvlT
         IWlOJrkiyy4DsUl5zFv1P5oL81UXlTVoBVkbaz2IC8H3DW5oNOCrNuvXfDuta9mV4Pzb
         Ny1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m75YssoAZeEc3upnhOg8VXCQb/cRu7AqXUSmMlyeUMo=;
        b=4ENWEuAuZXPm2heh7xYmIsjX4yd85tX1iOmg5wJXThsOAEYLL5tZcLv7i04pbn7tq5
         5WIbw8qd0B6bPx7QJ3ocYCnjun2H2P2MQT0i4hjbOwnDhl2H7TpR6zFeXzOvTUTQfFBI
         vExw+k/HkZNtY790cmp/l00Xv9RJ0lZNf+aLDRN2PKRntG7n8+kDsJXrh1dn01q/8zzM
         axva0srT1+oAJupjM2C9sqWuVVSjgAMZsZQwQIxB8rkZ75hyxDnPusVvGYcafPdtKRMR
         Cg80pYv++mvnokH5pbpfXOf0RN0aWBW1KyTrnisAw1D1TGXuUQog+Zq9A48nU4yiBfNp
         faHA==
X-Gm-Message-State: AOAM531cUuShsq4VB84GuhSBhTqUq0BnzxtdxQhTB8f+wuKJGt7aCsRW
        8raTRG3A+/YjCGb6hqZKH6E=
X-Google-Smtp-Source: ABdhPJxemS73C0gSqbDxwPieYxfHzjJ/H5Qt6mgVdenKJo+bIU/eW2/Isj+Q6oR7AsEu3j8rz48xzQ==
X-Received: by 2002:a05:6402:4243:: with SMTP id g3mr37705844edb.284.1639130869961;
        Fri, 10 Dec 2021 02:07:49 -0800 (PST)
Received: from LABNL-ITC-SW01.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id cw5sm1267795ejc.74.2021.12.10.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 02:07:49 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit FN990 compositions
Date:   Fri, 10 Dec 2021 11:07:14 +0100
Message-Id: <20211210100714.22587-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the following Telit FN990 compositions:

0x1070: tty, adb, rmnet, tty, tty, tty, tty
0x1071: tty, adb, mbim, tty, tty, tty, tty
0x1072: rndis, tty, adb, tty, tty, tty, tty
0x1073: tty, adb, ecm, tty, tty, tty, tty

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Hello Johan,

following the output of usb-devices for all compositions:

T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=10000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1070 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990A28
S:  SerialNumber=522db9de
C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  5 Spd=10000 MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1071 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990A28
S:  SerialNumber=522db9de
C:  #Ifs= 9 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
I:  If#=0x3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  4 Spd=10000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1072 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990A28
S:  SerialNumber=522db9de
C:  #Ifs= 9 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  6 Spd=10000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1073 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990A28
S:  SerialNumber=522db9de
C:  #Ifs= 9 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
I:  If#=0x3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

Thanks,
Daniele
---
 drivers/usb/serial/option.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 546fce4617a8..42420bfc983c 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1219,6 +1219,14 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1063, 0xff),	/* Telit LN920 (ECM) */
 	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1070, 0xff),	/* Telit FN990 (rmnet) */
+	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1071, 0xff),	/* Telit FN990 (MBIM) */
+	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1072, 0xff),	/* Telit FN990 (RNDIS) */
+	  .driver_info = NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1073, 0xff),	/* Telit FN990 (ECM) */
+	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
-- 
2.17.1


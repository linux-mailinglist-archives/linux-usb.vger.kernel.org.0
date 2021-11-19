Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2BB457036
	for <lists+linux-usb@lfdr.de>; Fri, 19 Nov 2021 15:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbhKSOGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 09:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235173AbhKSOGj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Nov 2021 09:06:39 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7752CC061574
        for <linux-usb@vger.kernel.org>; Fri, 19 Nov 2021 06:03:37 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id t5so43493614edd.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Nov 2021 06:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=kf5wYCENHo9kPHnuAI/4+RaWR+tef+DcFgJFCp5f50Q=;
        b=YaG3V/MWWCANXu6okuPNc3QdU4ZiGq5G5yFLlwNWPBWS2/4c1aEOWiniTmCPDo2LTi
         LLRT0+ytSCDmGDWbXX21QBeSMWHK7kkEK75Jz9iVUk/yjFwohrKUKlVGbo9O1+vsJb5y
         tOBxpXg9EJg/dVgVCEg2RT7bb3K2cpjpyY1OCnoWn3USkYm7yfRemP/9/IOr4gS1y7HA
         1FP/iHA6sCfMc7ikaiMQjK8drANpp0il4b6Zsm9+lG4mBPLtanXe4FTpQpcPdZD1+g1Y
         TOOxXjWAXO3dt79bQU+7+q1tPgN52ZC8QCl9C91D7k9JA3t0QtwteOgU3rDe+G3fTUMU
         A0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kf5wYCENHo9kPHnuAI/4+RaWR+tef+DcFgJFCp5f50Q=;
        b=Qfj4zw2bOpUlpdBvcKU0bppUxbGNmyIzHuwEYsx3DHcVFlAoxfqTtySu7yt2U7w3jd
         OZhmXFNrDv3goVIM3krDu3mXuwp81L8vYnwLcM5TJvNrFD4CBzgrbO7Ac+Y0cW+H/Wbe
         +1OqvB28wY8ZtqruUdDthfqFAd4M12+k+qhy8hZlHb860X1pZ+WZOTJqefKw9yPRlutG
         fbk7XQ6xCzYJGMX4ou2MgRaHoQ2xGsaeccLQWGefk1nTwlb+S6ixD1Ga4gWScpJorBLr
         +kMzKa5iq6prH116p0wd8uOzlp2TUqdksA7/iHhcaaanT0dgCx4gKtJRxNUhpRdTiuIG
         rJdQ==
X-Gm-Message-State: AOAM5333M+u5tW3aWbnDoriIbYDnleVI7MTNdcQ/pQ67IOisujnkAaq0
        pGmugDmYxf207g92Z18zq0ujWv1P6MU=
X-Google-Smtp-Source: ABdhPJxmqOV1LPq3C1jrgCNYQ33NrSNACWpOqnKcUAkzFCaVFm/f0zTaUnBUNoIj1/ZZGtyI27PLkA==
X-Received: by 2002:a05:6402:280b:: with SMTP id h11mr25590489ede.341.1637330615937;
        Fri, 19 Nov 2021 06:03:35 -0800 (PST)
Received: from LABNL-ITC-SW01.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id hq9sm1290371ejc.119.2021.11.19.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:03:35 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit LE910S1 0x9200 composition
Date:   Fri, 19 Nov 2021 15:03:19 +0100
Message-Id: <20211119140319.10448-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the following Telit LE910S1 composition:

0x9200: tty

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Hello Johan,

following the lsusb verbose output:

Bus 003 Device 007: ID 1bc7:9200 Telit Wireless Solutions Telit Download Port
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x1bc7 Telit Wireless Solutions
  idProduct          0x9200 
  bcdDevice            1.00
  iManufacturer           1 Marvell
  iProduct                2 Telit Download Port
  iSerial                 3 200806006809080000
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0020
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              7 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0

Thanks,
Daniele
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a484ff5e4ebf..0902e79c8493 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1267,6 +1267,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
 	  .driver_info = NCTRL(0) | ZLP },
+	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9200),				/* Telit LE910S1 flashing device */
+	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) },
-- 
2.30.2


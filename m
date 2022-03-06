Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58B34CEC49
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 17:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiCFQxz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 11:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiCFQxy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 11:53:54 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F4732EE7
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 08:53:01 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id bi12so14174264ejb.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=/OF2g++NVapWas9TlzlJN282C0D0WDKqRHH9LNz4J3U=;
        b=NMoAB3/rlHHmuK92SOEyfUE4DANVvyg4LJJSlCK/PeZtCDaosbXI4lapfG3RDPzNl9
         OCQ/vp/Nco7ch/RyzQpKwLJLd1os1a6dS3UkLwMmHURVW910No/sOlt8LbIsdo9guxAX
         qqGtORhkTSq/E66AlWHkOzg53Il9ZxVyU4LDX7BmdxA6UmdPCMMzfDZt/b6xluSNvzFI
         4D1xovXWAfzAE2vK9oNTkMEUeQthZqoVRAJvO7B/WenS3L6HaLf/e3sTPcxpi/qQTSdG
         4MqgjGXkuDvRXCIvzcLwXUcJPDjPGN1ZZaLix1ZNRxFPfqETWBTC/0RgKgACsKY+sfg/
         SPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=/OF2g++NVapWas9TlzlJN282C0D0WDKqRHH9LNz4J3U=;
        b=KEI/JWkbsrf188JE/l2s/Nys3+gp3dsWKpI6x0hdctsuGjZ3gLVFwfj01BByLm+kja
         ar1UQE/Rzu54mwXfm3dwj5kcbAYQe9cdRDI0RKBEgdUaWqQfaWPIBFN6i4ZJUQaCmUKr
         bfI0W8CjL7BLiFYjTY3hFRzVe7jW1qKin1OMw+NMgsK+wWwgIsDsRURchiq6d85cFLsL
         k92x2nWNqsCn35pxo5P8wfuUXDJJKFXWB/IOpBWnCIwTlo4XkAQ/LRMEV3sy1y3wRHne
         YJm0sY6r/7lb+Y4rXmFEtCh9E7lH622iB9TDXHuOmby8ZBByXyScD3bwwDkAi1Tcwdiw
         zleg==
X-Gm-Message-State: AOAM530x6wbNNIgB5WkiCl61W+Qn4mOBWxuFRssZi8vN+YZaw/kX8fd1
        Diwdq+2ppBNmkxYTb9/1PX425IR4Fgo=
X-Google-Smtp-Source: ABdhPJxDxA6I2hcIwm3xrV9VeY/hjJ9OoFiDYxbzdWfZvjDBLmzJrUUGs3x0yaBgjf2SqUyHjST0MA==
X-Received: by 2002:a17:907:3f91:b0:6d7:16c0:ae1b with SMTP id hr17-20020a1709073f9100b006d716c0ae1bmr6324117ejc.74.1646585580171;
        Sun, 06 Mar 2022 08:53:00 -0800 (PST)
Received: from ?IPV6:2a01:5e0:502:80::827? ([2a01:5e0:502:80::827])
        by smtp.gmail.com with ESMTPSA id k3-20020a05640212c300b0041605b2d9c1sm3344916edx.58.2022.03.06.08.52.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 08:52:59 -0800 (PST)
Message-ID: <165de6a0-43e9-092c-2916-66b115c7fbf4@gmail.com>
Date:   Sun, 6 Mar 2022 17:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     linux-usb@vger.kernel.org
Content-Language: en-US
From:   =?UTF-8?B?TWF0ecOhxaEgS3JvdXBh?= <kroupa.matyas@gmail.com>
Subject: Another PL2303
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I recently bought a serial console adapter with PL2303. After a quick 
search I discovered that there have been problems with different 
versions of this chip so I include some info about mine.

Thanks in advance

Matyáš

dmesg:

[172076.820388] usb 3-2.2: new full-speed USB device number 11 using 
xhci_hcd
[172076.960358] usb 3-2.2: New USB device found, idVendor=067b, 
idProduct=23f3, bcdDevice= 6.05
[172076.960372] usb 3-2.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[172076.960377] usb 3-2.2: Product: USB-Serial Controller
[172076.960381] usb 3-2.2: Manufacturer: Prolific Technology Inc.
[172076.960384] usb 3-2.2: SerialNumber: CCBLj19B616
[172077.038242] usbcore: registered new interface driver pl2303
[172077.038251] usbserial: USB Serial support registered for pl2303
[172077.038269] pl2303 3-2.2:1.0: pl2303 converter detected
[172077.038273] pl2303 3-2.2:1.0: unknown device type, please report to 
linux-usb@vger.kernel.org

lsusb:

Bus 003 Device 011: ID 067b:23f3 Prolific Technology, Inc. USB-Serial 
Controller
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x067b Prolific Technology, Inc.
   idProduct          0x23f3
   bcdDevice            6.05
   iManufacturer           1 Prolific Technology Inc.
   iProduct                2 USB-Serial Controller
   iSerial                 3 CCBLj19B616
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0027
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x000a  1x 10 bytes
         bInterval               1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0


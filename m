Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A22662542
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 13:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbjAIMQp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 07:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbjAIMQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 07:16:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364611AA39
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 04:16:42 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hw16so7696656ejc.10
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 04:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bVDTHlYijFpTRIXjP7v3QEksgiva+IQkj5ycOT6O9No=;
        b=aB6Ly53hIM11MQ0L3KtDLpIZJqfaVWl6OxZnDj2NaJ8bL4uRxGK5Du0N9xGb7ts/AU
         FY+3f9y8ckkHHOHkMgpyGC3UU5aAUzulowgRy6VaLR4D1ds19Rn81tqRbc91yJNvgl5M
         6xQrc2gxiMBG5q3KxSw9D8zmjVtpKituQSo2ICZ9trojhcn0tEkGERP34PLEU0h9atVO
         ZVSxXoMNtyFA7fdTgi2dUG3VJVmPGlrp8e8kAL5vIE0aG/mg8fg44eyTMp71290ARZGP
         7y+jtYfM2yUSXOZ+ejlXKXnK/eGLIqj59d2I9AWMawWfaGLYG1iMexypeD452VVV1735
         aCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVDTHlYijFpTRIXjP7v3QEksgiva+IQkj5ycOT6O9No=;
        b=53hvJ6XwlBulVM6zBz4lVGNATRoKKwHbYoL3z9rqottoLjMqq68n2moX3Vd02um1f8
         Ufej0sVFUSdgGMVjW6SGHEkxw2xh5fOYCMwi4Vx5s6ohTrttiqhruFBRVEl4h9JiBPkV
         XYOI/TYoHskZsWOCTBHTerBBgvU60/oT07ldUJZqlySuibSuuCfYuU8kKNa+RaOraRTm
         DM5z4uBMFjR9//WYvZVEKTwN4euhcL//GqBlGX06LiCJgedB6kyoIWGv47XmA1IwYKZh
         xCb+yxQleyfs1qg9Bm9mahk4ZNQDfS1NrHt8GSi3+rQXvRrTsr8jmXLqfiWU09/CAnZN
         ps2w==
X-Gm-Message-State: AFqh2kq6+RCYzSwp9y+rnRVNJOH6pWPlU/gWiZ+o9MnQiwup34vHH+mb
        gg0P0XTIImANYiVZhPbwL34Gi3Wwz0bp6a5XCBA=
X-Google-Smtp-Source: AMrXdXsb+rkdbaetHIUs3ZvyMgz00uEcSi2g55FH65WXayj60Pu/3CZvJJjYUcEUcCKjO/Bzj0AHm0R/C+Vx4iodYB0=
X-Received: by 2002:a17:906:4703:b0:7c1:4665:ddb7 with SMTP id
 y3-20020a170906470300b007c14665ddb7mr6533988ejq.365.1673266600694; Mon, 09
 Jan 2023 04:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20230109115550.71688-1-qkrwngud825@gmail.com> <a8c19717-dcd5-74b6-be4b-57616ea88ab0@suse.com>
In-Reply-To: <a8c19717-dcd5-74b6-be4b-57616ea88ab0@suse.com>
From:   Juhyung Park <qkrwngud825@gmail.com>
Date:   Mon, 9 Jan 2023 21:16:29 +0900
Message-ID: <CAD14+f3f56pCp-8OVq5nUX=RdTU8r93bn5NbQYL-HckgcxO+sg@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        zenghongling@kylinos.cn, zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

On Mon, Jan 9, 2023 at 9:02 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
>
> On 09.01.23 12:55, Juhyung Park wrote:
> > This reverts commit e00b488e813f0f1ad9f778e771b7cd2fe2877023.
> >
> > The commit e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
> > blacklists UAS for the entire RTL9210 enclosures. Realtek's VendorId is 0x0bda
> > and RTL9210 enclosures reports 0x9210 for its ProductId.
> >
> > The RTL9210 controller was advertised with UAS since its release back in 2019
> > and was shipped with a lot of enclosure products with different firmware
> > combinations.
> >
> > If UAS blacklisting is really required said product (Hiksemi USB3-FW), it
> > should be done without blacklisting the entire RTL9210 products.
>
> Hi,
>
> I see this the issue. Do you have an idea how to limit the scope.

Unfortunately, no.

This might be the ugly case where, if a proper workaround could be
found (if the original report is valid at all), it may change the code
logic itself with some if branch rather than just unusual_uas.h.

With my RTL9210 enclosure, using multiple different firmware versions
still reports the same bcdDevice.

Note that, despite Hongling reporting that Windows doesn't use UAS in
https://lore.kernel.org/all/fbeffee7-3ac5-4798-14b0-724e0ed01947@126.com/
, Windows uses it on mine and respectively trim works.

>
> Hongling Zeng, do you have an idea, respectively if not, could
> you provide "lsusb -v" for the defective device?
>

Hongling didn't respond to Greg when he asked the same question back
in November: https://lore.kernel.org/all/Y29RtXGcey6V9iTY@kroah.com/

Anyways, here's my lsusb -v output. Hope it helps:
Bus 004 Device 002: ID 0bda:9210 Realtek Semiconductor Corp. RTL9210
M.2 NVME Adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x9210 RTL9210 M.2 NVME Adapter
  bcdDevice           20.01
  iManufacturer           1 Realtek
  iProduct                2 RTL9210
  iSerial                 3 012345678906
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x003e
  bNumDeviceCaps          4
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 1
      Sublink Speed ID count 0
    wFunctionalitySupport   0x1100
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
  Container ID Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType      4
    bReserved               0
    ContainerID             {03020100-0504-0706-0002-020200020202}
Device Status:     0x0000
  (Bus Powered)


>         Regards
>                 Oliver

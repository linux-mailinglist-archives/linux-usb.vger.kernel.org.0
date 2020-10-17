Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89D62912DB
	for <lists+linux-usb@lfdr.de>; Sat, 17 Oct 2020 18:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438134AbgJQQHZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Oct 2020 12:07:25 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:36374 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438132AbgJQQHY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Oct 2020 12:07:24 -0400
Received: by mail-io1-f51.google.com with SMTP id u19so7822345ion.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 09:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0xAu31PqT7JTGfJTUCz2tC5j2A260ZTkKBC1iWV3MAw=;
        b=s5UYQ9Gm8HBLysT7ohHfXu+QgxcbMzdNa0kP0q5EVq9K2GaHj6OJlSdhI/vsuLSB/S
         Vl10lBsQ/djzZT3T1HftkM6nDoq+sh6dn24vbN5B5X79vzRyfPUhch//FgVJdSGAQ3zI
         frjJ6qnBIejZk07B031UH89f5GBPRs/ZxtHtKdwCHmgsZiU55nHSOxOUJGeeBeTK8ZRR
         fdrLnOb9acO1g2AG6TNf/4ktAe4rKR+FuzKJd92xbMpwCxz0oDaIehchJ/0c0sUp/tR/
         TzaQseDc8EIKTuxFRzBR8S7YCC/wq9r/fP80DAvjmXGiewexq0W1xw5WQwYL2S3oM3yn
         L/rA==
X-Gm-Message-State: AOAM533AzJUNxLMrn5/iOqGJzSS0L9K2qrb7aciOvizzwY3n4xplyBGH
        iM5zGDV5inpf9j+8QplgiD0Ot8aQmBguZg==
X-Google-Smtp-Source: ABdhPJwOeOkDIyzAPJS1HQlsghRFFX6BhkffeWWg3kS5Shmc3hXa+S32M61DlWLjC78umpUsSGCxOQ==
X-Received: by 2002:a05:6602:208c:: with SMTP id a12mr6076082ioa.55.1602950842830;
        Sat, 17 Oct 2020 09:07:22 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id c1sm5570609ile.0.2020.10.17.09.07.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 09:07:22 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id t18so5985206ilo.12
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 09:07:22 -0700 (PDT)
X-Received: by 2002:a92:cbd2:: with SMTP id s18mr6016549ilq.34.1602950842312;
 Sat, 17 Oct 2020 09:07:22 -0700 (PDT)
MIME-Version: 1.0
From:   Pany <pany@fedoraproject.org>
Date:   Sat, 17 Oct 2020 16:07:11 +0000
X-Gmail-Original-Message-ID: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
Message-ID: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
Subject: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I installed fedora 32 into an SD card, with which I booted my Macbook.
It had worked well before, until I upgraded the kernel from 5.8.5 to
5.8.6 [1].

With kernel-5.8.6-200.fc32.x86_64.rpm [2] installed, the boot process
would be stuck at "A start job is running for
/dev/mapper/fedora_localhost_--live-home (<time> / no limit)" (See the
photo of screen [3]).

By appending "systemd.debug-shell=1" to the kernel cmdline, I saved
the journal [4].

This issue has been bisected to commit
53965c79c2dbdc898ffc7fdbab37e920594f5e14 ("USB: Fix device driver
race")

If I revert this commit, the kernel 5.8.6 would boot successfully.

Some background:
- The SDXC card slot on my Macbook Pro [5] is managed by USB controller [6]
- About the SD Card Reader, "lsusb -vv" shows:
```
Bus 002 Device 002: ID 05ac:8406 Apple, Inc. Internal Memory Card Reader
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x05ac Apple, Inc.
  idProduct          0x8406 Internal Memory Card Reader
  bcdDevice            8.20
  iManufacturer           3 Apple
  iProduct                4 Card Reader
  iSerial                 5 000000000820
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002c
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
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
        bMaxBurst               4
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
        bMaxBurst               4
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      HIRD Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x001c
  (Bus Powered)
  U1 Enabled
  U2 Enabled
  Latency Tolerance Messaging (LTM) Enabled
```

I'm looking forward to getting help from you guys. Thanks!

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1878347
[2] https://koji.fedoraproject.org/koji/buildinfo?buildID=1605304
[3] https://bugzilla.redhat.com/attachment.cgi?id=1714633
[4] https://bugzilla.redhat.com/attachment.cgi?id=1717469
[5] https://support.apple.com/kb/SP715?locale=en_US
[6] https://support.apple.com/en-us/HT204384#4
-- 
Regards,
Pany
pany@fedoraproject.org

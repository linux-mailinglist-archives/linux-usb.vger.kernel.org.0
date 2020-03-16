Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03741863AE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 04:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgCPDek (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 23:34:40 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:46061 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729383AbgCPDek (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 23:34:40 -0400
Received: by mail-io1-f42.google.com with SMTP id w7so318610ioj.12
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MlBomQEgZyav7UaAbI7AVqRLDS9R4PV9VQaWLNpxdKM=;
        b=TEfUrGLwe9MUEQQ3fMVB2XosyjPwDAKM8p/zuxVJQ2LLs5ZyH2ltvYIEOqgMAu8hyx
         GLuvSg2cYnGqv+CAhcAwc18EiQy9CFDCi1HhFKSlDe2HkUbyYF+2FT0iYye80kg+ZO26
         ii34zyhoxtoNQHP9/3mtJFlBY3BxMSfePCl11TrWtc6Jb7pl+pS/Dj2cA3phcqGd5v+Z
         tuD3jEr6S4JJHnCT85s2PGLxJ5SuCnjxfqRscNfghQC9nd1VSCyhzLYSxNAaUCyNZsEH
         16+TskNjHwzHIDNnA5s0ipQb+Ai3lVT+W3SuYXtpq915nIE7IPYOzegLJ8tdA1TPKRJQ
         lyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MlBomQEgZyav7UaAbI7AVqRLDS9R4PV9VQaWLNpxdKM=;
        b=imw9Fn5dTSyGu2M3PZxKOJA+MhoGAc54S4/9NuGlYvjXLkWsDnl8mtHgKwiw20uxZ7
         iU0tUfVbad5Fwp+/EsH+1LSACW55VQjzJ3wpo8iROgGtY1i0ZC5kE+iqqaiYCOoywsQh
         UcLNbhWfH/WpJiOe+TG/aVTOjWdZrIeg/i4OEvVXzo+taiCEPJhK3CoChwLMQ14HJ+35
         SWfPM1AzDTOKq7xXai87AJoiJVR0O+quPXPCdJ2EbZx4hyXy3rMvUdD0NjHQO5PWrZH9
         c0PqRMtnJ4xhFZ8zN9uf1541thpO3WYFivRLL7giElZyBhrP3Bl7lDjYfm+8oPwTgJAl
         5UUw==
X-Gm-Message-State: ANhLgQ0+zs7IddaRb8ChuBmXezBtmHNOK6BMJveoqGywhUuLLC9Cipmr
        I2q9JjlJkBL06DGNe0wcbpFRtMoST0cQhzV5CvFDvX+J
X-Google-Smtp-Source: ADFU+vvt9JuF+PJkcIn9KXoF4doiXitVljBdinJyaW89VVHV2/gr1/TLHmGDU820+zy3cfp8fqfiYzt9+wk+CYdy4DQ=
X-Received: by 2002:a5d:970e:: with SMTP id h14mr21959479iol.201.1584329679741;
 Sun, 15 Mar 2020 20:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <43547627-70f7-95d7-f003-97388505a19e@lockie.ca>
 <CAL411-o0grY_oL=pXrq-zeDqwaF87rYoLFUOPWP-HrPa2DmozA@mail.gmail.com> <917f2afb-7edd-9dbb-dcdd-c1467af410b0@lockie.ca>
In-Reply-To: <917f2afb-7edd-9dbb-dcdd-c1467af410b0@lockie.ca>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 16 Mar 2020 11:34:28 +0800
Message-ID: <CAL411-qOEXd-FSXAj=yEdmcDj_bmEwEwRJkxf=k2AfreF_4PkA@mail.gmail.com>
Subject: Re: USB 2?
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On 2020-03-13 5:46 a.m., Peter Chen wrote:
> > On Fri, Mar 13, 2020 at 11:17 AM James <bjlockie@lockie.ca> wrote:
> >
> > Yes, from below message, you could know it.
> >
> >>     bcdUSB               2.00
> >> wMaxPacketSize     0x0200  1x 512 bytes
> >> I'm trying to buy a USB dvdrw on Amazon but even different sellers sell
> >> the same thing under a different "brand".
> >>
> >> $ sudo lsusb -v -d 13fd:0840
> >> Bus 001 Device 006: ID 13fd:0840 Initio Corporation INIC-1618L SATA
> >> Device Descriptor:
> >>     bLength                18
> >>     bDescriptorType         1
> >>     bcdUSB               2.00
> >>     bDeviceClass            0
> >>     bDeviceSubClass         0
> >>     bDeviceProtocol         0
> >>     bMaxPacketSize0        64
> >>     idVendor           0x13fd Initio Corporation
> >>     idProduct          0x0840 INIC-1618L SATA
> >>     bcdDevice            1.14
> >>     iManufacturer           1 Generic
> >>     iProduct                2 External
> >>     iSerial                 3 554830302020323534363832
> >>     bNumConfigurations      1
> >>     Configuration Descriptor:
> >>       bLength                 9
> >>       bDescriptorType         2
> >>       wTotalLength       0x0020
> >>       bNumInterfaces          1
> >>       bConfigurationValue     1
> >>       iConfiguration          0
> >>       bmAttributes         0xc0
> >>         Self Powered
> >>       MaxPower                2mA
> >>       Interface Descriptor:
> >>         bLength                 9
> >>         bDescriptorType         4
> >>         bInterfaceNumber        0
> >>         bAlternateSetting       0
> >>         bNumEndpoints           2
> >>         bInterfaceClass         8 Mass Storage
> >>         bInterfaceSubClass      2 SFF-8020i, MMC-2 (ATAPI)
> >>         bInterfaceProtocol     80
> >>         iInterface              0
> >>         Endpoint Descriptor:
> >>           bLength                 7
> >>           bDescriptorType         5
> >>           bEndpointAddress     0x81  EP 1 IN
> >>           bmAttributes            2
> >>             Transfer Type            Bulk
> >>             Synch Type               None
> >>             Usage Type               Data
> >>           wMaxPacketSize     0x0200  1x 512 bytes
> >>           bInterval               0
> >>         Endpoint Descriptor:
> >>           bLength                 7
> >>           bDescriptorType         5
> >>           bEndpointAddress     0x02  EP 2 OUT
> >>           bmAttributes            2
> >>             Transfer Type            Bulk
> >>             Synch Type               None
> >>             Usage Type               Data
> >>           wMaxPacketSize     0x0200  1x 512 bytes
> >>           bInterval               0
> >> Device Qualifier (for other device speed):
> >>     bLength                10
> >>     bDescriptorType         6
> >>     bcdUSB               2.00
> >>     bDeviceClass            0
> >>     bDeviceSubClass         0
> >>     bDeviceProtocol         0
> >>     bMaxPacketSize0        64
> >>     bNumConfigurations      1
> >> can't get debug descriptor: Resource temporarily unavailable
> >> Device Status:     0x0001
> >>     Self Powered
> Is there any chance the Linux usb subsystem might be detecting incorrectly?
> Maybe is uses the same IDs as the INIC-1618L SATA product but is a
> slight upgrade to USB 3?
>

The above information is read from device, unless the device supplied the
wrong information. Besides, like I mentioned above, you could get the
real hardware bus speed through dmesg whether it is "high-speed"
or "SuperSpeed", it is got from hardware status.

Peter

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9B736A4D4
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 11:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732103AbfGPJXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 05:23:12 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:40279 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfGPJXK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 05:23:10 -0400
Received: by mail-lj1-f177.google.com with SMTP id m8so19174885lji.7
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 02:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dSQySKc5D28DozEGEVwD/pff6MLnsi0bcLRyztNAS4c=;
        b=muxeIy+zlX64/6aa8mXab0weh1F3NMpzGhNzaC5nGbjrvHPEJTrT6U15vZ3Yu3HN0r
         /qsWL+/zG20uvgsgjrAACVQ81zNk/7CDjnJU6ZEYgUA9I7UtbQudGZZwJ6P92MUlnPpn
         k4pOGu9Po8/tMD1nEDxO+J7cfubIJfSQ0LX29nrLNGRGz857a7McGWTfXCpECYYPBBJi
         g+I6UGawF3QL0wFvXBPKgsS6gdFMfAxTZZZMVFSTNgOHe4D6F6DTQJdEXD4cT5w3P9xC
         PSJK+d6eVuHryT8krHlKtRU6QeVjVUqrzKJDLFRWLSONEFRsmc++nBvwggOPfU7L71a2
         r9dA==
X-Gm-Message-State: APjAAAUMSJ5GjhJOA95gaDbuMiBQNt+EtJD2UP09p+04u+iKkknITKXC
        pAG9bhW3ggYTlrglvijQ2aQBzWETuxQ=
X-Google-Smtp-Source: APXvYqxfG2TYbJJHwQ+Tw4TMimwlnCoyIzXPLHBj0XdPvLemZ5PnAou7kBQbEsVVSQhvBmYx1pPK/Q==
X-Received: by 2002:a2e:2d12:: with SMTP id t18mr17223758ljt.175.1563268987990;
        Tue, 16 Jul 2019 02:23:07 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id w8sm2720184lfq.62.2019.07.16.02.23.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 02:23:07 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnJft-0004HI-GO; Tue, 16 Jul 2019 11:23:05 +0200
Date:   Tue, 16 Jul 2019 11:23:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Markus Breunig <Markus.L.Breunig@gmx.net>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: Fwd: Re: New USB Device
Message-ID: <20190716092305.GC3522@localhost>
References: <5D1D1376.7070202@gmx.net>
 <5D1E65F3.6090307@gmx.net>
 <20190705052121.GD15821@kroah.com>
 <5D224A18.2070907@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D224A18.2070907@gmx.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Pleas avoid top posting. ]

On Sun, Jul 07, 2019 at 09:38:00PM +0200, Markus Breunig wrote:
> Hi Greg,
> 
> also the company GNS has a fragmented homepage, the handbook ist
> available here:
> http://www.servicedocs.com/ARTIKELEN/7200284490001.pdf
> habe a look to page 10 "Remarks to Linux"
> 
> This is the log of "lsusb -v" (full scan result attached):
> 
> Bus 001 Device 004: ID 04d8:f8e8 Microchip Technology, Inc. Harmony
> 300/350 Remote

Are you sure this is the right device? This looks like a remote control,
and one that should be using the cdc-acm driver.

> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.00
>    bDeviceClass          255 Vendor Specific Class
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0         8
>    idVendor           0x04d8 Microchip Technology, Inc.
>    idProduct          0xf8e8 Harmony 300/350 Remote
>    bcdDevice           48.12
>    iManufacturer           1
>    iProduct                2
>    iSerial                 3
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength           67
>      bNumInterfaces          2
>      bConfigurationValue     1
>      iConfiguration          0
>      bmAttributes         0xc0
>        Self Powered
>      MaxPower              100mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass         2 Communications
>        bInterfaceSubClass      2 Abstract (modem)
>        bInterfaceProtocol      1 AT-commands (v.25ter)
>        iInterface              0
>        CDC Header:
>          bcdCDC               1.10
>        CDC ACM:
>          bmCapabilities       0x02
>            line coding and serial state
>        CDC Union:
>          bMasterInterface        0
>          bSlaveInterface         1
>        CDC Call Management:
>          bmCapabilities       0x00
>          bDataInterface          1
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x82  EP 2 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0008  1x 8 bytes
>          bInterval               2
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        1
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass        10 CDC Data
>        bInterfaceSubClass      0 Unused
>        bInterfaceProtocol      0
>        iInterface              0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x03  EP 3 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x83  EP 3 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               0

> Am 05.07.2019 07:21, schrieb Greg KH:
> > On Thu, Jul 04, 2019 at 10:47:47PM +0200, Markus Breunig wrote:
> >> Hi Greg,
> >>
> >> using a serial device driver is the idea of the manufacturer
> >> "www.gns-gmbh.com". In the LINUX instructions of the ADS-B receiver some
> >> hints to use the device are given via usbserial.
> >
> > Any pointers to those instructions?
> >
> >> In practice the "GNS 5890 ADS-B Receiver" is similare to some GPS
> >> Receivers with NMEA 0183 interface starting to send information on the
> >> serial interface after power on and signal availabillity (with 115200
> >> boud data rate).

Johan

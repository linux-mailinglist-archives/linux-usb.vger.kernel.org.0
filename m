Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B28378B44F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 11:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfHMJhP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 05:37:15 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:33504 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbfHMJhP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 05:37:15 -0400
Received: by mail-lj1-f181.google.com with SMTP id z17so12486541ljz.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 02:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g6HLb35o24mMleNDjSOk8KjoZ9bdc+BeV4VAa1quYrg=;
        b=r3co6UQJ1UHKoZfg6AtAK4DtVk5Rqm5kYex4k4txaooDbMJv4Y1VXw0cf9t1Y3JDTe
         r++xxBYYgxPUvsEGO96JnWi1abaPGl1MDEpXClRhyOYSZketwmPDWDuhfHRqAZMHjiyn
         pTTgZ8h4HUSO7F06yb2lx0HuuTp11s8FjJv+UXHCizyGuo655G6KG5+9f5cdkyMq+4Hk
         RGt1H055LnFpVUZMnefhEDk6QhsWoKnhdaKoXYzbVkxzLKMkyoIQtlrf00FmQd/0fUJw
         MuFcOBrq2sQaHZJCjCsBdafYJ/Y5iARGYFRlhhig001abEiCOclqXI5IeGbY9JVIkWs3
         gD6w==
X-Gm-Message-State: APjAAAUQgeKRQojJ/ukNK2Pv/9SA6uZxZsVbLH783fux+MjPlKRKUmQG
        yjTKeVoSWRl+ojMrbMY87EU=
X-Google-Smtp-Source: APXvYqyaNg7s9OUjNPjhQ+kPzoEAwGkOrIZrUJl0CK1JeAI42haQtGnCdlrVAeSUOpmf4b9H9Vh7sA==
X-Received: by 2002:a2e:978e:: with SMTP id y14mr6774696lji.10.1565689032453;
        Tue, 13 Aug 2019 02:37:12 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id t137sm19494318lff.78.2019.08.13.02.37.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 02:37:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hxTEp-0003DU-O6; Tue, 13 Aug 2019 11:37:07 +0200
Date:   Tue, 13 Aug 2019 11:37:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Markus Breunig <Markus.L.Breunig@gmx.net>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: Fwd: Re: New USB Device
Message-ID: <20190813093707.GD15556@localhost>
References: <5D1D1376.7070202@gmx.net>
 <5D1E65F3.6090307@gmx.net>
 <20190705052121.GD15821@kroah.com>
 <5D224A18.2070907@gmx.net>
 <20190716092305.GC3522@localhost>
 <4e9b3ecf-ca45-51a5-d582-d3d067ecc723@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e9b3ecf-ca45-51a5-d582-d3d067ecc723@gmx.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 31, 2019 at 07:32:29PM +0200, Markus Breunig wrote:
> 
> 
> Am 16.07.2019 um 11:23 schrieb Johan Hovold:
> > [ Pleas avoid top posting. ]
> >
> > On Sun, Jul 07, 2019 at 09:38:00PM +0200, Markus Breunig wrote:
> >> Hi Greg,
> >>
> >> also the company GNS has a fragmented homepage, the handbook ist
> >> available here:
> >> http://www.servicedocs.com/ARTIKELEN/7200284490001.pdf
> >> habe a look to page 10 "Remarks to Linux"
> >>
> >> This is the log of "lsusb -v" (full scan result attached):
> >>
> >> Bus 001 Device 004: ID 04d8:f8e8 Microchip Technology, Inc. Harmony
> >> 300/350 Remote
> >
> > Are you sure this is the right device? This looks like a remote control,
> > and one that should be using the cdc-acm driver.
> >
> 
> The output of lsusb before plugging the GNS5890 device into the USB-port:
> 
> Bus 001 Device 005: ID 046d:c05a Logitech, Inc. M90/M100 Optical Mouse
> Bus 001 Device 004: ID 046a:0001 Cherry GmbH Keyboard
> Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp.
> SMSC9512/9514 Fast Ethernet Adapter
> Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> and the result of the lsusb after plugging the GNS5890 device into the
> USB-port:
> 
> Bus 001 Device 005: ID 046d:c05a Logitech, Inc. M90/M100 Optical Mouse
> Bus 001 Device 004: ID 046a:0001 Cherry GmbH Keyboard
> Bus 001 Device 006: ID 04d8:f8e8 Microchip Technology, Inc. Harmony
> 300/350 Remote
> Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp.
> SMSC9512/9514 Fast Ethernet Adapter
> Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Ok, thanks for confirming. 

Based on the below descriptors, this device should be handled by the
cdc-acm driver and show up as a /dev/ttyACMn.

Do you have that driver enabled? Can you enable debugging in that driver
and post the syslog from when plugging the device in if it still doesn't
work?

You can enable debugging using

	modprobe cdc-acm dyndbg==p

or through sysfs, see

	Documentation/admin-guide/dynamic-debug-howto.rst

> >> Device Descriptor:
> >>     bLength                18
> >>     bDescriptorType         1
> >>     bcdUSB               2.00
> >>     bDeviceClass          255 Vendor Specific Class
> >>     bDeviceSubClass         0
> >>     bDeviceProtocol         0
> >>     bMaxPacketSize0         8
> >>     idVendor           0x04d8 Microchip Technology, Inc.
> >>     idProduct          0xf8e8 Harmony 300/350 Remote
> >>     bcdDevice           48.12
> >>     iManufacturer           1
> >>     iProduct                2
> >>     iSerial                 3
> >>     bNumConfigurations      1
> >>     Configuration Descriptor:
> >>       bLength                 9
> >>       bDescriptorType         2
> >>       wTotalLength           67
> >>       bNumInterfaces          2
> >>       bConfigurationValue     1
> >>       iConfiguration          0
> >>       bmAttributes         0xc0
> >>         Self Powered
> >>       MaxPower              100mA
> >>       Interface Descriptor:
> >>         bLength                 9
> >>         bDescriptorType         4
> >>         bInterfaceNumber        0
> >>         bAlternateSetting       0
> >>         bNumEndpoints           1
> >>         bInterfaceClass         2 Communications
> >>         bInterfaceSubClass      2 Abstract (modem)
> >>         bInterfaceProtocol      1 AT-commands (v.25ter)
> >>         iInterface              0
> >>         CDC Header:
> >>           bcdCDC               1.10
> >>         CDC ACM:
> >>           bmCapabilities       0x02
> >>             line coding and serial state
> >>         CDC Union:
> >>           bMasterInterface        0
> >>           bSlaveInterface         1
> >>         CDC Call Management:
> >>           bmCapabilities       0x00
> >>           bDataInterface          1
> >>         Endpoint Descriptor:
> >>           bLength                 7
> >>           bDescriptorType         5
> >>           bEndpointAddress     0x82  EP 2 IN
> >>           bmAttributes            3
> >>             Transfer Type            Interrupt
> >>             Synch Type               None
> >>             Usage Type               Data
> >>           wMaxPacketSize     0x0008  1x 8 bytes
> >>           bInterval               2
> >>       Interface Descriptor:

Johan

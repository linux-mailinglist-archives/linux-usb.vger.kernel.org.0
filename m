Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47ECD11547B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 16:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfLFPn2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 10:43:28 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36060 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfLFPn2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 10:43:28 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so5624741lfe.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 07:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A+Bt4QXkUy8P1IApXEfursQDN9ZnatdwyDYzafAnZ8I=;
        b=o1BaIFji2WlMQ/fBJgV32dVRJlKF/KLf35J223enaoEcoX/VjlvBugV7WOoaU45yWI
         XUzh2b1ehEIjEZk9dSL6uVQCA5VhKmgJQb7KuTmdn1ZKcTRPEl53NlugCQM0PsTFYmkd
         6T9LcTwAgPJIJF3wdPZalDzg7OUSq2XV8bNvyvvhPQOJV7v4K4fDTT7iWZgqwa1Fp51P
         x7ZNW4RSznCrsdzaq2sP8AIkB+rXT+lbAba5dZgClMNWUt3Vb8PzQySEnZJD24OTimrS
         RmdFmqngyUAWsKdb1imvce8frN2gdHjj6U2XX6Pplvz+a/GdlZiN6Ze25/3GY+dTYxCg
         PbLw==
X-Gm-Message-State: APjAAAVRDbGkQUDtHtXGvJsakBH1LQ2I+S5auLLJzar22wic0R8zergV
        eNdDJ6v1SfBa/E3fzk040UpGQ46g
X-Google-Smtp-Source: APXvYqyN1ikZ2FH2+9fRSlQOCTUXaXDWooyIIk9WDBG+GYCizKE+8Xj3Yb9/TLrjEqRlnLwK+zT+cg==
X-Received: by 2002:a05:6512:21d:: with SMTP id a29mr1363757lfo.186.1575647005713;
        Fri, 06 Dec 2019 07:43:25 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id e9sm3674685ljp.87.2019.12.06.07.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 07:43:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1idFlS-00058o-V9; Fri, 06 Dec 2019 16:43:31 +0100
Date:   Fri, 6 Dec 2019 16:43:30 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191206154330.GP10631@localhost>
References: <20191118133251.21401-1-dnlplm@gmail.com>
 <20191205145731.GM10631@localhost>
 <CAGRyCJGPzxT8AChC6sq-8v-PAQJFuY-bZqoHmoJiwGCyxrTgZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJGPzxT8AChC6sq-8v-PAQJFuY-bZqoHmoJiwGCyxrTgZg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 05, 2019 at 05:06:59PM +0100, Daniele Palmas wrote:
> Il giorno gio 5 dic 2019 alle ore 15:57 Johan Hovold
> <johan@kernel.org> ha scritto:
> >
> > On Mon, Nov 18, 2019 at 02:32:51PM +0100, Daniele Palmas wrote:
> > > Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> > > to be sent if out data size is equal to the endpoint max size.
> > >
> > > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > > ---
> > >  drivers/usb/serial/option.c   | 8 ++++++++
> > >  drivers/usb/serial/usb-wwan.h | 1 +
> > >  drivers/usb/serial/usb_wwan.c | 9 +++++++++
> > >  3 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > > index e9491d400a24..c13e063cb399 100644
> > > --- a/drivers/usb/serial/option.c
> > > +++ b/drivers/usb/serial/option.c
> > > @@ -567,6 +567,9 @@ static void option_instat_callback(struct urb *urb);
> > >  /* Interface must have two endpoints */
> > >  #define NUMEP2               BIT(16)
> > >
> > > +/* Device needs ZLP */
> > > +#define ZLP          BIT(17)
> > > +
> > >
> > >  static const struct usb_device_id option_ids[] = {
> > >       { USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
> > > @@ -1196,6 +1199,8 @@ static const struct usb_device_id option_ids[] = {
> > >         .driver_info = NCTRL(0) | RSVD(1) },
> > >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),    /* Telit LN940 (MBIM) */
> > >         .driver_info = NCTRL(0) },
> > > +     { USB_DEVICE(TELIT_VENDOR_ID, 0x9010),                          /* Telit SBL FN980 flashing device */
> > > +       .driver_info = NCTRL(0) | ZLP },
> >
> > Hmm. Could you post the lsusb -v output for this device?
> >
> 
> Bus 003 Device 004: ID 1bc7:9010 Telit Wireless Solutions
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.10
>   bDeviceClass            0 (Defined at Interface level)
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x1bc7 Telit Wireless Solutions
>   idProduct          0x9010
>   bcdDevice            0.00
>   iManufacturer           1 Telit Wireless Solutions
>   iProduct                2 FN980m
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength           32
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xa0
>       (Bus Powered)
>       Remote Wakeup
>     MaxPower                2mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass    255 Vendor Specific Subclass
>       bInterfaceProtocol     16
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength           42
>   bNumDeviceCaps          3
>   ** UNRECOGNIZED:  14 10 0a 00 01 00 00 00 00 11 00 00 30 40 0a 00 b0 40 0a 00
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x00
>     wSpeedsSupported   0x000e
>       Device can operate at Full Speed (12Mbps)
>       Device can operate at High Speed (480Mbps)
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   1
>       Lowest fully-functional device speed is Full Speed (12Mbps)
>     bU1DevExitLat          10 micro seconds
>     bU2DevExitLat        2047 micro seconds
>   USB 2.0 Extension Device Capability:
>     bLength                 7
>     bDescriptorType        16
>     bDevCapabilityType      2
>     bmAttributes   0x00000002
>       Link Power Management (LPM) Supported
> Device Status:     0x0000
>   (Bus Powered)
> 
> > I wonder whether using option is the right thing to do here. We're just
> > currently throwing everything modem related in here it seems. :)
> >
> 
> I understand your concern. At first, in fact, I tried to add support
> for this in usb-serial-simple, but the change seemed to me more
> impacting than the one I had to do for adding support in option.
> 
> Let me know if you want me to continue investigating the
> usb-serial-simple way or you have another advice.

Yeah, I was thinking along those lines as well. Let me get me get back
to you on that.

Johan

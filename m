Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73BBD114468
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 17:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbfLEQHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 11:07:12 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:35231 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEQHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 11:07:11 -0500
Received: by mail-qv1-f67.google.com with SMTP id d17so1479455qvs.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 08:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3t+NP8ZvACAU6n3yD/jbmc1KqR7eR57o45UTijUEV4k=;
        b=lgjFFBR/d/JwEjJZ3cs+4xduiYfJiZ1he7k6Mrs0XXMq1ApDw3oc0/cWB86dP25nnG
         ccBLxbDB4N8McKhLT6xuv0sQMRDHxL7arhaDkj4pACGUoFW6kpb6bWYF4wILIwjgZ221
         hbIRabfNiJd0MzQj0WvtQCx0jSoK/n23ctf6sxEeacGwyaBZNo2ONOEETJXuFT7CgLpG
         RIE6flcdK4qC5JyyunUH/UNG1zOjTmhRecpoPcpkp/ExOwJBnhgnx0Wk8BzdMFjLvXDk
         I2vIIW/SewU66ccqTwBLcpfllMcGGFe7qoV03m7JrKuIJzrlQunAh6wONL9tD2YSPNy+
         D+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3t+NP8ZvACAU6n3yD/jbmc1KqR7eR57o45UTijUEV4k=;
        b=oEXQMFofEruw1vL056x7pUFo8coAKwmKkjdWyAgB783ku2NpJ7PHOqyu9+TumwYCzU
         IyiuMX1nrkXY9k0MDuMKINqoJNiuPfVPRsM34NCmmflj0zCywoFW1kt/qS2tjry/Sul+
         ij7KzIMaN2QjROhMkELfzUnOxZe5XGX8opAaSEMN2U/vLis2YSavhB1DZ/gaWxjyARHu
         IKKufJfoDbJDmWSE/xQN/VSU3jG+wzGXW2UDBvzEuSG/Ste5U5O8q23xPELcTlZACF5w
         h/Rqb1T77H0ZZGdiHh7nlnDDUfys7OonII/qNt0dvjDBiSfIgJqjA1DfxdZYKRkzDCsA
         SQkQ==
X-Gm-Message-State: APjAAAUAGHvFrx9trtNM0UWQyQrnQjmzfdoQENALHJmTeKJ3MSMpBpvq
        YrIpZiKy3Ha0g+tdeBGf5GZob81vKggyd2v6jEs=
X-Google-Smtp-Source: APXvYqxG6XnArJk50Ht7b9vK8U2U09tGi5+N5G2nTSwv+A7ud7NKG/kuc7DNJKZ3Zj6mMxlx6i5o346Sw5abgm3uD3g=
X-Received: by 2002:a0c:b0fa:: with SMTP id p55mr8345550qvc.239.1575562030199;
 Thu, 05 Dec 2019 08:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20191118133251.21401-1-dnlplm@gmail.com> <20191205145731.GM10631@localhost>
In-Reply-To: <20191205145731.GM10631@localhost>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Thu, 5 Dec 2019 17:06:59 +0100
Message-ID: <CAGRyCJGPzxT8AChC6sq-8v-PAQJFuY-bZqoHmoJiwGCyxrTgZg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno gio 5 dic 2019 alle ore 15:57 Johan Hovold
<johan@kernel.org> ha scritto:
>
> On Mon, Nov 18, 2019 at 02:32:51PM +0100, Daniele Palmas wrote:
> > Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> > to be sent if out data size is equal to the endpoint max size.
> >
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > ---
> >  drivers/usb/serial/option.c   | 8 ++++++++
> >  drivers/usb/serial/usb-wwan.h | 1 +
> >  drivers/usb/serial/usb_wwan.c | 9 +++++++++
> >  3 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index e9491d400a24..c13e063cb399 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -567,6 +567,9 @@ static void option_instat_callback(struct urb *urb);
> >  /* Interface must have two endpoints */
> >  #define NUMEP2               BIT(16)
> >
> > +/* Device needs ZLP */
> > +#define ZLP          BIT(17)
> > +
> >
> >  static const struct usb_device_id option_ids[] = {
> >       { USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
> > @@ -1196,6 +1199,8 @@ static const struct usb_device_id option_ids[] = {
> >         .driver_info = NCTRL(0) | RSVD(1) },
> >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),    /* Telit LN940 (MBIM) */
> >         .driver_info = NCTRL(0) },
> > +     { USB_DEVICE(TELIT_VENDOR_ID, 0x9010),                          /* Telit SBL FN980 flashing device */
> > +       .driver_info = NCTRL(0) | ZLP },
>
> Hmm. Could you post the lsusb -v output for this device?
>

Bus 003 Device 004: ID 1bc7:9010 Telit Wireless Solutions
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x1bc7 Telit Wireless Solutions
  idProduct          0x9010
  bcdDevice            0.00
  iManufacturer           1 Telit Wireless Solutions
  iProduct                2 FN980m
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           32
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower                2mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol     16
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
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
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           42
  bNumDeviceCaps          3
  ** UNRECOGNIZED:  14 10 0a 00 01 00 00 00 00 11 00 00 30 40 0a 00 b0 40 0a 00
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
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      Link Power Management (LPM) Supported
Device Status:     0x0000
  (Bus Powered)

> I wonder whether using option is the right thing to do here. We're just
> currently throwing everything modem related in here it seems. :)
>

I understand your concern. At first, in fact, I tried to add support
for this in usb-serial-simple, but the change seemed to me more
impacting than the one I had to do for adding support in option.

Let me know if you want me to continue investigating the
usb-serial-simple way or you have another advice.

> >       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
> >       { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
> >         .driver_info = RSVD(1) },
> > @@ -2097,6 +2102,9 @@ static int option_attach(struct usb_serial *serial)
> >       if (!(device_flags & NCTRL(iface_desc->bInterfaceNumber)))
> >               data->use_send_setup = 1;
> >
> > +     if (device_flags & ZLP)
> > +             data->use_zlp = 1;
> > +
> >       spin_lock_init(&data->susp_lock);
> >
> >       usb_set_serial_data(serial, data);
> > diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
> > index 1c120eaf4091..934e9361cf6b 100644
> > --- a/drivers/usb/serial/usb-wwan.h
> > +++ b/drivers/usb/serial/usb-wwan.h
> > @@ -38,6 +38,7 @@ struct usb_wwan_intf_private {
> >       spinlock_t susp_lock;
> >       unsigned int suspended:1;
> >       unsigned int use_send_setup:1;
> > +     unsigned int use_zlp:1;
> >       int in_flight;
> >       unsigned int open_ports;
> >       void *private;
> > diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> > index 7e855c87e4f7..8066b5e2d305 100644
> > --- a/drivers/usb/serial/usb_wwan.c
> > +++ b/drivers/usb/serial/usb_wwan.c
> > @@ -228,6 +228,15 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
> >               } else {
> >                       intfdata->in_flight++;
> >                       spin_unlock_irqrestore(&intfdata->susp_lock, flags);
> > +                     if (intfdata->use_zlp) {
> > +                             unsigned int ep_maxp;
> > +
> > +                             ep_maxp = usb_maxpacket(port->serial->dev,
> > +                                                     this_urb->pipe, 1);
> > +
> > +                             if (ep_maxp && (todo % ep_maxp == 0))
> > +                                     this_urb->transfer_flags |= URB_ZERO_PACKET;
>
> No need to do the transfer_length calculations here, the host-controller
> driver will take care of that. Just set URB_ZERO_PACKET unconditionally
> if the device requires it.
>

Understood.

Thanks,
Daniele

> > +                     }
> >                       err = usb_submit_urb(this_urb, GFP_ATOMIC);
> >                       if (err) {
> >                               dev_err(&port->dev,
>
> Johan

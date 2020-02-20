Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDB516670F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 20:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgBTTVx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 14:21:53 -0500
Received: from mail-ed1-f42.google.com ([209.85.208.42]:45257 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgBTTVx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 14:21:53 -0500
Received: by mail-ed1-f42.google.com with SMTP id v28so35025336edw.12
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2020 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/T4t+PxxaSD/9y+kjW+GDhGvajsfygAk7T0IvI1hauY=;
        b=qtq1x2lj6tsYAr279g2IDqKG7T0SUHEb6L/zTKRyT6tmK6ztnzj3AwJKwSwv9+0GQD
         q7wMLCnN+/uoMOep8mM1f4UXA583jGrer6UiEK7BCW8jTornyAZLrkGqrazINuBE3c/0
         aPCdCRzGt8S3pcmSRGBDVIi/yRCQXcFFzfbkCEmfFPcVc7eKRr0R+TJ4xjeEbLrWZbF7
         M38gyHn+hBPHcPolw46jV/m7rd3LDusbz7NxzhrMLe110lEX33xssJVp8GPU7OuE7eVm
         l+RVfVU1ds2MjurkrcimfjFw9ND1aSDSw8jF96HfGF/zIhO4MAgkOVFsw9NBXOqhkiBw
         LAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/T4t+PxxaSD/9y+kjW+GDhGvajsfygAk7T0IvI1hauY=;
        b=QSqHnK5KLrpfIUglx1WozdOhWG/agPl1DQcnp2t9Qq5wb1EOEHqLQdq8l0Nw8w25GV
         lUQIou1c21u07J1Z4fAkeCacfP4+0zWvwYMsxQ2qdqiMxpOMLPNLN6cig2UnSOgZJrcf
         rKLFZ/RnVnvH+pRAqH1oF9LAKnCUo0OPOJ234o4XEO/k/HVUixNqVhc6fwqu/W2FC91B
         pr/pZastxDBDRTVsfBTb6mkLVH3VOTipP1WvCpMDJBZGjnIVhlzsw0ZzlcgpoWgbZg7A
         7jdJbpgqdmicA7g2RI2MgLcVVjw5JBSBPoAa4lhzn831VaOhatwDvsbrqliuTiP0bzX2
         rNhg==
X-Gm-Message-State: APjAAAVbF0REO0qNpyqvEjnoF8AXGDXleMsPjIj+CBwLOOJLpDLJ8fkN
        GQCLcesV3HAG3tbIgJLdNAi0Q/vIhFAruBYmR1Tsrzls
X-Google-Smtp-Source: APXvYqxdvvXensaONgFgLi4emjS/QdDMA8tW4sQXgi/w2ybqPEGiMO01IvQxLstLZZFf+v066eDrw+x4UkXJ5hKVNPQ=
X-Received: by 2002:a17:906:ce3c:: with SMTP id sd28mr30764632ejb.251.1582226509438;
 Thu, 20 Feb 2020 11:21:49 -0800 (PST)
MIME-Version: 1.0
References: <CAAfyv36n=--KiHmdyS7hOGzF8fVtq8y=uZx0cxARgp7fUta4ng@mail.gmail.com>
 <Pine.LNX.4.44L0.2002201024190.1453-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2002201024190.1453-100000@iolanthe.rowland.org>
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Thu, 20 Feb 2020 20:21:38 +0100
Message-ID: <CAAfyv35O2FFsvDSAv7r+GOTg=24-K-3eRPJTifWHFQFafX=DHQ@mail.gmail.com>
Subject: Re: functionfs gadget with multiple endpoints
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

hi Alan,

On Thu, Feb 20, 2020 at 4:26 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 20 Feb 2020, Belisko Marek wrote:
>
> > Hi,
> >
> > I'm playing with functionfs and use configfs + functionfs + ffs-test
> > from kernel to test connection between my device and host. ffs-test
> > example provide 1 configuration with 1 interface and with 2 bulk
> > endpoints.
> >
> > I'm writing application which will write/read data to usb device but
> > can be accessed from other multiple application. I'm planning to write
> > kind of gatekeeper which will serialize data to endpoint and notify
> > reader about received data.
> >
> > I was thinking about other possibility to extend gadget to provide
> > more endpoints (like 2). I was able to extend ffs-test and also I can
> > send/receive data (using libusb) over original endpoints but not over
> > new created one (I've run 2 instances of same application which
> > basically create transfers for 2 different endpoints) but when running
> > second application I got this error:
> >
> > libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16
> > libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16
>
> Only one program at a time can claim an interface, and submitting an
> URB to an endpoint automatically claims the endpoint's interface.
>
> > I'm not USB expert but multiple endpoint should be possible (maybe I
> > need to put them to other interface?-> tried that also but got same
> > error as above with errno=2). Thanks for any pointers and advice.
>
> errno=16 and errno=2 are different errors, not the same error.
> Putting the endpoints in different interfaces should work; you probably
> have a bug somewhere in your code.
To clarify  it a bit. I have test program which basically
asynchronously sends buffer to bulk endpoint.
Then as said if start second program I got errno=16 which means busy
as other program already occupy endpoint so this is clear.
But when extend ffs-test in this way https://pastebin.com/xymtDuJj
using lsusb I can see:

 Bus 001 Device 010: ID 1d6b:0104 Linux Foundation Multifunction
Composite Gadget
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0104 Multifunction Composite Gadget
  bcdDevice            4.12
  iManufacturer           1
  iProduct                2
  iSerial                 3
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           32
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          4
    bmAttributes         0x80
      (Bus Powered)
    MaxPower                2mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              5
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
        bInterval               1
 Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              5
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
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1

When use same program as before but writing to EP 2 OUT I got error 2.

Also one thing I noticed is that bNumInterfaces still shows 1 (even I
have 2 interface descriptors) and not 2 as I would expect.
Is there something I'm doing wrong or maybe it can be bug in ffs code?
Is there any drawback of using multiple endpoints in overall transfer speed?

Thanks and BR,

>
> Alan Stern
>

marek

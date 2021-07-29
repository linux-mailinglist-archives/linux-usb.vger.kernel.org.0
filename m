Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7B03DAA64
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 19:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhG2Rhc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 13:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhG2Rhb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jul 2021 13:37:31 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9AFC061765
        for <linux-usb@vger.kernel.org>; Thu, 29 Jul 2021 10:37:27 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id 190so6724645qkk.12
        for <linux-usb@vger.kernel.org>; Thu, 29 Jul 2021 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPJuNsYtt4R6NnnDgkB7ul+8SVMdPdnAeDpm8QAWy0Q=;
        b=tshkj1FxOEJ8Vb5cev5rtYS9Ycdp2XgoPudxo0/sQu78LmGHWE8JCEhoTRAv7l4eJP
         KMr+HhODHWridZ6057zu4sBnmYHgrjWLEPuFSq6J+EqJVrjiZoQCF+UQbvyyBww/I8b4
         6O08zk3Dzdb2s7PHpOsUZYrGcCl8Lq0LBG/AP3UCsfLzyydGg8Lql8BUMbgUOFfRZ1kh
         dorMUBVjVCWOHvaiJp8wQw3M6+4lLrGIF0TFAzVDY9zR0qN2YliiU+vUWH1C/v89EzOC
         DqmMBWNUy72mg3IJ6TATUT9Elm6EbGawdKh4Ty85My+J4mY/WqT5d6eje2ChPbJvv93D
         vTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPJuNsYtt4R6NnnDgkB7ul+8SVMdPdnAeDpm8QAWy0Q=;
        b=FbEAYT8lt10gYFEU+ufqbM8mopxniKbF7fBizeezGAqTUbKkF9LmrpESoiwX9IeWG7
         a0YAw2yQCgR67qWXsse/cfpURkEnu4/0TAv6jc4ZfSVykt5Mg1ov438/yc93SbC+wsQl
         4GibRwbMPZnAdpMhgTgTxo+Cl4tLjBiWcGBA2iDG1cM5JmXbnm2FauPRW2Nlal2mr9Sy
         Jai7KGEsXEUvysiWdj0uiydHrxUHKacgWawCCI1IkGgT4OjkBUoS8EPPc2xrgAdwe9H3
         JsM3xODYj2F1AQ7lHK2LLoefqPoHrjU0Sp+bFlKzn0VGh3yrPmar9bkdCWavbYwzWVqY
         YlyQ==
X-Gm-Message-State: AOAM530XjA2FVn+4Wr9jz5raXiCPxIc5rJ08nw2snqsRxbDJcPPNR5VT
        fWMBbWewBHqLfCiTLmj0x58OYbfnPHUrJi31N9k=
X-Google-Smtp-Source: ABdhPJywjzfxB2r5Mv8RZIja/kRKOnBm49spl+cmd7dy8eA/bz6rlPBmh1VS2rYSFfrYtA2VFSpAwPi2hsinQ07Dcpc=
X-Received: by 2002:a05:620a:c9b:: with SMTP id q27mr6188537qki.131.1627580246911;
 Thu, 29 Jul 2021 10:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
 <YQJ8rNbYhSwmZvbb@hovoldconsulting.com>
In-Reply-To: <YQJ8rNbYhSwmZvbb@hovoldconsulting.com>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Thu, 29 Jul 2021 10:37:00 -0700
Message-ID: <CA+E=qVdS+7AvRcQAioUu2BshP=ReOcrCLEHE3pmERsXJascbgA@mail.gmail.com>
Subject: Re: Commit 8a7bf7510d1f ("USB: serial: pl2303: amend and tighten type
 detection") broke pl2303 driver for my adapter
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 29, 2021 at 3:02 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jul 27, 2021 at 05:00:20PM -0700, Vasily Khoruzhick wrote:
> > Hey,
> >
> > My PL2303 adapter isn't working after I upgraded to 5.13.
> >
> > Looks like the culprit is commit 8a7bf7510d1f ("USB: serial: pl2303:
> > amend and tighten type detection").
> >
> > It used to work fine in 5.12.x.
> >
> > Now it fails like this:
> >
> > [246872.298632] usb 1-1: new full-speed USB device number 14 using xhci_hcd
> > [246872.440065] usb 1-1: New USB device found, idVendor=067b,
> > idProduct=23c3, bcdDevice= 3.05
> > [246872.440079] usb 1-1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [246872.440085] usb 1-1: Product: USB-Serial Controller
> > [246872.440089] usb 1-1: Manufacturer: Prolific Technology Inc.
> > [246872.440093] usb 1-1: SerialNumber: CMA>b103Y23
> > [246872.445098] pl2303 1-1:1.0: pl2303 converter detected
> > [246872.445114] pl2303 1-1:1.0: unknown device type, please report to
> > linux-usb@vger.kernel.org
>
> Thanks for the report. Can you please post the output of lsusb -v for
> this device?

Here it is:

Bus 001 Device 024: ID 067b:23c3 Prolific Technology, Inc. USB-Serial
Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x23c3
  bcdDevice            3.05
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 3 CMA>b103Y23
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0

> > Any ideas on how to fix it properly? Should I send a patch that
> > handles bcdDevice == 0x305 and returns TYPE_HX for it from
> > pl2303_detect_type()?
>
> The device id indicates that this is in fact a PL2303GT so we may need
> to amend the HXN type detection.

What's the difference between HX and HXN?

> Johan

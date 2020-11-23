Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919A52C00D1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 08:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgKWHpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 02:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKWHpV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 02:45:21 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03247C0613CF
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2020 23:45:21 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id y73so8624738vsc.5
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2020 23:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mly8w2bQw7hI7nAsWqMWyGpJd8PDkyFM0D9DrCDINE0=;
        b=mFTEetiIxZa4VJtDN9jeDK2IX1C5edYAozp9D2muCh9rFQNz/5zGuT3Fdhnvf0sQK2
         GClDD0/PwUoXgyO8/o8oZNSJdeSNA0/dejEGsOhtUhyhyuLdDRQ6YE+jtd8VM+bN2sHc
         uDSxcd5gpFzyRET1nsEcIfyLmpD3He1OzrCggqZTGJBqqFSVnOTFDZJkjnNEBODXufhh
         +xDdd6gCgIu62qGJNWvoQSSaOzWxteS39P009Q3p2t3ST+luZp9o1QjooFGEUTyXlbED
         ZqTgYw0/wxbmnvmunLPW0l3S4P46QqEsSva2PLzpCiqPFpVQy7YurY6gfJv3B0HlxIiM
         l5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mly8w2bQw7hI7nAsWqMWyGpJd8PDkyFM0D9DrCDINE0=;
        b=H2DangNMCO5Dpq3z7qETRmKXKw9+1MT6OSeBzjv1gHU7Pe6G1eWthTJUPlFi8JMMk3
         9vlJpUKfbMvejIZEDCBeG5Z41QNaUi/RhwF/mMNZXM4HbrjST5f3TLRRJmpYH39L3EMN
         IIyYGKy0sc2ZWXwmz+Zx5Bj2kPPV9WKf6ErurCDjU1xJXljusFZb9/zp6ohZb/0AKaH4
         rX9qEFFu5yZFWlOr0TVUbC5CgkqrkMo8apVFtRfkuzBIgIhfDtS3udabU8/HH5OfdJxH
         scMQJnl1t4idI/tqIspgdyuHt+SFVNYFTWDEhYbGulAZzc+qFoLc2uE3LHd+SyXcHEG5
         sQZw==
X-Gm-Message-State: AOAM530qm41LxJMZ0TAX/wgKtFPShx4k9khX1z9tRMwX9LSOq7y8dgcs
        7HfSnSh6tOD/UOnH4iFCObp5GSao2WkO2FeQOfI=
X-Google-Smtp-Source: ABdhPJwIrJ/Kfegw4AIl0E86SMSs2BV0Edrimwpkn3rvOSJ4Wcca0e+I8WtdUkjVL59b/R6Dk9eRhaNHvZPyV5JXO4g=
X-Received: by 2002:a67:df8b:: with SMTP id x11mr17490712vsk.37.1606117520188;
 Sun, 22 Nov 2020 23:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20201119115931.19050-1-gciofono@gmail.com> <X7ePVj4C/wVWb5GL@localhost>
In-Reply-To: <X7ePVj4C/wVWb5GL@localhost>
From:   Giacinto Cifelli <gciofono@gmail.com>
Date:   Mon, 23 Nov 2020 08:45:09 +0100
Message-ID: <CAKSBH7E_nRw-B7LAb-jj78OW7YPjBu-iKwJA4keZzd-WiBDQEA@mail.gmail.com>
Subject: Re: [PATCH] option: added support for Thales Cinterion MV31 option port.
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

here is the short version: bus 1, dev 2 is the EXS82:
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 2: Dev 3, If 0, Class=Hub, Driver=hub/7p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
    |__ Port 1: Dev 2, If 0, Class=Vendor Specific Class, Driver=option, 480M
    |__ Port 1: Dev 2, If 1, Class=Communications, Driver=cdc_acm, 480M
    |__ Port 1: Dev 2, If 2, Class=CDC Data, Driver=cdc_acm, 480M
    |__ Port 1: Dev 2, If 3, Class=Communications, Driver=cdc_acm, 480M
    |__ Port 1: Dev 2, If 4, Class=CDC Data, Driver=cdc_acm, 480M
    |__ Port 1: Dev 2, If 5, Class=Communications, Driver=cdc_ether, 480M
    |__ Port 1: Dev 2, If 6, Class=CDC Data, Driver=cdc_ether, 480M

and here the long version (only the part concerning the device):

Bus 001 Device 002: ID 1e2d:006c
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 ?
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1e2d
  idProduct          0x006c
  bcdDevice            0.00
  iManufacturer           4
  iProduct                3
  iSerial                 5
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          243
    bNumInterfaces          7
    bConfigurationValue     1
    iConfiguration          2
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         1
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Call Management:
        bmCapabilities       0x03
          call management
          use DataInterface
        bDataInterface          2
      CDC Union:
        bMasterInterface        1
        bSlaveInterface         2
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
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
        bInterval               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         3
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Call Management:
        bmCapabilities       0x03
          call management
          use DataInterface
        bDataInterface          4
      CDC Union:
        bMasterInterface        3
        bSlaveInterface         4
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         5
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      6 Ethernet Networking
      bInterfaceProtocol      0
      iInterface              0
      CDC Header:
        bcdCDC               1.10
      CDC Ethernet:
        iMacAddress                      1 (??)
        bmEthernetStatistics    0x00000000
        wMaxSegmentSize              16384
        wNumberMCFilters            0x0001
        bNumberPowerFilters              0
      CDC Union:
        bMasterInterface        5
        bSlaveInterface         6
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0


I did make a mistake on the name of the patch.  It should read EXS82
and not MV31 (which will come a bit later, as soon as they make their
mind for the final enumeration).
Please let me know of any further comments, and I will re-submit with
the right subject.
Shall I add the lsusb output above in the patch comment?

Thank you,
Giacinto



On Fri, Nov 20, 2020 at 10:41 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Nov 19, 2020 at 12:59:31PM +0100, Giacinto Cifelli wrote:
> > There is a single option port in this modem, and it is used as debug port
> >
> > Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
>
> Can you post the output of "lsusb -v" for this device?
>
> Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C334A178D26
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 10:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgCDJJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 04:09:09 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43091 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725283AbgCDJJJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 04:09:09 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id F02665DA;
        Wed,  4 Mar 2020 04:09:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 04 Mar 2020 04:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=+NsArOJK9YWCmsHoVRHWystONiW
        ZZOCYvnVUt83zzCY=; b=O/XyuKtdz6+Z2rVUz7qUiscz8NpYb67FIoJiopyF5/Q
        9VLZ4itZ+A4DF9ByjDjZsodUVszKRSutXUpauV8qUl+sTDilO7vvJU5y5C+zAinp
        gmVV2MVFepSVQeYc6eJsCXmMMNOYS6gu78wV5uPT/ojtKn46bGa6+O2ephk5V9Bx
        g8Dwr6MoU31CS6I1A7l7CgnymuvfbBYQmAIVIZIU+f8+TZ0h0i9UlaVNLwE0PplK
        7bglKsQ0lYbeHtFFCzgj4MZD4w6KAhe/i8VWDOMlDvw8+bcqJ40Mjap0+zP4yqm7
        bT42TN3QAcwaYcX6b/edC3RasrQXRgGzS4iIC4YTG8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+NsArO
        JK9YWCmsHoVRHWystONiWZZOCYvnVUt83zzCY=; b=apQzj89OAcl+r7cruzJ/P+
        ZvQI6X8fXV88qZLGaBZb9EcIyC9S6jzh0LtN4Wcxw8iowlb4sO4LDlVS1h/KrqWa
        91QLFZSL2lIsV0w3qi+mCay6Cmyfyf5U/XmFxZOiji3fy/FsQjd/lwY9z9UEA3Sn
        UEpkn0KQwUSEJWqixYynV7ZmcJPibB4BAwYvHFik5WR08d8jKyYU2Qi445ASE2Aj
        VxU+LworA5XUTUmAznxQ/niloqMcDNyAG8G/ZOu9f0aWo8loDVt7O5VAx0TtqVvw
        XWmLOIqiWQEE6GWLqZnJWHZInp3Qkd7NEtnDGj6nkoFJOOYw6lVGVgopw9fRvFIQ
        ==
X-ME-Sender: <xms:M3BfXpZoYkZu-_rnA4muykqOIVEKxyyn8XiezgzokMHr-Hqu_JVGwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtkecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfmjfcu
    oehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtjeenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvghes
    khhrohgrhhdrtghomh
X-ME-Proxy: <xmx:M3BfXn1D95GZXZUgT5YyC3yxup5MtVyJy6nV0W8CRspsMDGdXjPGuw>
    <xmx:M3BfXpUSpB7IJ7loIFw9NA5udjLPhmWiO4fSz3Ul3Zp0mFKjtB_jYQ>
    <xmx:M3BfXhVLtLQb-5bZSyBDH54sdAxsERDSIOIiTraUW9ZyfLi4rLPf0A>
    <xmx:M3BfXvgAZZWvDgPvkotmVBmJ_jAV5QMYvuUbFObCdocyd0Yq4jeU9Q>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id DF6AD30615B2;
        Wed,  4 Mar 2020 04:09:06 -0500 (EST)
Date:   Wed, 4 Mar 2020 10:09:05 +0100
From:   Greg KH <greg@kroah.com>
To:     Igor Filippov <igorf777@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: driver
Message-ID: <20200304090905.GD1429273@kroah.com>
References: <5e5941d6.1c69fb81.92ce2.f6a5@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e5941d6.1c69fb81.92ce2.f6a5@mx.google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 28, 2020 at 07:37:40PM +0300, Igor Filippov wrote:
> I apologize for my carelessness. I will try to send it to everyone...

You can't send html email to the list, that will cause it to get
rejected :(

Anyway, I think this is the device, right:

> Bus 002 Device 004: ID 1b5c:0201
> Couldn't open device, some information will be missing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            2 Communications
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x1b5c
>   idProduct          0x0201
>   bcdDevice            1.00
>   iManufacturer           4
>   iProduct               38
>   iSerial                74
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength           67
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              250mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         2 Communications
>       bInterfaceSubClass      2 Abstract (modem)
>       bInterfaceProtocol      0 None
>       iInterface            104
>       CDC Header:
>         bcdCDC               1.10
>       CDC Call Management:
>         bmCapabilities       0x01
>           call management
>         bDataInterface          1
>       CDC ACM:
>         bmCapabilities       0x02
>           line coding and serial state
>       CDC Union:
>         bMasterInterface        0
>         bSlaveInterface         1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval              32
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass        10 CDC Data
>       bInterfaceSubClass      0 Unused
>       bInterfaceProtocol      0
>       iInterface            104
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0


Can you confirm that the vendor/product id is 1b5c/0201 for this?

If so, what is wrong with the "normal" cdc driver here?  Why does the
usb-serial generic driver need to be used instead?

Do you have a pointer to where you got the instructions to usb the
usb-serial generic driver instead of the built-in kernel driver?

thanks,

greg k-h

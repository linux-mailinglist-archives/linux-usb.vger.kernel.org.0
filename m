Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FC7202E57
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 04:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731057AbgFVC0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 22:26:22 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43537 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731037AbgFVC0W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 22:26:22 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 49BAC5C121A;
        Sun, 21 Jun 2020 22:26:20 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sun, 21 Jun 2020 22:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=76LnwSjhFt3UkHK9WIsDzGQHA2l2tRV
        y8glpO9OO7f8=; b=jVl/61NxowwuRVdZJjV1837u81urXVCWjXowsRXcykB2IYc
        L0X07N5yatxXasWd9vD96gDuOccJpJ4cXVpDYXA5JkNWzZcevqn24jmS4crKoZRa
        ppoe+2rO7OS0Rb99xKKNyyEl5WtX0GE1GYIDrQWttgN6DdH4aAe1YbKnT9Tg9cip
        0fgYKz92XKHXEOQbl3ULzMSNUqsrNpBoCgY3SxaIKj/OYO3UD2snj0JIJfXYVjyB
        y68yN4TSiQDrQtvlcQmtz8kl/2Mp5Vn7bA8aIuD5epVpS1/uOg6pQ6KIv8B/dC7l
        Hv9VXr0hpAPhOY04M+7p3qaZ547BM4itjmpVpBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=76LnwS
        jhFt3UkHK9WIsDzGQHA2l2tRVy8glpO9OO7f8=; b=stVy5Ya9XPBYXbOAKYBv6w
        woAVdV+jvfHAYrZIDWLhY+bt+4UE1WtKHamE9Q4wVIoQieiZaGjxVKsumy1qWX5d
        IVZzFkLQKZHuUWOCyQZIPGPbvS2IMf8UMw+GpJwidNVWvd9UDD3GwdpWfu7qOuJB
        p+HUXj2kFFkGR2G1e/lTSy4oMSA8PZ5Td578u/WWoJlI6fXzU36V1ITl/EOijLNJ
        IfG4ug0Nnxy1w1KXEyxyY9WYKj1PkRXbtx3YUhSRTu3ZU0vzB9i0V6lAyvdRsRGH
        Fsw1rEoAv1JRHC/AQCr7EJU8M2NDNsIFfN/umiCqWfwl2+2i8MhyRIRsbsNaiheQ
        ==
X-ME-Sender: <xms:yxbwXvG0QcmhXL6YsdRLWRR3y0Xw0eIi2TXr0dx_dQjX98sn3GnsQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepveeghf
    evveetteefteekjeejhedufffffffhuefflefhueffudefudeljeefuefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:zBbwXsWsrM0vGzAuWTjDGXNCIuCxCJHJ2CpeWcyWUjKSt2G8B4Yx8Q>
    <xmx:zBbwXhLmusgd0h0Oig4WwEuyINPdKaXpnThy1syDr6Kz-ZsVtlqkAw>
    <xmx:zBbwXtGNw1ub5DFB-IEHjl_wWkIKrUSqdl2MHlg7Z72y67Pyhhn6Pw>
    <xmx:zBbwXths_yJPmuH8ku2eaU1d-8wXsllTnZPDInGrK12UsFOKxOngpA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D86F2660081; Sun, 21 Jun 2020 22:26:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <86137ba1-4a08-4862-b3b0-47544f60e9f6@www.fastmail.com>
In-Reply-To: <20200621140916.GB107361@rowland.harvard.edu>
References: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
 <20200621140916.GB107361@rowland.harvard.edu>
Date:   Sun, 21 Jun 2020 21:25:53 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to Use Isochronous Behavior w/ Isoc Endpoint in FunctionFC
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020, at 9:09 AM, Alan Stern wrote:
> On Sat, Jun 20, 2020 at 10:38:33PM -0500, Sid Spry wrote:
> 
> > When I was using a repurposed audio device I had to set an alternate mode. Is
> > that related to the issue here? The alternate mode seems to be a relic of the
> > descriptor layout before I dropped the device class and substituted my own
> > driver. The current descriptors specify no alternate modes.
> 
> I don't know much about FunctionFS, so I can't help with your main 
> question about isochronous packets not being dropped.  But I can explain 
> this.
> 

Your responses have been quite helpful; I appreciate them.

For those reading along I have gotten a set of descriptors working (detailed
below) however write(2) still blocks meaning at least one stale data packet
will be received. However, I realize now that typically a writer thread will be
sending an asynchronously updated buffer and the single stale packet was
probably never noticed, especially for AV applications.

Unfortunately for my application the stale packet *does* matter, and I am still
seeking a way to mitigate it.

> In the USB-2.0 spec, at the end of section 5.6.3 the text says:
> 
> 	All device default interface settings must not include any 
> 	isochronous endpoints with non-zero data payload sizes (specified 
> 	via wMaxPacketSize in the endpoint descriptor). Alternate 
> 	interface settings may specify non-zero data payload sizes for 
> 	isochronous endpoints.
> 
> That's why you had to select an alternate setting before transferring 
> any isochronous data.  Any isochronous endpoint in altsetting 0 must have 
> its maxpacket size set to 0.
> 

This was the issue. I rely too heavily on the USB audio class spec, I should go
through all of the spec.

I now must ask the list: What is the relation of the isochronous endpoint setup
to the allocated bandwidth on the bus? I understand the limit of 3 1024 byte
transfers per frame, but this says nothing about how it will be allocated or
how a device is refused bandwidth. Do I need to look for link degradation on
the application layer? It seems like having a single non-spec device means
the OS can't arbitrate link bandwidth.


Also!

For the list's consideration I have included an accepted but nonworking
configuration that perplexes me. The application note for the original device
I used specified a set of descriptors which was like so (device and
configuration omitted):

(Vendor Microphone Class Descriptors)
```
    INTERFACE 0: Vendor Specific ===========================
     bLength            :    0x9 (9 bytes)
     bDescriptorType    :    0x4 Interface
     bInterfaceNumber   :    0x0
     bAlternateSetting  :    0x0
     bNumEndpoints      :    0x0
     bInterfaceClass    :   0xff Vendor Specific
     bInterfaceSubClass :    0x1
     bInterfaceProtocol :    0x0
     iInterface         :    0x0 
    INTERFACE 1: Vendor Specific ===========================
     bLength            :    0x9 (9 bytes)
     bDescriptorType    :    0x4 Interface
     bInterfaceNumber   :    0x1
     bAlternateSetting  :    0x0
     bNumEndpoints      :    0x0
     bInterfaceClass    :   0xff Vendor Specific
     bInterfaceSubClass :    0x2
     bInterfaceProtocol :    0x0
     iInterface         :    0x0 
    INTERFACE 1, 1: Vendor Specific ========================
     bLength            :    0x9 (9 bytes)
     bDescriptorType    :    0x4 Interface
     bInterfaceNumber   :    0x1
     bAlternateSetting  :    0x1
     bNumEndpoints      :    0x1
     bInterfaceClass    :   0xff Vendor Specific
     bInterfaceSubClass :    0x2
     bInterfaceProtocol :    0x0
     iInterface         :    0x0 
      ENDPOINT 0x81: Isochronous IN ========================
       bLength          :    0x9 (7 bytes)
       bDescriptorType  :    0x5 Endpoint
       bEndpointAddress :   0x81 IN
       bmAttributes     :    0x5 Isochronous
       wMaxPacketSize   :   0xc8 (200 bytes)
       bInterval        :    0x1
```

If I (almost) match that:

(FunctionFS Device Descriptors)
```
    INTERFACE 0: Vendor Specific ===========================
     bLength            :    0x9 (9 bytes)
     bDescriptorType    :    0x4 Interface
     bInterfaceNumber   :    0x0
     bAlternateSetting  :    0x0
     bNumEndpoints      :    0x0
     bInterfaceClass    :   0xff Vendor Specific
     bInterfaceSubClass :    0x0
     bInterfaceProtocol :    0x0
     iInterface         :    0x5 Source/Sink
    INTERFACE 1: Vendor Specific ===========================
     bLength            :    0x9 (9 bytes)
     bDescriptorType    :    0x4 Interface
     bInterfaceNumber   :    0x1
     bAlternateSetting  :    0x0
     bNumEndpoints      :    0x0
     bInterfaceClass    :   0xff Vendor Specific
     bInterfaceSubClass :    0x0
     bInterfaceProtocol :    0x0
     iInterface         :    0x6 Isoc Source/Sink
    INTERFACE 1, 1: Vendor Specific ========================
     bLength            :    0x9 (9 bytes)
     bDescriptorType    :    0x4 Interface
     bInterfaceNumber   :    0x1
     bAlternateSetting  :    0x1
     bNumEndpoints      :    0x2
     bInterfaceClass    :   0xff Vendor Specific
     bInterfaceSubClass :    0x0
     bInterfaceProtocol :    0x0
     iInterface         :    0x6 Isoc Source/Sink
      ENDPOINT 0x81: Isochronous IN ========================
       bLength          :    0x9 (7 bytes)
       bDescriptorType  :    0x5 Endpoint
       bEndpointAddress :   0x81 IN
       bmAttributes     :    0x5 Isochronous
       wMaxPacketSize   :  0x200 (512 bytes)
       bInterval        :    0x1
      ENDPOINT 0x1: Isochronous OUT ========================
       bLength          :    0x9 (7 bytes)
       bDescriptorType  :    0x5 Endpoint
       bEndpointAddress :    0x1 OUT
       bmAttributes     :    0x5 Isochronous
       wMaxPacketSize   :  0x200 (512 bytes)
       bInterval        :    0x1
```

libusb seems to encounter an error:

(pyusb error output)
```
>>> import usb
>>> ds = [d for d in usb.core.find(find_all=True, idVendor=0x1d6b, idProduct=0x0104)]
>>> d = ds[0]
>>> d.set_interface_altsetting(interface=1, alternate_setting=1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.7/site-packages/usb/core.py", line 902, in set_interface_altsetting
    self._ctx.managed_set_interface(self, interface, alternate_setting)
  File "/usr/lib/python3.7/site-packages/usb/core.py", line 102, in wrapper
    return f(self, *args, **kwargs)
  File "/usr/lib/python3.7/site-packages/usb/core.py", line 204, in managed_set_interface
    self.backend.set_interface_altsetting(self.handle, i.bInterfaceNumber, alt)
  File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 807, in set_interface_altsetting
    altsetting))
  File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 595, in _check
    raise USBError(_strerror(ret), ret, _libusb_errno[ret])
usb.core.USBError: [Errno None] Other error
```

(libusb error from C code)
```
libusb: error [op_set_interface] setintf failed error -1 errno 32
```

But, if interface 1 alternate setting 0 is dropped, and interface 1 alternate
setting 1 is kept, both invocations work and my C code spits out data very
fast, although I must inspect it further as I seem to be duplicating data in my
reads.

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5E820389E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 16:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgFVOCF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 10:02:05 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38121 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728070AbgFVOCE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 10:02:04 -0400
Received: (qmail 135245 invoked by uid 1000); 22 Jun 2020 10:02:03 -0400
Date:   Mon, 22 Jun 2020 10:02:02 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to Use Isochronous Behavior w/ Isoc Endpoint in FunctionFC
Message-ID: <20200622140202.GA134271@rowland.harvard.edu>
References: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
 <20200621140916.GB107361@rowland.harvard.edu>
 <86137ba1-4a08-4862-b3b0-47544f60e9f6@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86137ba1-4a08-4862-b3b0-47544f60e9f6@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 09:25:53PM -0500, Sid Spry wrote:
> I now must ask the list: What is the relation of the isochronous endpoint setup
> to the allocated bandwidth on the bus?

Bandwidth allocation is determined by the host controller driver, or in 
the case of xHCI, hardware.  Therefore it will vary with different drivers 
or controllers.

> I understand the limit of 3 1024 byte
> transfers per frame, but this says nothing about how it will be allocated or
> how a device is refused bandwidth. Do I need to look for link degradation on
> the application layer? It seems like having a single non-spec device means
> the OS can't arbitrate link bandwidth.

If allocation fails, the application will find out either when it tries to 
issue a Set-Interface request or when it tries to submit an isochronous 
URB.

Did you say earlier that your host controller is xHCI?  If it is then the 
OS doesn't arbitrate link bandwidth; the xHCI hardware does.

> Also!
> 
> For the list's consideration I have included an accepted but nonworking
> configuration that perplexes me. The application note for the original device
> I used specified a set of descriptors which was like so (device and
> configuration omitted):

[apparently irrelevant details omitted]

> libusb seems to encounter an error:
> 
> (pyusb error output)
> ```
> >>> import usb
> >>> ds = [d for d in usb.core.find(find_all=True, idVendor=0x1d6b, idProduct=0x0104)]
> >>> d = ds[0]
> >>> d.set_interface_altsetting(interface=1, alternate_setting=1)
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.7/site-packages/usb/core.py", line 902, in set_interface_altsetting
>     self._ctx.managed_set_interface(self, interface, alternate_setting)
>   File "/usr/lib/python3.7/site-packages/usb/core.py", line 102, in wrapper
>     return f(self, *args, **kwargs)
>   File "/usr/lib/python3.7/site-packages/usb/core.py", line 204, in managed_set_interface
>     self.backend.set_interface_altsetting(self.handle, i.bInterfaceNumber, alt)
>   File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 807, in set_interface_altsetting
>     altsetting))
>   File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 595, in _check
>     raise USBError(_strerror(ret), ret, _libusb_errno[ret])
> usb.core.USBError: [Errno None] Other error
> ```
> 
> (libusb error from C code)
> ```
> libusb: error [op_set_interface] setintf failed error -1 errno 32
> ```

Error 32 means that the device returned a STALL status when it received 
the Set-Interface request.  The code responsible for this error response 
might be in FunctionFS or in your driver.

> But, if interface 1 alternate setting 0 is dropped, and interface 1 alternate
> setting 1 is kept, both invocations work and my C code spits out data very
> fast, although I must inspect it further as I seem to be duplicating data in my
> reads.

If you drop altsetting 0 then you're probably not issuing a Set-Interface 
request.  That would explain why you don't get a failure.

If you like, you can try issuing a Set-Interface(0) request (even though 
it's redundant) just to see if it fails.

Alan Stern

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636C1203B45
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 17:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgFVPmS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 11:42:18 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50483 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729250AbgFVPmR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 11:42:17 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id C6C7C3EE;
        Mon, 22 Jun 2020 11:42:14 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Mon, 22 Jun 2020 11:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=+iEkReGlWiTGZZXgO0bHzWtXGAGF9qD
        K3EkUpUaCXFI=; b=L3Ts+W1HbXmnDnNkw8O/VV0HwtyBiDpQzLKQnq4sWsqPCL1
        EtgLSintFI5nhJtgEJNyZ4lY170pvAdaKOSuHOWOWCR+lFK1wWpWJ90gUWMBPNjn
        A2FXoNLqNiN2+qkdKBiG/58Xvt/kLdDpAtbNAxDfuE581HV5MQgo/QKd8+JdwMMU
        ypq+1kibN5rGbIkhDC6zYh60BNMJjMNrZJxNw3DdMcvsXxEa5AtnEW4Q0BRbtM4m
        Zk52gU80KtcWowEKytVQYxcti80EAm4G1rqHGUf29bRoUjqEDbSVFBWA5H0ajjI3
        q46Br+uLXek7YHUciR0LcwcgwvZVIRhEDzoSxgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+iEkRe
        GlWiTGZZXgO0bHzWtXGAGF9qDK3EkUpUaCXFI=; b=ah0qnf1eo1haiLLAzXOD10
        5d7loxuKE9jf5XZnhwyNd5i5okweam7VI7Ta24uv34wYeoMy8h2mFqTpzvNhIihu
        c4JQbeFOtF7jOup5nY3f83AA5Gnn3tU0MHs5uF067L7rNLtpSVdkEHFTPf2Li/Ry
        5zvUtlHhEiYV5Cgmzjhe5+VsB1VgfyobXNF3a7THcTHVIKq9uqTuoNcBGtAN962a
        O+AU1NhvU8gxSzxpj5sQlWgwttbPAs+myVvh8ZtlK9DI6nN33zXPOMVsZIOeZ7Qb
        5abba4v/F7WtYqkVipPhygz48XQWJZP9PA6TWL4royVSAcRFxUnNGLgbbUfG/bzw
        ==
X-ME-Sender: <xms:VdHwXprJepOGIzT6qN_wQ1wxZQxy6gfY5uhVV9U5VyvLkymPGyPRUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepfedtge
    eljeelgfevffehueekvdejudeuteevhfdvlefgvefghfeftdefgfdtheeunecuffhomhgr
    ihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:VdHwXrpOVsr5-5RKe0GX97CkD4w18f-xlT_uNI-li7gvKqwAXIQH8A>
    <xmx:VdHwXmP5UohSl_NDX1aJlk2w6nKChPaPSjnUJZmTx8CpZwdA7zBljw>
    <xmx:VdHwXk6Nip2Lu_HZ_48M0jVUb-MVvnu02QJNCAVTAj3mLebaQbzKvw>
    <xmx:VtHwXqENnZvEZ9PvETrq3ZUJVggF54a5Q3WZk1OnX2KTrEXEzQIJqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B2DBE660081; Mon, 22 Jun 2020 11:42:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <564fdd69-5e90-4a4c-a8dd-a33f251c025d@www.fastmail.com>
In-Reply-To: <20200622140202.GA134271@rowland.harvard.edu>
References: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
 <20200621140916.GB107361@rowland.harvard.edu>
 <86137ba1-4a08-4862-b3b0-47544f60e9f6@www.fastmail.com>
 <20200622140202.GA134271@rowland.harvard.edu>
Date:   Mon, 22 Jun 2020 10:41:14 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to Use Isochronous Behavior w/ Isoc Endpoint in FunctionFC
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 22, 2020, at 9:02 AM, Alan Stern wrote:
> On Sun, Jun 21, 2020 at 09:25:53PM -0500, Sid Spry wrote:
> > I now must ask the list: What is the relation of the isochronous endpoint setup
> > to the allocated bandwidth on the bus?
> 
> Bandwidth allocation is determined by the host controller driver, or in 
> the case of xHCI, hardware.  Therefore it will vary with different drivers 
> or controllers.
> 

Ok, variation I expected. Sadly it seems like I am not made aware of which
interface alternate setting is chosen.

See: https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/
function/f_fs.c#L3265.

The ctrlrequest struct (https://elixir.bootlin.com/linux/latest/source/include
/uapi/linux/usb/ch9.h#L213) is only sent for SETUP events. Of which I have
yet to triggered.

> > I understand the limit of 3 1024 byte
> > transfers per frame, but this says nothing about how it will be allocated or
> > how a device is refused bandwidth. Do I need to look for link degradation on
> > the application layer? It seems like having a single non-spec device means
> > the OS can't arbitrate link bandwidth.
> 
> If allocation fails, the application will find out either when it tries to 
> issue a Set-Interface request or when it tries to submit an isochronous 
> URB.
> 
> Did you say earlier that your host controller is xHCI?  If it is then the 
> OS doesn't arbitrate link bandwidth; the xHCI hardware does.
> 

It is. The device is HS USB2. Eventually I'll find a platform with a superspeed
UDC. Suspecting I will have to repurpose a rooted Android phone. If anyone
has a lead on something with an easily accessible hardware serial port I am
interested.

> > Also!
> > 
> > For the list's consideration I have included an accepted but nonworking
> > configuration that perplexes me. The application note for the original device
> > I used specified a set of descriptors which was like so (device and
> > configuration omitted):
> 
> [apparently irrelevant details omitted]
> 
> > libusb seems to encounter an error:
> > 
> > (pyusb error output)
> > ```
> > >>> import usb
> > >>> ds = [d for d in usb.core.find(find_all=True, idVendor=0x1d6b, idProduct=0x0104)]
> > >>> d = ds[0]
> > >>> d.set_interface_altsetting(interface=1, alternate_setting=1)
> > Traceback (most recent call last):
> >   File "<stdin>", line 1, in <module>
> >   File "/usr/lib/python3.7/site-packages/usb/core.py", line 902, in set_interface_altsetting
> >     self._ctx.managed_set_interface(self, interface, alternate_setting)
> >   File "/usr/lib/python3.7/site-packages/usb/core.py", line 102, in wrapper
> >     return f(self, *args, **kwargs)
> >   File "/usr/lib/python3.7/site-packages/usb/core.py", line 204, in managed_set_interface
> >     self.backend.set_interface_altsetting(self.handle, i.bInterfaceNumber, alt)
> >   File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 807, in set_interface_altsetting
> >     altsetting))
> >   File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 595, in _check
> >     raise USBError(_strerror(ret), ret, _libusb_errno[ret])
> > usb.core.USBError: [Errno None] Other error
> > ```
> > 
> > (libusb error from C code)
> > ```
> > libusb: error [op_set_interface] setintf failed error -1 errno 32
> > ```
> 
> Error 32 means that the device returned a STALL status when it received 
> the Set-Interface request.  The code responsible for this error response 
> might be in FunctionFS or in your driver.
>

I see the set-interface request in my code as a read/write error on the endpoints
(errno 11: resource temporarily unavailable) and an enable event. Otherwise
most things "just happen."

I've had issues reusing endpoint numbers like you are supposed to. Either the
descriptors aren't accepted or more commonly the UDC won't bind. E.g. I have
to give interface 0 eps 1, 2 and interface 1 eps 3, 4. The numbering is preserved
on the host, kind of. Eps are compacted into their numbering based on direction.
So you see interface 0 with eps 0x81 and 0x01, and interface 1 with eps 0x82 
and 0x02.

This isn't causing me problems per se but does seem improper.

I'll look through the functionfs code when I have some time. The user mode
does not seem to be passed much information.

> > But, if interface 1 alternate setting 0 is dropped, and interface 1 alternate
> > setting 1 is kept, both invocations work and my C code spits out data very
> > fast, although I must inspect it further as I seem to be duplicating data in my
> > reads.
> 
> If you drop altsetting 0 then you're probably not issuing a Set-Interface 
> request.  That would explain why you don't get a failure.
> 
> If you like, you can try issuing a Set-Interface(0) request (even though 
> it's redundant) just to see if it fails.
> 

Ah, yes, I had done set-interface(0 [, 0]). set-interface(1, 0) also works. It is just
set-interface(1, 1) that is nonfunctional when an alternate mode 0 is provided.

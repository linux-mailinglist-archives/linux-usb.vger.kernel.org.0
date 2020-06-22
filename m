Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AD9204277
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 23:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbgFVVOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 17:14:09 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52577 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730295AbgFVVOI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 17:14:08 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id CC6D35C0D2F;
        Mon, 22 Jun 2020 17:14:06 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Mon, 22 Jun 2020 17:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=CPnevfLea/yO+Zmw5WfTkJ0vHLe66yA
        rV3re+F6nmC0=; b=ru8xMdI8Ow8vdBqgrYVxXZQGSIj0L4IagpQ5qsB2kVjGi7I
        NQ16nybyir9eok8BsVAwco0YYwB7NohzvhDz74QZ5PBraxCK1UBQABPqlj5K1yqL
        YxzzxLq/kb2A6KLORi3NRthnS56wy1qZ99m+KlJ1fVZml/Jkvcspja0jlDPlA2OZ
        Z75a3g+undRvpIB8eDnhikqJ6/ceeoNTklzujlsuZaH5E0QmMSKsXFIsdBSpZF+u
        2lpSgcohwgtbbwZyYwrtwaVGxXLiRrryhQeJh8jFFRZW+hE9Zqa14mauIXcQG/vg
        XGruy13zygbL8smiTdTExqnKKztb2aLfrFRNvhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CPnevf
        Lea/yO+Zmw5WfTkJ0vHLe66yArV3re+F6nmC0=; b=RkYfhQvfzOUPQ36r1MZQOk
        NTVE/g9YhiAlriL+LSwY5OBxMJ92Ub2lxLTXId/664pQaZ1JXFZsK4tNWyKkNfxQ
        DHNASZexaINRN9FN1X7qCIH+OHAx2rZCyUAcTp8H0LWy/Bfa3oPlCbbeSDproG3D
        aEthlCata/ps0vmxYve0Q8MksmGepHrujnErdkPGb2I1PWFiu9cAZAc8jZ+ui8W9
        frveJSO8/7PU0EFs1PlSqUvnwAAR0GW+/knnnZbJUKHo22sQQCwMba1dCVZq2Yi9
        f2h0p7AbXRX3o2Wp1AEnb5KHCQquhK4tq9LH+qIsT2pmiAjRcfcW6WmDQXckueFw
        ==
X-ME-Sender: <xms:Hh_xXhT0jiB-RQBXG6Djg113H8jWp10OeLD4vPO87S_ybsITXPgDfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhi
    ugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeeftd
    egleejlefgveffheeukedvjeduueetvefhvdelgfevgffhfedtfefgtdehueenucffohhm
    rghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:Hh_xXqwAju7rpMmM1Zoh5v76a85UBU3_fdGilBxwlOjWeRbtwQvLlA>
    <xmx:Hh_xXm0pAeUHdalDhbC0k9I5zXPdMx9G4WwLiPtfqLEgay8QqROxiw>
    <xmx:Hh_xXpD9FYg6kgp1hsJJ_0dfEEkpjfLxreG_Z823oK0b4YgbpAus_g>
    <xmx:Hh_xXltNOjsgFbyE2Iu5Tbjqamw14nrKKqbyDOPwIoedo8Wx59GLHg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 63702660081; Mon, 22 Jun 2020 17:14:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <26bbc5be-0329-4f78-9ba8-7d3d773a8d09@www.fastmail.com>
In-Reply-To: <20200622164115.GD137824@rowland.harvard.edu>
References: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
 <20200621140916.GB107361@rowland.harvard.edu>
 <86137ba1-4a08-4862-b3b0-47544f60e9f6@www.fastmail.com>
 <20200622140202.GA134271@rowland.harvard.edu>
 <564fdd69-5e90-4a4c-a8dd-a33f251c025d@www.fastmail.com>
 <20200622164115.GD137824@rowland.harvard.edu>
Date:   Mon, 22 Jun 2020 16:13:39 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to Use Isochronous Behavior w/ Isoc Endpoint in FunctionFC
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 22, 2020, at 11:41 AM, Alan Stern wrote:
> On Mon, Jun 22, 2020 at 10:41:14AM -0500, Sid Spry wrote:
> > On Mon, Jun 22, 2020, at 9:02 AM, Alan Stern wrote:
> > > On Sun, Jun 21, 2020 at 09:25:53PM -0500, Sid Spry wrote:
> > > > I now must ask the list: What is the relation of the isochronous endpoint setup
> > > > to the allocated bandwidth on the bus?
> > > 
> > > Bandwidth allocation is determined by the host controller driver, or in 
> > > the case of xHCI, hardware.  Therefore it will vary with different drivers 
> > > or controllers.
> > > 
> > 
> > Ok, variation I expected. Sadly it seems like I am not made aware of which
> > interface alternate setting is chosen.
> > 
> > See: https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/
> > function/f_fs.c#L3265.
> > 
> > The ctrlrequest struct (https://elixir.bootlin.com/linux/latest/source/include
> > /uapi/linux/usb/ch9.h#L213) is only sent for SETUP events. Of which I have
> > yet to triggered.
> 
> Like I said before, you'll need to ask someone who knows more about 
> FunctionFS.
> 

This is a mailing list, I am not only expecting you to reply.

> > > > libusb seems to encounter an error:
> > > > 
> > > > (pyusb error output)
> > > > ```
> > > > >>> import usb
> > > > >>> ds = [d for d in usb.core.find(find_all=True, idVendor=0x1d6b, idProduct=0x0104)]
> > > > >>> d = ds[0]
> > > > >>> d.set_interface_altsetting(interface=1, alternate_setting=1)
> > > > Traceback (most recent call last):
> > > >   File "<stdin>", line 1, in <module>
> > > >   File "/usr/lib/python3.7/site-packages/usb/core.py", line 902, in set_interface_altsetting
> > > >     self._ctx.managed_set_interface(self, interface, alternate_setting)
> > > >   File "/usr/lib/python3.7/site-packages/usb/core.py", line 102, in wrapper
> > > >     return f(self, *args, **kwargs)
> > > >   File "/usr/lib/python3.7/site-packages/usb/core.py", line 204, in managed_set_interface
> > > >     self.backend.set_interface_altsetting(self.handle, i.bInterfaceNumber, alt)
> > > >   File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 807, in set_interface_altsetting
> > > >     altsetting))
> > > >   File "/usr/lib/python3.7/site-packages/usb/backend/libusb1.py", line 595, in _check
> > > >     raise USBError(_strerror(ret), ret, _libusb_errno[ret])
> > > > usb.core.USBError: [Errno None] Other error
> > > > ```
> > > > 
> > > > (libusb error from C code)
> > > > ```
> > > > libusb: error [op_set_interface] setintf failed error -1 errno 32
> > > > ```
> > > 
> > > Error 32 means that the device returned a STALL status when it received 
> > > the Set-Interface request.  The code responsible for this error response 
> > > might be in FunctionFS or in your driver.
> > >
> > 
> > I see the set-interface request in my code as a read/write error on the endpoints
> > (errno 11: resource temporarily unavailable) and an enable event. Otherwise
> > most things "just happen."
> > 
> > I've had issues reusing endpoint numbers like you are supposed to. Either the
> > descriptors aren't accepted or more commonly the UDC won't bind. E.g. I have
> > to give interface 0 eps 1, 2 and interface 1 eps 3, 4. The numbering is preserved
> > on the host, kind of. Eps are compacted into their numbering based on direction.
> > So you see interface 0 with eps 0x81 and 0x01, and interface 1 with eps 0x82 
> > and 0x02.
> 
> That's exactly how it's supposed to work.  Don't mix up endpoint _numbers_ 
> with endpoint _addresses_; they aren't the same thing.  Read through the 
> USB-2.0 specification for more information.
> 
> Also don't forget that two interfaces in the same configuration are not 
> allowed to share an endpoint (other than endpoint 0, which doesn't really 
> belong to any interface).
> 
> > This isn't causing me problems per se but does seem improper.
> 
> Why?
> 

Ah, yes, I was mixing up numbers/addresses. Strange as the only useful
number to me seems to be the address.

> > I'll look through the functionfs code when I have some time. The user mode
> > does not seem to be passed much information.
> 
> If you think this is a weakness of FunctionFS and it needs to be fixed, 
> report it to the FunctionFS maintainers.  See the MAINTAINERS file in the 
> top-level directory of the kernel source code.
> 
> > > > But, if interface 1 alternate setting 0 is dropped, and interface 1 alternate
> > > > setting 1 is kept, both invocations work and my C code spits out data very
> > > > fast, although I must inspect it further as I seem to be duplicating data in my
> > > > reads.
> > > 
> > > If you drop altsetting 0 then you're probably not issuing a Set-Interface 
> > > request.  That would explain why you don't get a failure.
> > > 
> > > If you like, you can try issuing a Set-Interface(0) request (even though 
> > > it's redundant) just to see if it fails.
> > > 
> > 
> > Ah, yes, I had done set-interface(0 [, 0]). set-interface(1, 0) also works. It is just
> > set-interface(1, 1) that is nonfunctional when an alternate mode 0 is provided.
> 
> Okay.  Maybe the problem occurs in the code that enables the endpoints for 
> altsetting 1.
> 

I do appreciate the help, I'll report to the maintainers later. I'll have to table it for
now. As it is I'm able to send reliably on each frame so I'm happy.

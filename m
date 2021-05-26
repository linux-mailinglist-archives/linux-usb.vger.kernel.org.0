Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26B2391180
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 09:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhEZHur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 03:50:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230289AbhEZHuq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 May 2021 03:50:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB856613E6;
        Wed, 26 May 2021 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622015355;
        bh=TGoirBc7GI62eq80DVl1YW6uVIRM0cM5mJgFfRSi924=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cujPaTuIm8aup0MmCJ8Ty61tBe7DyDUFEZFl5QQPWt+QvOMKXVMgMgWaW3fXeBljG
         6YuZmnkl1FUHmYwb8ltwyXmZ2finu3Xr5qP8rPPToFpsPMeI6EcUfGpeSgK033cJTu
         Xo/ZuTfF1upD5IszxG4+jFDnZxyQgHDQ0b6UKQWtXCI4xJuBordvVlMYWIM1/jMwZr
         4vFLKxV8PD97ljUulaLL42RrW0SPz0+x5fkYqQteekwCMwPoh1u6PcNDk8yGgYGbZp
         g5JP7dNX8sSO+Wg4webhTbjHcbfi0J6wBKzahP3FN/mhB27ryzqjkFNVDM1FCP9wdo
         3rpdfNzsSvRRg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lloHw-00039P-4h; Wed, 26 May 2021 09:49:12 +0200
Date:   Wed, 26 May 2021 09:49:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YK39eIHKAU5KDX7y@hovoldconsulting.com>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
 <20210522021623.GB1260282@rowland.harvard.edu>
 <YKuQgPd+JFNnNcfd@hovoldconsulting.com>
 <20210524144736.GB1320815@rowland.harvard.edu>
 <YKzwMVxgaVycl+Yi@hovoldconsulting.com>
 <20210525151208.GA1363494@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525151208.GA1363494@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 25, 2021 at 11:12:08AM -0400, Alan Stern wrote:
> On Tue, May 25, 2021 at 02:40:17PM +0200, Johan Hovold wrote:
> > On Mon, May 24, 2021 at 10:47:36AM -0400, Alan Stern wrote:
> > > Do you think the check should be weakened for this case (i.e., ignore 
> > > the direction bit in bRequestType when wLength is 0)?  So far it seems 
> > > that the number of places getting this wrong isn't prohibitively large.
> > 
> > In a sense the request-type direction bit is already ignored when
> > wLength is zero. The question is if we should ignore the direction bit
> > of the pipe argument, or rather allow it to be IN, when wLength is
> > zero.
> > 
> > With the above check now merged, the following transfer triggers the
> > warning:
> > 
> > 	usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> > 			0, USB_DIR_IN | USB_TYPE_VENDOR,
> > 			0x0020, CMD_I2C_DA_RD,
> > 			NULL, 0, 1000);
> > 
> > This request was used by a media driver to determine if a certain i2c
> > register was accessible by attempting to read it without really caring
> > about its value.
> > 
> > I changed the above to actually read the value, but this is an example
> > where allowing usb_rcvctrlpipe() might otherwise make sense was it not
> > for the possibility that some HCD could get confused.
> > 
> > Changing the above to use usb_sndctrlpipe() while either keeping
> > USB_DIR_IN or dropping USB_DIR_IN (for an I2C read request) does not
> > seem right. The latter could potentially even confuse some firmware even
> > if the direction bit is supposed to be ignored.
> > 
> > So far this is the only example I've found where changing to
> > usb_sndctrlpipe() and USB_DIR_OUT isn't obviously correct, but on the
> > other hand just reading the register in question is straight-forward
> > enough and does not require any exceptions in usb_submit_urb().
> 
> Okay, yes.  This seems like a sufficiently unusual edge case that we 
> don't need to add special code to cater for it.
> 
> In fact, the direction bit in the pipe for a control transfer is never 
> exposed to the USB device.  All the device sees is bRequestType and the 
> data/status packet tokens (IN or OUT), which are dictated by the USB 
> protocol.  So the fact that we insist on usb_sndctrlpipe for what will 
> ultimately become an I2C read request is unimportant.

Right, it just looks a bit weird to use usb_sndctrlpipe() with
USB_DIR_IN, but that should be fine especially as such cases appears to
be rare.

> > We could perhaps even go the other way and strengthen the check to warn
> > if USB_DIR_IN is set when wLength is zero...
> 
> Given that the spec says the direction bit is ignored when wLength is 
> zero, I think we shouldn't do this.

I agree, let's just allow this.

> > > PS: Another check we could add is to make sure that the 
> > > transfer_buffer_length value agrees with wLength.  Should I add such a 
> > > check?
> > 
> > That sounds sensible as some of the HCDs only appears to check
> > transfer_buffer_length when handling the data stage and a mismatch could
> > amount to undefined behaviour (OUT) or perhaps even buffer overruns
> > (IN).
> > 
> > Judging from a quick check we don't seem to have any such cases
> > currently so this could be implemented as a submission failure rather
> > than another warning.
> 
> All right; I'll make the submission fail with a -EBADR (invalid request 
> descriptor) error; that seems like a good choice of an obscure and 
> otherwise unused value to match this case.  But I'll put in a debugging 
> message, so that anyone who wants to know if this is occurring will have 
> a way to find out.

Sounds good.

Johan

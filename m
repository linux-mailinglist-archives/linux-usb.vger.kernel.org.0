Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF88404731
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 10:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhIIIqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 04:46:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:52932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231234AbhIIIqq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 04:46:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EC7261139;
        Thu,  9 Sep 2021 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631177137;
        bh=9ul2mQXB/wAf38NMXb8TFZ/Ew7YNPUC8eNwV/nt+xJQ=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=YUPz8Jy2AoOuVGKdm/cDHknbW2N1GmrM3dj2mvdNvkomPYb6sViytJzDQ1OnpSqAk
         ATzFyZAjiUU6Fwjtuz3vsTbEKdP1brN5MIeAK5v0Oqb/6m/vkJZ1lRbCurfScnnUw1
         YDJnooytSlIvP5WcsIWTOqJ4WlhZM/XYoga0ZBf96f+v+PMIOPeC1Mm23YBzH/rCGO
         NLOTVeUr/4RLP8eDZ5hKL47iGi/WI3I14JxYMSkvcBV1XwMnOQ3VOhjfmQq4hNUO+W
         HmbkUXruxkoVwx7Fpe6QgaH1LUq/PzGGnEM51tdOG4R/4xzpdB/RIgfZVDo5QbKAbE
         pHWCLW3JjCa6g==
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
 <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YTm51tmCXRtKZIcx@kroah.com>
 <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Date:   Thu, 09 Sep 2021 11:45:14 +0300
In-reply-to: <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
Message-ID: <87bl52b0i9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


"Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com> writes:

>> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Sent: Thursday, September 9, 2021 3:38 PM
>> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
>> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
>> Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
>> 
>> On Thu, Sep 09, 2021 at 07:17:57AM +0000, Linyu Yuan (QUIC) wrote:
>> >
>> >
>> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > > Sent: Thursday, September 9, 2021 2:11 PM
>> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
>> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
>> > > Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
>> > >
>> > > On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
>> > > > change device release function to clear gadget pointer.
>> > >
>> > > That does not properly describe what and why this change is needed.
>> > >
>> > > >
>> > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> > > > ---
>> > > >  drivers/usb/dwc3/gadget.c | 5 +++--
>> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> > > > index 804b505..e2ab5f6 100644
>> > > > --- a/drivers/usb/dwc3/gadget.c
>> > > > +++ b/drivers/usb/dwc3/gadget.c
>> > > > @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3
>> > > *dwc)
>> > > >
>> > > >  static void dwc_gadget_release(struct device *dev)
>> > > >  {
>> > > > -	struct usb_gadget *gadget = container_of(dev, struct usb_gadget,
>> > > dev);
>> > > > +	struct dwc3 *dwc = dev_get_platdata(dev);
>> > >
>> > > Are you sure this is the same?
>> > Yes, in dwc3_gadget_init()
>> > 	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
>> > 	dev				= &dwc->gadget->dev;
>> > 	dev->platform_data		= dwc;
>> >
>> > here original code use follow container_of, it use same dev,
>> > container_of(dev, struct usb_gadget, dev);
>> > >
>> > > >
>> > > > -	kfree(gadget);
>> > > > +	kfree(dwc->gadget);
>> > > > +	dwc->gadget = NULL;
>> > >
>> > > Why set this to NULL?  Who cares about this now?  What changed to
>> make
>> > > it required?
>> > It better to set to NULL for better understanding.
>> 
>> Understanding of what?  What issue does this fix?  You need a reason to
>> make this, or any, kernel change.
>
> Sorry, let explain, for example, when do role switch, we can check it
> value to make sure it switch complete,
>
> If we do not set to NULL, it will be invalid.

Using this pointer as a role switch flag seems fragile, though.

-- 
balbi

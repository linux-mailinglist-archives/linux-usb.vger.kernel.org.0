Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459101D0620
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 06:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgEMEsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 00:48:14 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41833 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725898AbgEMEsN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 00:48:13 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id A1B1E5C0003;
        Wed, 13 May 2020 00:48:12 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Wed, 13 May 2020 00:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=wKI9kWdFgvxntpoR5sxGFOZA1ewtbq8
        rdpKuBheo3Zg=; b=mRs3wd36bXaphwqNecak80myt8redPXv0mfjLkpOBqUGD9z
        GVbG39T83kF+SBhNAKZkUClaK/omNr92+P8/Lm7K8Wxu4jAPglb5xAymUClBDcJi
        14zcxgJzK0yD9GIMoagYWqJTnI0zpopfXc0BMrUdDi8kXDqnRKCN7HR8kF3TmjHz
        ruQMCXswUleZlczP6x52viZJ00DqPqdYxxFa452JqV+onbGAXISzgOYTvKUhMQVw
        t6O0bc2A+gqeQOV1Ghpf3Ds2Fl0sojr9myqzg6dzu7h4SFQUiKpIAtp2AI4YX4L8
        CMTmIDFUhpz9F0zCEwbGw7QA2hbk58Q94rOdfZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wKI9kW
        dFgvxntpoR5sxGFOZA1ewtbq8rdpKuBheo3Zg=; b=LvzBq+Dcf+otOmwj5vOFX0
        m+ZN8A9xI9HP/79NlaVen2qIcIwTkch180XOi12Q6tiOS5kr7OjppCD96zpztSli
        IOopgwSGwwkSjPnJ1KpWiFr0GFsMRvQMAA0hKWv5zdiezLzPOEZG6CGOSj9mWqXs
        OzNpLjHP8lKLzP9+m+KjamlvI6VslbMEihaO0mw3NZuvR8a2AJETxmc4KEuMileF
        XmxtQmZ465jACIPQbwDP3cpk6smHODTEwEaYqsLuacZrdY6AMJgQhSQ/ZWxv7Qtu
        eZicVRzdqn3Yh+8odSdsLuBX73SHoqzhV3YCzkzd/+JF3jnbvFoGI2PAS1Q01ldg
        ==
X-ME-Sender: <xms:DHy7XpsRQ4hV-NcDAjMZoP9OXAvSYyUnOrQrDLOWNuul16kX0PxIbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleefgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevgefhve
    evteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruh
    hs
X-ME-Proxy: <xmx:DHy7XifdOTO6R8uighHlAQaERNiphV4JEkoFD7rWU6l2nYHprrwc4w>
    <xmx:DHy7XsyLqHV4nC_aPwLNkFl_ujiVZUdhnEHf8vkeUu4gQmiWEOLmcw>
    <xmx:DHy7XgM6UJNYB9RciWNhDOjqBMrjtCLIOKQ4budmZkHTd_U49Eh-IQ>
    <xmx:DHy7XuLtNyrv4eQrfR5kx6eURHvatd2QX0fatp3WhZ9_J7qA6SP0lw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 53D4566007E; Wed, 13 May 2020 00:48:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <ba5a11fe-90a6-48c2-8da1-66076e52c6b4@www.fastmail.com>
In-Reply-To: <e89456b5-20db-48c1-814b-075e84ca8b8b@www.fastmail.com>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
 <20200512195231.GA26080@rowland.harvard.edu>
 <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
 <e89456b5-20db-48c1-814b-075e84ca8b8b@www.fastmail.com>
Date:   Tue, 12 May 2020 23:47:27 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Claus Stovgaard" <claus.stovgaard@gmail.com>,
        "Alan Stern" <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello again, I'm terribly sorry for the double post. Claus, you might try detecting the speed of the connection and re-enumerating if necessary. It would avoid noncompliance with the spec and is probably the easiest option.

Unsure of how this would be done with a C manifestation of functionfs code but echoing "" to the UDC pseudofile under /sys/kernel/config/usb_gadget/${your_gadget} will allow you to set everything up again and reenumerate.

On Tue, May 12, 2020, at 11:43 PM, Sid Spry wrote:
> Have you tried only providing a SS configuration? If that fails for some reason I suspect the next course of action would be to see why, and patch the driver so it does not.
> 
> Out of curiosity, which SoC are you using?
> 
> On Tue, May 12, 2020, at 3:08 PM, Claus Stovgaard wrote:
> > On tir, 2020-05-12 at 15:52 -0400, Alan Stern wrote:
> > > On Tue, May 12, 2020 at 09:25:38PM +0200, Claus Stovgaard wrote:
> > > > 
> > > > In a certain scenario I would like to force the dwc3 to only
> > > > connect
> > > > via superspeed and not fall back to USB2.
> > > > 
> > > > What options exist for forcing the dwc3 to keep retry?
> > > 
> > > The USB-3 spec forbids devices from operating only at SuperSpeed. 
> > > Devices must be able to connect at high speed, although possibly
> > > with 
> > > reduced functionality.
> > > 
> > > Alan Stern
> > > 
> > 
> > I understand the requirement from the USB 3 specification. Though in
> > the scenario for this specific device, it is not about comply with the
> > USB 3 specification, but my question is rather what options I have for
> > not comply with the specification here, and then force retry of USB 3,
> > using the dwc3 as device.
> > 
> > The device is in a fixed mounting with a fixed host. Sometimes when the
> > host and device is powered up, it ends in high-speed instead of super-
> > speed. I would like the option for "I will not be compliant with USB,
> > but rather retry super-speed".
> > 
> > Regards
> > Claus
> > 
> > 

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F09BD388D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 06:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfJKElf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 00:41:35 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57909 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726099AbfJKElf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 00:41:35 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D023621D26;
        Fri, 11 Oct 2019 00:41:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 11 Oct 2019 00:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=5/+iOpELycZpC0MTwhVfynJi15W
        sJNom1anWUYNAIKQ=; b=Q2x46KaLO9bvgEU4XcN4XBeFWhm6w5lD50wC5E7Yr9j
        2SqKFUQWUFlavURDbtqP9yZI2HnRixtn0AXXpgF2P1gHdh+0UeTQyAgZhUEzdPZ9
        t4nkH3WwaFV4TU0Fovuz3ty16eN52/9hFnYwkdj3Vf06bRC5IwKr3HbeY98ypxcm
        WjSI7pVoJQNc3I+JOFwQMLZw47dXW9KWEifGc0l9l4VDbfMaN+H2qMzlGIhNno8H
        3fWUd3aWaUJZzuUWTl2rX2hxp6Z59mwJZfHfNv9hXcmDNE1aSgnz1XgcyGwpcMxd
        BEH5pZKHCzYPEA4Gjl2/Hy2N8Bx1sM4gXJr9HMJ4+Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5/+iOp
        ELycZpC0MTwhVfynJi15WsJNom1anWUYNAIKQ=; b=GMnMCqwfOCLU/RWSFkszEF
        FHeebUYLHrqg6ZWyUE9qlarhvEJR83S/TrTbjXfoMsHFDpPNWqy0dvgTHgzq8YWf
        YFfRlbEQ+TswA6WEscJVbnTQWm3rNFPdeuP7G2h6+06zA0EWOmhf4zQaXMyuRKIO
        ehZkr2+APNmMk8DNcjcWu9UHrOj2eIlNzWUZS4IptlcBoZM61Z6R3X8MrbnMr4Iy
        roE1+Z2dEQKV+7IfeX49CrN1IY5q13oZpsIL44QKavJ/3D0/5IlcQ+5boAmQC6QF
        7ke4TwiW/cs7Z8O2gg2Rwene8rPPo+HQmC2tI69hfz55VfX8zTCC48DvIsPyoULQ
        ==
X-ME-Sender: <xms:_gegXXzPXbC2iu9w9l4sqKv-buRdNXNOiiChi52sxyl7Ald85hhCxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieeggdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
    lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:_gegXYkvmBJ7irozfPll8Nkh49la_iWE-xjUDIuapX3vom97g88IJw>
    <xmx:_gegXYkiQ6y0qi-Zw6DIrkHHeZEZWMWxtOYDyszgzdkrX14wiN_YPg>
    <xmx:_gegXSzpGN1861wNmNpLbPUdvWrzhmnuskxBk8IllUp9aJ5pDIWBKA>
    <xmx:_gegXejO8ytZBTuIHlfs-hSPm1QKEvTROJhYCa2h4Z38kbYn5zK6QA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id EB77380059;
        Fri, 11 Oct 2019 00:41:33 -0400 (EDT)
Date:   Fri, 11 Oct 2019 06:41:32 +0200
From:   Greg KH <greg@kroah.com>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: Re: [PATCH] usb: usbfs: Suppress problematic bind and unbind uevents.
Message-ID: <20191011044132.GA946248@kroah.com>
References: <20191010164800.2444-1-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010164800.2444-1-ingo.rohloff@lauterbach.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 10, 2019 at 06:48:00PM +0200, Ingo Rohloff wrote:
> commit 1455cf8dbfd0 ("driver core: emit uevents when device is bound
> to a driver") added bind and unbind uevents when a driver is bound or
> unbound to a physical device.
> 
> For USB devices which are handled via the generic usbfs layer (via
> libusb for example), this is problematic:
> Each time a user space program calls
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
> and then later
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> The kernel will now produce a bind or unbind event, which does not
> really contain any useful information.
> 
> This allows a user space program to run a DoS attack against programs
> which listen to uevents (in particular systemd/eudev/upowerd):
> A malicious user space program just has to call in a tight loop
> 
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> 
> With this loop the malicious user space program floods the kernel and
> all programs listening to uevents with tons of bind and unbind
> events.
> 
> This patch suppresses uevents for ioctls USBDEVFS_CLAIMINTERFACE and
> USBDEVFS_RELEASEINTERFACE.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  drivers/usb/core/devio.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

I am guessing this is a new version of a previously-submitted patch?  If
so, you need to include a "version" number on it, and put what you
changed below the --- line.  The kernel documentation should explain how
to do this, if not, please let us know.

Please fix this up and resend.

thanks,

greg k-h

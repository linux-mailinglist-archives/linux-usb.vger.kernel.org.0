Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DE41FCA12
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 11:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgFQJpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 05:45:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgFQJpC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jun 2020 05:45:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D789F207E8;
        Wed, 17 Jun 2020 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592387100;
        bh=qHnoIIiMCJHQD3PRVlt1FQDon52HF/kXtPa6XVkCzYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NqbtHA5J1U0PToLQ0IBvcazWgFIKY+tK8OEcbZiVgJEbXE1H0tiigScdm4WZIjCfv
         25YCHYjeMPN8T+ZQ8QSPToh+Q5QS2gpQUVMx8v2YGUc1DVOwpALnWt/dVGgOglv99F
         tZLFtg2rc2kUTU0YPF+mvHGd0qvGiAJtO8NrJrFg=
Date:   Wed, 17 Jun 2020 11:44:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?77+977+977+977+977+977+9?= <jh0801.jung@samsung.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Message-ID: <20200617094453.GA1944221@kroah.com>
References: <CGME20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791@epcas2p3.samsung.com>
 <1592358930-28684-1-git-send-email-jh0801.jung@samsung.com>
 <20200617051738.GB1331778@kroah.com>
 <20200617075249.GA1547648@kroah.com>
 <033901d64487$2bab03f0$83010bd0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <033901d64487$2bab03f0$83010bd0$@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 17, 2020 at 06:10:39PM +0900, ������ wrote:
> 
> 
> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
> > owner@vger.kernel.org] On Behalf Of Greg KH
> > Sent: Wednesday, June 17, 2020 4:53 PM
> > To: JaeHun Jung
> > Cc: linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
> > 
> > On Wed, Jun 17, 2020 at 07:17:38AM +0200, Greg KH wrote:
> > > On Wed, Jun 17, 2020 at 10:55:30AM +0900, JaeHun Jung wrote:
> > > > In mobile, a co-processor is used when using USB audio to improve
> > > > power consumption.
> > > > hooking is required for sync-up when operating the co-processor. So
> > > > register call-back function.
> > > > The main operation of the call-back function is as follows:
> > > > - Initialize the co-processor by transmitting data
> > > >   when initializing.
> > > > - Change the co-processor setting value through
> > > >   the interface function.
> > > > - Configure sampling rate
> > > > - pcm open/close
> > > >
> > > > Bug: 156315379
> > > >
> > > > Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc
> > >
> > > No need for Bug or Change-Id on patches submitted to us, same for the
> > > odd "ANDROID:" in the subject.
> > >
> 
> Ok, I will delete it.
> 
> > > > Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
> > > > ---
> > > >  sound/usb/card.c     | 16 ++++++++++++++++
> > > >  sound/usb/card.h     |  1 +
> > > >  sound/usb/clock.c    |  5 +++++
> > > >  sound/usb/pcm.c      | 33 +++++++++++++++++++++++++++++++++
> > > >  sound/usb/usbaudio.h | 30 ++++++++++++++++++++++++++++++
> > > >  5 files changed, 85 insertions(+)
> > >
> > > Did you run scripts/get_maintainer.pl on this patch to determine that
> > > maybe the alsa-devel list should also be needed?
> > >
> 
> Yes, it was sent looking for maintainer of sound/usb.
> This callbacks is for sync with Audio Core.
> So, I was implement on sound/usb.
> 
> > >
> > >
> > > >
> > > > diff --git a/sound/usb/card.c b/sound/usb/card.c index
> > > > fd6fd17..2f3fa14 100644
> > > > --- a/sound/usb/card.c
> > > > +++ b/sound/usb/card.c
> > > > @@ -111,6 +111,7 @@ MODULE_PARM_DESC(skip_validation, "Skip unit
> > > > descriptor validation (default: no)  static
> > > > DEFINE_MUTEX(register_mutex);  static struct snd_usb_audio
> > > > *usb_chip[SNDRV_CARDS];  static struct usb_driver usb_audio_driver;
> > > > +struct snd_usb_audio_vendor_ops *usb_audio_ops;
> > > >
> > > >  /*
> > > >   * disconnect streams
> > > > @@ -210,6 +211,12 @@ static int snd_usb_create_stream(struct
> > snd_usb_audio *chip, int ctrlif, int int
> > > >  	return 0;
> > > >  }
> > > >
> > > > +void snd_set_vender_interface(struct snd_usb_audio_vendor_ops
> > > > +*vendor_ops) {
> > > > +	usb_audio_ops = vendor_ops;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(snd_set_vender_interface);
> > >
> > > You are exporting a lot of new symbols, but you have no user of these
> > > symbols, which is not allowed, as you know.  Please also post your
> > > user of them so we can see if you are doing things correctly or not.
> > >
> 
> Yes, I know.
> This is called from Audio core module.
> Audio related drivers associated with this module cannot disclose because
> of security.

What do you mean?  The license of the code is GPL version 2, so there is
no "security" reason to not publish it.

> I think this is true of other vendors as well.

What other vendor needs these hooks?

> > > Also, only one set of "vendor ops" does not make any sense at all,
> > > this needs to be on a per-host-controller basis, right?  If so, why is
> > > this all in the sound driver?
> > 
> 
> Currently, this interface is only for USB audio. USB information is that is
> has in the xhci host driver.
> When USB audio is connected, F/W of audio core performs the control of USB
> host for low power.

But that's not how these hooks are being created, you need to properly
handle any USB bus type.  As-is these will not work correctly.

> > Also, your api is making a lot of assumptions about the running system,
> > there seems to not be any way to always "know" what bus/device the
> > callbacks are being used for in many places.
> 
> This is only used in limited scenarios. And the information of USB host get
> through from exynos_usb_audio driver.

But that's not what these hooks show.

Again, please publish all of the code, we can not just add random kernel
hooks (that aren't even correct), without having a user of the code.

Would you want to have to maintain such a system?

> > Why not just add the needed functionality to the sound driver itself
> > instead of trying to rely on these odd "callbacks"?
> 
> Audio core operates in F/W and is module.
> Because there are many connected modules, it is cannot on built-in and
> module to implement the non-callbacks

I do not understand, sorry.  Perhaps the code that uses the hooks would
better explain this.

thanks,

greg k-h

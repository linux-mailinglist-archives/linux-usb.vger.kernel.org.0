Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B661214D672
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2020 07:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgA3GeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 01:34:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:54002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgA3GeG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jan 2020 01:34:06 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F67420707;
        Thu, 30 Jan 2020 06:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580366045;
        bh=767Wiye4mKvLlTJNrl4itVPQCJYPkxOxoRtmVbI43IE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GAoh0lqn7+37aP0BSP1IFRW90WNwcfq67J3Jof7oFCh8ICp24ImbvmEgaGKXJiNzr
         mVrj87oKFpgr9IhxfFWYoJTraM+i2uJdpIaO7rXsSlVd0M6PlEb23Dnjf/9bQI316B
         AqboVFpvWh8Lqev5u3fjhnJGZI4KCvNqwXmKuGnU=
Date:   Thu, 30 Jan 2020 07:34:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Richard Dodd <richard.o.dodd@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Usb midi device does not work on wake
Message-ID: <20200130063403.GB628384@kroah.com>
References: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
 <1578907421.2590.2.camel@suse.com>
 <CAAWug1eZiDgMGH9qDi=_Cj_=-HU2icVpNCzeaRYJLzQBChJDJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAWug1eZiDgMGH9qDi=_Cj_=-HU2icVpNCzeaRYJLzQBChJDJA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 29, 2020 at 03:47:29PM +0000, Richard Dodd wrote:
> On Mon, Jan 13, 2020 at 9:40 AM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > Am Sonntag, den 12.01.2020, 12:06 +0000 schrieb Richard Dodd:
> > > Hello
> > >
> > > I've got a Novation midi-over-usb device (LaunchControl XL) that works
> > > correctly on boot, but remains in power-off mode when waking from
> > > sleep.
> > >
> > > I suspect that there is some sort of initialisation that needs to be
> > > applied. Could anyone suggest possible causes, or point me in the
> > > direction of the relevant source code. I found `sound/usb/quirks.c`,
> > > which seems to be the place to handle this kind of thing, but there is
> > > no mention of my device anywhere in the source tree at present
> > > (1235:0061).
> >
> > Hi,
> >
> > some devices need an additional reset. They have the quirk RESET_RESUME
> > in that file. Try adding your device to that list and recompile your
> > kernel.
> >
> >         HTH
> >                 Oliver
> >
> 
> Hi
> 
> I found the list you are talking about in `drivers/usb/core/quirks.c`,
> and when I patched it, my device correctly woke up after suspend. :)
> 
> Can I upstream the patch by posting it here. The patch is attached to
> this email.

Can you please resend this in the format described in the documentation
so that we can apply it to the tree?

thanks,

greg k-h

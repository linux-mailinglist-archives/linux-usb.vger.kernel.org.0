Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D880B362D8
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 19:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfFERjG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 13:39:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbfFERjG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 13:39:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F04520717;
        Wed,  5 Jun 2019 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559756345;
        bh=UKix3GmYdW5W+ygZcNaVVXHDiBd3KXs3Qr9IdIEipLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWntEIUEeFG1AYv+Qr/XZHHJl/p0ZIWTDKhE5Z4MoYdNHDTUQjCVkHgQl8l6cXEei
         tiXo3TsPn4VjP60u9Vo+5ODOex/knTM8e83J9eYgEiPgLAz7f6/VT/zMa9YuMYThIJ
         U6Y3mCyaYXp3vFpZiHj5yTfaqbvpNWyimT/F2dpo=
Date:   Wed, 5 Jun 2019 19:39:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: Slow I/O on USB media
Message-ID: <20190605173902.GE27700@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
 <20190530132522.GA21005@kroah.com>
 <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
 <20190604054300.GE1588@kroah.com>
 <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
 <20190605145525.GA28819@kroah.com>
 <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
 <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> Hi,
> Il giorno mer, 05/06/2019 alle 16.55 +0200, Greg KH ha scritto:
> > On Wed, Jun 05, 2019 at 09:36:04AM +0200, Andrea Vai wrote:
> > > Hi,
> > > Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> > > > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha
> > scritto:
> > > > > > [...]
> > > > > Hi,
> > > > > 
> > > > > > Any chance you can use 'git bisect' to find the offending
> > > > commit?
> > > > > Yes, I am doing it as I managed to build the kernel from
> > source
> > > > 
> > > > Great!  What did you find?
> > > 
> > > # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> > > drm/atomic: Use explicit old crtc state in
> > > drm_atomic_add_affected_planes()
> > > 
> > > By the way, as I am not expert, is there a way to double-check
> > that I
> > > bisected correctly? (such as, e.g., test with the version before
> > this
> > > one, and then with this commit applied?)
> > 
> > How exactly are you "testing" this?
> > 
> > I would recommend a script that does something like:
> >       mount the disk somewhere
> >       copy a big file to it
> >       unmount the disk
> > 
> > testing how long the whole process takes, especially the 'unmount'
> > is
> > important.  Are you doing that?
> 
> Well, not exactly, and thank you for pointing me out. I am doing the
> job in two ways, from the DE (when I am located at the PC), or in an
> ssh session when I am away. In ssh I manually mount the media, then
> run
> 
> touch begin
> date
> <cp command>
> date
> touch end

That tests nothing other than the size of the memory in your system :(

You have to flush the data out to the device fully in order to properly
measure device throughput.  Calling 'touch' does not do that.

> If I use the DE (where the media is mounted automatically) I used to
> "eject" the media after the copy finished, and took note of the time
> used until the media was correctly "ejected" (and, so, unmounted).

eject/unmount is good.

> Anyway, I know that I can do all of this in a better way, and will let
> you know.

Yes, please do so, your steps above do not show much.

And you need to get your auto-mount out of the way, as who knows what
options your device is being mounted with (i.e. sync or no sync).  You
have to control that yourself in order to be sure.

thanks,

greg k-h

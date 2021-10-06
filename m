Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125194238FC
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 09:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237389AbhJFHf7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 03:35:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:45176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237384AbhJFHf6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Oct 2021 03:35:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DEDE6115A;
        Wed,  6 Oct 2021 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633505646;
        bh=I0wW/KB424BErSNIoPaQJ4tfMgq/mRZWwckR5msycH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bf5FJbDhMuyRRnuvFlNdqbcgYwt1P2WPJThhkTwesq/33amEmNf+zrg9a0UaXgYWE
         nir22agDpKOxZLgbK4Hcn1kEfuEutx0gz9oNwlcGRnhwvSbQl8o066sq5nK4f2wRvi
         xOWSevv+ppFi8DxQ0yz9J99Z4O3Pq6JDxn6wCtz0=
Date:   Wed, 6 Oct 2021 09:34:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: u_audio.c: Adding Playback Pitch ctl for
 sync playback
Message-ID: <YV1RazARcBrgv5bJ@kroah.com>
References: <20210925143003.12476-1-pavel.hofman@ivitera.com>
 <YVw3e1zOS2QvKiM0@kroah.com>
 <cbd8d9cc-df7b-1990-4ff4-8f2b2a30f846@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd8d9cc-df7b-1990-4ff4-8f2b2a30f846@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 06, 2021 at 08:43:08AM +0200, Pavel Hofman wrote:
> 
> Dne 05. 10. 21 v 13:31 Greg KH napsal(a):
> > On Sat, Sep 25, 2021 at 04:30:03PM +0200, Pavel Hofman wrote:
> > > EP IN is hard-coded as ASYNC both in f_uac1 and f_uac2 but u_audio sends
> > > steady number of audio frames in each USB packet, without any control.
> > > 
> > > This patch adds 'Playback Pitch 1000000' ctl analogous to the existing
> > > 'Capture Pitch 1000000' ctl. The calculation of playback req->length in
> > > u_audio_iso_complete respects the Playback Pitch ctl value to 1ppm now.
> > > 
> > > Max. value for Playback Pitch is configured by the existing parameter
> > > uac2_opts->fb_max, used also for the Capture Pitch.
> > > 
> > > Since the EP IN packet size can be increased by uac2_opts->fb_max now,
> > > maxPacketSize for the playback direction is calculated by the same
> > > algorithm as for the async capture direction in
> > > f_uac2.c:set_ep_max_packet_size.
> > > 
> > > Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> > > ---
> > >   drivers/usb/gadget/function/f_uac2.c  |  5 +-
> > >   drivers/usb/gadget/function/u_audio.c | 93 ++++++++++++++++++++-------
> > >   2 files changed, 74 insertions(+), 24 deletions(-)
> > 
> > Does not apply to my tree, what kernel release / branch did you make
> > this against?
> > 
> 
> Greg, the patch requires patch 0560c9c ("usb: gadget: f_uac2: fixed EP-IN
> wMaxPacketSize") which I sent prior to this one (not as a patch series, this
> patch was not ready at that time). You applied 0560c9c to your usb-linus
> yesterday, hence this patch applies cleanly to usb-linus now.
> 
> Your branch usb-next does not have 0560c9c yet, therefore the patch fails.
> But both patches apply cleanly to usb-next as a series, tested just now.
> 
> This patch ("usb: gadget: u_audio.c: Adding Playback Pitch ctl for sync
> playback") is not a bugfix and can wait in usb-next.
> 
> That goes back to my question of what are the rules for the two of your
> branches. What if a new patch requires patches from both usb-linus (bugfix)
> and usb-next (new features)?

I have 2 branches (well 3) in my tree:
	master - tracks Linus's tree
	usb-linus - patches to go to Linus for "this" release
	usb-next - patches to go to Linus for the "next" release


So bugfixes go into usb-linus, and new features go into usb-next.

After the patches in usb-linus get merged into Linus, I merge that
branch (well Linus's -rc release) into the usb-next branch so that
dependencies can get resolved and bugfixes show up for testing.

If you have patches like this that rely on one, I need to know that
otherwise problems can happen, as you can see here.  Please just resend
this after it hits usb-next, or tell me and I will wait until that
happens myself.

does this help?

thanks,

greg k-h

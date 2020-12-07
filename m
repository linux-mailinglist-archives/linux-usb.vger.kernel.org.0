Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40ACF2D0D53
	for <lists+linux-usb@lfdr.de>; Mon,  7 Dec 2020 10:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgLGJqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Dec 2020 04:46:47 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33165 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgLGJqq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Dec 2020 04:46:46 -0500
Received: by mail-lj1-f194.google.com with SMTP id t22so14293620ljk.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Dec 2020 01:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0zD1sO37rr+bZNiMUC7R1ntdMBMWzywfJiiIbhVf9KA=;
        b=QWxpdXRLoJ2QvFss0FWnPLXIm2vx1O2HI3McIaxzf9lmj8dZcMXP51wl4yPmcnPYFo
         Lho5dtM9AkNwhMxO3mTd3d46BBJ0qM4o5QUnDVmOIFzhATyB3O3tqGBtTpNthiwF5hDb
         yAQFkmd3ff+NwJY/sJuMUmkgt+uGZ0XMoUxF1/2JhpdU/pukrvM0bCbXgQ3jgGe7wX4n
         WtdEy9tTZKINMwY+U5muCRswUPAuAzR+qWsjfRWv5P3jCt+uY0ALO1jrAvmdP93NOjRK
         BW/1C8wwwWl1oskI4CbajiDlPqycoVIacXEAtHAGBJnsG2mZTvMtmOHECPj+kzTvWKHk
         hX4A==
X-Gm-Message-State: AOAM530XFtEXTqjMRQ8m6GOZrzaTxyE+WHd5yrxVMT5bYtDGiwc1ZE6O
        G9NlWFa+5Aa4g3CmgIYeUyA+s8LjvRHj/A==
X-Google-Smtp-Source: ABdhPJy8FyaSX7jH4zoltNGT9j8LG0JL/q8ZujslufaD8iLnweRrSypzj4Cz92DQG5XbUXQ2PhnqeA==
X-Received: by 2002:a2e:a17c:: with SMTP id u28mr8398289ljl.453.1607334363898;
        Mon, 07 Dec 2020 01:46:03 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z13sm2031256lfs.214.2020.12.07.01.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 01:46:03 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmD6M-0000zz-7V; Mon, 07 Dec 2020 10:46:38 +0100
Date:   Mon, 7 Dec 2020 10:46:38 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [PATCH 1/3] USB: core: drop pipe-type check from new
 control-message helpers
Message-ID: <X835/tzDMj6772Qa@localhost>
References: <20201204085110.20055-1-johan@kernel.org>
 <20201204085110.20055-2-johan@kernel.org>
 <X8pSSqQenF8sytJg@kroah.com>
 <X8paua9wKFSb+DPz@localhost>
 <X8y+eFcjuZdk9cRe@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8y+eFcjuZdk9cRe@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 06, 2020 at 12:20:24PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 04, 2020 at 04:50:17PM +0100, Johan Hovold wrote:
> > On Fri, Dec 04, 2020 at 04:14:18PM +0100, Greg Kroah-Hartman wrote:
> > > On Fri, Dec 04, 2020 at 09:51:08AM +0100, Johan Hovold wrote:
> > > > The new control-message helpers include a pipe-type check which is
> > > > almost completely redundant.
> > > > 
> > > > Control messages are generally sent to the default pipe which always
> > > > exists and is of the correct type since its endpoint representation is
> > > > created by USB core as part of enumeration for all devices.
> > > > 
> > > > There is currently only one instance of a driver in the tree which use
> > > > a control endpoint other than endpoint 0 (and it does not use the new
> > > > helpers).
> > > > 
> > > > Drivers should be testing for the existence of their resources at probe
> > > > rather than at runtime, but to catch drivers failing to do so USB core
> > > > already does a sanity check on URB submission and triggers a WARN().
> > > > Having the same sanity check done in the helper only suppresses the
> > > > warning without allowing us to find and fix the drivers.
> > > 
> > > The issue is "bad" devices.  syzbot fuzzed the USB sound drivers with
> > > stuff like this and found a bunch of problems, which is where this check
> > > originally came from.  While it is nice to "warn" people, that keeps
> > > moving forward and then the driver tries to submit an urb for this
> > > endpoint and things blow up.  Or throw more warnings, I can't remember.
> > 
> > Nothing blows up, it's just a reminder to fix the driver which I don't
> > think we should suppress.
> > 
> > I looked at the sound driver changes for this a while back it has the
> > same "problem" in that it uses a too big hammer for something that's not
> > an issue.
> 
> Then what about the syzbot issues found?  They didn't seem to be
> "caught" by any usb core changes, which is why they were added to the
> sound driver.
> 
> Or am I mis-remembering this?

The big hammer I was referring to is the commit adding the
snd_usb_pipe_sanity_check() helper to sound:

	801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and
	EP types")

It adds a sanity check like the one you included in the new
control-message helper to the corresponding wrappers in sounds, but also
to some individual drivers using usb_control_msg() or
usb_interrupt_msg() directly.

Those checks that were added for ep0 are completely unnecessary since
the WARN_ON in usb_submit_urb() will *never* trigger on such requests.

The checks added for endpoints other than ep0 were the ones that syzbot
could potentially hit and typically involved usb_interrupt_msg(). By
silently bailing out before submitting the URB, well you suppress that
warning, but you don't really fix the driver.
 
> > The sanity check in sound was only "needed" in cases where drivers where
> > issuing synchronous requests for endpoints other than ep0 and the
> > drivers never verified the type of the endpoint before submitting
> > thereby hitting the WARN() in usb_submit_urb().
> 
> Ok, but we still have to check for that somewhere, right?

Not for ep0, no.

For other endpoints there should be a check in probe() so that we don't
pretend to support a driver only to silently fail in some subroutine at
some later point when trying to use the device.

> > That has never been an issue for ep0 since it is created by USB core and
> > by definition is of control type (i.e. regardless of the device
> > descriptors).
> > 
> > By silently refusing to submit, we even risk breaking drivers which can
> > use either an interrupt or bulk endpoint depending on the firmware (we
> > have a few drivers supporting such devices already).
> 
> I don't understand this, sorry.

I was referring to the kind of checks added to for example the sound
drivers for endpoints other than ep0 where snd_usb_pipe_sanity_check()
was called before usb_interrupt_msg() *only* to suppress the WARN_ON()
in usb_submit_urb().

That could potentially silently break a working driver and such checks
would be better to do once at probe, rather than at every submission.

> > > So I'd like to keep this check here if at all possible, to ensure we
> > > don't have to fix those "bugs" again, it's not hurting anything here, is
> > > it?
> > 
> > But for this function which creates a control pipe it will by definition
> > never be an issue unless it is used with a control endpoint other than
> > ep0. And there are basically no such devices/drivers around; there is
> > only a single such usb_control_msg() in the entire kernel tree. (I can
> > add sanity check to its probe function.)
> > 
> > So specifically there's nothing for syzbot to trigger here, and having
> > the check in place for control transfers and ep0 is more confusing than
> > helpful.
> 
> My worry is that we will trigger the issues found by syzbot again, if
> this is removed.  If that check is also somewhere else, that's fine to
> remove these, but I'm confused as to if that is the case here or not.

I guarantee you that syzbot cannot trigger anything again from removing
the pipe-type checks from the new helpers.

Such a check is only useful for endpoints other than ep0, but then they
should preferably be done once at probe time.

Johan

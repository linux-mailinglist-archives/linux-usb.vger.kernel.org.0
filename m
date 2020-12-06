Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7B02D0486
	for <lists+linux-usb@lfdr.de>; Sun,  6 Dec 2020 12:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgLFLqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Dec 2020 06:46:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:46780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729639AbgLFLqU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 6 Dec 2020 06:46:20 -0500
Date:   Sun, 6 Dec 2020 12:20:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607255139;
        bh=GPR/4dXW9A6pb950Xpiqt8Rrho+FS30Nf22SLi0DlFQ=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=raaHT0qOOomQAqG2PNoV3Hgtd17z8octVnQ3XpY512MtrFba9yYg2cQHxbsx3I5DK
         4Gg77T8uyIcftWoE5ALmCbxITqOoyY/1J72iS8InhTuMt1/1LcDB86edrseL84TR5m
         w0vcaUyBHniZPBvtLHWNYXXLcDOauRO50InsRt2w=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [PATCH 1/3] USB: core: drop pipe-type check from new
 control-message helpers
Message-ID: <X8y+eFcjuZdk9cRe@kroah.com>
References: <20201204085110.20055-1-johan@kernel.org>
 <20201204085110.20055-2-johan@kernel.org>
 <X8pSSqQenF8sytJg@kroah.com>
 <X8paua9wKFSb+DPz@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8paua9wKFSb+DPz@localhost>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 04:50:17PM +0100, Johan Hovold wrote:
> On Fri, Dec 04, 2020 at 04:14:18PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Dec 04, 2020 at 09:51:08AM +0100, Johan Hovold wrote:
> > > The new control-message helpers include a pipe-type check which is
> > > almost completely redundant.
> > > 
> > > Control messages are generally sent to the default pipe which always
> > > exists and is of the correct type since its endpoint representation is
> > > created by USB core as part of enumeration for all devices.
> > > 
> > > There is currently only one instance of a driver in the tree which use
> > > a control endpoint other than endpoint 0 (and it does not use the new
> > > helpers).
> > > 
> > > Drivers should be testing for the existence of their resources at probe
> > > rather than at runtime, but to catch drivers failing to do so USB core
> > > already does a sanity check on URB submission and triggers a WARN().
> > > Having the same sanity check done in the helper only suppresses the
> > > warning without allowing us to find and fix the drivers.
> > 
> > The issue is "bad" devices.  syzbot fuzzed the USB sound drivers with
> > stuff like this and found a bunch of problems, which is where this check
> > originally came from.  While it is nice to "warn" people, that keeps
> > moving forward and then the driver tries to submit an urb for this
> > endpoint and things blow up.  Or throw more warnings, I can't remember.
> 
> Nothing blows up, it's just a reminder to fix the driver which I don't
> think we should suppress.
> 
> I looked at the sound driver changes for this a while back it has the
> same "problem" in that it uses a too big hammer for something that's not
> an issue.

Then what about the syzbot issues found?  They didn't seem to be
"caught" by any usb core changes, which is why they were added to the
sound driver.

Or am I mis-remembering this?

> The sanity check in sound was only "needed" in cases where drivers where
> issuing synchronous requests for endpoints other than ep0 and the
> drivers never verified the type of the endpoint before submitting
> thereby hitting the WARN() in usb_submit_urb().

Ok, but we still have to check for that somewhere, right?

> That has never been an issue for ep0 since it is created by USB core and
> by definition is of control type (i.e. regardless of the device
> descriptors).
> 
> By silently refusing to submit, we even risk breaking drivers which can
> use either an interrupt or bulk endpoint depending on the firmware (we
> have a few drivers supporting such devices already).

I don't understand this, sorry.

> > So I'd like to keep this check here if at all possible, to ensure we
> > don't have to fix those "bugs" again, it's not hurting anything here, is
> > it?
> 
> But for this function which creates a control pipe it will by definition
> never be an issue unless it is used with a control endpoint other than
> ep0. And there are basically no such devices/drivers around; there is
> only a single such usb_control_msg() in the entire kernel tree. (I can
> add sanity check to its probe function.)
> 
> So specifically there's nothing for syzbot to trigger here, and having
> the check in place for control transfers and ep0 is more confusing than
> helpful.

My worry is that we will trigger the issues found by syzbot again, if
this is removed.  If that check is also somewhere else, that's fine to
remove these, but I'm confused as to if that is the case here or not.

thanks,

greg k-h

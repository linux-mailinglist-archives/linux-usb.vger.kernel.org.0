Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CE92CF13A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 16:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgLDPu1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 10:50:27 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32882 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgLDPu1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 10:50:27 -0500
Received: by mail-lj1-f194.google.com with SMTP id t22so7161655ljk.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 07:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N8D5VwXUsDN4nPYhFMFgjo1Jh9C5deRR+3Vxg8A75Wo=;
        b=aVdPJrUdwzmNUYSxlnIJvyH1jx9lSliOxiS0Ts1xGZEOgWzvcKDVgJwsfQ57npmOTJ
         wqd7TbED4EolLKFyu93iJrdHoDEhwq9o+ac2SjSFH+/iQwF2HpOivifN65n6eWoR4E3L
         dQcubopCm7JJsfYHT7ervpNntY2sUojdZsZxXDWbKw+GL2H6089nUFWj3JnJgPoREn/l
         chnNFFZB0c0aIdZ9J3pjFc8szTNXpPY4QoZ8DJyqBm0m2O4xsH166r+d/UY2RNcMBPmo
         syIHb1JUT0+/w3hOtqYVJIe5SENo7/bPN9nmh/iMSF1TWW+7rMAPdr0Nm8T/cMsc0Vy2
         f3sA==
X-Gm-Message-State: AOAM531TaNbdTmHRk3l0/jvkB5tsphyzmmubCLKKoe0NQRxnPJLc3UU5
        v0UgJXarbLGeWZfUWqu3poU=
X-Google-Smtp-Source: ABdhPJwQWUF4opbPJczDFTi3ipmDNee93tEEp11vWPuQaBB6ghesAc/wzMSz6tRhf0WfilpqaDaFjA==
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr3928913ljj.48.1607096984626;
        Fri, 04 Dec 2020 07:49:44 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k11sm1836784lfj.170.2020.12.04.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 07:49:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1klDLd-0005YE-JO; Fri, 04 Dec 2020 16:50:18 +0100
Date:   Fri, 4 Dec 2020 16:50:17 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [PATCH 1/3] USB: core: drop pipe-type check from new
 control-message helpers
Message-ID: <X8paua9wKFSb+DPz@localhost>
References: <20201204085110.20055-1-johan@kernel.org>
 <20201204085110.20055-2-johan@kernel.org>
 <X8pSSqQenF8sytJg@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8pSSqQenF8sytJg@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 04:14:18PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 04, 2020 at 09:51:08AM +0100, Johan Hovold wrote:
> > The new control-message helpers include a pipe-type check which is
> > almost completely redundant.
> > 
> > Control messages are generally sent to the default pipe which always
> > exists and is of the correct type since its endpoint representation is
> > created by USB core as part of enumeration for all devices.
> > 
> > There is currently only one instance of a driver in the tree which use
> > a control endpoint other than endpoint 0 (and it does not use the new
> > helpers).
> > 
> > Drivers should be testing for the existence of their resources at probe
> > rather than at runtime, but to catch drivers failing to do so USB core
> > already does a sanity check on URB submission and triggers a WARN().
> > Having the same sanity check done in the helper only suppresses the
> > warning without allowing us to find and fix the drivers.
> 
> The issue is "bad" devices.  syzbot fuzzed the USB sound drivers with
> stuff like this and found a bunch of problems, which is where this check
> originally came from.  While it is nice to "warn" people, that keeps
> moving forward and then the driver tries to submit an urb for this
> endpoint and things blow up.  Or throw more warnings, I can't remember.

Nothing blows up, it's just a reminder to fix the driver which I don't
think we should suppress.

I looked at the sound driver changes for this a while back it has the
same "problem" in that it uses a too big hammer for something that's not
an issue.

The sanity check in sound was only "needed" in cases where drivers where
issuing synchronous requests for endpoints other than ep0 and the
drivers never verified the type of the endpoint before submitting
thereby hitting the WARN() in usb_submit_urb().

That has never been an issue for ep0 since it is created by USB core and
by definition is of control type (i.e. regardless of the device
descriptors).

By silently refusing to submit, we even risk breaking drivers which can
use either an interrupt or bulk endpoint depending on the firmware (we
have a few drivers supporting such devices already).

> So I'd like to keep this check here if at all possible, to ensure we
> don't have to fix those "bugs" again, it's not hurting anything here, is
> it?

But for this function which creates a control pipe it will by definition
never be an issue unless it is used with a control endpoint other than
ep0. And there are basically no such devices/drivers around; there is
only a single such usb_control_msg() in the entire kernel tree. (I can
add sanity check to its probe function.)

So specifically there's nothing for syzbot to trigger here, and having
the check in place for control transfers and ep0 is more confusing than
helpful.

Johan

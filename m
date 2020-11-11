Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07742AEA53
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 08:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgKKHuB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 02:50:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:54396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgKKHuB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 02:50:01 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 767262072C;
        Wed, 11 Nov 2020 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605081000;
        bh=b1D63emCe62YsWyIwGooDXckAR+BvM/Vb11aWEL6sf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RDbvs7kkjzIeUoDdRYtpPJG465oG0N3qJErc2MlHdC+gcCv2bckH4e6sLHK1q/XY3
         m156vNuNiAp3Qdiop31erD3IkIX0MKxhfb/YKeHPZQquIoCgS5VCuR650aZ91626ev
         EW59IksYqjXp3ZvtEAT11UpB30D2aIDjUeO1w3Lo=
Date:   Wed, 11 Nov 2020 08:51:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <X6uX5IOhb2Pozbuq@kroah.com>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 10, 2020 at 06:42:17PM -0500, Alberto Sentieri wrote:
> 1) The current Ubuntu Kernel is 5.4.0-53. Do you want me to upgrade it to
> 5.9, from kernel.org? Or is there a Ubuntu 5.9 package that I can use? It
> would be easy to do it If there is a Ubuntu package with 5.9, which I would
> install and, after the tests, uninstall.

There might be a Ubuntu package, we don't know.

The issue is that the Ubuntu kernel you are using is an old one, and we
(the community) have no idea what is in there.  We can help you if you
use a kernel.org release, otherwise you really should get support from
Ubuntu as you are relying on them for this type of thing (and probably
paying them for support as you are using it in a corporate setting and
relying on it, right?)

> 2) Why do you believe that 5.9 would solve the problem? I am asking that
> because I cannot change the production machine for a test if I cannot go
> back to the original state. There is always a risk involved.

You should always be able to choose a different kernel version at boot
time, no need to ever get rid of your older one in case something goes
wrong.

There has been lots of changes in the past year of kernel development,
as always, from 5.4 to 5.9, so something that we did then might have
resolved this.  Maybe not, but we don't know if you can't try as to try
to remember what we did a year ago is hard, as I am sure you can imagine
:)

> 3) It is one single thread dealing with all 36 devices. Each device has its
> own co-routine (not preemptive), but all co-routines are executed by a
> unique thread.

Are you sure that these threads are not just getting stalled somehow
when a response doesn't come back properly and are not timing out, which
your userspace co-routines should be doing if the bus stalls, right?

One thing to note, USB hubs are almost never tested with that many
devices at once, so you might have to upgrade to one that says it really
will work with that many devices, and provide enough power to them.  We
have seen more low-power issues on USB hubs and connections over the
years to know that this is a real issue, and one that the OS can't do
much about, but can affect it.

> 4) By network console, do you mean ssh? It dies as well when it locks. The
> screen is the regular GNOME3 screen and nothing can be seen there. Every
> time it locks they send a picture, and I cannot see anything meaningful
> there. I am thinking about disabling GNOME3, but I need their blessing for
> that.

No, netconsole is something else, see the kernel documentation for the
full details.

thanks,

greg k-h

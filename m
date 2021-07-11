Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB763C3B8C
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 12:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhGKKlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 06:41:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:38290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231183AbhGKKlB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 11 Jul 2021 06:41:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B394611CC;
        Sun, 11 Jul 2021 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625999894;
        bh=4FIZAvhUkan8OkE7ZmQ6ux5LG0j3nTDdj+zX4Mlp1Y4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u8O/JyPPKC1w1nctIkSvKmjzFVVA4yY+WjgZ3tvjop8htkEBZ8VSD5W6FE/5sPHkA
         DsA2tJ1bTgqSIDITdvsdkaWiwHjU6eTPqJmihXsYAtQDcoUOUXWBMzsza1QYuY1e8F
         ClBusFSuxKsU9gQjqgr84lohkDDqW+zPQFv6dPLc=
Date:   Sun, 11 Jul 2021 12:38:12 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tristan Miller <psychonaut@nothingisreal.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: "Chipmunk audio" on Logitech USB webcams
Message-ID: <YOrKFIlEHopiVKJT@kroah.com>
References: <20210711102503.179b154b.psychonaut@nothingisreal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210711102503.179b154b.psychonaut@nothingisreal.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 11, 2021 at 10:25:03AM +0200, Tristan Miller wrote:
> Greetings.
> 
> Many models of Logitech USB webcams malfunction under Linux by producing
> audio that sounds distorted, garbled, or high-pitched. For most users,
> the problem happens randomly, and can usually be worked around by
> restarting the audio application or by unplugging the webcam and then
> plugging it back in again.
> 
> The problem is described in a kernel.org bug at
> <https://bugzilla.kernel.org/show_bug.cgi?id=44281>. Despite eight
> years' worth of comments and duplicate bugs indicating that that the
> problem is still occurring, this report has remained closed as
> "resolved" since 2013. It's unclear whether any of the right developers
> have even seen these comments; certainly none of them have ever
> responded, even just to reopen the bug. A comment on one of the
> duplicate bugs <https://bugzilla.kernel.org/show_bug.cgi?id=203763#c1>
> suggests that this may be because the bug was misfiled in the
> v4l-dvb/webcam product, whereas it should instead have been posted to
> this mailing list.
> 
> I'd appreciate it if one of the USB for Linux developers could take a
> quick look at the bug report to confirm whether it's been filed in the
> right place.  If not, please let us know (either here or in Bugzilla)
> where the bug should be reported instead, and if it is indeed here on
> linux-usb, let us know if any further diagnostic information is
> required.

Please report the information directly here, to this list, and to the
sound developers at alsa-devel@alsa-project.org and we can all work to
resolve this.

First off it would be great to test if this happens in 5.13, does it?
And how can you reproduce it and with what specific device?

thanks,

greg k-h

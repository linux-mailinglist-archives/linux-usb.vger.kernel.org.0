Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4436591E
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 16:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbfGKOgO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 10:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:38012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbfGKOgN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 10:36:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E97121019;
        Thu, 11 Jul 2019 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562855773;
        bh=n7p1j3OLenF1OkiBLupCAuR2ptmIcxfFoBAArv7yQZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hgK1KT1n1aP/JPxQcy2J1JG4iL83QI1wZIsS4rTTPzrWNkyfPZa3hxThJmeFJo/4R
         o6FVKlXsVdN5Hh68OBPCZJt6FlkaZCGXnu0A4UuLBX+3a4xUdsDoHU+TXEhh/6rxS7
         yhsBqeR031byZk8enrbMLULT301nY6zTf7Ly+DU0=
Date:   Thu, 11 Jul 2019 16:36:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usbfs: Add ioctls for runtime suspend and resume
Message-ID: <20190711143610.GA26778@kroah.com>
References: <1562836586.4259.6.camel@opensource.cirrus.com>
 <Pine.LNX.4.44L0.1907111013400.2503-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1907111013400.2503-100000@netrider.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 11, 2019 at 10:20:10AM -0400, Alan Stern wrote:
> Also, the last I looked, Android was using version 4.9 of the kernel.  
> Since this patch won't get into the kernel until version 5.4 at the
> earliest, it may be quite a while before it shows up in Android.

Android does not "use" a specific version of the kernel, they only
specify the "minimum kernel version" for a specific Android release.

As an example, for Android Q, they require the 4.9 kernel as a minimum,
and they have a specific LTS version as well, with updates required over
time as well.

That being said, you can always use a newer kernel version for Android,
and they publish 4.14 and 4.19 kernel trees if you wish to use them, as
well as they have a "mainline" branch that is now at 5.2 for companies
that want to use those kernels.

But for new features, like this one, you will need Android userspace
changes to start relying on the kernel change, so that will take a bit
of work, and by then the new kernel feature could have been backported
as well if it is something they want to rely on.

So yes, it would be at least a year before it showed up in Android given
they do a release on a yearly cadence.

thanks,

greg k-h

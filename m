Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F198E28581C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 07:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgJGFWz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 01:22:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgJGFWy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Oct 2020 01:22:54 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5519720B1F;
        Wed,  7 Oct 2020 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602048172;
        bh=mQ4OBvHHVxi9Cmqmaui+les7s/4m9yZpRWGhkHp46Ew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1SndXToSiEEWsmRYCcEXWRcR0KDbqNU5aHVBVTbc6wGqe7F1Q/WV/IJm30DQIPKc6
         Zx88eANa0GOs5bqTYM658czsxv8pJIJn5m/iEi5SQLDsB6PZr0VmvoOHmG4j9HhK4Y
         9vn5KZZeVmiIa7aFIXWde8w+PIceYpId2ataQkLM=
Date:   Wed, 7 Oct 2020 07:22:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Landley <rob@landley.net>
Cc:     linux-usb@vger.kernel.org, "D. Jeff Dionne" <jeff@coresemi.io>,
        johan@kernel.org
Subject: Re: USB panic on one machine, hang on another.
Message-ID: <20201007052250.GA48615@kroah.com>
References: <6A0F5F09-112C-4BB0-9ECF-16395A9D27F1@coresemi.io>
 <fdae51af-8f0a-f9c6-2dfa-d6ecade04128@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdae51af-8f0a-f9c6-2dfa-d6ecade04128@landley.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 06, 2020 at 11:56:16PM -0500, Rob Landley wrote:
> We've been implementing a new USB device (starting by adapting the Joris example
> CDC-ACM VHDL to a new I/O chip, although we're more interested in EEM), and
> attempting to talk to the result makes Linux VERY unhappy.
> 
> On one machine it panics the kernel, on another it makes the USB subsystem fork
> off multiple kernel threads stuck eating 100% CPU until a reboot, and also not
> notice when we physically unplug the device afterwards.
> 
> I'm aware our device is wrong (haven't figured out HOW it's wrong yet), but...
> Linux's USB stack should not be doing that? MacOS instead times something out
> and disables the device. (Which again doesn't help us debug it, but at least
> doesn't require a reboot afterwards.)
> 
> We finally got a good packet capture, alas from a windows GUI tool we had to
> take screenshots of, which totals 6 megabytes so I threw the files in a
> temporary directory on my web server. (I apologize in advance for dreamhost:
> it's cheap.)
> 
>   https://landley.net/isb_usb_weallsb
> 
> Here are two emails about it, the first is an earlier message with the kernel
> panic dump and the second is yesterday's packet capture. Does anybody understand
> what's going on here?

5.3.0 is pretty old, we have fixed a number of issues like this in newer
kernels (or at the very least, the stable kernel trees).  So if you
could test there, that would be great.

Also, do you have the output of 'lsusb -v' of your device?  Perhaps your
descriptors are incorrect?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC5A35FAE
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 16:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfFEOz3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 10:55:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:55014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728303AbfFEOz3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 10:55:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FF5A206B8;
        Wed,  5 Jun 2019 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559746528;
        bh=LRZ30IPa6Nv2lRdKaHOKDLX7XyAGFKonVvxxNwqLT8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LZjO9Ux7yVL3s4+u/DYaZJ071X99d49oJqAwPpf1DIP7AEvq3kIhoclG36/XlpMR/
         N0JPdQobFdyr3K8aMQ74zoGuG3XXzIlRA2lKp2BQ9YIEFoelZuokv4i1Ul20HwVba5
         o7egZ5ZQUqoXV0byy4oo7jIBhRDZolbkqPP3nojE=
Date:   Wed, 5 Jun 2019 16:55:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Slow I/O on USB media
Message-ID: <20190605145525.GA28819@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
 <20190530132522.GA21005@kroah.com>
 <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
 <20190604054300.GE1588@kroah.com>
 <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 09:36:04AM +0200, Andrea Vai wrote:
> Hi,
> Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha scritto:
> > > > [...]
> > > Hi,
> > > 
> > > > Any chance you can use 'git bisect' to find the offending
> > commit?
> > > Yes, I am doing it as I managed to build the kernel from source
> > 
> > Great!  What did you find?
> 
> # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> drm/atomic: Use explicit old crtc state in
> drm_atomic_add_affected_planes()
> 
> By the way, as I am not expert, is there a way to double-check that I
> bisected correctly? (such as, e.g., test with the version before this
> one, and then with this commit applied?)

How exactly are you "testing" this?

I would recommend a script that does something like:
	mount the disk somewhere
	copy a big file to it
	unmount the disk

testing how long the whole process takes, especially the 'unmount' is
important.  Are you doing that?

Also, you should probably just boot into text mode for this, most
graphical DEs like to auto-mount disks these days.

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1375433E85
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 07:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfFDFnE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 01:43:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:33676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfFDFnD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 01:43:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFD432341B;
        Tue,  4 Jun 2019 05:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559626983;
        bh=8SaWfngaEUhjwMF9qU08kz93yf4Xs2GH+ch1M4C2a+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cw3zgi5Q7N2/pGMAsl6Uh7On0szLZK+Kzli/xPZ9RL/VciXqNjVcSsnbdCizDM3Qq
         NwCmhoGP5C/jz8s8h8c3eJhdlfDlpOyxKX1herUz598QWfZHq7Po3MhTDD6aUvhrxI
         OWETEOBmXU9WztPeCYGNiJo4EWrVlUDTNn+5wxto=
Date:   Tue, 4 Jun 2019 07:43:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Slow I/O on USB media
Message-ID: <20190604054300.GE1588@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
 <20190530132522.GA21005@kroah.com>
 <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha scritto:
> > [...]
> Hi,
> 
> > Any chance you can use 'git bisect' to find the offending commit?
> Yes, I am doing it as I managed to build the kernel from source

Great!  What did you find?

> > And did you accidentally turn on "sync" for the filesystem? 
> Sorry, I don't think so but actually I don't know exactly what it is
> nor how to check it...
> 
> >  How do you
> > know the old kernel really flushed the buffers out in 1 minute? 
> 
> I used to try to unmount the usb media (e.g. "eject" using Nautilus
> file manager), and got a message stating the filesystem was in use and
> could not be mounted, so always answered to not eject it until it was
> unmounted without any warning... does it make sense?

That does not mean that the data is not flushed to the device yet, that
just means that some userspace program is still accessing the device.
You need to run some other type of test to validate how long it taks for
the data to get to the device.

> >  But 12
> > minutes is really long, did anything else change in your userspace
> > between the kernel changes as well?
> I am not sure if I understand correctly the "userspace" you mention:
> if you mean my home directory and contents, settings etc, then yes,
> maybe... but while I am doing the tests I am quite sure I didn't
> change anything, and double-checked many times that the 4.20 kernel is
> always working (I usually boot up with it when I need to do the usual
> day work).

I mean, did any other programs on your machine change between the
upgrade of your kernel?  Maybe some gnome-tracker is going off and
indexing all of the data on that device after you mount it, and it
wasn't previously doing that before.  As it is still busy, something has
some open files on that device.

good luck!

greg k-h

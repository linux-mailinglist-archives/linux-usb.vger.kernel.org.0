Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196ACCDFDB
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 13:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfJGLGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 07:06:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbfJGLGh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 07:06:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF4322064A;
        Mon,  7 Oct 2019 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570446396;
        bh=zCznCBIXH114Btrwy4ks+kqvn78t1MXpS7iQXYbOizI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z75oaeO4njI0LWdrcTf0UY7dqEweTwqp/Onq4r5DZTdVO7+bOMkIaXCkgQknieigE
         atDf6sxo5j2qZP3WowWu7DEfn6Ytj6ejJ8tSS5LZEA2rFPW7V8KDP9gfEfNakKeLMv
         6TstAGnNmw59ZVmWkblJMZQ9K71YmpUO55WnmCjk=
Date:   Mon, 7 Oct 2019 13:06:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Harald Welte <laforge@gnumonks.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CREAD ignored by almost all USB serial drivers
Message-ID: <20191007110633.GB614644@kroah.com>
References: <20190928204955.GE4247@nataraja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190928204955.GE4247@nataraja>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 28, 2019 at 10:49:55PM +0200, Harald Welte wrote:
> [Copied on requst from https://bugzilla.kernel.org/show_bug.cgi?id=205033]
> 
> It seems that a lot of Linux kernel USB serial device drivers are
> ignoring the CREAD setting of termios.c_cflag.
> 
> The man page is quite clear:
>        CREAD  Enable receiver.
> 
> The glibc man page at
> https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_chapter/libc_17.html
> states:
> 	"Macro: tcflag_t CREAD
> 	 If this bit is set, input can be read from the terminal.
> 	 Otherwise, input is discarded when it arrives."
> 
> When I mask this bit and then call tcsetattr(), I'm still receiving
> input characters, at least on a pl2303 USB UART.  Looking at the source
> code of drivers/usb/serial/, the *only* driver appearing to respect
> CREAD is digi_acceleport.c.  All others seem to ignore it.  To the
> contrary, most classic serial drivers in drivers/tty/serial seem to
> implement it.
> 
> In absence of low-level support in individual drivers to actually
> disable the receiver in hardware, I would have at least expected the
> core tty/serial layer to drop/discard any characters received by the
> hardware while CREAD is not set.  But that also doesn't appear to be the
> case.
> 
> What's even more worrying is that the tcsetattr() call succeeds, i.e. it
> is a silent error.  I would expect the kernel to either implement the
> functionalty in one way or another, or simply return tcsetattr() with
> an error if an unsupported combination (i.e. CFLAG not set) is
> configured.
> 
> This is not a theoretical issue.  Anyone implementing a half-duplex
> protocol with shared Rx and Tx line will face the same issue.
> 
> Am I missing something here?  Please don't tell me that I just
> discovered something that's broken for some 20-odd years, or at the very
> least as far as normal linux.git history reaches back :/

You just discovered something that has been broken since the first
usb-serial driver was written, all those years ago :)

I did add support for this to the digi driver, as you saw, as the
hardware had support for it.  For everything else, they are all just
dumb uarts and do not expose that information to the host computer and I
think everyone just forgot about this option.

Given that you are the first to report it that I can think of, I don't
think very many people use half-duplex protocols with a shared Rx/Tx
(which is crazy anyway...)

> Please keep me in Cc of any responses, I'm not subscribed to linux-usb.

Is there a specific usb-serial driver that you are using that you want
to have this support added to?

thanks,

greg k-h

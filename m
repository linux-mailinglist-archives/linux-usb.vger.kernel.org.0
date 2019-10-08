Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE54ACFDB3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 17:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfJHPen (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 11:34:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfJHPen (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 11:34:43 -0400
Received: from localhost (unknown [89.205.136.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36DB620659;
        Tue,  8 Oct 2019 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570548882;
        bh=gedyEADQD6OTaLpPmOxw11c2PmKepW1ZUZHpyW+81CA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v6G/e8filNnikPm9i/X3AEUxYaa+5qs4/5DvP9JTyuD5gONpx9zyBjUKYA+7pyOMh
         YRb29Uq+nukmaLZgakoaNH8ks5Qd7D9DZoub3ClEohijdFSbYIQOI0ZXsrug8B9sNy
         QdCdi/tGm9pTwxT57upda6jQmB7zmuz2qrfi4I2g=
Date:   Tue, 8 Oct 2019 17:34:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Harald Welte <laforge@gnumunks.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CREAD ignored by almost all USB serial drivers
Message-ID: <20191008153438.GA2880669@kroah.com>
References: <20190928204955.GE4247@nataraja>
 <20191007110633.GB614644@kroah.com>
 <20191007131852.GN3821@nataraja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007131852.GN3821@nataraja>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 07, 2019 at 03:18:52PM +0200, Harald Welte wrote:
> Hi Greg,
> 
> On Mon, Oct 07, 2019 at 01:06:33PM +0200, Greg KH wrote:
> > On Sat, Sep 28, 2019 at 10:49:55PM +0200, Harald Welte wrote:
> > > It seems that a lot of Linux kernel USB serial device drivers are
> > > ignoring the CREAD setting of termios.c_cflag.
> >
> > You just discovered something that has been broken since the first
> > usb-serial driver was written, all those years ago :)
> 
> Amazing and frightening at the same time.  I would have expected
> somebody had built something like a hardware test fixture to test those
> drivers during all those decades.  Something like a "well-known" serial
> device as the tester, attaching to all the handshake etc. lines of the
> "device under test" and then running through many of the possible
> settings from HW to SW flow control, baud rate, parity, number of stop
> bits, break characters, etc.

I had a tester that was just a loopback device.  Amazing what just a
simple device like that found over time, these things barely work :)

Anyway, yes, a "real" test setup like this would be great to have, I
don't know of one around anywhere, and if you use it, I am sure you will
find lots of issues.  Turns out almost all usb-serial devices are used
for "basic" rx/tx stuff, all of the "fancy" serial things just are not
all that common anymore given that serial is not the primary way data is
transferred anymore.

> I have no shortage of projects to work on, but if somebody else was
> interested to host a physical setup with many different [USB] serial
> ports and some CI around, I might be tempted to build the actual tester
> hardware and some test suite software for it.

Would be nice to see :)

> > I did add support for this to the digi driver, as you saw, as the
> > hardware had support for it.  For everything else, they are all just
> > dumb uarts and do not expose that information to the host computer and I
> > think everyone just forgot about this option.
> 
> I am aware that many USB serial adapters are rather "dumb", hence my suggestion
> to add a related option to the core usb-serial, or even to the core tty/serial
> layer: If the driver doesn't process CREAD, simply discard the received bytes
> at this common/shared layer.

Yes, that could be done in the usb-serial core probably.

> > Given that you are the first to report it that I can think of, I don't
> > think very many people use half-duplex protocols with a shared Rx/Tx
> > (which is crazy anyway...)
> 
> Every smart card interface [1] on this planet, including every SIM card in every
> mobile phone uses such a setup: asynchronous half-duplex communication with
> shared Rx/Tx.  Sure, not many people attach something like that to a USB-Serial
> adapter (as oppose to a USB-CCID reader), but I just wanted to clarify
> it's not as obscure as one may think.  You can actually buy
> ultra-low-cost SIM card readers built that way.
> 
> Also, I would assume that RS-485 is still used in lots of technology,
> including e.g. DMX and industrial control systems.  Unless you go for a
> rather obscure 4-wire RS-485, then you have the same half-duplex
> operation on shared medium.  Please note that USB-RS485 adapters exist,
> using a variety of USB-serial chipsets.

485 just got added to some tty drivers recently, so yes, it is used, but
not all that common it seems.  Or maybe it is and everyone "knows" to
buy the one good device that supports it.

thanks,

greg k-h

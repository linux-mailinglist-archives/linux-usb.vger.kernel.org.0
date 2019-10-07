Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F455CE354
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 15:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfJGNWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 09:22:42 -0400
Received: from ganesha.gnumonks.org ([213.95.27.120]:46611 "EHLO
        ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfJGNWm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 09:22:42 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.89)
        (envelope-from <laforge@gnumonks.org>)
        id 1iHSyG-0006ZO-JG; Mon, 07 Oct 2019 15:22:40 +0200
Received: from laforge by nataraja.lan with local (Exim 4.92.2)
        (envelope-from <laforge@gnumonks.org>)
        id 1iHSua-0006mB-LR; Mon, 07 Oct 2019 15:18:52 +0200
Date:   Mon, 7 Oct 2019 15:18:52 +0200
From:   Harald Welte <laforge@gnumunks.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CREAD ignored by almost all USB serial drivers
Message-ID: <20191007131852.GN3821@nataraja>
References: <20190928204955.GE4247@nataraja>
 <20191007110633.GB614644@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007110633.GB614644@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Mon, Oct 07, 2019 at 01:06:33PM +0200, Greg KH wrote:
> On Sat, Sep 28, 2019 at 10:49:55PM +0200, Harald Welte wrote:
> > It seems that a lot of Linux kernel USB serial device drivers are
> > ignoring the CREAD setting of termios.c_cflag.
>
> You just discovered something that has been broken since the first
> usb-serial driver was written, all those years ago :)

Amazing and frightening at the same time.  I would have expected
somebody had built something like a hardware test fixture to test those
drivers during all those decades.  Something like a "well-known" serial
device as the tester, attaching to all the handshake etc. lines of the
"device under test" and then running through many of the possible
settings from HW to SW flow control, baud rate, parity, number of stop
bits, break characters, etc.

I have no shortage of projects to work on, but if somebody else was
interested to host a physical setup with many different [USB] serial
ports and some CI around, I might be tempted to build the actual tester
hardware and some test suite software for it.

> I did add support for this to the digi driver, as you saw, as the
> hardware had support for it.  For everything else, they are all just
> dumb uarts and do not expose that information to the host computer and I
> think everyone just forgot about this option.

I am aware that many USB serial adapters are rather "dumb", hence my suggestion
to add a related option to the core usb-serial, or even to the core tty/serial
layer: If the driver doesn't process CREAD, simply discard the received bytes
at this common/shared layer.

> Given that you are the first to report it that I can think of, I don't
> think very many people use half-duplex protocols with a shared Rx/Tx
> (which is crazy anyway...)

Every smart card interface [1] on this planet, including every SIM card in every
mobile phone uses such a setup: asynchronous half-duplex communication with
shared Rx/Tx.  Sure, not many people attach something like that to a USB-Serial
adapter (as oppose to a USB-CCID reader), but I just wanted to clarify
it's not as obscure as one may think.  You can actually buy
ultra-low-cost SIM card readers built that way.

Also, I would assume that RS-485 is still used in lots of technology,
including e.g. DMX and industrial control systems.  Unless you go for a
rather obscure 4-wire RS-485, then you have the same half-duplex
operation on shared medium.  Please note that USB-RS485 adapters exist,
using a variety of USB-serial chipsets.

> > Please keep me in Cc of any responses, I'm not subscribed to linux-usb.
> 
> Is there a specific usb-serial driver that you are using that you want
> to have this support added to?

I'm typically using cp2102 or FTDI based devices, though of
course in terms of "market footprint", PL2303 probably beats all of the
others.  However, as indicated, maybe the "catch-all fall-back" in the
core is an easy way to adhere termios rules about CREAD without having
to hack up every driver individually?

Thanks,
	Harald

[1] well, not every, but most smart cards follow ISO 7816-3, which is
    what I'm talking about
-- 
- Harald Welte <laforge@gnumunks.org>            http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6926D2D56FB
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 10:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgLJJW6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 04:22:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:36582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728235AbgLJJW6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 04:22:58 -0500
Date:   Thu, 10 Dec 2020 10:06:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607592137;
        bh=uusQH84CvrIjsML3nBLyENRNWB4hJAGVg6Oykdnge6A=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=gMmjtcKYa0ITrJ+qrZ5wILYNFF+CT7GJVjfrk5z8Mgx3G7H23sSiJtGYlT/LYU34a
         lptTGGXXFGernbwdG8NfjSL5B+klBHZ52nazg/nHZMh7Ipx5wrXih6IworH6FB/8A/
         4bFjzlY5UXJ7LevC9lv4NWR+i3MMWDyYCowoN0EI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
        "Mychaela N . Falconia" <falcon@freecalypso.org>,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] tty: add flag to suppress ready signalling on open
Message-ID: <X9HlA17uI7I3Cuxw@kroah.com>
References: <20201202113942.27024-1-johan@kernel.org>
 <X9Dficb8sQGRut+S@kroah.com>
 <CA+uuBqYTzXCHGY8QnP+OQ5nRNAbqx2rMNzLM7OKLM1_4AzzinQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqYTzXCHGY8QnP+OQ5nRNAbqx2rMNzLM7OKLM1_4AzzinQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 09, 2020 at 02:49:45PM -0800, Mychaela Falconia wrote:
> Greg K-H wrote:
> 
> > I think we need more review for the rest of the series.  This does
> > change the way serial ports work in a non-traditional way (i.e. using
> > sysfs instead of terminal settings).
> 
> But the problem is that the current status quo is fundamentally broken
> for those hardware devices in which DTR and/or RTS have been repurposed
> for something other than modem and flow control.  Right now whenever a
> "cold" (never previously opened) serial port is opened for the first
> time, that open action immediately and unstoppably asserts both DTR
> and RTS hardware outputs, without giving userspace any opportunity to
> say "no, please don't do it".  Yes, this behaviour is codified in a
> bunch of standards that ultimately trace back to 1970s Original UNIX,
> but just because it is a standard does not make it right - this
> Unix/POSIX/Linux "standard" serial port behaviour is a bug, not a
> feature.

Thanks for the long response, but I think you have to realize that
creating a new api for something that has been "how things work" since
the 1970's should not be taken lightly.  No matter if it was a bug or
not, changing user-visable behavior is not a trivial thing.  What we
come up with here has to stand the test of time of being able to be
supported properly for the next 40+ years.

thanks,

greg k-h

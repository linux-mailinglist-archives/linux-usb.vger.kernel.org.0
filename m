Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1229C5D092
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 15:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGBNZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 09:25:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726457AbfGBNZX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 09:25:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75F4B206E0;
        Tue,  2 Jul 2019 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562073923;
        bh=ELD1ZK3XU1Q5HbwA9GJ0bXI2O1EJ64ovo9lUY+zvWaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VYSDV1jyq8FhvP2HNjXWEo9hWd/zGucyU3edWydw36FVY3mix7RTT+C6XwgApLFRN
         JIPDO0CyRpAktOvnjY2iOLghmHZksG9GxNsW619FJi0RsHzZwNtlHcxHPg9ZNFyi0o
         O1lvpjz1enebPw6Y95ZwuZ0CLOiQDAjBi7avPCU0=
Date:   Tue, 2 Jul 2019 15:25:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Aidan Thornton <makosoft@gmail.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Marco Zatta <marco@zatta.me>
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
Message-ID: <20190702132520.GA22668@kroah.com>
References: <20190601075257.GA24550@jimmy.localdomain>
 <1559555890.25071.5.camel@suse.com>
 <CAB=c7ToV==vGZWOXaRqRcoOb4TNeVqi4QNAvgtiN0K6JjoF8Tg@mail.gmail.com>
 <1562071602.5819.14.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562071602.5819.14.camel@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 02:46:42PM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 20.06.2019, 21:19 +0100 schrieb Aidan Thornton:
> 
> > This doesn't make much sense though. e387ef5c47dd should apply this
> > quirk to all Logitech UVC webcams, and this is definitely a UVC-based
> > Logitech webcam with the appropriate VID and interface descriptor.
> > Surely it shouldn't make any difference whether I add an entry for the
> > specific VID+PID pair of my particular camera or not? The C270 is as
> > well, I think.
> 
> Well, it is applied a little later.
> 
> > What's particularly annoying is that since this is an intermittent
> > problem, it's hard to tell if I'm chasing a phantom solution for it
> > again. Haven't managed to replicate it since applying this fix and did
> > so pretty quickly before but you never know.
> 
> Should I just readd everything removed in e387ef5c47dd?
> 
> Greg, what do you think? This is hard to test, the hardware is old
> and I want to avoid chasing them all separately.

It's up to you, if you think the issue is resolved if we readd
everything, that's fine with me.

thanks,

greg k-h

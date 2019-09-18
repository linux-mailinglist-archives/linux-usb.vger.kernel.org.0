Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B9DB6265
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 13:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbfIRLpP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 07:45:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:50794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730198AbfIRLpP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 07:45:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9BF221907;
        Wed, 18 Sep 2019 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568807114;
        bh=xe30Vt/UgJxm8NUpWY9YkpcUtbsYVvcOqmZ/kFHLD5Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S1dR2sCRqnTfplkaRWVh26geOlvF+cmYq02MnBEVlhUo6OAci2DSeGbtcv1McF3/h
         kqkE1mFGg3Y6FtgfkeL7p2qDMImERCBbfv0daq83e9rzAnSMUeYePRMM6i60fHsMeC
         sT5DK+wDk+EZSFPVjQSUlGjaaX7KJ3I/YWxv4QWs=
Date:   Wed, 18 Sep 2019 13:45:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] USB: serial: add port statistics
Message-ID: <20190918114511.GA1899089@kroah.com>
References: <20190918091415.23683-1-yegorslists@googlemail.com>
 <20190918110814.GC1894362@kroah.com>
 <CAGm1_kvb--Ckxxft=Nqx4GDoHhA_qU3+ZCoqF86dEua_V2VrtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kvb--Ckxxft=Nqx4GDoHhA_qU3+ZCoqF86dEua_V2VrtA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 01:22:42PM +0200, Yegor Yefremov wrote:
> On Wed, Sep 18, 2019 at 1:08 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Sep 18, 2019 at 11:14:15AM +0200, yegorslists@googlemail.com wrote:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > Add additional port statistics like received and transmitted bytes
> > > the way /proc/tty/driver/serial does.
> > >
> > > As usbserial driver already provides USB related information and
> > > this line is longer than 100 characters, this patch adds an
> > > additional line with the same port number:
> > >
> > > 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...
> > > 0: tx:112 rx:0
> > >
> > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > ---
> > >  drivers/usb/serial/usb-serial.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> >
> > You can't change existing proc files without having the chance that
> > userspace tools will break.
> >
> > Have you tried this and seen what dies a horrible death?
> 
> This patch is more a proof of concept (forgot to add RFC keyword). I
> find statistics provdes by the 8250 driver very useful for debugging
> purposes. What would be the best way to implemnt this feature for
> usbserial driver?
> 
> a) extend current line:
> 
> 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...tx:112 rx:0
> 
> though this still can break parsing
> 
> b) creating special entries for FTDI and other UARTs? Though it would
> be greate to have all usbserial UART handled the same way in the same
> file

Why is any of this needed at all?  Also, be very aware of the security
issues involved here, we had to disable access of these values by
"normal" users for other tty devices, so please don't break that by
offering it up here again.

What is going to use this information?

thanks,

greg k-h

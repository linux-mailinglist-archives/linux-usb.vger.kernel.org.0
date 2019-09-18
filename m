Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E114B62A6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbfIRMCU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 08:02:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726565AbfIRMCU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 08:02:20 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 169D02054F;
        Wed, 18 Sep 2019 12:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568808137;
        bh=EsPB8Ccpv5OSQDXtolYbZA9qi0MW30pF7WjJeC3rCKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=06THZ3Rrt9DMIQfscNUnFTMZc9zIQO2teeo8V4Sk2wGqPJUeypCbWVd3Kve/BijGO
         j5YW5BW5mXsiNgJ3s694mTQh27fFNXLBMSemTrbkwsuLmCtD6c0bvMUlpuxTkjDiK8
         C/BFtM9Yw9eJ1Yg50o4iM3D69I6z/MCo3MWOjTe8=
Date:   Wed, 18 Sep 2019 14:02:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] USB: serial: add port statistics
Message-ID: <20190918120215.GA1901208@kroah.com>
References: <20190918091415.23683-1-yegorslists@googlemail.com>
 <20190918110814.GC1894362@kroah.com>
 <CAGm1_kvb--Ckxxft=Nqx4GDoHhA_qU3+ZCoqF86dEua_V2VrtA@mail.gmail.com>
 <20190918114511.GA1899089@kroah.com>
 <CAGm1_kv9x234BSE1U0u=huwQDZdxmX-zURS6mB6ypbahmbAC_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kv9x234BSE1U0u=huwQDZdxmX-zURS6mB6ypbahmbAC_A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 01:51:29PM +0200, Yegor Yefremov wrote:
> On Wed, Sep 18, 2019 at 1:45 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Sep 18, 2019 at 01:22:42PM +0200, Yegor Yefremov wrote:
> > > On Wed, Sep 18, 2019 at 1:08 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Sep 18, 2019 at 11:14:15AM +0200, yegorslists@googlemail.com wrote:
> > > > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > > > >
> > > > > Add additional port statistics like received and transmitted bytes
> > > > > the way /proc/tty/driver/serial does.
> > > > >
> > > > > As usbserial driver already provides USB related information and
> > > > > this line is longer than 100 characters, this patch adds an
> > > > > additional line with the same port number:
> > > > >
> > > > > 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...
> > > > > 0: tx:112 rx:0
> > > > >
> > > > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > > > ---
> > > > >  drivers/usb/serial/usb-serial.c | 22 ++++++++++++++++++++++
> > > > >  1 file changed, 22 insertions(+)
> > > >
> > > > You can't change existing proc files without having the chance that
> > > > userspace tools will break.
> > > >
> > > > Have you tried this and seen what dies a horrible death?
> > >
> > > This patch is more a proof of concept (forgot to add RFC keyword). I
> > > find statistics provdes by the 8250 driver very useful for debugging
> > > purposes. What would be the best way to implemnt this feature for
> > > usbserial driver?
> > >
> > > a) extend current line:
> > >
> > > 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...tx:112 rx:0
> > >
> > > though this still can break parsing
> > >
> > > b) creating special entries for FTDI and other UARTs? Though it would
> > > be greate to have all usbserial UART handled the same way in the same
> > > file
> >
> > Why is any of this needed at all?  Also, be very aware of the security
> > issues involved here, we had to disable access of these values by
> > "normal" users for other tty devices, so please don't break that by
> > offering it up here again.
> >
> > What is going to use this information?
> 
> This feature is not a "must have" one but it is convenient to see
> transferred/received bytes and error flags from user space. If some
> serial software is not working like expected and doesn't provide
> enough debugging information one can quickly look at port statistics
> from the console in order to check whether and how many bytes were
> transferred or whether the were some communication errors.

Again, it's a security issue, so be careful about this.  If you _REALLY_
need it, make it a debugfs file, readble by root only.

Or a tracepoint, and then you can have a userspace read the data using
ebpf :)

thanks,

greg k-h

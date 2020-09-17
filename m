Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABA626E10D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgIQQpg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 12:45:36 -0400
Received: from forward2-smtp.messagingengine.com ([66.111.4.226]:47541 "EHLO
        forward2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728633AbgIQQpR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 12:45:17 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id 5F4121940046;
        Thu, 17 Sep 2020 12:44:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 17 Sep 2020 12:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vM7MZw
        Jd3AhFbuG6zI5+IZRnlUM1rthnW5NePpx7/oo=; b=XIE1mikRfM1szwDc4nNYCM
        t5DxZOjdZeJFyZrbsuh9jzuugXkpew1YmJ7rQM+6aVQDKsfKo5NlDqEfZsc2K92x
        46dsdKJM2m4x8v4L+28ujC0DRVVuERuXRJobSS+uCgFJYSAlBl7a2e+wUnjPMxrt
        rlXZwS4Dx90JZLJQYypMahF05gGOr2Hg/q20nR9b4k+0XpAINskYNvgCmuCOq1TX
        LpDRPP18dZYlVQVMq6eOEz2eh8cDf7wsuSVaXQ+Lbt/Mbi8eBfejvUo6s0eAvJbC
        fpQxS2Utl3E66gsyYUJeNkxBLu6cy/kEVEEFpp6gPskqLx5aFAa8hHYgm+bYmF8Q
        ==
X-ME-Sender: <xms:h5JjX4thuphLZIo_pJ6gJ-x8tUCYokryHDUkpdgsfe54UYCc_EHrTA>
    <xme:h5JjX1eGGDmUOyCozCbKW1VAAD8rhc2qlkKPRLnFoLqIqFbkIlQvd86QvssjsVG29
    4OpS7dDHmMbQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgmffjsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgqeenucggtf
    frrghtthgvrhhnpeetvdelgeffgfdutdelvddvtdetffejtefgveevueeggfellefhveev
    feduueduvdenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:h5JjXzy1t5k_Si5LiKVMPKozDSjy9iGoyv_F3-dzxXm4BPbUbsFfAQ>
    <xmx:h5JjX7N-P-BtsFvKLWGKHnzQaEBx1Y2UeKP4-fqOBn_xGaRo_e_vRA>
    <xmx:h5JjX4-IJcrJqyTBP6hI7HdZSI9h1T8SWx1oWNGPJ0KBd8-BH0trTg>
    <xmx:h5JjXxKN8Hq9hCNgTfsCuiWFbmqMW37TVnIsBXG1ZSJYk65s-EixEQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id AA1BF3280065;
        Thu, 17 Sep 2020 12:44:54 -0400 (EDT)
Date:   Thu, 17 Sep 2020 18:45:27 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usblp: fix race between disconnect() and read()
Message-ID: <20200917164527.GA723130@kroah.com>
References: <20200917103427.15740-1-oneukum@suse.com>
 <20200917114347.GA3436799@kroah.com>
 <1600344191.2424.44.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600344191.2424.44.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 17, 2020 at 02:03:11PM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 17.09.2020, 13:43 +0200 schrieb Greg KH:
> > On Thu, Sep 17, 2020 at 12:34:27PM +0200, Oliver Neukum wrote:
> > > read() needs to check whether the device has been
> > > disconnected before it tries to talk to the device.
> > > 
> > > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > > Reported-by: syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com
> > > ---
> > >  drivers/usb/class/usblp.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> > > index 084c48c5848f..67cbd42421be 100644
> > > --- a/drivers/usb/class/usblp.c
> > > +++ b/drivers/usb/class/usblp.c
> > > @@ -827,6 +827,11 @@ static ssize_t usblp_read(struct file *file, char __user *buffer, size_t len, lo
> > >  	if (rv < 0)
> > >  		return rv;
> > >  
> > > +	if (!usblp->present) {
> > > +		count = -ENODEV;
> > > +		goto done;
> > > +	}
> > > +
> > 
> > What prevents ->present from not being changed right after this test?
> 
> Hi,
> 
> the mutex taken in
> 
> rv = usblp_rwait_and_lock(usblp, !!(file->f_flags & O_NONBLOCK));

Ah, missed that, thanks.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE97FD32A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 04:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfKODTz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 22:19:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:37268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfKODTz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Nov 2019 22:19:55 -0500
Received: from localhost (unknown [104.132.150.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1258C206F4;
        Fri, 15 Nov 2019 03:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573787994;
        bh=X4dYlN8jycxk7zQtoFd/+f0G72lvDqeGK30npKrQ4EY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k2VD6Bgw3J5MR11pZihhZ/NmF4+UVPdGxF2xOanlIJD6yhXpfGArzODu1jEaJcZxD
         a8nxXL3a23P6xmA9c/wTwHQm8PVg6OBoGSIslb6e+evXQ4T+c+AS2aF25435pF0RJe
         oM8isZ0lqZmzVxtDimIoMXRLH/OJnvyWS4DcSLno=
Date:   Fri, 15 Nov 2019 11:19:51 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH 1/1] usb: gadget: add raw-gadget interface
Message-ID: <20191115031951.GA793701@kroah.com>
References: <cover.1573236684.git.andreyknvl@google.com>
 <282c5da077ad53ce4e5ff9b4350bbf62b33bb6a9.1573236684.git.andreyknvl@google.com>
 <20191108211745.GA1282512@kroah.com>
 <CAAeHK+w-nB4MngSNhazkZAa-Ovdu1C45HaD6XCPoJ79qRo8keQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+w-nB4MngSNhazkZAa-Ovdu1C45HaD6XCPoJ79qRo8keQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 14, 2019 at 04:08:29PM +0100, Andrey Konovalov wrote:
> On Fri, Nov 8, 2019 at 10:17 PM Greg Kroah-Hartman
> > > +static void gadget_unbind(struct usb_gadget *gadget)
> > > +{
> > > +     struct raw_dev *dev = get_gadget_data(gadget);
> > > +     unsigned long flags;
> > > +
> > > +     if (WARN_ON(!dev))
> > > +             return;
> >
> > Why warn?  How can this happen?
> 
> This shouldn't happen and I initially had BUG_ON there, but checkpatch
> complained. I can use BUG_ON of leave it as WARN_ON, which would you
> prefer?

If it should never happen, then why test it?
If it can happen, then just test and print an error, why panic the
machine if panic-on-warn is enabled for something that we can test and
recover from?

And no, never add BUG_ON please.

> > > +static int raw_open(struct inode *inode, struct file *fd)
> > > +{
> > > +     struct raw_dev *dev;
> > > +
> > > +     dev = dev_new();
> > > +     if (!dev) {
> > > +             pr_err("failed to created device");
> >
> > So many error messages printed on failures, you only needed the original
> > one if memory was gone that the core sent out.
> 
> What do you mean by the original one? I see only one error printed in
> case dev_new() fails. However I'm not sure if there's much value in
> printing an error in case the kernel ran out of memory, as it doesn't
> handle this very well anyway AFAIK. Should I remove this pr_err?

Yes, please do.

thanks,

greg k-h

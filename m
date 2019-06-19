Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D155C4BF3B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 19:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfFSREs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 13:04:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfFSREs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 13:04:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DCF6217F4;
        Wed, 19 Jun 2019 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560963886;
        bh=ThLKNb0gdILDyX7sJZSMKst2Rhwyz57X8YfXnQtqX3k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jF5ihnAb0ZTXMaBglw62fPOH0UuwiuPVVetG01GsfauovrS1tKoSd7jjoXlDnBDJ0
         qqYLwh7LM9W00FV8fdc94T9xwU/OBrMB+nFrGeqBr8Id6YGP32IIvrnm1jDjPimLeI
         0rP4oOJGsnvKvXDoQCRt8L8rSts4Zp9X+YemxnkQ=
Date:   Wed, 19 Jun 2019 19:04:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dmg <dmg@turingmachine.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a,
 b) in adutux driver
Message-ID: <20190619170444.GA10107@kroah.com>
References: <20190618153529.11418-1-dmg@turingmachine.org>
 <20190618160658.GA27611@kroah.com>
 <87imt2kdub.fsf@mn.cs.uvic.ca>
 <20190618181326.GA19012@kroah.com>
 <87d0j9jzqc.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0j9jzqc.fsf@mn.cs.uvic.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 19, 2019 at 09:39:55AM -0700, dmg wrote:
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Tue, Jun 18, 2019 at 10:22:52AM -0700, dmg wrote:
> >>
> >> Greg KH <gregkh@linuxfoundation.org> writes:
> >>
> >> >> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> >> >> index 9465fb95d70a..4a9fa3152f2a 100644
> >> >> --- a/drivers/usb/misc/adutux.c
> >> >> +++ b/drivers/usb/misc/adutux.c
> >> >> @@ -379,7 +379,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
> >> >>
> >> >>  		if (data_in_secondary) {
> >> >>  			/* drain secondary buffer */
> >> >> -			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
> >> >> +			int amount = min_t(size_t, bytes_to_read, data_in_secondary);
> >> >
> >> > Shouldn't amount and data_in_secondary be of size_t type?  Then you can
> >> > just use min() here, right?
> >>
> >>
> >> I looked at the code.
> >>
> >> there is an implicit assertion that
> >>
> >>    dev->secondary_tail >=  dev->secondary_head
> >>
> >>
> >> (which are pointers to the secondary buffer)
> >
> > No, those are integers for the buffer, secondary_tail seems just to be
> > the "length" of the buffer, and secondary_head is the current "start" of
> > the buffer that has not been sent yet.
> >
> > So these can not ever "wrap", thank goodness.
> 
> I looked at the code and yes, the cannot wrap.
> 
> >
> > But really, ick ick ick, this code is odd.  Seems like they are trying
> > to go with a "flip buffer" scheme when there are many simpler ways to do
> > all of this...
> >
> > Oh well, we deal with what we have...
> >
> >> 	while (bytes_to_read) {
> >> 		int data_in_secondary = dev->secondary_tail - dev->secondary_head;
> >> 		dev_dbg(&dev->udev->dev,
> >> 			"%s : while, data_in_secondary=%d, status=%d\n",
> >> 			__func__, data_in_secondary,
> >> 			dev->interrupt_in_urb->status);
> >>
> >> 		if (data_in_secondary) {
> >> 			/* drain secondary buffer */
> >> 			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
> >> 			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
> >> 			if (i) {
> >> 				retval = -EFAULT;
> >> 				goto exit;
> >> 			}
> >> 			dev->secondary_head += (amount - i);
> >> 			bytes_read += (amount - i);
> >> 			bytes_to_read -= (amount - i);
> >> 		} else {
> >> 			/* we check the primary buffer */
> >>
> >> As computed, data_in_secondary is the number of bytes left in the secondary
> >> buffer and hence, it should always be larger or equal 0.
> >
> > Yes.
> >
> >> The if statement seems to imply this fact. There is no handling of the case
> >> where data_in_secondary is negative--if that was the case, copy_to_user will be
> >> called with a negative number, which I assume will return an error.
> >
> > Looking at the code, it never can be.
> >
> > And no, copy_to_user() with a negative number is just a really BIG
> > number, and bad things happen, we never want to do that as it's usually
> > a security issue then.
> >
> >> This is interesting. It means that if the pointers are incorrect (head points
> >> after tail), the current code will probably be able to recover from the bug with
> >> an error (i assume copy_to_user will return != 0 if called with a negative
> >> number).
> >>
> >> If we change data_in_secondary to size_t, and the head points after the tail,
> >> the data_in_secondary will be invalid (but positive) and copy_to_user will try
> >> to read those number of bytes. I don't know what would happen in that case.
> >
> > Looking at the code, I do not see how this can happen, do you?
> 
> I agree. No, it cannot.
> 
> >
> >> Amount is number of bytes to read from this buffer, so it does not make sense for it to be
> >> negative. So it being size_t sounds ok.
> >>
> >> Barring that potential bug in the values of the pointers of the head and the
> >> tail,  it appears it is safe to change the type of both data_in_secondary and
> >> amount to size_t, and use min instead. It will also require to change the printf-style
> >> modifier  (%d => %lu)
> >>
> >> Also,  note the use of "amount -i" the end of the if statement. At this point i
> >> is equal to zero. the "- i" can be dropped from all these computations.
> >
> > That is someone who did not know what copy_to_user() returned and
> > assumed it was the number of bytes copied :(
> >
> >> please let me know if this is something that sounds ok, and I'll prepare it and
> >> submit a new patch.
> >
> > It sounds ok.  And if you want to fix anything else up here in this
> > mess, it's always appreciated.  Odds are no one uses this driver
> > anymore, but that's no reason to keep it being such a mess :)
> 
> 
> I have created a new patch. But I am not sure what is the best way to 'connect'
> my new patch to this one. I am currently using git-send-mail to avoid
> interference from my mail client. Unless you think there is a better way, I'll
> send it as I have before.

No need to "connect" it if you don't want to, just send the new one.

thanks,

greg k-h

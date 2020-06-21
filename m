Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF032029DF
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 11:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbgFUJzN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 05:55:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729573AbgFUJzN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Jun 2020 05:55:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 280FC248A8;
        Sun, 21 Jun 2020 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592733312;
        bh=1ZP4vrtmpbaimh8JH7vTQIapA07NwP1HrWUeoOHjojM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ep3qxcCDfTw8BPJziqGJBLKe6TaS9VJlUSXjmBV2HP3+a/BNPv+MrT/1KJqDu0h33
         KINOjc/XWRjLdFm5FrYruQRBcagxYxQvLnNewfjcfqwC3gHifzDc24oTiDpZEyORUz
         vJVaLOIDwaIsADwBrGJHiI3Ml2FTjVcvR37GMI/s=
Date:   Sun, 21 Jun 2020 11:55:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200621095509.GA120230@kroah.com>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 11:45:11AM +0200, Jerry wrote:
> Greg Kroah-Hartman wrote on 6/21/20 10:58 AM:
> > On Sat, Jun 20, 2020 at 09:58:40PM +0200, Jerry wrote:
> > > usbserial: add cp210x support for icount to detect parity error in received data
> > Why is this here?
> > 
> Because it seems be mandatory?
> https://www.kernel.org/doc/html/latest/process/5.Posting.html#patch-formatting-and-changelogs
> 
> "A one-line description of what the patch does. This message should be
> enough for a reader who sees it with no other context to figure out the
> scope of the patch; it is the line that will show up in the “short form”
> changelogs. This message is usually formatted with the relevant subsystem
> name first, followed by the purpose of the patch. For example:
> gpio: fix build on CONFIG_GPIO_SYSFS=n"

Yes, that should have been the first line of the git commit, which ends
up being the subject line for your email.

> Did I misunderstand your rule or used wrong name of subsystem? Should I
> type?
> USB serial: add cp210x support for icount to detect parity error in received
> data

That would have been fine too, you can't do it twice, once as a subject
and once as the first line in the email, otherwise that would look
really odd, right?

> > > Motivation - current version of cp210x driver doesn't provide any way to detect
> > > a parity error in received data from userspace. Some serial protocols like STM32
> > > bootloader protect data only by even parity so application needs to detect
> > > whether parity error happened to read again peripheral data.
> > > 
> > > I created a simple patch which adds support for icount (ioctl TIOCGICOUNT) which
> > > sends GET_COMM_STATUS command to CP210X and according received flags increments
> > > fields for parity error, frame error, break and overrun.
> > > So application can detect an error condition after reading data from ttyUSB
> > > and repeat operation. There is no impact for applications which don't
> > > call ioctl TIOCGICOUNT.
> > > This patch is also placed at http://yyy.jrr.cz/cp210x.patch (my first patch)
> > Please read the section entitled "The canonical patch format" in the
> > kernel file, Documentation/SubmittingPatches for what is needed in order
> > to properly describe the change.
> I read it, but still not sure what exactly was wrong? Yes, I wrapped lines
> of description to 80 colums and now I noticed that only 75 columns is
> allowed but I doubt that it is all?

That is one thing, but also the "This patch..." should not be in a
changelog, right?  Look at the other changes sent to the list for
examples of how to do this.

> > > Signed-off-by: Jaromir Skorpil <Jerry@jrr.cz>
> > This does not match your From: line :(
> I supposed that only mail address in From line matter?
> I understand that real name is mandatory only for Signed-off-by field?

It has to match the From: line of your email to ensure that this really
is the same person.

thanks,

greg k-h

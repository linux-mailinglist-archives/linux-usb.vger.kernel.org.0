Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B35E2640AE
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 10:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730464AbgIJI4j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 04:56:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730400AbgIJIze (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 04:55:34 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DA2D206A1;
        Thu, 10 Sep 2020 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599728134;
        bh=Sw3cSgiiRVB7WjdtgUzZk4fAw77GoTjxM0/fy6CX2UQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VaYGy1DGNz7YN5SG68MnqqzLWdNriwbjMQ5P5LsPml47jMyrueTtPJK9N4uvEJKvL
         nlDlIV9BHCB629AE3/7hHlSrrgov2Z+N4dr2ZS5/gZ1ZPZrtHthGSvJLhMUKQOuOJw
         J9az9zqi3guXQPR7Oh/HlzGZzv+FCRNKi24CcDWY=
Date:   Thu, 10 Sep 2020 10:55:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Lars Melin <larsm17@gmail.com>,
        Oliver Neukum <oneukum@suse.de>, linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russ Dill <Russ.Dill@gmail.com>,
        Hector Martin <hector@marcansoft.com>
Subject: Re: [PATCH v2] usb: serial: Repair FTDI FT232R bricked eeprom
Message-ID: <20200910085541.GA1099591@kroah.com>
References: <20200909193419.2006744-1-james.hilliard1@gmail.com>
 <1599706954.10822.3.camel@suse.de>
 <a1161f77-5b37-39ea-eb91-7b0b59278960@gmail.com>
 <20200910080850.GD24441@localhost>
 <CADvTj4rDdj8KtLhGZEZP+XZcF4DTE4oW9sNf=zNWaRPzkny93A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4rDdj8KtLhGZEZP+XZcF4DTE4oW9sNf=zNWaRPzkny93A@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 10, 2020 at 02:17:44AM -0600, James Hilliard wrote:
> On Thu, Sep 10, 2020 at 2:08 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Thu, Sep 10, 2020 at 12:33:55PM +0700, Lars Melin wrote:
> > > On 9/10/2020 10:02, Oliver Neukum wrote:
> > > > Am Mittwoch, den 09.09.2020, 13:34 -0600 schrieb James Hilliard:
> > > >> This patch detects and reverses the effects of the malicious FTDI
> > > >> Windows driver version 2.12.00(FTDIgate).
> > > >
> > > > Hi,
> > > >
> > > > this raises questions.
> > > > Should we do this unconditionally without asking?
> > > > Does this belong into kernel space?
> > > >
> > >
> > > My answer to both of those question is a strong NO.
> > >
> > > The patch author tries to justify the patch with egoistical arguments
> > > (easier for him and his customers) without thinking of all other users
> > > of memory constrained embedded hardware that doesn't need the patch code
> > > but have to carry it.
> > >
> > > The bricked PID is btw already supported by the linux ftdi driver so
> > > there is no functionality gain in the patch.
> >
> > I fully agree. This doesn't belong in the kernel. If the Windows driver
> > breaks someones device on purpose they should know about it, and *if*
> > they want they can reprogram the device using the tools mentioned in the
> > thread. But the kernel shouldn't be playing such games and reprogram
> > eeproms behind people's backs.
> One of the main issues is that this issue is very often not-obvious, FTDI
> specifically designed their malicious driver to make it appear that the
> hardware failed, they intentionally do not provide proper feedback to
> the user when they soft-brick it. I assume this is because they want
> to push the support costs related to their malicious driver onto the
> integrator rather than themselves.

That's fine, but why is it the Linux kernel's job to fix up this mess?

There is already a userspace tool that can be run to resolve this for
devices that wish to have this fixed up for.  Use that.  We want to keep
things that can be done in userspace, in userspace, whenever possible.

And again, Linux runs just fine with these devices so why is it Linux's

I'm with Johan here, reprogramming eeproms when people least expect it
is not nice, and in a way, is much the same thing that the Windows
drivers are doing.

thanks,

greg k-h

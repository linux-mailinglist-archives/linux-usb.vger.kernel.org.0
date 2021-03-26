Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412DA34A81F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 14:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCZNbJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 09:31:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229995AbhCZNap (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 09:30:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A8DA619C2;
        Fri, 26 Mar 2021 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616765443;
        bh=yR51c7u7Bdi2DPsBDHt0VWZxo5dQ1YG6a+mnQkNfG/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hMS8Resn8vCC0PF++Z9OcbH8/PgPgG0+egjDD80EzGvQtJ2oh9NurGIEtKTaGCpEk
         TuzWy4fBe/8J0UtuzZ8ihw7f9/Fl5mOCDCJsWZrmaDdb3tj0xZUX6qFwCuSlwQeC0c
         kJL4yj9rYieUOrcRWCwKQKBfy7GnAjyqWB9sk7CM=
Date:   Fri, 26 Mar 2021 14:30:40 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc2: Add default param to control power
 optimization.
Message-ID: <YF3iAGC5NjMxtwOP@kroah.com>
References: <20210318061247.B2EACA005D@mailhost.synopsys.com>
 <YFnP4EFrmwuc6Scn@kroah.com>
 <ce789dca-82ae-0800-7577-2ea0d4c33955@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce789dca-82ae-0800-7577-2ea0d4c33955@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 24, 2021 at 04:44:31PM +0000, Artur Petrosyan wrote:
> Hi Greg,
> 
> On 3/23/2021 15:24, Greg Kroah-Hartman wrote:
> > On Thu, Mar 18, 2021 at 10:12:46AM +0400, Artur Petrosyan wrote:
> >> - Added a default param "power_saving" to enable or
> >>    disable hibernation or partial power down features.
> >>
> >> - Printed hibernation param in hw_params_show and
> >>    power_saving param in params_show.
> > 
> > This says what you are doing, but not _why_ you are doing this.  Why is
> > this needed at all?
> > 
> > Please read the documentation for how to write a good changelog text for
> > when you resubmit this series.
> 
> Thank you for your reply. I have corrected changelog of the patch 
> according the documentation. Will submit in series.
> 
> > 
> > Also note that the emails were not "threaded", was that on purpose?
> Yes, the patches that were included in the "usb: dwc2: Fix and improve 
> power saving modes" which was submitted earlier were too large and 
> needed to be split up into smaller patches.
> We had a discussion about that with Felipe Balbi earlier. Here is the 
> link to the discussion thread 
> (https://marc.info/?l=linux-usb&m=160379651904064&w=2)
> So I did the split and obviously the cover letter and the subject were 
> changed therefor I have submitted the updates with this thread and 
> mentioned in the cover letter that these are continuation of the 
> previous patch set that was too large.

No, I mean you are not "threading" your emails so that they show up as
one after another all in the same email "thread".  Please use
git-send-email to do this, or some other tool.

thanks,

greg k-h

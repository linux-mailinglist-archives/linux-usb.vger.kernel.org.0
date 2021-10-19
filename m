Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DF3432F8F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 09:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhJSHeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 03:34:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:50268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234691AbhJSHeD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 03:34:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CA556137F;
        Tue, 19 Oct 2021 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634628711;
        bh=0mWtOhHHavXATvNfchyONfHu9pPTSnq66KGn6WkLiTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2eSEex4ExDqY1eMlza6GH/2GDlPGPDCHycTTLnZ8jEZFo3E0YKbPJUE7/HMz54DHv
         5/1ssdwq7USzQXddiJNf5CieEdOIjxrHqoT592ygY5A6ifPgGe8HA6fP1V4fvQLQaY
         02Tx82m9gVotbeCBhenS41HR1FuWkr1zbQlx/tTc=
Date:   Tue, 19 Oct 2021 09:31:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
Message-ID: <YW50ZLkVDkVuYdBp@kroah.com>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <YW5ajmF67RjuD7l5@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW5ajmF67RjuD7l5@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 07:41:34AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 18, 2021 at 09:39:08PM +0300, Sergey Shtylyov wrote:
> > Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> > The affected drivers use platform_get_irq() which can return IRQ0 (considered
> > invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
> > called at the end of the probe methods. I think that the solution to this issue
> > is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
> > patch set to get the things going...
> 
> Why not fix the root of the problem for your platform that is failing to
> assign a valid irq for the device?
> 
> Are you going to make this change to all callers of this function in the
> kernel tree?

Also, you should have gotten a huge WARNING in your kernel log if this
happens to let you know that something bad is going on.  Is this patch
series going to really change any of that?

What is the root problem here that you are trying to paper over with
this patchset?

thanks,

greg k-h

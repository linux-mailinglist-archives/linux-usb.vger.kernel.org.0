Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7116433E84
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 20:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhJSShf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 14:37:35 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42493 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231783AbhJSShf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 14:37:35 -0400
Received: (qmail 1091752 invoked by uid 1000); 19 Oct 2021 14:35:21 -0400
Date:   Tue, 19 Oct 2021 14:35:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
Message-ID: <20211019183521.GA1090528@rowland.harvard.edu>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <YW5ajmF67RjuD7l5@kroah.com>
 <YW50ZLkVDkVuYdBp@kroah.com>
 <fb0e0bfc-ca56-e70b-5563-a23fe546f651@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb0e0bfc-ca56-e70b-5563-a23fe546f651@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 09:28:08PM +0300, Sergey Shtylyov wrote:
> On 10/19/21 10:31 AM, Greg Kroah-Hartman wrote:
> 
> [...]
> >>> Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> >>> The affected drivers use platform_get_irq() which can return IRQ0 (considered
> >>> invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
> >>> called at the end of the probe methods. I think that the solution to this issue
> >>> is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
> >>> patch set to get the things going...
> >>
> >> Why not fix the root of the problem for your platform that is failing to
> >> assign a valid irq for the device?
> >>
> >> Are you going to make this change to all callers of this function in the
> >> kernel tree?
> > 
> > Also, you should have gotten a huge WARNING in your kernel log if this
> > happens to let you know that something bad is going on.
> 
>    That's the relatively recent addition, yet it doesn't override IRQ0 to s/th
> like -EINVAL.
> 
> > Is this patch
> > series going to really change any of that?
> 
>    How? It doesn't touch drivers/base/platform.c...
> 
> > 
> > What is the root problem here that you are trying to paper over with
> > this patchset?
> 
>    As I said, it would be preferrable to either deny IRQ0 in usb_add_hcd() or
> just don't try to filter it out. The real problem is that usb_add_hcd() does
> add a non-functioning HCD without the necessary IRQ handling (it only hooks
> an IRQ when it's non-zero).

This is because some HCDs don't use interrupts (e.g., dummy-hcd).

Alan Stern

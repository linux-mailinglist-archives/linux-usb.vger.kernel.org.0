Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00CB860B68
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 20:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbfGES26 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 14:28:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:47436 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727615AbfGES26 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 14:28:58 -0400
Received: (qmail 4967 invoked by uid 2102); 5 Jul 2019 14:28:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Jul 2019 14:28:57 -0400
Date:   Fri, 5 Jul 2019 14:28:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     EJ Hsu <ejh@nvidia.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
In-Reply-To: <4addd98e5f7edc17783201cde43c166488acc0df.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1907051422000.1606-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:

> (following our conversation)
> 
> Here's a completely untested alternative patch (it replaces my previous
> one) that fixes it a bit differently.
> 
> This time it should handle the case of a disconnect happening
> before we have dequeued a config change.
> 
> This assumes that it's correct to never call
> usb_composite_setup_continue() if an fsg_disable() happens after a
> fsg_set_alt() and before we have processed the latter.

That should be handled okay.  If it isn't, the composite core needs to 
be fixed.

> I will try to test it tomorrow if time permits, otherwise some time
> next week:
> ---
> 
> [PATCH] usb: gadget: mass_storage: Fix races between fsg_disable and fsg_set_alt
> 
> If fsg_disable() and fsg_set_alt() are called too closely to each
> other (for example due to a quick reset/reconnect), what can happen
> is that fsg_set_alt sets common->new_fsg from an interrupt while
> handle_exception is trying to process the config change caused by
> fsg_disable():
> 
> 	fsg_disable()
> 	...
> 	handle_exception()
> 		sets state back to FSG_STATE_NORMAL
> 		hasn't yet called do_set_interface()
> 		or is inside it.
> 
>  ---> interrupt
> 	fsg_set_alt
> 		sets common->new_fsg
> 		queues a new FSG_STATE_CONFIG_CHANGE
>  <---
> 
> Now, the first handle_exception can "see" the updated
> new_fsg, treats it as if it was a fsg_set_alt() response,
> call usb_composite_setup_continue() etc...
> 
> But then, the thread sees the second FSG_STATE_CONFIG_CHANGE,
> and goes back down the same path, wipes and reattaches a now
> active fsg, and .. calls usb_composite_setup_continue() which
> at this point is wrong.
> 
> Not only we get a backtrace, but I suspect the second set_interface
> wrecks some state causing the host to get upset in my case.
> 
> This fixes it by replacing "new_fsg" by a "state argument" (same
> principle) which is set in the same lock section as the state
> update, and retrieved similarly.
> 
> That way, there is never any discrepancy between the dequeued
> state and the observed value of it. We keep the ability to have
> the latest reconfig operation take precedence, but we guarantee
> that once "dequeued" the argument (new_fsg) will not be clobbered
> by any new event.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Yes, this looks just right.  If I had thought about this a little more
deeply earlier on, I would have come up with a patch very much like
this.

My only comments are cosmetic.

> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 26 ++++++++++++--------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 043f97ad8f22..2ef029413b01 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c

> @@ -2285,16 +2292,14 @@ static int do_set_interface(struct fsg_common *common, struct fsg_dev *new_fsg)
>  static int fsg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
>  {
>  	struct fsg_dev *fsg = fsg_from_func(f);

While you're changing this, it would be nice to add the customary blank 
line here.

> -	fsg->common->new_fsg = fsg;
> -	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
> +	__raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE, fsg);
>  	return USB_GADGET_DELAYED_STATUS;
>  }
>  
>  static void fsg_disable(struct usb_function *f)
>  {
>  	struct fsg_dev *fsg = fsg_from_func(f);

And here.  Otherwise:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern


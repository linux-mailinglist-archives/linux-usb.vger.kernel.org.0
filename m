Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9E536A2A5
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 20:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhDXSmR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 14:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbhDXSmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Apr 2021 14:42:15 -0400
Received: from mail.solidxs.nl (mail.solidxs.nl [IPv6:2a01:4f8:150:72a3::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F1AC061574
        for <linux-usb@vger.kernel.org>; Sat, 24 Apr 2021 11:41:36 -0700 (PDT)
Received: by mail.solidxs.nl (Postfix, from userid 1000)
        id 635834C80C46; Sat, 24 Apr 2021 20:41:33 +0200 (CEST)
Date:   Sat, 24 Apr 2021 20:41:33 +0200
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Marcel Hamer <marcel@solidxs.se>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Thinh Nguyen <thinhn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: add missing wakeup link states
Message-ID: <20210424184133.GA1778359@solidxs.nl>
References: <20210423152524.624619-1-marcel@solidxs.se>
 <87pmykksuw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmykksuw.fsf@kernel.org>
From:   Marcel Hamer <marcel@solidxs.nl>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 24, 2021 at 11:08:07AM +0300, Felipe Balbi wrote:
> Marcel Hamer <marcel@solidxs.se> writes:
> 
> > In dwc3_send_gadget_ep_cmd() a check is performed if the gadget needs
> > waking up. The following condition is checked before calling the
> > __dwc3_gadget_wakeup() function:
> >
> > 	needs_wakeup = (dwc->link_state == DWC3_LINK_STATE_U1 ||
> >         		dwc->link_state == DWC3_LINK_STATE_U2 ||
> >                         dwc->link_state == DWC3_LINK_STATE_U3);
> >
> > Inside __dwc3_gadget_wakeup() only link_state DWC3_LINK_STATE_U3 is checked
> > and link state DWC3_LINK_STATE_U1 and DWC3_LINK_STATE_U2 are considered
> > invalid and generate a warning because of the call to:
> >
> > 	dev_WARN_ONCE(dwc->dev, ret, "wakeup failed --> %d\n", ret);
> >
> > because of ret being -EINVAL.
> >
> > Signed-off-by: Marcel Hamer <marcel@solidxs.se>
> > ---
> >  drivers/usb/dwc3/gadget.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index c7ef218e7a8c..d05a7d630410 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -1972,6 +1972,8 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
> >  	switch (link_state) {
> >  	case DWC3_LINK_STATE_RESET:
> >  	case DWC3_LINK_STATE_RX_DET:	/* in HS, means Early Suspend */
> > +	case DWC3_LINK_STATE_U1:
> > +	case DWC3_LINK_STATE_U2:
> 
> I think this was fixed recently by Thinh.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c560e76319a94a3b9285bc426c609903408e4826
> 
> -- 
> balbi

Great, I missed that. Thank you for clarifying this.

Kind regards,

Marcel

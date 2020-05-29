Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4791D1E7F52
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgE2Nzb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 09:55:31 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:23263 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgE2Nzb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 09:55:31 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49YR0d0ByYz9s;
        Fri, 29 May 2020 15:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1590760529; bh=Ahv7mUDTuyxTSHWyPZ7XPAxCgroBDI5D/yY3iwLuGsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YXwJXHDI5Wnwz3Rjh57U0N5rjfWYb+GvadNg8fVhdT5nVC1m/v4p4kjuGsso/ybos
         PKvv8/O+atjd/H8JMqF36T08BhnfUFaEhhwYplLAO0H4MFbNze4bl6Y0z91fsMPM2Y
         UGFoiWq1iL3SmRU9viGjsgEkwoEJtVnCg4i0rsgU7T9nIdrxGTJ+AaM4jqIDjFQJun
         ikpXm46j7+kGR1XoUwx9YXmv0iG5HpUA/tGAgv4AAPYZ8wKcXzFH82eEVeOPIQ/MSm
         TrXE2GasbGM3U+Pyj1k+hOXdNR+onNYJ/v+PGN1JMftskIQNXW431ntQ6CuC33J5MB
         0UFaBf4WvjXBA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Fri, 29 May 2020 15:55:24 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Baldyga <r.baldyga@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_acm: don't disable disabled EP
Message-ID: <20200529135524.GA14614@qmqm.qmqm.pl>
References: <237e4bc8c63680f9ce0388d35b4c34a856ed8595.1590690518.git.mirq-linux@rere.qmqm.pl>
 <20200529081104.GD32755@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200529081104.GD32755@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 29, 2020 at 08:10:40AM +0000, Peter Chen wrote:
> On 20-05-28 20:30:28, Micha� Miros�aw wrote:
> > Make debugging real problems easier by not trying to disable an EP that
> > was not yet enabled.
> > 
> > Fixes: 4aab757ca44a ("usb: gadget: f_acm: eliminate abuse of ep->driver data")
> > Signed-off-by: Micha� Miros�aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/usb/gadget/function/f_acm.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
> > index 200596ea9557..46647bfac2ef 100644
> > --- a/drivers/usb/gadget/function/f_acm.c
> > +++ b/drivers/usb/gadget/function/f_acm.c
> > @@ -425,9 +425,11 @@ static int acm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
> >  	/* we know alt == 0, so this is an activation or a reset */
> >  
> >  	if (intf == acm->ctrl_id) {
> > -		dev_vdbg(&cdev->gadget->dev,
> > -				"reset acm control interface %d\n", intf);
> > -		usb_ep_disable(acm->notify);
> > +		if (acm->notify->enabled) {
> > +			dev_vdbg(&cdev->gadget->dev,
> > +					"reset acm control interface %d\n", intf);
> > +			usb_ep_disable(acm->notify);
> > +		}
> 
> But it does not fix any issues, the usb_ep_disable checks 'enabled' flag.

It generates spurious trace events if you enable them.

Best Regards,
Micha� Miros�aw

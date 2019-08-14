Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5C9F8D673
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 16:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfHNOqF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 10:46:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52078 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726230AbfHNOqF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 10:46:05 -0400
Received: (qmail 3248 invoked by uid 2102); 14 Aug 2019 10:46:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 Aug 2019 10:46:04 -0400
Date:   Wed, 14 Aug 2019 10:46:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] usb: host: ohci-pxa27x: Fix and & vs | typo
In-Reply-To: <20190814140414.GU1974@kadam>
Message-ID: <Pine.LNX.4.44L0.1908141045070.1771-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 14 Aug 2019, Dan Carpenter wrote:

> I was looking at this code again today and I'm still convinced this
> patch is correct.  Should I resend?
> 
> regards,
> dan carpenter
> 
> On Fri, Feb 23, 2018 at 03:33:00PM +0300, Dan Carpenter wrote:
> > The code is supposed to clear the RH_A_NPS and RH_A_PSM bits, but it's
> > a no-op because of the & vs | typo.  This bug predates git and it was
> > only discovered using static analysis so it must not affect too many
> > people in real life.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Not tested.
> > 
> > diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
> > index 3e2474959735..7679fb583e41 100644
> > --- a/drivers/usb/host/ohci-pxa27x.c
> > +++ b/drivers/usb/host/ohci-pxa27x.c
> > @@ -148,7 +148,7 @@ static int pxa27x_ohci_select_pmm(struct pxa27x_ohci *pxa_ohci, int mode)
> >  		uhcrhda |= RH_A_NPS;
> >  		break;
> >  	case PMM_GLOBAL_MODE:
> > -		uhcrhda &= ~(RH_A_NPS & RH_A_PSM);
> > +		uhcrhda &= ~(RH_A_NPS | RH_A_PSM);
> >  		break;
> >  	case PMM_PERPORT_MODE:
> >  		uhcrhda &= ~(RH_A_NPS);

The patch sure looks right to me.  FWIW:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern


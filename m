Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F5624A20B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 16:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgHSOwh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 10:52:37 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33153 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728093AbgHSOwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Aug 2020 10:52:37 -0400
Received: (qmail 183014 invoked by uid 1000); 19 Aug 2020 10:52:36 -0400
Date:   Wed, 19 Aug 2020 10:52:36 -0400
From:   "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Message-ID: <20200819145236.GA181847@rowland.harvard.edu>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com>
 <20200818093305.GA34785@kroah.com>
 <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200818144655.GA144306@rowland.harvard.edu>
 <20200819013014.GA16614@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819013014.GA16614@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 01:31:14AM +0000, Peter Chen wrote:
> On 20-08-18 10:46:55, stern@rowland.harvard.edu wrote:
> > On Tue, Aug 18, 2020 at 10:05:51AM +0000, Peter Chen wrote:
> > >  
> > > > >
> > > > > diff --git a/drivers/usb/gadget/udc/core.c
> > > > > b/drivers/usb/gadget/udc/core.c index 473e74088b1f..43351b0af569
> > > > > 100644
> > > > > --- a/drivers/usb/gadget/udc/core.c
> > > > > +++ b/drivers/usb/gadget/udc/core.c
> > > > > @@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget
> > > > > *gadget)  {
> > > > >  	usb_del_gadget(gadget);
> > > > >  	usb_put_gadget(gadget);
> > > > > -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
> > > > 
> > > > Shouldn't you do this patch earlier in the series, as the
> > > > usb_put_gadget() call could have freed the memory that is being cleared here?
> > > > 
> > > 
> > > If I did it earlier, it would cause dwc3 break if people do 'git bisect', dwc3 issue is
> > > fixed at patch 5.
> > 
> > If you use the patch I posted earlier:
> > 
> > 	https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fmarc.info%2F%3Fl%3Dlinux-usb%26m%3D159605415210351%26w%3D2&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7C84c12532be684ba94c1708d843858e86%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637333588196922016&amp;sdata=gOe5kecj38gR9qIbkfjVkNO%2FICp0bHis30Yi2tomrc8%3D&amp;reserved=0
> > 
> > instead of this one then dwc3 would continue to work correctly during 
> > the intermediate stages of the series.
> > 
> 
> But at last, we don't want below at .release function
> 
> 	memset(dev, 0, sizeof(*dev));
> 
> It still needs another patch to delete it after dwc3 changes,
> and it changes .release function name to usb_udc_zero_release,
> this change may also not be needed.
> 
> Or I only do move memory clear operation at the first patch, and
> delete it at the last patch, it could let the reader not see
> the memory clear operation at the usb_del_gadget during the patch
> series.

One way or another, the existing code is wrong.  I guess the best we can 
do for now is to let it remain wrong during the patch series, rather 
than changing it to be wrong in a different way.

To put it another way, we already run the risk of clearing memory that 
has been freed.  The series does not make that risk any worse, and it 
eventually fixes the problem.

This means your patch should remain in its position at the end of the 
series.

Alan Stern

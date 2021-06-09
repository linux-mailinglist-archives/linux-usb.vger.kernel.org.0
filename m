Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E893A0EB7
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 10:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237661AbhFII2I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 04:28:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235580AbhFII2H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 04:28:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA6536136D;
        Wed,  9 Jun 2021 08:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623227173;
        bh=XDxAElcq4IXebSssmG+9nXQk5QgUC1l+LePJ+RQbZ64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J4Bf2InYRazRzYu/Xt7hf24LdVh8RIKarHjli97HM3AkyDataSFTA8a/u3fw9rFFy
         yxEPxX3klwPSBrnZzWTn0DOtn0KDvdFNHtjsAZlvy5P5zLN/FRy5LoAuiQTRxZDf0w
         JDskDIKC2eyvOKHaAmbQrLxToeQGFhZcewcUIluk=
Date:   Wed, 9 Jun 2021 10:26:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jun Li <jun.li@nxp.com>
Cc:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
Subject: Re: [PATCH] usb: chipidea: udc: assign interrupt number to USB
 gadget structure
Message-ID: <YMB7IzMTj8s12Wig@kroah.com>
References: <1620989984-7653-1-git-send-email-jun.li@nxp.com>
 <YLoFyCyRofg/Jz9r@kroah.com>
 <VI1PR04MB59356EF043AFBFEF160410F6893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <VI1PR04MB5935921F1543147A27C23AA1893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB5935921F1543147A27C23AA1893B9@VI1PR04MB5935.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 11:34:53AM +0000, Jun Li wrote:
> 
> 
> > -----Original Message-----
> > From: Jun Li
> > Sent: Friday, June 4, 2021 7:10 PM
> > To: Greg KH <gregkh@linuxfoundation.org>
> > Cc: peter.chen@kernel.org; linux-usb@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
> > Subject: RE: [PATCH] usb: chipidea: udc: assign interrupt number to USB gadget
> > structure
> > 
> > > -----Original Message-----
> > > From: Greg KH <gregkh@linuxfoundation.org>
> > > Sent: Friday, June 4, 2021 6:52 PM
> > > To: Jun Li <jun.li@nxp.com>
> > > Cc: peter.chen@kernel.org; linux-usb@vger.kernel.org; dl-linux-imx
> > > <linux-imx@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
> > > Subject: Re: [PATCH] usb: chipidea: udc: assign interrupt number to
> > > USB gadget structure
> > >
> > > On Fri, May 14, 2021 at 06:59:44PM +0800, Li Jun wrote:
> > > > Chipidea also need sync interrupt before unbind the udc while gadget
> > > > remove driver, otherwise setup irq handling may happen while unbind,
> > > > see below dump generated from android function switch stress test:
> > > >
> > ...
> > > >
> > >
> > > What commit does this fix?  Should it go to stable kernels, and if so,
> > > how far back?
> > 
> > I will resend the patch with fix tag added.
> 
> Hi Greg,
> 
> I assume this problem may exist all along or very far, but this patch
> need base one commit[1] to fix this problem, so I think that commit is
> the point to know how far this patch can apply back for stable kernels,
> in this case, please let me know if adding fix tag pointing to that commit
> still the right way for this.
> 
> [1] 3c73bc52195d ("usb: gadget: core: sync interrupt before unbind the udc")

Yes, that's fine and the correct way to do it.

thanks,

greg k-h

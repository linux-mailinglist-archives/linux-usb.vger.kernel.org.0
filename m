Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7FD14DCBC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2020 15:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgA3OWn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 09:22:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:37432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727107AbgA3OWn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jan 2020 09:22:43 -0500
Received: from localhost (unknown [84.241.198.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D95E720674;
        Thu, 30 Jan 2020 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580394162;
        bh=HL2XcW3hlVb13HwEQxD5dNVZ2aqbQM5YFJYsSBUrSZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CXcoXdWDLC0kusEKiJYoyCEDdTaSiLgm98IuBA1Q3mTe8UBOoTHBF+YJYDq8BDxeL
         VwmvgTKUmvgTm4GNKLpiY13SbdFlPnAKIYqXSy8PUCWpsDDC/MJoOcixPCljxSoROq
         So2HD8dX29NPPym4xZqlqGg9kvtlHsKbvehdl7ts=
Date:   Thu, 30 Jan 2020 15:22:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v4 1/2] usb: phy: show USB charger type for user
Message-ID: <20200130142239.GA963335@kroah.com>
References: <1579145333-1657-1-git-send-email-peter.chen@nxp.com>
 <20200124084039.GB2923791@kroah.com>
 <VI1PR04MB5327245DEABD688CC88F88548B040@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB5327245DEABD688CC88F88548B040@VI1PR04MB5327.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 30, 2020 at 02:05:17PM +0000, Peter Chen wrote:
>  
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > ---
> > > Changes for v4:
> > > - No changes.
> > >
> > >  drivers/usb/phy/phy.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c index
> > > 0277f62739a2..ad2554630889 100644
> > > --- a/drivers/usb/phy/phy.c
> > > +++ b/drivers/usb/phy/phy.c
> > > @@ -34,6 +34,14 @@ struct phy_devm {
> > >  	struct notifier_block *nb;
> > >  };
> > >
> > > +static const char *const usb_chger_type[] = {
> > > +	[UNKNOWN_TYPE]			=
> > "USB_CHARGER_UNKNOWN_TYPE",
> > > +	[SDP_TYPE]			= "USB_CHARGER_SDP_TYPE",
> > > +	[CDP_TYPE]			= "USB_CHARGER_CDP_TYPE",
> > > +	[DCP_TYPE]			= "USB_CHARGER_DCP_TYPE",
> > > +	[ACA_TYPE]			= "USB_CHARGER_ACA_TYPE",
> > > +};
> > 
> > As these are exported values (CDP_TYPE and friends), they really need to have
> > explicit values on the .h file, otherwise it might not work properly on all systems.
> > 
> 
> Sorry, what do you mean? These values are defined at include/uapi/linux/usb/charger.h

Yes, but they are not set to a specific value, so they can really be
"anything".  That .h file needs to have specific numbers set to the
enum values in order for this to work properly on all arches/compilers.

thanks,

greg k-h

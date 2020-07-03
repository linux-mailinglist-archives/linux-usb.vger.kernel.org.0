Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BE52134DB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgGCHXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:23:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgGCHXd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:23:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 427AE20720;
        Fri,  3 Jul 2020 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593761012;
        bh=DFhW5+PsERQgFDOxQUfWY7tjinQBNQMNXJashXIbOzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=exNxVcehQzf9NsfCa40xsmVkwoxjh3m107GkxK18wSKTk+T2Kf+uSSAc+hlNPxXB7
         B2hcB3/7qK+JjzdWzstSnrQ/7YIgEahDpJfeMoYVG+s72Xr9NERcyQEeZfUIlYWETN
         91SpQm5gLAF0dTXYm1DydvrHfF6HeHncB1ZZifOU=
Date:   Fri, 3 Jul 2020 09:23:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Message-ID: <20200703072336.GA2225285@kroah.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
 <20200703062653.29159-2-peter.chen@nxp.com>
 <20200703070044.GB2220026@kroah.com>
 <20200703071628.GA14348@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703071628.GA14348@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 07:16:19AM +0000, Peter Chen wrote:
> On 20-07-03 09:00:44, Greg KH wrote:
> > On Fri, Jul 03, 2020 at 02:26:45PM +0800, Peter Chen wrote:
> > > Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> > > better we have a unity API to handle both USB2 and USB3's power, it
> > > could simplify code for error handling and further power management
> > > implementation.
> > > 
> > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > ---
> > >  drivers/usb/cdns3/core.c | 44 ++++++++++++++++++++++++++--------------
> > >  1 file changed, 29 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > > index 19bbb5b7e6b6..bfd09aa98c12 100644
> > > --- a/drivers/usb/cdns3/core.c
> > > +++ b/drivers/usb/cdns3/core.c
> > > @@ -384,6 +384,28 @@ static int cdns3_role_set(struct usb_role_switch *sw, enum usb_role role)
> > >  	return ret;
> > >  }
> > >  
> > > +static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)
> > 
> > Please just make function calls self-describing, instead of having to
> > try to remember what a specific flag means.  This isn't as bad as some
> > functions, but the general idea remains, this should be 2 functions:
> > 	set_phy_power_off()
> > 	set_phy_power_on()
> > 
> > no need for the cdns3_ prefix, it's a static function.
> > 
> > Then have those two functions call a helper if you really want to, but
> > that means that reading where those functions are called is obvious and
> > no need to backtrack to where this was declared to determine that the
> > second parameter meant on/off and not is_disabled/not_disabled or
> > something crazy like that.
> > 
> > 
> > 
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	if (on) {
> > > +		ret = phy_power_on(cdns->usb2_phy);
> > 
> > See, phy gets it right.
> > 
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		ret = phy_power_on(cdns->usb3_phy);
> > > +		if (ret) {
> > > +			phy_power_off(cdns->usb2_phy);
> > > +			return ret;
> > > +		}
> > > +	} else {
> > > +		phy_power_off(cdns->usb3_phy);
> > > +		phy_power_off(cdns->usb2_phy);
> > 
> > Ick, even worse, this needs to be 2 separate functions as there is NO
> > common code path here at all.
> > 
> 
> The purpose of this API is adding two PHY (USB2 and USB3) APIs into one
> private APIs since two PHYs power operation are always called together
> and we will have more than one places to call them.

That's fine, just make 2 separate functions that do this, don't combine
it into one that does two totally separate code paths based on a flag
that is passed into it.

thanks,

greg k-h

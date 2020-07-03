Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFE5213490
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgGCHAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgGCHAl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:00:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DA3D20771;
        Fri,  3 Jul 2020 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593759641;
        bh=1WDavdsilEKm5xWoHhjsqrLaLimDNs2dH/OKKPB/hoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j5C8mmGzTZ3JGln/GZm4AY12M1gj2OLtJPKhO3DrEml3jgvwowKVF2cLL1KqsM4gr
         0lsOOlh4eMcnhbIehVCaAtXAlJIQJd74gyQdkwouXXf3VCUTtg2vElJvw7yga3q+1j
         8rzav0usTNm+dfGct0MilTzKeOO34Ebzu9F6vBCQ=
Date:   Fri, 3 Jul 2020 09:00:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com
Subject: Re: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Message-ID: <20200703070044.GB2220026@kroah.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
 <20200703062653.29159-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703062653.29159-2-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 02:26:45PM +0800, Peter Chen wrote:
> Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> better we have a unity API to handle both USB2 and USB3's power, it
> could simplify code for error handling and further power management
> implementation.
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/core.c | 44 ++++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 19bbb5b7e6b6..bfd09aa98c12 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -384,6 +384,28 @@ static int cdns3_role_set(struct usb_role_switch *sw, enum usb_role role)
>  	return ret;
>  }
>  
> +static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)

Please just make function calls self-describing, instead of having to
try to remember what a specific flag means.  This isn't as bad as some
functions, but the general idea remains, this should be 2 functions:
	set_phy_power_off()
	set_phy_power_on()

no need for the cdns3_ prefix, it's a static function.

Then have those two functions call a helper if you really want to, but
that means that reading where those functions are called is obvious and
no need to backtrack to where this was declared to determine that the
second parameter meant on/off and not is_disabled/not_disabled or
something crazy like that.



> +{
> +	int ret = 0;
> +
> +	if (on) {
> +		ret = phy_power_on(cdns->usb2_phy);

See, phy gets it right.

> +		if (ret)
> +			return ret;
> +
> +		ret = phy_power_on(cdns->usb3_phy);
> +		if (ret) {
> +			phy_power_off(cdns->usb2_phy);
> +			return ret;
> +		}
> +	} else {
> +		phy_power_off(cdns->usb3_phy);
> +		phy_power_off(cdns->usb2_phy);

Ick, even worse, this needs to be 2 separate functions as there is NO
common code path here at all.

thanks,

greg k-h

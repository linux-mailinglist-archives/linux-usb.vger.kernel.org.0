Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF8930E03
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2019 14:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfEaMW2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 May 2019 08:22:28 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:36638 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaMW1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 May 2019 08:22:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C8E1C27F93B0;
        Fri, 31 May 2019 14:22:26 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id AVuTUOwU6LyF; Fri, 31 May 2019 14:22:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 66A4E27F950C;
        Fri, 31 May 2019 14:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 66A4E27F950C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1559305341;
        bh=+Chk+EPTaFV4PbLsEOZuz4Z28rO5Nwp46YyP2IeNWR4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=XDvfrOce/Qe9lwATcAbPA/cFhKXg0gslhPlG6SjXGzLFrnD0+LkPVypKonQUI5Ge8
         jN8EAwsrpHtBEalUBGbJvsCi3SvzsOhCspKU/WsNy5WJzRjqykAItRMvTFeIj6mxAQ
         +lu7t4R5EE3mNke/XyWRz8dzIy0OflsZFQH7fGmI=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id dmBIEyfKGQhW; Fri, 31 May 2019 14:22:21 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 4632627F93B0;
        Fri, 31 May 2019 14:22:21 +0200 (CEST)
Date:   Fri, 31 May 2019 14:22:14 +0200
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc2: Use generic PHY width in params setup
Message-ID: <20190531122214.schd4sqv7rfi2bq7@tellis.lin.mbt.kalray.eu>
References: <20190507100852.11263-2-jmaselbas@kalray.eu>
 <20190509091528.28397-1-jmaselbas@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509091528.28397-1-jmaselbas@kalray.eu>
User-Agent: NeoMutt/20180716-1557-a6ba22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

This is a reminder in case you missed this patch.

Kind regards,
Jules

On Thu, May 09, 2019 at 11:15:28AM +0200, Jules Maselbas wrote:
> Setting params.phy_utmi_width in dwc2_lowlevel_hw_init() is pointless since
> it's value will be overwritten by dwc2_init_params().
> 
> This change make sure to take in account the generic PHY width information
> during paraminitialisation, done in dwc2_set_param_phy_utmi_width().
> 
> By doing so, the phy_utmi_width params can still be overrided by
> devicetree specific params and will also be checked against hardware
> capabilities.
> 
> Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_width")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> ---
> v2: Fix typo in commit message. Add Fixes and Tested-by tags.
> ---
>  drivers/usb/dwc2/params.c   | 9 +++++++++
>  drivers/usb/dwc2/platform.c | 9 ---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 6900eea57526..5949262ff669 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -253,6 +253,15 @@ static void dwc2_set_param_phy_utmi_width(struct dwc2_hsotg *hsotg)
>  	val = (hsotg->hw_params.utmi_phy_data_width ==
>  	       GHWCFG4_UTMI_PHY_DATA_WIDTH_8) ? 8 : 16;
>  
> +	if (hsotg->phy) {
> +		/*
> +		 * If using the generic PHY framework, check if the PHY bus
> +		 * width is 8-bit and set the phyif appropriately.
> +		 */
> +		if (phy_get_bus_width(hsotg->phy) == 8)
> +			val = 8;
> +	}
> +
>  	hsotg->params.phy_utmi_width = val;
>  }
>  
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index d10a7f8daec3..e98d7812da2d 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -271,15 +271,6 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>  
>  	hsotg->plat = dev_get_platdata(hsotg->dev);
>  
> -	if (hsotg->phy) {
> -		/*
> -		 * If using the generic PHY framework, check if the PHY bus
> -		 * width is 8-bit and set the phyif appropriately.
> -		 */
> -		if (phy_get_bus_width(hsotg->phy) == 8)
> -			hsotg->params.phy_utmi_width = 8;
> -	}
> -
>  	/* Clock */
>  	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
>  	if (IS_ERR(hsotg->clk)) {
> -- 
> 2.21.0.196.g041f5ea
> 

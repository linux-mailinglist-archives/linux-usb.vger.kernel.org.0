Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60F834A841
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 14:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhCZNjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 09:39:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:36838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230093AbhCZNin (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 09:38:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1126B61879;
        Fri, 26 Mar 2021 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616765922;
        bh=RaQnT4o38sWXYSu1MQkXo9HILmv/f/XBNbspAjPziyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KvoQrwggcpZ+38hPfBWtUHq20c3xgEz9puRti2y2x+KCjS3pDu0KLKtnLEH7Tr4Cj
         4tlsI9x8aZgCQjZ/F0Zve+xHOVeWPFK/j9uQEwKuD+B+lBxUnnTI8pha/hgqZ1MWsK
         ZQ8D2xfsptLjoCgfR25qtUvwVeJXW7RdLNqVLm6c=
Date:   Fri, 26 Mar 2021 14:38:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: core: don't enable wakeup for runtime PM
Message-ID: <YF3j3/FEJ2/iFCBJ@kroah.com>
References: <1616563105-28565-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616563105-28565-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 24, 2021 at 01:18:25PM +0800, Li Jun wrote:
> Don't enable dwc3 core to wakeup system by default if runtime suspended,
> this will make the power domain of dwc3 core or its parent device can't be
> off while system sleep even system wakeup by usb is not required.
> 
> Fixes: fc8bb91bc83e ("usb: dwc3: implement runtime PM")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> Change for v2:
> - Add fix tag and cc to stable kernel.
> 
>  drivers/usb/dwc3/core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 94fdbe502ce9..0bba5c21de56 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1840,8 +1840,6 @@ static int dwc3_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	device_init_wakeup(dev, true);
> -
>  	return 0;
>  }
>  
> @@ -1850,8 +1848,6 @@ static int dwc3_runtime_resume(struct device *dev)
>  	struct dwc3     *dwc = dev_get_drvdata(dev);
>  	int		ret;
>  
> -	device_init_wakeup(dev, false);
> -
>  	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
>  	if (ret)
>  		return ret;
> -- 
> 2.25.1
> 

Can I get some verification by other users of this driver that this
actually fixes something?  I find it odd it's not shown up yet to anyone
else...

thanks,

greg k-h

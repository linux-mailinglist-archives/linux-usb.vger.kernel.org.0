Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6993AABB5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 08:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFQGNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 02:13:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhFQGNA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 02:13:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 595C161019;
        Thu, 17 Jun 2021 06:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623910253;
        bh=G+KMZ3KjXZkyH4VKUrdCgbGvdttOVEsUVcy9eyIAbnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s4OPYF6LYxgLwO5C6eIHbAWuOGClCsaqv4l1GRC+oihulOCC3JxoD/ZWI32KMcRBV
         06uxBVp/KVnNIhGH90szhQx8KRy8sJk4ZWLPVyBCGMSlNBQvO4STaGhYtjTdbIiNJS
         jE7Xm4CAHGJlNDEHF9YxGyiT/kfDbKfEQyydNGnY=
Date:   Thu, 17 Jun 2021 08:10:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix debugfs creation flow
Message-ID: <YMrnaS0EcVQpNpXH@kroah.com>
References: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 16, 2021 at 10:56:02PM -0700, Minas Harutyunyan wrote:
> Creation EP's debugfs called earlier than debugfs folder for dwc3
> device created. As result EP's debugfs are created in '/sys/kernel/debug'
> instead of '/sys/kernel/debug/usb/dwc3.1.auto'.
> 
> Moved dwc3_debugfs_init() function call before calling
> dwc3_core_init_mode() to allow create dwc3 debugfs parent before
> creating EP's debugfs's.
> 
> Fixes: 8562d5bfc0fc ("USB: dwc3: remove debugfs root dentry storage")
> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> ---
>  drivers/usb/dwc3/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index e0a8e796c158..ba74ad7f6995 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1620,17 +1620,18 @@ static int dwc3_probe(struct platform_device *pdev)
>  	}
>  
>  	dwc3_check_params(dwc);
> +	dwc3_debugfs_init(dwc);
>  
>  	ret = dwc3_core_init_mode(dwc);
>  	if (ret)
>  		goto err5;
>  
> -	dwc3_debugfs_init(dwc);
>  	pm_runtime_put(dev);
>  
>  	return 0;
>  
>  err5:
> +	dwc3_debugfs_exit(dwc);
>  	dwc3_event_buffers_cleanup(dwc);
>  
>  	usb_phy_shutdown(dwc->usb2_phy);
> 
> base-commit: 1da8116eb0c5dfc05cfb89896239badb18c4daf3

I thought we fixed this already in usb-next and usb-linus, right?  Where
are you seeing this problem happening?

thanks,

greg k-h

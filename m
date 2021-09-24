Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1F6416D96
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 10:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244685AbhIXIVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 04:21:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244581AbhIXIVI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 04:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F9C361090;
        Fri, 24 Sep 2021 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632471575;
        bh=j+vSA3Y0V/smgE9MwWDNyABdIKkpb0NSjB17vddCwKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2ZEWM4dnakVSJI5Vad6T84jyZU3UbXt94wc5Q0qpTBoom46kKft2cb4t2h03yAqOr
         qSmsxNQ+4zOx+ucfIkzD7AfzDfIf+c6NkR396zqqKO1JC87J/hOg1hOPKf6LuG6rEa
         jeePjimb6egKcfQMJC3SE/entj7CjGJ8xmYLYhcs=
Date:   Fri, 24 Sep 2021 10:19:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Zhiwei Yang <yangzhiwei@uniontech.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: phy: tahvo:replace "%p" with "%pK"
Message-ID: <YU2KFcOWBWU3UsZV@kroah.com>
References: <20210924075913.31584-1-yangzhiwei@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924075913.31584-1-yangzhiwei@uniontech.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 24, 2021 at 03:59:13PM +0800, Zhiwei Yang wrote:
> Use "%pK" to avoid kernel address leaked
> 
> Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
> ---
>  drivers/usb/phy/phy-tahvo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
> index baebb1f5a973..5dc600fadc5f 100644
> --- a/drivers/usb/phy/phy-tahvo.c
> +++ b/drivers/usb/phy/phy-tahvo.c
> @@ -194,7 +194,7 @@ static int tahvo_usb_set_host(struct usb_otg *otg, struct usb_bus *host)
>  	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>  					    phy);
>  
> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, host);
> +	dev_dbg(&tu->pt_dev->dev, "%s %pK\n", __func__, host);
>  
>  	mutex_lock(&tu->serialize);
>  
> @@ -224,7 +224,7 @@ static int tahvo_usb_set_peripheral(struct usb_otg *otg,
>  	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>  					    phy);
>  
> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, gadget);
> +	dev_dbg(&tu->pt_dev->dev, "%s %pK\n", __func__, gadget);
>  
>  	mutex_lock(&tu->serialize);
>  
> -- 
> 2.20.1
> 
> 
> 

Both of these lines should just be removed as ftrace can be (and should
be) used instead for stuff like "did the kernel get to this function?"
that these lines seem to be for.

So can you just resubmit this as removing those lines?

thanks,

greg k-h


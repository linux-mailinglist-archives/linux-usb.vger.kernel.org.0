Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1B6359D2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 11:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfFEJsW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 05:48:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:50862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbfFEJsW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 05:48:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 572B42075C;
        Wed,  5 Jun 2019 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559728101;
        bh=7SIWnOjgiMy1b7rUmC/gSPkhsL7uXGeybj6tOT/Hcec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CHNcmKtAUNao/BKpbzcv3RjI9wl1xJBFmgol4wiEZY5h0w3GDW8NeRLSIqDmNXznl
         E4zIQ5ifFMtgqgzopffpIchNetLax2b2CfJ2uDBa/rwy2VhCfFleXF4/P+6/K9B3J+
         0ZV1UKb+aksfIxwDNxDHo4v9FoKbZawCmCHKQu3A=
Date:   Wed, 5 Jun 2019 11:48:19 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Duyanlin <duyanlin@huawei.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Zengweilin <zengweilin@huawei.com>
Subject: Re: [PATCH] drivers/usb/host/imx21-hcd.c: fix divide-by-zero in func
 nonisoc_etd_done
Message-ID: <20190605094819.GB24282@kroah.com>
References: <1559564879-88739-1-git-send-email-duyanlin@huawei.com>
 <52727B2E0D7DFC4A945AFC14D2E3E5A92211C6FE@dggeml529-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52727B2E0D7DFC4A945AFC14D2E3E5A92211C6FE@dggeml529-mbx.china.huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 02:02:40AM +0000, Duyanlin wrote:
> 
> If the function usb_maxpacket(urb->dev, urb->pipe, usb_pipeout(urb->pipe)) returns 0, that will cause a illegal divide-by-zero operation, unexpected results may occur.
> It is best to ensure that the denominator is non-zero before dividing by zero.

Please wrap your changelog comments at 72 columns.

> Signed-off-by: Yanlin Du <duyanlin@huawei.com>

This name HAS to match the From: line of your email.  For that reason
alone I can not take this patch.

> ---
>  drivers/usb/host/imx21-hcd.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/imx21-hcd.c b/drivers/usb/host/imx21-hcd.c index 6e3dad1..6a47f78 100644
> --- a/drivers/usb/host/imx21-hcd.c
> +++ b/drivers/usb/host/imx21-hcd.c
> @@ -1038,6 +1038,7 @@ static void nonisoc_etd_done(struct usb_hcd *hcd, int etd_num)
>  	int cc;
>  	u32 bytes_xfrd;
>  	int etd_done;
> +	unsigned int maxp;
>  
>  	disactivate_etd(imx21, etd_num);
>  
> @@ -1104,13 +1105,13 @@ static void nonisoc_etd_done(struct usb_hcd *hcd, int etd_num)
>  		break;
>  
>  	case PIPE_BULK:
> +		maxp = usb_maxpacket(urb->dev, urb->pipe,
> +				usb_pipeout(urb->pipe));

How can this ever be 0?  Don't we abort a lot earlier if a pipe length
is 0?

thanks,

greg k-h

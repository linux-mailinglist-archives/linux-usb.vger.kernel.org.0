Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1252481F0
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 11:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgHRJco (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 05:32:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgHRJcn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 05:32:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CA002078B;
        Tue, 18 Aug 2020 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597743162;
        bh=CJKF84bwlgUagqoXRgPcpYTxYPoOrC07nTYTVUSLdtk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pBYqitvUe2uxZu7KgyXeUAVwMUO8R8EkXp0eCo+dCNbUFWmk2IgzsOQ/5OsR3/eQA
         RaaXLT3NRSvywuwcLgNz6eOto6xIRw+pz6pIPFE7b7vCbTmUuL/Lh9yFt1UcP+Mqul
         E9LcLN8m2gMEtOWaABR9hD07E8Qi0D22D+VccBfI=
Date:   Tue, 18 Aug 2020 11:33:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Message-ID: <20200818093305.GA34785@kroah.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810022510.6516-7-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 10:25:10AM +0800, Peter Chen wrote:
> We have already allocated gadget structure dynamically at UDC (dwc3)
> driver, so commit fac323471df6 ("usb: udc: allow adding and removing
> the same gadget device")could be reverted.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes from v1:
> - No changes.
> 
>  drivers/usb/gadget/udc/core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 473e74088b1f..43351b0af569 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
>  {
>  	usb_del_gadget(gadget);
>  	usb_put_gadget(gadget);
> -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));

Shouldn't you do this patch earlier in the series, as the
usb_put_gadget() call could have freed the memory that is being cleared
here?

Otherwise, this series looks good, thanks for doing it.

greg k-h

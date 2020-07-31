Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C873E2344DD
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732689AbgGaLzu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 07:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:51602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732512AbgGaLzu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 07:55:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3285B2245C;
        Fri, 31 Jul 2020 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596196549;
        bh=OkDkFKOa3+CujNapZuZR6KkJKd9OiUv4PIltSXghvzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UWXcZOePOFOkogBuP97IQ8SxyjYp41AulIh+Wi5w/X/vxQk62pe/+3iDkn9Wd+WAf
         Z/yWfe3Q2WK71rh38MWgwpubdDaPzB+2I613A/jjFDj/KPdZkQTaqqf7JDLLuVYCm6
         veJql/h5Yp1P1DI9ecnOLh3xQb4xzwnbTuwEHGH4=
Date:   Fri, 31 Jul 2020 13:55:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Message-ID: <20200731115536.GB1648202@kroah.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731095935.23034-1-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 31, 2020 at 05:59:35PM +0800, Peter Chen wrote:
> Per discussion[1], to avoid UDC driver possible freeing gadget device
> memory before device core finishes using it, we add wait-complete
> mechanism at usb_del_gadget_udc and gadget device .release callback.
> After that, usb_del_gadget_udc will not return back until device
> core finishes using gadget device.

Ick, no, that's a sure way for a deadlock to happen.

Why does the gadget core care about this at all?  It shouldn't.



> 
> For UDC drivers who have own .release callback, it needs to call
> complete(&gadget->done) by themselves, if not, the UDC core will
> handle it by default .release callback usb_gadget_release.
> 
> [1] https://www.spinics.net/lists/linux-usb/msg198790.html
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> If this RFC patch is ok, I will create the formal patches which will change
> UDC drivers who have their own .release function.
> 
>  drivers/usb/gadget/udc/core.c | 14 +++++++++++---
>  include/linux/usb/gadget.h    |  2 ++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index ee226ad802a4..ed141e1a0dcf 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1138,9 +1138,15 @@ static void usb_udc_release(struct device *dev)
>  
>  static const struct attribute_group *usb_udc_attr_groups[];
>  
> -static void usb_udc_nop_release(struct device *dev)
> +static void usb_gadget_release(struct device *dev)
>  {
> +	struct usb_gadget *gadget;
> +
>  	dev_vdbg(dev, "%s\n", __func__);
> +
> +	gadget = container_of(dev, struct usb_gadget, dev);
> +	complete(&gadget->done);
> +	memset(dev, 0x0, sizeof(*dev));

No, the memory should be freed here, not memset.

thanks,

greg k-h

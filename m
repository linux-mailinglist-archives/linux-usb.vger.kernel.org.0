Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4D440492C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 13:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235446AbhIILVZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 07:21:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:39500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234962AbhIILVZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 07:21:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C72061100;
        Thu,  9 Sep 2021 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631186416;
        bh=rV7EhxtfxifE+8V0YSU8AFi9ysMtnkNPldv0QzBJbx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mqEJAo4IKRHE03n2M/PBWn20xudOEMDMDVQzXwxT/UY0iK94ukzIvlxxtMIQEMkPy
         +qAudV9b3eHKcL1fAlsKJt2Rao/R/7Wz//Rl54X7qR7rtqru7SdhB4OpfNmyJmQsWi
         C6Pf2n7DKxfYJJIVTgPvApvT+wjPxy6JhbSZA1n8=
Date:   Thu, 9 Sep 2021 13:20:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: gadget: clear gadget pointer after exit
Message-ID: <YTnt7bZOzHjbOXZW@kroah.com>
References: <1631185963-14873-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631185963-14873-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 09, 2021 at 07:12:43PM +0800, Linyu Yuan wrote:
> change device release function to clear gadget pointer,
> it is just a cleanup change.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: fix comment from Greg Kroah-Hartman and improve commit log
> v3: change commit log, it is just a cleanup change
> 
>  drivers/usb/dwc3/gadget.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 804b505..e2ab5f6 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3 *dwc)
>  
>  static void dwc_gadget_release(struct device *dev)
>  {
> -	struct usb_gadget *gadget = container_of(dev, struct usb_gadget, dev);
> +	struct dwc3 *dwc = dev_get_platdata(dev);
>  
> -	kfree(gadget);
> +	kfree(dwc->gadget);
> +	dwc->gadget = NULL;
>  }
>  
>  /**
> -- 
> 2.7.4
> 

This does not do any functional change, and is not a "cleanup" at all.

If you have code that requires this, wonderful, please submit that as
well, but we can not take changes that do not have in-tree users,
otherwise we could never maintain the kernel at all.  Make this a patch
series with your usage as well.

thanks,

greg k-h

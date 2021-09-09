Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865B6404574
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 08:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351103AbhIIGME (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 02:12:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231176AbhIIGME (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 02:12:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2B0860F93;
        Thu,  9 Sep 2021 06:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631167855;
        bh=LDXAxdkGurnwDGIDZBbQ9aWX6XpUlRaTd1rVL3xP9HQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E6q2Q4aOtkjRYlvapcx0EOujHUR2qUqEskP3/8tzRQBWyzCo538hlKupv3R75A2Pi
         DtBoAs4Aoi2mpuG55EIrANGPBAXvwh19dIzt6kxuyiYLuoa7eo21TViJNzIby0T7MW
         UyymTTSaX30KB9X8eBnuxkxafDm8VC/Wt+T1pvKI=
Date:   Thu, 9 Sep 2021 08:10:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Message-ID: <YTmlbFw9DufQc6gU@kroah.com>
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
> change device release function to clear gadget pointer.

That does not properly describe what and why this change is needed.

> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
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

Are you sure this is the same?

>  
> -	kfree(gadget);
> +	kfree(dwc->gadget);
> +	dwc->gadget = NULL;

Why set this to NULL?  Who cares about this now?  What changed to make
it required?

thanks,

greg k-h

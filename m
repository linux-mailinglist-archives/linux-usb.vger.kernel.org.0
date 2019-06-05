Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0589A35F13
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 16:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfFEOVh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 10:21:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbfFEOVg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 10:21:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD7DE206C3;
        Wed,  5 Jun 2019 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559744496;
        bh=WVBtNhofdnvJkq53voJWvebrCLkrn2IcpEjJMYTbD3c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mULR2d1z0acGiN9m1WRM0rCuDE1IcZROX0NOevHm6j79IABCmJlcMbBvORFnBaV2V
         FMIdQKwxv0Y3nH4jlrgYJ9ndN4pRQZLRLedBcxMoQK3KCJiqJBMYcZ7hHPPu4MPv1N
         cN1O0j75fabr1XaDk5iokhEjtuh6eGRVAPOPqJ4E=
Date:   Wed, 5 Jun 2019 16:21:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Peter.Chen@nxp.com, johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: chipidea: Use dev_err() instead of pr_err()
Message-ID: <20190605142133.GB8803@kroah.com>
References: <20190605130723.9184-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605130723.9184-1-festevam@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 10:07:23AM -0300, Fabio Estevam wrote:
> dev_err() is more appropriate for printing error messages inside
> drivers, so switch to dev_err().
> 
> While at it also add the missing newlines and remove 'device'
> string as the ci_role(ci)->name string will tell if it is host
> or gadget.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Add missing newlines (Johan)
> - Remove 'device' string
> 
>  drivers/usb/chipidea/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 27749ace2d93..92132b35b7fd 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
>  	hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
>  
>  	if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
> -		pr_err("cannot enter in %s device mode", ci_role(ci)->name);
> -		pr_err("lpm = %i", ci->hw_bank.lpm);
> +		dev_err(ci->dev, "cannot enter in %s mode\n",

You changed the string text, why?

thanks,

greg k-h

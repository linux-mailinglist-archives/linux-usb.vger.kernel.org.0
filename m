Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8CAF9539
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 17:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKLQLH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 11:11:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:33922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfKLQLG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 11:11:06 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3F6E21D7F;
        Tue, 12 Nov 2019 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573575066;
        bh=pQA1lT3K9RnpaPdI7+O/qk3qJ+bb7yjK12aPDY7l5+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+e2l42eF/ess4BJJX9qSWnPeHyqU3eLyAamIC40NTfUJzPrWerm9bWGLHW6SD3Qp
         WAQYKMHo6GlQcUuRa0k9I4z3eXbA4zXwAumClzLWS/9yFuD56Dg1pPSiSk0YdgGW4N
         KTKfNjSC5Ch2rXu9aa0EVTBPnz6pSUu46NN5sVos=
Date:   Tue, 12 Nov 2019 17:11:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USBIP: add config dependency for SGL_ALLOC
Message-ID: <20191112161103.GA1702825@kroah.com>
References: <20191112154939.21217-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112154939.21217-1-oneukum@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 12, 2019 at 04:49:39PM +0100, Oliver Neukum wrote:
> USBIP uses lib/scatterlist.h
> Hence it needs to set CONFIG_SGL_ALLOC
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/usbip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/usbip/Kconfig b/drivers/usb/usbip/Kconfig
> index 2f86b28fa3da..7bbae7a08642 100644
> --- a/drivers/usb/usbip/Kconfig
> +++ b/drivers/usb/usbip/Kconfig
> @@ -4,6 +4,7 @@ config USBIP_CORE
>  	tristate "USB/IP support"
>  	depends on NET
>  	select USB_COMMON
> +	select SGL_ALLOC
>  	---help---
>  	  This enables pushing USB packets over IP to allow remote
>  	  machines direct access to USB devices. It provides the
> -- 
> 2.16.4
> 

Heh, I had to do this as part of the backport patch, and I was wondering
why this wasn't triggering in Linus's tree as well...

I'll go queue this up now, thanks!

greg k-h

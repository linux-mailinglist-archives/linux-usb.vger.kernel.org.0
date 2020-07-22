Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618B322956F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 11:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgGVJu5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 05:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:49778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGVJu4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 05:50:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99BD420714;
        Wed, 22 Jul 2020 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595411456;
        bh=2MtnZD3NZOUCwF0s7oq0qG9Sq0GkzGWhQnUybbsF6zE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MPJDZPBxiq/Zlkr9DD0co/pNl0dyLZtclKAN3h6S5tc2b+8teQv+r3TVmyZzW3Dic
         vbUyR74fvvz4zBwBI96wkesY+dnNeq+yuHtGXZ2Lw0RoVDSyopsm22nkwzZSKUiPSV
         gYeAEYyZEZP+ixS9enh0ZTzqs2qNCDSoI4+DGyN0=
Date:   Wed, 22 Jul 2020 11:51:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/2] USB: Fix source path in header
Message-ID: <20200722095102.GA2816153@kroah.com>
References: <20200722094628.4236-1-hadess@hadess.net>
 <20200722094628.4236-2-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722094628.4236-2-hadess@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 11:46:28AM +0200, Bastien Nocera wrote:
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

I can't take patches without any changelog text at all, sorry.

> ---
>  drivers/usb/core/driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index a6187dd2186c..bd346e683af3 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * drivers/usb/driver.c - most of the driver model stuff for usb
> + * drivers/usb/core/driver.c - most of the driver model stuff for usb

Just drop the whole file name, it's not needed at all.

thanks,

greg k-h

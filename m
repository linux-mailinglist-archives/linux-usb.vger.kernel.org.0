Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15566200872
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 14:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730727AbgFSMNU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 08:13:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgFSMNT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 08:13:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A29D7206F1;
        Fri, 19 Jun 2020 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592568799;
        bh=x99C7W2Q/rigDbBqMDFevgxyMwl6NKj83NncB/err6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k6tfrW9ZnkTaBqKztWk4rvnNencpO8gqPUIiO8qJv0i0dNB7GE4LKt3lByvG2HTEo
         OKKE+lbVgrY0nk9Zs1IwkGbN3NkdCSRX8KvhnOIQz5wmpKzNRFOF/ql9RmY03cO6Fz
         aN5l1VDw8HbeDKsCxVeDn32g61GP8GJsmO+x0XXw=
Date:   Fri, 19 Jun 2020 14:13:12 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200619121312.GB965960@kroah.com>
References: <k9XZapJHJVXoO82YNf3IlaNfFbMsR4tzD22KaFWD_x_WL5ksH5DzaCy1knWtCBjSfPWExoNX0f3t4lRVU0UhNiDt4nkxU2juWmEkC4x7P3A=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k9XZapJHJVXoO82YNf3IlaNfFbMsR4tzD22KaFWD_x_WL5ksH5DzaCy1knWtCBjSfPWExoNX0f3t4lRVU0UhNiDt4nkxU2juWmEkC4x7P3A=@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 11:18:31AM +0000, Rob Gill wrote:
> The user tool modinfo is used to get information on kernel modules, including a
> description where it is available.
> 
> This patch adds a brief MODULE_DESCRIPTION to the following modules in driver/usb.
> 
> isight_firmware
> mxuport
> u_ether
> uas
> 
> Signed-off-by: Rob Gill <rrobgill@protonmail.com>
> ---
>  drivers/usb/gadget/function/u_ether.c | 1 +
>  drivers/usb/misc/isight_firmware.c    | 1 +
>  drivers/usb/serial/mxuport.c          | 1 +
>  drivers/usb/storage/uas.c             | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index fbe96ef1a..579ab41c6 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -1180,3 +1180,4 @@ EXPORT_SYMBOL_GPL(gether_disconnect);
> 
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("David Brownell");
> +MODULE_DESCRIPTION("Ethernet-over-USB link layer utilities for Gadget stack");

Is this really "utilities", or just the driver itself for a usb ethernet
gadget?  I know you took this from the top of the file, but is that
still correct?





> diff --git a/drivers/usb/misc/isight_firmware.c b/drivers/usb/misc/isight_firmware.c
> index 4d30095d6..607c90c22 100644
> --- a/drivers/usb/misc/isight_firmware.c
> +++ b/drivers/usb/misc/isight_firmware.c
> @@ -129,3 +129,4 @@ module_usb_driver(isight_firmware_driver);
> 
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
> +MODULE_DESCRIPTION("USB isight camera firmware");

This isn't the firmware itself, but a driver to load the firmware.  So
maybe "USB isight camera firmware loader"?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73A27AA2D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 15:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfG3Nvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 09:51:37 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37794 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727303AbfG3Nvh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jul 2019 09:51:37 -0400
Received: (qmail 1723 invoked by uid 2102); 30 Jul 2019 09:51:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Jul 2019 09:51:36 -0400
Date:   Tue, 30 Jul 2019 09:51:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] usb: host: ohci-tmio: Mark expected switch fall-throughs
In-Reply-To: <20190729222201.GA19408@embeddedor>
Message-ID: <Pine.LNX.4.44L0.1907300951240.1507-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 29 Jul 2019, Gustavo A. R. Silva wrote:

> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: arm):
> 
> drivers/usb/host/ohci-tmio.c: In function ‘tmio_stop_hc’:
> ./include/linux/device.h:1499:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/host/ohci-tmio.c:99:4: note: in expansion of macro ‘dev_err’
>     dev_err(&dev->dev, "Unsupported amount of ports: %d\n", ohci->num_ports);
>     ^~~~~~~
> In file included from drivers/usb/host/ohci-hcd.c:1257:0:
> drivers/usb/host/ohci-tmio.c:100:3: note: here
>    case 3:
>    ^~~~
> drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     pm |= CCR_PM_USBPW3;
>        ^
> drivers/usb/host/ohci-tmio.c:102:3: note: here
>    case 2:
>    ^~~~
> drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     pm |= CCR_PM_USBPW2;
>        ^
> drivers/usb/host/ohci-tmio.c:104:3: note: here
>    case 1:
>    ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-tmio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-tmio.c b/drivers/usb/host/ohci-tmio.c
> index d5a293a707b6..fb6f5e9ae5c6 100644
> --- a/drivers/usb/host/ohci-tmio.c
> +++ b/drivers/usb/host/ohci-tmio.c
> @@ -97,10 +97,13 @@ static void tmio_stop_hc(struct platform_device *dev)
>  	switch (ohci->num_ports) {
>  		default:
>  			dev_err(&dev->dev, "Unsupported amount of ports: %d\n", ohci->num_ports);
> +			/* fall through */
>  		case 3:
>  			pm |= CCR_PM_USBPW3;
> +			/* fall through */
>  		case 2:
>  			pm |= CCR_PM_USBPW2;
> +			/* fall through */
>  		case 1:
>  			pm |= CCR_PM_USBPW1;
>  	}
> 


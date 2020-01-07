Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91C4132FD3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 20:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgAGTrp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 14:47:45 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:48228 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728440AbgAGTro (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 14:47:44 -0500
Received: (qmail 7650 invoked by uid 2102); 7 Jan 2020 14:47:43 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Jan 2020 14:47:43 -0500
Date:   Tue, 7 Jan 2020 14:47:43 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Colin King <colin.king@canonical.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][V3] usb: ohci-da8xx: ensure error return on variable
 error is set
In-Reply-To: <20200107123901.101190-1-colin.king@canonical.com>
Message-ID: <Pine.LNX.4.44L0.2001071447300.1567-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Jan 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an error occurs when calling devm_gpiod_get_optional or
> calling gpiod_to_irq it causes an uninitialized error return in variable
> 'error' to be returned.  Fix this by ensuring the error variable is set
> from da8xx_ohci->oc_gpio and oc_irq.
> 
> Thanks to Dan Carpenter for spotting the uninitialized error in the
> gpiod_to_irq failure case.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: fix typo and grammar in commit message
> V3: fix gpiod_to_irq error case, re-write commit message
> 
> ---
>  drivers/usb/host/ohci-da8xx.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
> index 38183ac438c6..1371b0c249ec 100644
> --- a/drivers/usb/host/ohci-da8xx.c
> +++ b/drivers/usb/host/ohci-da8xx.c
> @@ -415,13 +415,17 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
>  	}
>  
>  	da8xx_ohci->oc_gpio = devm_gpiod_get_optional(dev, "oc", GPIOD_IN);
> -	if (IS_ERR(da8xx_ohci->oc_gpio))
> +	if (IS_ERR(da8xx_ohci->oc_gpio)) {
> +		error = PTR_ERR(da8xx_ohci->oc_gpio);
>  		goto err;
> +	}
>  
>  	if (da8xx_ohci->oc_gpio) {
>  		oc_irq = gpiod_to_irq(da8xx_ohci->oc_gpio);
> -		if (oc_irq < 0)
> +		if (oc_irq < 0) {
> +			error = oc_irq;
>  			goto err;
> +		}
>  
>  		error = devm_request_threaded_irq(dev, oc_irq, NULL,
>  				ohci_da8xx_oc_thread, IRQF_TRIGGER_RISING |

Acked-by: Alan Stern <stern@rowland.harvard.edu>


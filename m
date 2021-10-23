Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE1B4384D1
	for <lists+linux-usb@lfdr.de>; Sat, 23 Oct 2021 20:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhJWS6O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 14:58:14 -0400
Received: from mleia.com ([178.79.152.223]:44280 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230266AbhJWS6O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 14:58:14 -0400
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 Oct 2021 14:58:14 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 5F4C62E1D8;
        Sat, 23 Oct 2021 18:48:20 +0000 (UTC)
Subject: Re: [PATCH 08/10] usb: host: ohci-nxp: fix deferred probing
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-arm-kernel@lists.infradead.org
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
 <20211021191437.8737-9-s.shtylyov@omp.ru>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <c80e73b0-a09e-955e-e3f8-0d940a5e7908@mleia.com>
Date:   Sat, 23 Oct 2021 21:48:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211021191437.8737-9-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20211023_184820_406618_8EDAB838 
X-CRM114-Status: GOOD (  19.15  )
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sergey,

On 10/21/21 10:14 PM, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
> will fail the probe permanently instead of the deferred probing. Switch to
> propagating the error codes upstream...
> 
> Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")

thank you for the change, it is correct per se, however the blamed commit id
is obviously invalid and must be fixed.

The driver has been added 6 years before introduction of the EPROBE_DEFER by
commit d1c3414c2a9d ("drivercore: Add driver probe deferral mechanism"), and
the mechanism in connection to getting an irq was added even later, presumably
in commit 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq"), but
please correct me here.

> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>   drivers/usb/host/ohci-nxp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index afb9c2fc85c3..2492f78da6f1 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -212,7 +212,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0) {
> -		ret = -ENXIO;
> +		ret = irq;
>   		goto fail_resource;
>   	}
>   	if (!irq) {
> 

After an expected correction of the blamed commit id is done:

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

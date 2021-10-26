Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9069F43B981
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 20:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbhJZS2a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 14:28:30 -0400
Received: from mleia.com ([178.79.152.223]:34186 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238269AbhJZS2a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 14:28:30 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 1341E2F042;
        Tue, 26 Oct 2021 18:25:35 +0000 (UTC)
Subject: Re: [PATCH v2 11/22] usb: host: ohci-nxp: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-12-s.shtylyov@omp.ru>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <c1b4a352-97ad-d2da-58ac-480d12d5fd48@mleia.com>
Date:   Tue, 26 Oct 2021 21:25:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211026173943.6829-12-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20211026_182535_097401_AD46D684 
X-CRM114-Status: GOOD (  16.47  )
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sergey,

On 10/26/21 8:39 PM, Sergey Shtylyov wrote:
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
> 
> Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> Changes in version 2:
> - fixed the subject to match the patch;
> - added Alan's ACK.
> 
>   drivers/usb/host/ohci-nxp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 85878e8ad331..afb9c2fc85c3 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -215,6 +215,10 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   		ret = -ENXIO;
>   		goto fail_resource;
>   	}
> +	if (!irq) {
> +		ret = -EINVAL;
> +		goto fail_resource;
> +	}
>   
>   	ohci_nxp_start_hc();
>   	platform_set_drvdata(pdev, hcd);
> 

thank you for the change.

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

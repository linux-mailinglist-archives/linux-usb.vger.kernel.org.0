Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3B3215D40B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 09:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgBNIs5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 03:48:57 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50986 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgBNIs5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Feb 2020 03:48:57 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E8mogu034713;
        Fri, 14 Feb 2020 02:48:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581670130;
        bh=GaCu5POQ1T6riHusnOIyNaM556/nSKKzgDxDiMpND2k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PUWDEDj6WZdbRyEztMwvMuGbkizWPA7/G8Mf/CQ7V8ZYMbSUXLcZiuRpDGPguVSdQ
         l6Os6GhspbIWpSi4dQzbYas7akOOXDhUfRc6OuaTJt1rlbSVFozbg3N9yRY8u1INmK
         W7eoxPM1dXu4u8MewLcrmQBz6YuXIrB904kiMFDc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E8mova101729
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Feb 2020 02:48:50 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 02:48:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 02:48:49 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E8mlwl084809;
        Fri, 14 Feb 2020 02:48:48 -0600
Subject: Re: [PATCH 2/2] usb: cdns3: gadget: toggle cycle bit before reset
 endpoint
To:     Peter Chen <peter.chen@nxp.com>, <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>,
        <pawell@cadence.com>, <gregkh@linuxfoundation.org>,
        <jun.li@nxp.com>
References: <20200214071414.7256-1-peter.chen@nxp.com>
 <20200214071414.7256-3-peter.chen@nxp.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <97bbbf7d-2718-b6a0-2fda-6cac21643dfe@ti.com>
Date:   Fri, 14 Feb 2020 10:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214071414.7256-3-peter.chen@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 14/02/2020 09:14, Peter Chen wrote:
> If there are TRBs pending during clear stall and reset endpoint, the

s/and/or?

> DMA will advance after reset operation, but it doesn't be expected,

s/doesn't/isn't?

> since the data has still not be ready (For OUT, the data has still

s/"has still not be"/"is not yet"

(e.g. for OUT, the data is not yet available).

> not received). After the data is ready, there isn't any interrupt

s/"there isn't any"/"there won't be any"

> since the EP_TRADDR has already points to next TRB entry.

remove "has"

> 
> To fix it, it toggles cyclt bit before reset operation, and restore

s/cyclt/cycle

s/restore/restores

> it after reset, it could keep DMA stopping.

It prevents DMA from getting stuck up?

> 
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>   drivers/usb/cdns3/gadget.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 1d8a2af35bb0..7b6bb96b91d1 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -2595,11 +2595,21 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
>   {
>   	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
>   	struct usb_request *request;
> +	struct cdns3_request *priv_req;
> +	struct cdns3_trb *trb = NULL;
>   	int ret;
>   	int val;
>   
>   	trace_cdns3_halt(priv_ep, 0, 0);
>   
> +	request = cdns3_next_request(&priv_ep->pending_req_list);
> +	if (request) {
> +		priv_req = to_cdns3_request(request);
> +		trb = priv_req->trb;
> +		if (trb)
> +			trb->control = trb->control ^ 1;

use TRB_CYCLE macro instead of 1.

Is it better to toggle this bit or explicitly set/clear it?

> +	}
> +
>   	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>   
>   	/* wait for EPRST cleared */
> @@ -2610,10 +2620,11 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
>   
>   	priv_ep->flags &= ~(EP_STALLED | EP_STALL_PENDING);
>   
> -	request = cdns3_next_request(&priv_ep->pending_req_list);
> -
> -	if (request)
> +	if (request) {
> +		if (trb)
> +			trb->control = trb->control ^ 1;

same here.

>   		cdns3_rearm_transfer(priv_ep, 1);
> +	}
>   
>   	cdns3_start_all_request(priv_dev, priv_ep);
>   	return ret;
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

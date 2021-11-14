Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C51044FBA9
	for <lists+linux-usb@lfdr.de>; Sun, 14 Nov 2021 21:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236301AbhKNVBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Nov 2021 16:01:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22811 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236232AbhKNVBP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Nov 2021 16:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636923498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pnp8pM+/uuwUVD415q7LbGa5W5h6Fo7vf4H24zop064=;
        b=LTHMTCZsWq43yPOh/J8lKO9KvTXvgmaNjGbpGl+PR16iGrTPfS9moG6we7Eue7IR8dYilm
        7NjXdmAfU9YEbTuft5rBfgw4oeXpGJWrdLU/7o2Ue0Bvd+OcfGEMWV9tWAaBuCi1XawyZp
        0sawqTHrFg7M7sO4pd1awN8xjp3Lb2Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-aaY1Q7XSMGWNU5TN6GUZ-Q-1; Sun, 14 Nov 2021 15:58:17 -0500
X-MC-Unique: aaY1Q7XSMGWNU5TN6GUZ-Q-1
Received: by mail-ed1-f72.google.com with SMTP id f4-20020a50e084000000b003db585bc274so12223632edl.17
        for <linux-usb@vger.kernel.org>; Sun, 14 Nov 2021 12:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pnp8pM+/uuwUVD415q7LbGa5W5h6Fo7vf4H24zop064=;
        b=D+1C9oz2+Cefm+LfjesfWMIm2lar4Pt8rmdIoWZyjmn2p1ybq5ZEwt7EmK0Gpd6FEx
         9m0ZsfyQ5xR4s+jwf0IXjefC/s6NtfxAgeZZI8pQEessZvy+A7t6n8VrPmO8oTuix3vI
         yu8ZJ0bAiDtbeis7lP2Hi632PI7R13hW/f0aA1PX5S5TN4b51A90Mu9GLY3urVSjOczF
         +eohnjbrhFfFUU+HyEQOqzdvYq1cf8NSoP8vXePdg+pJ7z9p0l3we37TNmic61Lz4CgG
         dGCiY2XVPT3HEmZkGZygc8ax0Gg+yziNljkIUkfsTJbtS1sLFXVg4fZM0b3yeg+j5HyF
         o+OA==
X-Gm-Message-State: AOAM532FmHMICgzIETgAQ9ZKiFFK3Q1jo3MgBHVtmLZmYYDxH4pTf7EK
        68/BpNjPLhXIjLEotOXwZWmfaKUmV+LE0ORdxyCfwwhl60JyCLUJBGLRd6435dKS5FgH2w+8Tyc
        fqebYrAh91KeExbUiH11e
X-Received: by 2002:a50:d492:: with SMTP id s18mr48552244edi.145.1636923496646;
        Sun, 14 Nov 2021 12:58:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg14BGQiR3vH+syGpF58gTCsuYq8609RRTO6bbqnEexzVDYDB92LyXrOkZY4aJzL0T04ChcA==
X-Received: by 2002:a50:d492:: with SMTP id s18mr48552222edi.145.1636923496528;
        Sun, 14 Nov 2021 12:58:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gb2sm5475548ejc.52.2021.11.14.12.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 12:58:16 -0800 (PST)
Message-ID: <029e4c99-3aa5-fdb8-6ddc-fd3b144e4253@redhat.com>
Date:   Sun, 14 Nov 2021 21:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] usb: dwc3: leave default DMA for PCI devices
Content-Language: en-US
To:     Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc:     balbi@kernel.org, arnd@arndb.de, hch@lst.de, sven@svenpeter.dev,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211113142959.27191-1-fabioaiuto83@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211113142959.27191-1-fabioaiuto83@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/13/21 15:29, Fabio Aiuto wrote:
> in case of a PCI dwc3 controller, leave the default DMA
> mask. Calling of a 64 bit DMA mask breaks the driver on
> cherrytrail based tablets like Cyberbook T116.
> 
> Fixes: 45d39448b4d0 ("usb: dwc3: support 64 bit DMA in platform driver")
> Reported-by: Hans De Goede <hdegoede@redhat.com>
> Tested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>

I can confirm that this fixes things for me to:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/usb/dwc3/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 643239d7d370..f4c09951b517 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1594,9 +1594,11 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	dwc3_get_properties(dwc);
>  
> -	ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(64));
> -	if (ret)
> -		return ret;
> +	if (!dwc->sysdev_is_parent) {
> +		ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(64));
> +		if (ret)
> +			return ret;
> +	}
>  
>  	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
>  	if (IS_ERR(dwc->reset))
> 


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA22118B056
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 10:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgCSJfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 05:35:00 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41694 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgCSJfA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 05:35:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id z22so1025042lfd.8
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NiDnRV7NI9Khqp9ESuBw2nq/wy1BnLikL2FairlQ1dM=;
        b=wTjB6gk+bF7Z2p01tu+RH+sASuqFUmpcZ5axQkNFVM6SpdKeLdsjbek3a0Tr6s5MAW
         K3lZLKJnrtX+Zh/bCVqoRYE2t0dD72o2JsSS5JA1fOOQdjBDrVwVEQ5eoJao+X2WYVnp
         m8/zowwQfzJzRBo/Ew7IGwsv+3kQ/SueOmiTSJgWcYJ177LRLHbOqomdgiy+OsArnXVl
         VPI79zA/ZQ3N8IQThu+GgTpRayrnk5fP85XcxINJ3DIvOSHAyd3ntDGGlJeMGVeFTg0o
         mkELZX3VcaggxH40h/DsLaRY9QCq7YWBa88wfHRwZZ6YA1okOJ5nLzutTcU0h1tPtTnt
         gTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NiDnRV7NI9Khqp9ESuBw2nq/wy1BnLikL2FairlQ1dM=;
        b=ij2euvXQsHhVmjmOYC0reuESZ68/SDZ6MRm+4i6lNXSQ0IKn5CB5EYOwmWKhcInwS5
         6nUJVsAyOrHXsaSiGI1hSZVzswqnvjx+jlKtktdqdrg0icb+RqgY5zeDuqO9ScNpVaqz
         WFLp4zw2G60VXgOdCqgKscsPNxw93Gef/7u3V800NnhEkmR5N3k3HoHzDFxuIO1uiWdZ
         TwtqX5U0PeUD7JU+SmmduueJ554FmQKEKo8HW5ZJTTxAvCTxRavqwWddkHelAe711SG4
         iELv+RpTUmN4xMg3GdoKm4JLkpxp8CAWiZPs3mUN+ZZbAewAOAx9Zn/d24+9n7yzBK/9
         bJQA==
X-Gm-Message-State: ANhLgQ117dFq+vd5RiMKOXK74t7I0MaSwxnQD3RZUHM2+s5/sbyJzgsz
        Ur/NuoQebBap3UmAQ+0EmONmkQ==
X-Google-Smtp-Source: ADFU+vvZw6a8s0/WaXTKL2RvegLchTpAyeAVtitjQsaDhSDP9dTKxN3/cdu+ckUbmo4K7NlBhDdRww==
X-Received: by 2002:ac2:54af:: with SMTP id w15mr1569160lfk.17.1584610497710;
        Thu, 19 Mar 2020 02:34:57 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:461c:252e:e50e:a5fa:f432:89e9? ([2a00:1fa0:461c:252e:e50e:a5fa:f432:89e9])
        by smtp.gmail.com with ESMTPSA id m21sm1066656ljb.89.2020.03.19.02.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 02:34:56 -0700 (PDT)
Subject: Re: [PATCH v2] usb: dwc3: support continuous runtime PM with dual
 role
To:     Martin Kepplinger <martin.kepplinger@puri.sm>, balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, rogerq@ti.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200319084902.24747-1-martin.kepplinger@puri.sm>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7a085229-68a7-d700-1781-14225863a228@cogentembedded.com>
Date:   Thu, 19 Mar 2020 12:34:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319084902.24747-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 19.03.2020 11:49, Martin Kepplinger wrote:

> The DRD module calls dwc3_set_mode() on role switches, i.e. when a device is
> being pugged in. In order to support continuous runtime power management when

     Plugged? :-)

> plugging in / unplugging a cable, we need to call pm_runtime_get() in this path.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
> 
> revision history
> ----------------
> v2: move pm_rumtime calls into workqueue (thanks Roger)
>      remove unrelated documentation patch
> v1: https://lore.kernel.org/linux-usb/ef22f8de-9bfd-c1d5-111c-696f1336dbda@puri.sm/T/
> 
> 
>   drivers/usb/dwc3/core.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 1d85c42b9c67..0c058b2ac21d 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -121,17 +121,19 @@ static void __dwc3_set_mode(struct work_struct *work)
>   	if (dwc->dr_mode != USB_DR_MODE_OTG)
>   		return;
>   
> +	pm_runtime_get(dwc->dev);

    Not get_sync()

> +
>   	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
>   		dwc3_otg_update(dwc, 0);
>   
>   	if (!dwc->desired_dr_role)
> -		return;
> +		goto out;
>   
>   	if (dwc->desired_dr_role == dwc->current_dr_role)
> -		return;
> +		goto out;
>   
>   	if (dwc->desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
> -		return;
> +		goto out;
>   
>   	switch (dwc->current_dr_role) {
>   	case DWC3_GCTL_PRTCAP_HOST:
> @@ -190,6 +192,9 @@ static void __dwc3_set_mode(struct work_struct *work)
>   		break;
>   	}
>   
> +out:
> +	pm_runtime_mark_last_busy(dwc->dev);
> +	pm_runtime_put_autosuspend(dwc->dev);
>   }
>   
>   void dwc3_set_mode(struct dwc3 *dwc, u32 mode)

MBR, Sergei

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8B728DBBA
	for <lists+linux-usb@lfdr.de>; Wed, 14 Oct 2020 10:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgJNIhR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Oct 2020 04:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729472AbgJNIhR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Oct 2020 04:37:17 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE756C051111
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2020 01:37:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a7so2755029lfk.9
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2020 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fdlp1OkYjpA8k3eS7clBSf+ezld3M1TODVaJQo9WX5Q=;
        b=np44jYrcryqxuO52hoPLfQJAh+lcm1zm+1BUExjP+E29qmMK16+KzljnpXftRVnzYJ
         iMa0ygRhdVFFKKs808rV09fkHTdxApqbJUiUIWpKfTk7TB9Rqn0S4xr1zr0sHa+i4jcw
         v5fWJxJiOQL6cUGS0jBiEp+3gxjQhrWavrpkovgQW7Xhz5+8lLzFICWL6D6ary745AyY
         ImfYx68wNqhxVBqb+/PBRi/dhy9zhf0xsf/+fc7Tm6CtHc09QblY3CfyX+YIoHndjreS
         mtk2qM8Rwmg8GjV+WusMR3Abwecxa8gZaQqp9RVFmGdj/xtksT2ulF0i1XY3hXiONmC2
         z5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Fdlp1OkYjpA8k3eS7clBSf+ezld3M1TODVaJQo9WX5Q=;
        b=c+XcrX7taAh95dAI6TG5hxf01yenxXSl0fTSdqDfsAKVKYB3onrlPSqxa3yrIcZ6t+
         yMegRn5zbvOJV+8L6omZ/dn08Vi8ehHoHlQiRZn5tZ8tpU2tCkVcEMpg9cobRgFJRR6y
         30yy/AQKIASPYMRHKQakOvJYYixqCBfXIWzMM3M5rUD/uSfgGbCmAuarO2JiOgTLxslw
         aREzc41Ppo//NcbJ2AsVEQ6PSEjMeggv02G+Q3Jgx2m3o6PCHKCIEtjyTFwW1gdbHolz
         NBewmFjo5UpSxv3X35GIQLITGUIu8I+mHixYq1KyXzrIqdiWSIUQyd84cQtzN+vMje/W
         0WHw==
X-Gm-Message-State: AOAM533k4aHDNcNQpLE0eEmXBsZggZkbajv/9JXE9itnNrFZuTcPOSrN
        11TPpORE/dKqY+T+DVY5Ig1g7QTQYkw=
X-Google-Smtp-Source: ABdhPJzc8tYAr2MQycsibbArnHIaB+kKzSYTQkGccqJDrsovTVJjFSSvKTdjgL5VqkeVA9Xq1t4n/Q==
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr940873lfp.545.1602664635039;
        Wed, 14 Oct 2020 01:37:15 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:81c:8735:1811:e3d4:3826:3ef4? ([2a00:1fa0:81c:8735:1811:e3d4:3826:3ef4])
        by smtp.gmail.com with ESMTPSA id w142sm873316lff.108.2020.10.14.01.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:37:14 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] usb: dwc3: Pass quirk as platform data
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
References: <cover.1602592488.git.joglekar@synopsys.com>
 <b3dbe5d9de39fb5105b8474e9c560917a78e2c63.1602592488.git.joglekar@synopsys.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <29322e22-3b5b-037d-82ba-8e8ac28cd325@gmail.com>
Date:   Wed, 14 Oct 2020 11:37:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <b3dbe5d9de39fb5105b8474e9c560917a78e2c63.1602592488.git.joglekar@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 13.10.2020 15:44, Tejas Joglekar wrote:

> This commit adds the platform device data to setup
> the XHCI_SG_TRB_CACHE_SIZE_QUIRK quirk. DWC3 hosts
> which are PCI devices does not use OF to create platform device
> but create xhci-plat platform device runtime. So
                                       ^ at

> this patch allow parent device to supply the quirk

    Allows.

> through platform data.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>   drivers/usb/dwc3/host.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index e195176580de..dd7c742333f7 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,15 @@
>   #include <linux/platform_device.h>
>   
>   #include "core.h"
> +#include "../host/xhci-plat.h"
> +
> +static const struct xhci_plat_priv dwc3_pdata = {
> +	.plat_start = NULL,
> +	.init_quirk = NULL,
> +	.suspend_quirk = NULL,
> +	.resume_quirk = NULL,

    Why not rely on the compiler to fill these with zeros?

> +	.quirks = XHCI_SG_TRB_CACHE_SIZE_QUIRK,
> +};
>   
>   static int dwc3_host_get_irq(struct dwc3 *dwc)
>   {
[...]

MBR, Sergei

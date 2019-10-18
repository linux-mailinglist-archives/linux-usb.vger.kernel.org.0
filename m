Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5351FDC832
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 17:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407936AbfJRPNd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 11:13:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52367 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393855AbfJRPNd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 11:13:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so6581087wmh.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 08:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AHVlwZpI1Il/Mqw6Whn6SsJXtUVGoCQg7RQm3GpCU6s=;
        b=BRD9OW0vAiNtbAMQho9TNo/oLkFN3Ti52s5V5g//wIE5xZuwDIfQSXpD1t7cVNca0+
         wGhJmGjaHla/gGSFoxo+NO1BIFkk9Xaz+eiAwMxwNTGZjz1OlKIKNe521OYUJQUhuDZ2
         4fdeZIjrdQkeQlvD2XwAPeiqRCWgmULRXGYSt/kLshUC6IkZsVO5FOYfS5lByA/zde3Q
         C/CptlLn+4frIu/tCGJ+HKmN6pXpNgSeYRtELe4t27bLsmy8imh8kAPPjZS1NP9cXzGD
         ZJrbZC0IJIEYcEFlG3pNQ+XrrrqxXdPSRWF1Uc+VFbburBiotqi83MadBR8wWEG9VsQn
         LGcg==
X-Gm-Message-State: APjAAAXc8HJx0inAfEXlPsakjiv2+Ovx7e5z1q05UM5K4f60jA1Lvj9T
        c360J9+J95i3Edrf6xe7gvXKyOwy
X-Google-Smtp-Source: APXvYqwcvkqhcUWuo3M+OuMNXaKmtLhTIrzgi8qm/6r6qECWEfupQpPInIoo0jqmPpSTlAJAU8KP/w==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr7832065wml.83.1571411611467;
        Fri, 18 Oct 2019 08:13:31 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id h17sm6380334wme.6.2019.10.18.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 08:13:30 -0700 (PDT)
Message-ID: <c90a79b56ac3d13b79db4f4b3206be71232df147.camel@andred.net>
Subject: Re: [PATCH 1/3] usb: chipidea: imx: change hsic power regulator as
 optional
From:   =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Fri, 18 Oct 2019 16:13:30 +0100
In-Reply-To: <20191011054129.20502-1-peter.chen@nxp.com>
References: <20191011054129.20502-1-peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter,

Thank you for this series, I was out so I will test it early next week
and report.


Cheers,
Andre'


On Fri, 2019-10-11 at 05:42 +0000, Peter Chen wrote:
> Not every platform needs this regulator.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 16700170bc34..25a38ed27aa8 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -359,7 +359,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  			return PTR_ERR(data->pinctrl_hsic_active);
>  		}
>  
> -		data->hsic_pad_regulator = devm_regulator_get(dev, "hsic");
> +		data->hsic_pad_regulator =
> +				devm_regulator_get_optional(dev, "hsic");
>  		if (PTR_ERR(data->hsic_pad_regulator) == -EPROBE_DEFER) {
>  			return -EPROBE_DEFER;
>  		} else if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {


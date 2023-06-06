Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F75723E04
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jun 2023 11:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbjFFJme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jun 2023 05:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236621AbjFFJmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jun 2023 05:42:15 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F87A10D5
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 02:41:54 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so21261605e9.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Jun 2023 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686044513; x=1688636513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mw1OtvOTs4pqnPQwqkGs6h9kUAoFI81KHh1ZGaOg3OM=;
        b=xM8SOEUNXYgI2yKBIXfmL1zvOScv2PHece9Ks5ICvbTDZy8mXmukMW7svRDcCOZV8F
         EdaG+eQILS3cJZmaLrKpvHCJTbFd4KHRnOThflr9zMXG7dgBoWiaK0bjaP03FkEpEEG7
         U4CMpVSVhHILfdMiJDx3Kne0HR+SsBF6ClugcJrL8l8nwuxVoDA2aadZm6QZAFD7OnnB
         UHQJJBmLoRFohJLSPKfWCGlobj6N3XshBfbF0yiKRKgHJjB/BpXjyXyLEe+dyGMuJlBi
         nSdB/OgiaC3WkxGXtK3WkCIBKpYQ+LaBNyAhgLZoOadCOOiw1SQZC9991M7Xuri4SXTQ
         4Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044513; x=1688636513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw1OtvOTs4pqnPQwqkGs6h9kUAoFI81KHh1ZGaOg3OM=;
        b=Z+BXwSPZHY3idU49QYBuap5ddONVr21KVXehZ26Q+3/2uEqJUgX+ZO+rtN5TWVha9y
         MDNZ2vxvbjakqC1+DY8MZTe3bdzy59z5VUEwRlWbhJG0phu2t9aNgjXtkRbqKqHBGCdh
         smrlXiC8J1R8pVjjQI4eyPVkJTrRHRKKQCOxGpkN8r40h+hjLpTfW5ydy+H7yfV+zR/2
         VVv3g0Zdf2ybJ5dh9QY71I7FwQXhyYqU+iDvYL+x88XlRC8h0wkdZtXylhJTo4qPZ5Q8
         GTb6NBo4TRmY8Ofr0Xn0b0pf1DmjW3TYaJ90M6AAVaAcFdqeg8KApeeVCRHtoAYpG4XE
         342A==
X-Gm-Message-State: AC+VfDwqKUQEW/r9IsNphBst6Mw1/qV+SncEqDa305PKzW/Z0HWf6o1Y
        TA57+0fI9kDbzdVXeLR/vTZODw==
X-Google-Smtp-Source: ACHHUZ79oYF1EX46QtpLLI7AAjVK4DSEivHLKCQuiAKUhGKLWhpCNXspc4d8JmOr1K4nKnwXlfi4eg==
X-Received: by 2002:a7b:c30c:0:b0:3f7:310a:3ffc with SMTP id k12-20020a7bc30c000000b003f7310a3ffcmr1628911wmj.5.1686044513160;
        Tue, 06 Jun 2023 02:41:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g11-20020a7bc4cb000000b003f735ba7736sm8748460wmk.46.2023.06.06.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:41:51 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:41:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Raviteja Garimella <raviteja.garimella@broadcom.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/snps_udc_plat: Fix a signedness bug in probe
Message-ID: <2b40b7b9-af84-4165-9115-c006c707bd79@kadam.mountain>
References: <ZH7sIkbSZg1rAJpJ@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7sIkbSZg1rAJpJ@moroto>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 06, 2023 at 11:19:46AM +0300, Dan Carpenter wrote:
> The irq_of_parse_and_map() function returns negative error codes
> but "udc->irq" is an unsigned int so the error handling doesn't work.
> 
> Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/gadget/udc/snps_udc_plat.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
> index 0ed685db149d..37edd6c35077 100644
> --- a/drivers/usb/gadget/udc/snps_udc_plat.c
> +++ b/drivers/usb/gadget/udc/snps_udc_plat.c
> @@ -103,7 +103,7 @@ static int udc_plat_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct udc *udc;
> -	int ret;
> +	int irq, ret;
>  
>  	udc = devm_kzalloc(dev, sizeof(*udc), GFP_KERNEL);
>  	if (!udc)
> @@ -132,11 +132,12 @@ static int udc_plat_probe(struct platform_device *pdev)
>  
>  	udc->phys_addr = (unsigned long)res->start;
>  
> -	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
> -	if (udc->irq <= 0) {
> +	irq = irq_of_parse_and_map(dev->of_node, 0);
> +	if (irq <= 0) {

Oops.  It turns out that irq_of_parse_and_map() returns zero on error,
not negatives so this patch isn't needed and probably the correct thing
is to change the error check to if (!irq) { instead.

regards,
dan carpenter


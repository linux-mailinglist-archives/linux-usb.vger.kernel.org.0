Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB13C3D708
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 21:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405563AbfFKTkx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jun 2019 15:40:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32976 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391090AbfFKTkx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jun 2019 15:40:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id x15so8099080pfq.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2019 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Tl9Z0NsfgrApufoe2WUbK2OeIisauNIixsAGf/fSmk=;
        b=vsAEGERkAaoThhFQXBii705fmbt72E/99Uu7FZajp8SUf8GTc9LlYBfAC9HjBDp5sL
         4EKL6GI9Rp7rOn2WJp0TItbwY1VpF5bcED6xmFO6HO1yjnxBmgJQRVff+Szsd7nDo52k
         o1KbxC6jfKkSBlesArxZfIgVWHOPkeVNKjzoOo2dLBfe0tMVlsJMNhicCRnqqzah4M1p
         nQ+X+wveo4NUY1wN8RdZqJ6VXO8ZpGZsQhfe115nX9JanaBCN6VcbYPC8c0LrFdvg90V
         DNFLgkX/ED/WENER8nOIEnsilSeYqIY4TNFJg1PXRtIJq4SgPMjABUQl+T2ZO2lY8t8G
         +ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Tl9Z0NsfgrApufoe2WUbK2OeIisauNIixsAGf/fSmk=;
        b=jlVXgY6ysQvvIkDXsrn9fQZ0XTehlfdVCp1amqYrwBjiYQHegcwRrp+37yJWUfo08N
         56G7/UmflFKl4bqmxMo726475QLQplc+++dZKCUgFsykYwWOCbA3x8a8rtI5H6pE3+jL
         l7wMhqYOVaeNOI5XeQAiE3Baa5eYhgjVSvJxvVSIYz0r7MgoC3rgQIKqjZEkU+f07Rrn
         xQKiQIrvaYLi8zWaupDAHoHkFVBhZ7AnoB/pVHu8UFN30VfDRTdmsuKhvxbxQEvxREaz
         ZilCH8wB7NR9uxSQqsGyTT2EbP3X/auNBz9dWJzg8G+1bjagEHt1TJgEYXZcDqtXFQbh
         UDJQ==
X-Gm-Message-State: APjAAAVfsR7wtOSZaxZyI0NwCalhNGWmbUAOFwSAG7/hcBPri7lkiI7h
        KxFn+Lh9B+w3o0ChTOQTH0xSxg==
X-Google-Smtp-Source: APXvYqzXVcc6fXXOJJq5bogayd4145zzm/qfoD7KDrsL3o2QfDRsySAjhmLpJFJJtPni27dVTOe/2Q==
X-Received: by 2002:a62:2a0a:: with SMTP id q10mr77972329pfq.79.1560282051640;
        Tue, 11 Jun 2019 12:40:51 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c133sm18710319pfb.111.2019.06.11.12.40.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 12:40:51 -0700 (PDT)
Date:   Tue, 11 Jun 2019 12:40:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] i2c: i2c-qcom-geni: Signify successful driver
 probe
Message-ID: <20190611194048.GR4814@minitux>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190610084213.1052-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610084213.1052-2-lee.jones@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 10 Jun 01:42 PDT 2019, Lee Jones wrote:

> The Qualcomm Geni I2C driver currently probes silently which can be
> confusing when debugging potential issues.  Add a low level (INFO)
> print when each I2C controller is successfully initially set-up.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 9e3b8a98688d..a89bfce5388e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -596,6 +596,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> +
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 

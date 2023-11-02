Return-Path: <linux-usb+bounces-2464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4A7DF75F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 17:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947CD281C0B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 16:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9330D1D6A6;
	Thu,  2 Nov 2023 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0kV1cxg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF7C1CF90
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 16:07:06 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9080137
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 09:07:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a98517f3so1334069e87.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698941219; x=1699546019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8E6OeBpp2Nw5yhR7KvCSLiTOkbzsJNh7XdGehlNCap0=;
        b=w0kV1cxgdO6Q2demWTudaTzokyjn1ExUzSDzkEwkqdusoBP6MP95FESayN/+FXPN+o
         NvQwtP8N5n9c/g6VAXa9WPkptzmVIAkIhEpr1U93wkq8//1eRAezfKghABvsQ9sWU/Xb
         5jVmEnEwk8Gik39D46Pw7rXIzRnrF4aCb2YEz+ghgoNJ30gPx8xEqS6bY1cnCYA43keu
         yVHPufrV5Xd8jJe3kOIpFbkgv1W0qqS64v8KVZ8AcRnb6f/4ydUkYnHY+VGk1iv1mA7M
         FZ4w1IJFNChn/mQN+HbRilUC55qeF+av0KgnYkvJACARtqywU9B/3arNuDi3ZJ32MHpz
         YKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698941219; x=1699546019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8E6OeBpp2Nw5yhR7KvCSLiTOkbzsJNh7XdGehlNCap0=;
        b=MLlQ64yKhBK4qG4HvygcRveh2XnLeoovYTy1bjG0HQYpI7vq4wMuq4QlYe1RmoicA1
         Izk8aCP+VxTpTyCxO4jZ9g9VEIGEbDr2SIRIB7mVVcmKH4SiB0UYvOBItsmJma0hkSDC
         Ek/NDN7JyzNnqEoeQn241EL5ItZszRYnMwXtPnE5ZuGN8LYqb+8kvrQqS+axG+zn1Qau
         fagwd6GOVn2ZJdXaP3zO4HF/iEJZ42J+yaAo5TpF7/jwMfmF7R7YbJJnLUVLAzuknB/P
         EnHLNXbohYDvXXYRCkXEYhZ7cMI4RH+61m5ko4QfNF0JRncQ1Sa/h3JhV7x07wXTXJ9I
         JgIQ==
X-Gm-Message-State: AOJu0YzgceYZsM1YaHDKL+YCrTUX4KCpKDzuibJ31+Tg0gk1R5Sm6x+1
	jqOBUDluE1fWfKNq1s1wllfQWw==
X-Google-Smtp-Source: AGHT+IERusrAEl2wCCk+nZGgKzy1aZ+jO07Yst4DCgg7p/Ws1QjPmha88uJz6Mc/GI2rpyEOhAAyaQ==
X-Received: by 2002:a05:6512:48d1:b0:500:bf33:3add with SMTP id er17-20020a05651248d100b00500bf333addmr13431425lfb.47.1698941218773;
        Thu, 02 Nov 2023 09:06:58 -0700 (PDT)
Received: from [192.168.67.140] (92.40.204.238.threembb.co.uk. [92.40.204.238])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d4903000000b0032d8034724esm2793705wrq.94.2023.11.02.09.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 09:06:57 -0700 (PDT)
Message-ID: <ba16e523-82cf-47a3-8ed3-24ef116faf66@linaro.org>
Date: Thu, 2 Nov 2023 16:06:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: eud: Add IRQ check for platform_get_irq()
Content-Language: en-US
To: Chen Ni <nichen@iscas.ac.cn>, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, quic_schowdhu@quicinc.com,
 gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231102075113.1043358-1-nichen@iscas.ac.cn>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20231102075113.1043358-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/11/2023 07:51, Chen Ni wrote:
> The function eud_probe() should check the return value of
> platform_get_irq() for errors so as to not pass a negative value to
> the devm_request_threaded_irq().
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   drivers/usb/misc/qcom_eud.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 7f371ea1248c..26e9b8749d8a 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -205,6 +205,9 @@ static int eud_probe(struct platform_device *pdev)
>   		return PTR_ERR(chip->mode_mgr);
>   
>   	chip->irq = platform_get_irq(pdev, 0);
> +	if (chip->irq < 0)
> +		return chip->irq;
> +
>   	ret = devm_request_threaded_irq(&pdev->dev, chip->irq, handle_eud_irq,
>   			handle_eud_irq_thread, IRQF_ONESHOT, NULL, chip);
>   	if (ret)

-- 
// Caleb (they/them)


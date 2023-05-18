Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D95707D6C
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 11:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjERJ5p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjERJ5o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 05:57:44 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D36E54
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 02:57:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ac735fee70so12551881fa.0
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684403859; x=1686995859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NG81Hvhp9Jezbz57sI5ty/V2MncOzknsBAnNjODvXNA=;
        b=QYRU1OuSfJALtMZbzZJcWOzE/EUpPp5XHN32GeUBGSqA0qFvrN8OEjIvlnn8ZdZc0w
         hf6CvAEGrssbe0tpBeeFgKLnRvB+7d/Kl+45c3FHENhJmp1KgWLxDcwgAR5cQayXjs+Z
         FSvrXb6Ulg1vVUkXilSIMtK95cDtN4UDtz+5Pw7gwTrKOBXbRtNnp0Yc6jAkuDmRhtPC
         46grWegzyv8+5zDjTHWnjhx2uzZMA3lRgTDA80RA7OHCH9Exw+vC91NJSeER33S2SVLn
         gd1cAEAEsNSD2RU4ZREFNcmKKPPsCl9e4eCCQQtZ/wxbw3pkRelCiISmqV59iYI8OpJu
         PZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403859; x=1686995859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NG81Hvhp9Jezbz57sI5ty/V2MncOzknsBAnNjODvXNA=;
        b=bbeQ6uCpXGeaUIN+edBaiSXlS33dCBHzKBwkT/wEX6ctjRv8iIxrxQYbsSXXwXa27F
         9odpTZfNQ+8Ni1zaF8NiAsxNyFuxxjjfb+nFVks3G+0JWIobQx8f7FGwZFw7T8kqNuhD
         LBrkNPF6bo00r1qW8MMDGPKwNAUXoKi3ktLJem2DS4j8QxWZn3JYU8V8uUxc8Em1L9aE
         rJoE9PkeuCIyPZEcZ8rbFQrvx3RWt0pqPr99NXWcLnFHBI6ocFruNVjwR3Seprfyi/u8
         YKzfbRXeLTiummXiLDtPBNaKh4x4d08JOWYNYkvaUFm8t+7EDgax15B109YykMzLSKs3
         SCzA==
X-Gm-Message-State: AC+VfDwXlBI1r3MU6RlgW9pluvty6KriozaZTaI3w9MrSl/BgDqajtFh
        JFAnPTKe0XqdC//2qe+D0moAGcMVzM5Shegw+Cc=
X-Google-Smtp-Source: ACHHUZ4lC3/7Pro9CW/fHIqUqGj2sbVcmgowiYOEovSX41gP8cjF3fT5zknO5kTxsircC8umKQTVNg==
X-Received: by 2002:a2e:a4a6:0:b0:2a8:ea26:5c72 with SMTP id g6-20020a2ea4a6000000b002a8ea265c72mr2138143ljm.8.1684403858977;
        Thu, 18 May 2023 02:57:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y7-20020a2e9d47000000b002a8d01905f7sm201013ljj.101.2023.05.18.02.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 02:57:38 -0700 (PDT)
Message-ID: <c811fe35-0930-ea38-5afa-0fceb8ee1837@linaro.org>
Date:   Thu, 18 May 2023 11:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 86/97] usb: misc: eud: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 18.05.2023 01:02, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/usb/misc/qcom_eud.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index b7f13df00764..0dc414463759 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -217,7 +217,7 @@ static int eud_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int eud_remove(struct platform_device *pdev)
> +static void eud_remove(struct platform_device *pdev)
>  {
>  	struct eud_chip *chip = platform_get_drvdata(pdev);
>  
> @@ -226,8 +226,6 @@ static int eud_remove(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, false);
>  	disable_irq_wake(chip->irq);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id eud_dt_match[] = {
> @@ -238,7 +236,7 @@ MODULE_DEVICE_TABLE(of, eud_dt_match);
>  
>  static struct platform_driver eud_driver = {
>  	.probe	= eud_probe,
> -	.remove	= eud_remove,
> +	.remove_new = eud_remove,
>  	.driver	= {
>  		.name = "qcom_eud",
>  		.dev_groups = eud_groups,

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B15707F0A
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 13:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjERLUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 07:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjERLUM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 07:20:12 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54F5B7
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 04:20:10 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso1870191f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684408809; x=1687000809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxF1l8hAePkD+mRkldvUwtkzEpP3z15LrS4E6Wh3Mpk=;
        b=YiDP7bUAzi3tXO4OHiCQ8qi+MfVoRlHXiBTGFaeeRiBn2TOAgkhAmF1KtzIRz6bn/u
         NoHdY3b1HTKMoxLefDsg14dE6Vq4FMFMebeYf+lekzRZjlI26rK9QXEiaIunhKOsnktP
         tC/UWvmnsINPqvVJSFNdjNMoaL7DhiVDe2j1whJ4iscdgK4cE27Og/svd7WNEhhcOuCt
         gIz76r4OSILRKq3hl0XDHvO50vLeZ6fkUiDrRzyWb758thcAAOGdznkVsExPk7hBzyCL
         IGFu62YMzub0cLkrvxq2iqQQE/bZz2AEjPfb2J4ZZ0Dfo3GBtTrY9+9+mJbyu2pCL2wL
         7Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684408809; x=1687000809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxF1l8hAePkD+mRkldvUwtkzEpP3z15LrS4E6Wh3Mpk=;
        b=f0+jfLgxjJot0vk/DiFb3FYJ76Hp3B62Hsb34jv1xaGK/d8PmRU47UHM/s9GPOhQSS
         4JwCR16r1waUCR2oRDB0r6zKkwjjQgmKsB3MVVAu801Ea6kpVwd0iaID8ndkhh34xuZW
         5acXOWNeoXLlHxAoE9QzmstPw7akE4/c7RGCK+BNflPWG1XaMx4cU2BrDsGqLmW4PLZb
         MfTl1QT6FPT0pDm8+RpXJ9M2yTamRKeBVPBwJq3UbFZGMDXPtz7X3a2kYZqm38xupt2/
         BnYakz9iTxwN0bwBMKcTfxvQwuHYT0G4WNB8/1DKYhWorgmND0PkOURaAKfGmJWvA5yW
         IasQ==
X-Gm-Message-State: AC+VfDzOh34NQaI5Q6JANMDpH9+wLDbaiBbEsHqeVNvp3CVd3Jt8KzQe
        5uLQOHvVV/5Vo10liDRd8zjZ4g==
X-Google-Smtp-Source: ACHHUZ75MeA/lDudrX1feJ6pEI6M6r3xDT/OLyIFAO/dexvKDk++DV8oZZBPa/EZVH2Bf61rugmP4Q==
X-Received: by 2002:a05:6000:1a47:b0:306:27c4:448 with SMTP id t7-20020a0560001a4700b0030627c40448mr1373565wry.7.1684408809271;
        Thu, 18 May 2023 04:20:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z13-20020adff1cd000000b003063176ef0dsm1804775wro.97.2023.05.18.04.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 04:20:08 -0700 (PDT)
Message-ID: <9d98fd90-5a7d-1385-1335-04240bbafde7@linaro.org>
Date:   Thu, 18 May 2023 12:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 92/97] usb: typec: qcom-pmic-typec: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/05/2023 00:02, Uwe Kleine-König wrote:
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
>   drivers/usb/typec/qcom-pmic-typec.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
> index 432ea62f1bab..924af87fb26d 100644
> --- a/drivers/usb/typec/qcom-pmic-typec.c
> +++ b/drivers/usb/typec/qcom-pmic-typec.c
> @@ -228,7 +228,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int qcom_pmic_typec_remove(struct platform_device *pdev)
> +static void qcom_pmic_typec_remove(struct platform_device *pdev)
>   {
>   	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
>   
> @@ -237,8 +237,6 @@ static int qcom_pmic_typec_remove(struct platform_device *pdev)
>   
>   	typec_unregister_port(qcom_usb->port);
>   	usb_role_switch_put(qcom_usb->role_sw);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id qcom_pmic_typec_table[] = {
> @@ -253,7 +251,7 @@ static struct platform_driver qcom_pmic_typec = {
>   		.of_match_table = qcom_pmic_typec_table,
>   	},
>   	.probe = qcom_pmic_typec_probe,
> -	.remove = qcom_pmic_typec_remove,
> +	.remove_new = qcom_pmic_typec_remove,
>   };
>   module_platform_driver(qcom_pmic_typec);
>   

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

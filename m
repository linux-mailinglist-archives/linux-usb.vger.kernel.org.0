Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822B5702BE2
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 13:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241578AbjEOLyp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 07:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241304AbjEOLy2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 07:54:28 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A84426BD
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 04:42:27 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f41d087b3bso96411765e9.0
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684150945; x=1686742945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LD5Rvc3k/RtIbhopk19Y3M9HNSW6Y86XANxNzfI2Io=;
        b=xiqjFttHxg0o83PmsBCpWxnbssUkfwGFFEOvU1JCzaVuo9xvQ02OoYilbsUnl2UX5x
         l1SmeMnXrkVgaQE9OanM/TZhWD8jAoTFHUBIWCIpfmC1hScdLlJyHtgGj5a241rq0R42
         xaIYIR4KbpfOHe8/SIl2u/numC1CfWN8kSfKVFJ/VEGwVZf9FUJPo/S+LfonA4DYdp+W
         otPoUgh+YQeQNfqufcF5yQB/Hji9L3BTXlounauxi4iUfWyNuzo845rVdoQDxK3Pc+gf
         fNYtd/xmmTqj3fOZROuXBK1GNyeSO1CtFzC/sWRC3Xy7grHBjQAvDi0BEFTOoUo9EmWD
         dXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150945; x=1686742945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LD5Rvc3k/RtIbhopk19Y3M9HNSW6Y86XANxNzfI2Io=;
        b=fKs/yEZogxiuX7a1+emF+ACpzsfkt4tkDq89Fj2W8TJqsr/+IW5tK49FtazSYw5GKf
         FMKJjkKd4BeljWMRXnnUEPT2//y6rmKR3rwoFkogwoyUjooXw8V9PZwiWwf7FhtH1tHu
         gYPDRXOqbzs8EmSpfq/O/QeAiPMPM8OmedTu5rS6ntzqfZ0DV1AL4wULSlKd7AKc8Qvm
         9A3hKPA2YOW4I08GzeD85rd+W5EuFMLszasco0awx3IyQBGRbJ0AmwWceMP8UsRt3dqI
         xqtdhPsQ3PlQAnGlt9QkQIkjg39GSNa+otdPQIEs9pfpV5DcvybBRFH3B8/jjpqF9jn/
         aoVg==
X-Gm-Message-State: AC+VfDy+NlTE+R6/FBtUr/PeYiIukgdMQqTYlz3g3KhvN2SrDU0/NIuY
        ZA+mX2B2cbRb2WQPCCmui1GnDw==
X-Google-Smtp-Source: ACHHUZ7i7eP2RR9RrR6RUzHCndr3cNcP7Q7FqrLZqJzXW3kEDrPonEIAsGYQV8ySK0NlcDWIO97Isw==
X-Received: by 2002:a05:600c:2201:b0:3f4:253b:92ae with SMTP id z1-20020a05600c220100b003f4253b92aemr16922436wml.0.1684150945549;
        Mon, 15 May 2023 04:42:25 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c229100b003f423a04016sm24545869wmf.18.2023.05.15.04.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 04:42:24 -0700 (PDT)
Message-ID: <54aaec74-c3a0-563d-5eda-a583782c2f57@linaro.org>
Date:   Mon, 15 May 2023 12:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] usb: typec: qcom: set pm8150b_typec_res
 storage-class-specifier to static
Content-Language: en-US
To:     Tom Rix <trix@redhat.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230515114043.3452010-1-trix@redhat.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230515114043.3452010-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/05/2023 12:40, Tom Rix wrote:
> smatch reports
> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:323:29: warning: symbol
>    'pm8150b_typec_res' was not declared. Should it be static?
> 
> This variable is only used in its defining file, so it should be static
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 191458ce4a06..937e855a6c4c 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -320,7 +320,7 @@ static struct pmic_typec_port_resources pm8150b_port_res = {
>   	.nr_irqs = 7,
>   };
>   
> -struct pmic_typec_resources pm8150b_typec_res = {
> +static struct pmic_typec_resources pm8150b_typec_res = {
>   	.pdphy_res = &pm8150b_pdphy_res,
>   	.port_res = &pm8150b_port_res,
>   };

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

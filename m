Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8102172BEFD
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 12:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjFLKaQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 06:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235238AbjFLK3t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 06:29:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD2B59DA
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 03:10:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f74d6695e4so164177e87.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686564573; x=1689156573;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UJOXI7NWxaGlAMXmYuetibwBgSH1F/dmnVvJT284BrM=;
        b=h8d8Xf7qutp2nWSiEIFcAAJVz5XE5grXL2IgKDR0Kfy29zmcojLoZzUNa9bb7VPS0n
         NMnBrNNPconf+XnOze0iGbonu9J3qGduS6DIA7I6kENaa1OyekaZnTz7iiHnZ8QMOcZf
         zJfuQS2XWhBMtc/C371aN5vCskbC/2u+NMbVuv84Waf4J3BceVDPPWCCPOLJmt5GxKin
         hoPm1gGQy/EIxo6s5M+Bc+HGkPsKYd/T8Li3yJvHFYy3AwlXZmnLsmfumaX4sZpRz7Ct
         ZLuiWI/amvJ0xrEmmBL0PDrhqz2hnxFhbs7o8ge6RRgL1UsBrFmPiOsPvlanHNAp9w3c
         Oxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564573; x=1689156573;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJOXI7NWxaGlAMXmYuetibwBgSH1F/dmnVvJT284BrM=;
        b=XSgqzFyt+2Id74HjZJQ0Zu2A3dSJGjnc/3WHYi7OUXUi6wc+9LcjoXchI72Q17HuG2
         s2KdmXMKk4d6PNMqvZ6dvGAbjfyrSqT2+SkX4sKTe/P7SWN2XbZMfLZz36tzT3xqSFyF
         yJlo28IyTjQBAVSILyrDp9+HvLnb/ynHqRvrcADmJOGSaENGznTBVHHSi3yAEIAQ4SYO
         m2k2MqcXShcLHs+LMcOIbKkbOOAwwO/Hfj0t1bSiJDMjrtQkfrgaE9MDSA3KIxLyfd9b
         YHWorX49NiWH+2qlJMXjbbnx4yr+RoISwn5Sa5GwOdFPgFxx175RgDIKWaG7fGjavCHP
         yDQA==
X-Gm-Message-State: AC+VfDx6m1soIpaj/+B6liAyuJnOPAc7isa6Kwmh8K8EE2jHPPbJdagm
        DopWlYo8QBlm68nYAhqAhR/x4hbxQLKUnQNbxeqt+A==
X-Google-Smtp-Source: ACHHUZ4uehM4jQ8rsUJZWcL5ncSWhd7m36oC/WdXiwDlPhdGAUTl4fXk3Aq4tkLkq9IE3ADNKvU8Jw==
X-Received: by 2002:a5d:6b43:0:b0:307:f75:f581 with SMTP id x3-20020a5d6b43000000b003070f75f581mr4652304wrw.18.1686564124203;
        Mon, 12 Jun 2023 03:02:04 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c2-20020a5d5282000000b002fae7408544sm12009223wrv.108.2023.06.12.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:02:03 -0700 (PDT)
Message-ID: <5cb3a029-2452-dbeb-691f-1c29ab7019bc@linaro.org>
Date:   Mon, 12 Jun 2023 12:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] usb: dwc3-meson-g12a: Fix an error handling path in
 dwc3_meson_g12a_probe()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yue Wang <yue.wang@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
Organization: Linaro Developer Services
In-Reply-To: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/06/2023 15:32, Christophe JAILLET wrote:
> If dwc3_meson_g12a_otg_init() fails, resources allocated by the previous
> of_platform_populate() call should be released, as already done in the
> error handling path.
> 
> Fixes: 1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 365aec00d302..e99c7489dba0 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -796,7 +796,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	ret = dwc3_meson_g12a_otg_init(pdev, priv);
>   	if (ret)
> -		goto err_phys_power;
> +		goto err_plat_depopulate;
>   
>   	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);
> @@ -804,6 +804,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_plat_depopulate:
> +	of_platform_depopulate(dev);
> +
>   err_phys_power:
>   	for (i = 0 ; i < PHY_COUNT ; ++i)
>   		phy_power_off(priv->phys[i]);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

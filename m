Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12E77042D1
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 03:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjEPBXs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 21:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjEPBXr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 21:23:47 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5803E4C3A
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 18:23:40 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ad819ab8a9so112990771fa.0
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 18:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684200218; x=1686792218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFsdzrNUCB91yNriDm61THdPDwlSojJxD49b8QFiUmM=;
        b=hZfzw1jWLGlfj8aOiW0+povajyBUAE80+Nt0QYyn45dJJMfs0gqgxKSxoRDOXWG4bQ
         1ifplYkaZPR7ivNrnAMm8prJAz7Wzyi2ohvFRNSF07Nw5vVaRZvt8tB0xCvq+k8FPBQX
         T3HSyMWnaUSMfXUUK9ueruIMYHm2mpQJUsdjEGxrNILNqrPo9M75WwnwisBl7GlNX31q
         xytqmiy2rMbiTklYK2HKt2rXrBdKcr1Fk0hpNjeL8PuLYfmgEiLqGHNnkhoNBsXACELy
         pTFM+v3bKjao9OWeNtJtAR5Nrc8hJyX6wAnWWpSSjX46AzZa4GxgMVJpOqdjxliuoX8p
         CyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684200218; x=1686792218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFsdzrNUCB91yNriDm61THdPDwlSojJxD49b8QFiUmM=;
        b=Gu19zL7vF4Bwsv9U4YnvindRCCOzAI9jCxP1yVgPWrbl3m2nanuy2WBM74qrvMOPvP
         Vebl8tjktWKbSE3dC9dU1iwu1UX99RaFg7HMTIeGePZBXCq/2R8XiD3Ty/NQUwj86Jsa
         d3oKtQlYlN35ZZmYdq8+k9pxKQchmPaVtet52tDcgfWHb7h4ZgLFiOFU9VJg0NObrD0+
         dTVixeEASGfHIt7EjN3A91N646bk32T7ina+14yEJWdaISKobP29uDRbP7fbYQMo/dKP
         3NXdiGqljR8R6ikLvY+9QUKqPPFPmGKko+McTNVRzEHYYOoVNiMQ1E+Obo6VWzECZI3D
         ONew==
X-Gm-Message-State: AC+VfDy1jm9f3Cp6RKr0JdTGDIq5Rfe+AQu3foqu7kv3YbGkR32wNSH8
        BdzCLVIJojzr31r+0tOwBdZV8A==
X-Google-Smtp-Source: ACHHUZ4v7ANIpHd1PgWjbMlH9q/KP2hjU5YgkpFLPMRPmOhdHzM9lfAf1/Fv4mxIbS3a7C99nWveAw==
X-Received: by 2002:ac2:532a:0:b0:4f3:84dd:a4e with SMTP id f10-20020ac2532a000000b004f384dd0a4emr992846lfh.37.1684200218653;
        Mon, 15 May 2023 18:23:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y27-20020ac2447b000000b004db3eff4b12sm2651977lfl.171.2023.05.15.18.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 18:23:38 -0700 (PDT)
Message-ID: <5353e51c-46c5-5178-fa1b-65fb71072e7f@linaro.org>
Date:   Tue, 16 May 2023 03:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qrb4210-rb2: Enable EUD debug
 peripheral
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
 <20230505064039.1630025-6-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230505064039.1630025-6-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5.05.2023 08:40, Bhupesh Sharma wrote:
> Since the USB-C type port on the Qualcomm QRB4210-RB2 board
> can be set primarily in a 'device' configuration (with the default
> DIP switch settings), it makes sense to enable the EUD debug
> peripheral on the board by default by setting the USB 'dr_mode' property
> as 'otg'.
> 
> Now, the EUD debug peripheral can be enabled by executing:
>  $ echo 1 > /sys/bus/platform/drivers/qcom_eud/1610000.eud/enable
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 1a0776a0cfd0..0ce72f1ebc10 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -30,6 +30,10 @@ vph_pwr: vph-pwr-regulator {
>  	};
>  };
>  
> +&eud {
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -253,7 +257,28 @@ &usb {
>  
>  &usb_dwc3 {
>  	maximum-speed = "super-speed";
> -	dr_mode = "peripheral";
> +
> +	/*
> +	 * There is only one USB DWC3 controller on QRB4210 board and it is connected
> +	 * via a DIP Switch:
> +	 * - to either an USB - C type connector or an USB - A type connector
> +	 *   (via a GL3590-S hub), and
> +	 * - to either an USB - A type connector (via a GL3590-S hub) or a connector
> +	 *   for further connection with a mezzanine board.
> +	 *
> +	 * All of the above hardware muxes would allow us to hook things up in
> +	 * different ways to some potential benefit for static configurations (for e.g.
> +	 * on one hand we can have two USB - A type connectors and a USB - Ethernet
> +	 * connection available and on the other we can use the USB - C type in
> +	 * peripheral mode).
> +	 *
> +	 * Note that since the USB - C type can be used only in peripehral mode,
> +	 * so hardcoding the mode to 'peripheral' here makes sense.
> +	 *
> +	 * However since we want to use the EUD debug device, we set the mode as
> +	 * 'otg' here.
> +	 */
> +	dr_mode = "otg";
>  };
>  
>  &usb_hsphy {

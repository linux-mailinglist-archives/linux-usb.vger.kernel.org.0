Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC4A52CFC4
	for <lists+linux-usb@lfdr.de>; Thu, 19 May 2022 11:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbiESJwX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 May 2022 05:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236101AbiESJwW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 05:52:22 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEA66F495
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 02:52:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u7so4875582ljd.11
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=epUC6Np0BXS3QJtTF4KvMmglvF2IOB83BUZ5j+BV7l0=;
        b=QBkFb4975luF3/Zu1UcADu2sFKXP2PZbztuUSfgRCSQzWdo7iEvLhpKikM5DvPo8nk
         Eo3+Ep+W94le6m+kuS7j913LwgYFSlh9PaMjW2pBO8Lp6Z4JhD1UZ+OZBIOSv0alz8mw
         W23zjqPyzL8JusYLmuYDzMc7VswVqCjaLPykqh7vYGjRntT6RnuNDvbI694WGaIB6q50
         eU5k19neBexRw4dL3lbTcSonik8s+lma9WD9lEs8mfgUUS6bFXO2VBxjbDcmREJwdqTR
         QahuxeqNjYU1rDKrGjrsgVTCnfh0g0uJFI87F6o0lmVPtxMNAEbWmyN5YYKOu3ILdghm
         p6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=epUC6Np0BXS3QJtTF4KvMmglvF2IOB83BUZ5j+BV7l0=;
        b=KctQumrP/8uDZaKYuVx3RhEFdHKmSqje4zHSgsAX4PTJ3FwG9Ng6HHU1NPj+zPMRX1
         qhEhcPcp/3OT7hRmIJKPWj/4WS5AjYlY9Eu0+J9sQD0BFwcx+iMSsEotQL6Bacvyt57o
         KUF9/ooO253jHOoiol+E7+NW6M+oA+JI3zknXby9u2EZwirMtmOoa/V/xF6kRRypsHaR
         qNOwXcLppMi5iTOZXAJQfwiRV03NOKjbHuAyFSgxpBap48iKUgNziWFJmFgWR71tIXRi
         jZY8mGEG7+IiRCJn9fJIVLPDbYPTwo2/o5IeE56XI0uhHzzJLoBkhxyVBH41ghfJsORT
         8I2w==
X-Gm-Message-State: AOAM530VUrCffkqspYHz6s9DXnWzyaWrNXJ6v4tM/ZgonfZ0mmsv8kB3
        Avg5Cn4oxdhqHPAzJt6ooqb/0Q==
X-Google-Smtp-Source: ABdhPJzwM+VOYt2tfc4jbF1tCaPh17iewQ0ya7xVnWgl2uzwoGpo9v131U1CKPP7Pp2/u/0r5RQWzQ==
X-Received: by 2002:a2e:9a84:0:b0:24f:4160:305d with SMTP id p4-20020a2e9a84000000b0024f4160305dmr2108933lji.375.1652953939236;
        Thu, 19 May 2022 02:52:19 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e9d42000000b00253bb2564cbsm529363ljj.134.2022.05.19.02.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:52:18 -0700 (PDT)
Message-ID: <b02873a1-ef1c-8ae6-2b7d-8e00c9db9ac0@linaro.org>
Date:   Thu, 19 May 2022 11:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sc7280: Update SNPS Phy params
 for SC7280 IDP device
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com
References: <1652934489-23386-1-git-send-email-quic_kriskura@quicinc.com>
 <1652934489-23386-4-git-send-email-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1652934489-23386-4-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/05/2022 06:28, Krishna Kurapati wrote:
> Overriding the SNPS Phy tuning parameters for SC7280 IDP device.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 5eb6689..556fb04 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -325,6 +325,12 @@
>  	vdda-pll-supply = <&vreg_l10c_0p8>;
>  	vdda33-supply = <&vreg_l2b_3p0>;
>  	vdda18-supply = <&vreg_l1c_1p8>;
> +	qcom,hs-rise-fall-time-bp = <0>;
> +	qcom,squelch-detector-bp = <(-2090)>;
> +	qcom,hs-disconnect-bp = <1743>;
> +	qcom,hs-amplitude-bp = <1780>;
> +	qcom,hs-crossover-voltage-microvolt = <(-31000)>;
> +	qcom,hs-output-impedance-micro-ohm = <2600000>;

Not correct property name.


Best regards,
Krzysztof

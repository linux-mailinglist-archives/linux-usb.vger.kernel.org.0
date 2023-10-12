Return-Path: <linux-usb+bounces-1517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE37C7347
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 18:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38762829A2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89EA29438;
	Thu, 12 Oct 2023 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJS9bGyU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482322F1B
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 16:42:11 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9A3C6
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 09:42:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso100591fa.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697128925; x=1697733725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg7mdO3+bBBGRgz1JJW3EWOQYH5H024kENOkHNU4kLA=;
        b=ZJS9bGyU78/AYtxhqYj7bVywM/lXcS7GgCK0Ae6mQ3nwl7n6Izbbmeb8yrrdlJGZn8
         9p8vehdzeRlnXGLbVXPh9qX2dQiZ3AALf6av1YH4vzQQrcU7H0IvnTv0yzChXjXqwjMW
         jchhPZ8YLvrCJD5zuB7Uqgks08scAaij9KQBdkhPQlBg0kO6C5UUAKu2cjpKHSGvT4Xf
         tlYT/a3x9wVxyrVNjVI0t5s++l3duxBWhv1fIUz2rFeTjFgGByZNDNFF11XvxnAxNarL
         G41pryUAXjl9xMVJwTlsj1oCzXQ8setzO+TPwtExnWsIirlC6iqtsW8ZVlT9ye+8dXws
         X3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128925; x=1697733725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg7mdO3+bBBGRgz1JJW3EWOQYH5H024kENOkHNU4kLA=;
        b=lCjlB+Jd5bxqo8lrQVgnxUZIJ39K36YAaM6XeCy8KzXmmJolUxUuEZf2Ugssok5DVr
         jElkKJ/9S0g6tDJpByXEoQh+xbfYkuiuYrj/F/Ds8zbOGQE9j2nwHhzOl1GA1m00DpCO
         zRJ/jHrrXZbIqYCAfwunkMfemssYdvEDwqN+KSnbMd1VpSh6f9SsYWWFhJOzLLqynn3m
         jokS99Oy0WzKAoS3CU1aVJ5bRbpOirHG79j6VcyITC41mTF/HF3ygx4g6zQcLWhLtZ4S
         5MaqcYsM/M3ze/lFCkZ7ve188rQlwVqSKmaIxMc7p1HGf/S2irpGQxyb/bn71O9Nsmkl
         dfkw==
X-Gm-Message-State: AOJu0Yy8xPobEBQumqZosjpg0xjDM2IICziCYQ5bH36YeFZ/w8rk1tDc
	9JsPqCG0/DVeT9jVisugTdXkDw==
X-Google-Smtp-Source: AGHT+IFBI9TpG5PuveaJYdzlvucg89JDXICF1SOKwex3xKjc7Qqn+pw4LfQpHoFOKn4cw2WXH+IZDA==
X-Received: by 2002:a2e:8798:0:b0:2c0:cfa:a1a0 with SMTP id n24-20020a2e8798000000b002c00cfaa1a0mr20926580lji.46.1697128924867;
        Thu, 12 Oct 2023 09:42:04 -0700 (PDT)
Received: from [172.30.204.175] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e7409000000b002bfe8537f37sm3633373ljc.33.2023.10.12.09.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:42:04 -0700 (PDT)
Message-ID: <02de745f-d648-497d-b520-712450f4ad9c@linaro.org>
Date: Thu, 12 Oct 2023 18:41:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/10] arm64: dts: qcom: sa8540-ride: Enable first
 port of tertiary usb controller
Content-Language: en-US
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
 ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-11-quic_kriskura@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231007154806.605-11-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/7/23 17:48, Krishna Kurapati wrote:
> From: Andrew Halaney <ahalaney@redhat.com>
> 
> There is now support for the multiport USB controller this uses so
> enable it.
> 
> The board only has a single port hooked up (despite it being wired up to
> the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
> which by default on boot is selected to mux properly. Grab the gpio
> controlling that and ensure it stays in the right position so USB 2.0
> continues to be routed from the external port to the SoC.
> 
> Co-developed-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> [Krishna: Rebased on top of usb-next]
> Co-developed-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index b04f72ec097c..6904a4c201ff 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -503,6 +503,18 @@ &usb_2_qmpphy0 {
>   	status = "okay";
>   };
>   
> +&usb_2 {
> +	pinctrl-0 = <&usb2_en_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
These additions are not quite sorted alphabetically, it seems

> +	phy-names = "usb2-port0", "usb3-port0";
> +	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
property
property-names

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


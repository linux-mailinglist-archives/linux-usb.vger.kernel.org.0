Return-Path: <linux-usb+bounces-151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4617A2023
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 15:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00DEF1C21391
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 13:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D4810A09;
	Fri, 15 Sep 2023 13:48:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D610949
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 13:48:41 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24DA268A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 06:48:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so35740691fa.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694785704; x=1695390504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLoVQHNPO7ESrRbvHvtdSLnA8ygdJfPRZs36Hp3fy4s=;
        b=FV4Xn30eJWjT4XSxr49L88eXC220LAuKU8s19MwXzB06eV6pbWm8OwA2gL+TyJ+5Hz
         yOFhvK3EnDvksUyi8mEpLPevYTC0JzAtyYNnKWEn9XO4+/jCy+f1PL8TQnzBCrc/ZCxV
         AR9Rlf8qSHQQ7Sq+0468KQbLT/Zu1D2MbjGDUn93WslsPFZfKKCAGSroo9L4jXye4s83
         WFiOb5ZFafQtwaBIjpLnvCqIta8oHi21C5AOVI934LZK9cbkTyE9DcW9cCwwyyByDOXx
         /wSzKJ2JdxayZRlZAcp0SUNzJWwc7qbMKTlHUcsSbS03kzE+2Z9ko+zoaERBMZOPInNp
         WxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694785704; x=1695390504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLoVQHNPO7ESrRbvHvtdSLnA8ygdJfPRZs36Hp3fy4s=;
        b=NhafL0p+58R6DV8CglZVFrWISwCLSoJ98AjZqhcQ587Zwjq6apWiI9jE35GXJOCl7Z
         jzfNbSbkyQRCP9X2GCjMhHAEoU64nXorqsIXkDUVXiuN3gxqmOmIbMdCS1VTscGT+OKG
         myRPH0AI6gXdd81Msi85ecUYodwseEXDW5YM1tpgNDaiQOeLqhl/AYgQ5LTM+1Bwq/r2
         4QiY3TfVJy87dYrodPHhBKPNVrN+vHFyw0J27BecxdJdRv5ExwnvRlK5z1wtkeMlE71c
         AUt02MaLMsnMdGkf0vU9Wno++AhFb+F10L1/cELbNk3wvu7dhgI40mxItRE7wZrVed8g
         LKlQ==
X-Gm-Message-State: AOJu0YziyzHEidOmVLKGpbyg/x+Mooj4kY2ptSO3Z3WuA3lzlfTc9J1I
	bdJd4zEPs7kG2aAn2q7UdiG9VQ==
X-Google-Smtp-Source: AGHT+IEYEq1P0psQTkdX/nX4ET1GV+WxWYIW6UFBZT4mI5ipXyYF8ygfjV+nw61ugc3545DB6rGHOg==
X-Received: by 2002:a2e:95d4:0:b0:2b6:ea3b:f082 with SMTP id y20-20020a2e95d4000000b002b6ea3bf082mr1580793ljh.38.1694785704010;
        Fri, 15 Sep 2023 06:48:24 -0700 (PDT)
Received: from [192.168.37.232] (178235177024.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.24])
        by smtp.gmail.com with ESMTPSA id u11-20020a170906068b00b00991faf3810esm2444001ejb.146.2023.09.15.06.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 06:48:23 -0700 (PDT)
Message-ID: <825bc60b-2067-43e2-8b43-9d38b7cebf02@linaro.org>
Date: Fri, 15 Sep 2023 15:48:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/13] usb: dwc3: qcom: Add multiport suspend/resume
 support for wrapper
Content-Language: en-US
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
 ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20230828133033.11988-1-quic_kriskura@quicinc.com>
 <20230828133033.11988-11-quic_kriskura@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230828133033.11988-11-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 28.08.2023 15:30, Krishna Kurapati wrote:
> QCOM SoC SA8295P's tertiary quad port controller supports 2 HS+SS
> ports and 2 HS only ports. Add support for configuring PWR_EVENT_IRQ's
> for all the ports during suspend/resume.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 39 +++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f8f8c5e39a01..34eeebb74a6a 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -37,7 +37,11 @@
>  #define PIPE3_PHYSTATUS_SW			BIT(3)
>  #define PIPE_UTMI_CLK_DIS			BIT(8)
>  
> -#define PWR_EVNT_IRQ_STAT_REG			0x58
> +#define PWR_EVNT_IRQ1_STAT_REG			0x58
> +#define PWR_EVNT_IRQ2_STAT_REG			0x1dc
> +#define PWR_EVNT_IRQ3_STAT_REG			0x228
> +#define PWR_EVNT_IRQ4_STAT_REG			0x238
> +
>  #define PWR_EVNT_LPM_IN_L2_MASK			BIT(4)
>  #define PWR_EVNT_LPM_OUT_L2_MASK		BIT(5)
>  
> @@ -107,6 +111,19 @@ struct dwc3_qcom {
>  	int			num_ports;
>  };
>  
> +/*
> + * SA8295 has 4 power event IRQ STAT registers to be checked
> + * during suspend resume.
> + */
But this driver supports much more than just SA8295?

> +#define NUM_PWR_EVENT_STAT_REGS	4
> +
> +static u32 pwr_evnt_irq_stat_reg_offset[NUM_PWR_EVENT_STAT_REGS] = {
> +	PWR_EVNT_IRQ1_STAT_REG,
> +	PWR_EVNT_IRQ2_STAT_REG,
> +	PWR_EVNT_IRQ3_STAT_REG,
> +	PWR_EVNT_IRQ4_STAT_REG,
> +};
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -440,15 +457,19 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  {
> +	u8 num_ports;
Maybe I'm picky, but I'm not sure defining a variable for
a single use of an object with a rather short name
(qcom->num_ports) is justified, here and below..

Konrad


Return-Path: <linux-usb+bounces-10636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D48D1BCA
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 14:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21E41C22097
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 12:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA10B16DEB0;
	Tue, 28 May 2024 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfpQDhSw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1DE16D9B3
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900995; cv=none; b=s7Jpgjz2ZCY6XHNddCeoSR6VPorVu5TKjfsRfD198qfmVnpqo6EWrUsfGWKhdNSm3hBs3FJXr9zkh0XyZPYu9EiyzZboUnpxYYhmynkk3tP9XRIBq4plzUTjQx0m0GexK/0CL5k4HhCfCjWqdvZwMsTODhkE5LdDSzsGaLvW8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900995; c=relaxed/simple;
	bh=c6bKxcXWNYjOOH0xRtK0KGI6gOon/19zEjgMhAayAqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF5ozCOXnKujTtaAyA8QVUkUE9kQUeBVxVqpAS9R3NXaFU64GooYv85zN79Q4cA+8/UmrCnpJoPOelBgvx2SavraB1rq0LF1XT+b1WZAEJl90d6ON+//Ouy7dQEePf9OkLgP2QbmYyfhdaEhN7U4j9f0sxVYNqwvyruJhYRDZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfpQDhSw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-529c05a8982so20130e87.0
        for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716900992; x=1717505792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBJydv2oVIxF33glNXhfsH0j7NMZZydOoyfGkqd3Bng=;
        b=rfpQDhSwEJGotNqLcxKrMS0y+28gjfTNNNHNkRA+UutyICUhBLYdckTobq8zgztGBf
         qtqKcyHM+v2Jh4umHeIotadX3d9/ZONqddlBisRiwRSaSpOb/7xVnKeaGAE8RaKYVVL7
         3HamyEo5WoOrbHTW8+4VtBob8j5GHwODjasLpuVS54zQ0Hw5cxBSoC9twYJIlJsYZGjw
         x8e9NzWE6EZBOfvVxxrl8F7pfjy3ebvN7vvCBzmHA2VGW7hhrOnb7nDQHtaVJd5ilX8d
         B4xkzwhLvV6EUWyoRvC9T1CFHvEf/VltbpviDc5xtDnME2Cfhgyu6y7NvEfdVqEP8dGE
         7Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900992; x=1717505792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBJydv2oVIxF33glNXhfsH0j7NMZZydOoyfGkqd3Bng=;
        b=Z6n/jNeSdwdjfs+xWD1QPf94+Bu0xR1tQo4G1PvMhyCailZs6PE7QltU7TVgdkbALp
         rJNrhIZHNk4gX7EMpPUKKMjI/Jz69UCEbUeccXCrJlhI6qq6RaNNgyRmcpT1tXkpjpBb
         umuaXF4swgQzpiNznPJsJic+BuEZJcwOFoGC+bF0sW0uD30Cqi7jaYPtChTphDRLi/wW
         JKLGVGj34dUM4ddGzEca5pd4wa9nb7ayZFNQaZK/tymsuj1uDHxqxDq/Ka9ZF5gJdTsc
         DVvB8CpjzJtLK3dQJa4iF5Zn1Gbn0fIDqJLhpHE7X4N//rbau/kjWOMqvdrYnX+Xch60
         cA3A==
X-Forwarded-Encrypted: i=1; AJvYcCWFFGbL7ZsPBboBmJBC5RX6DtpqPv5PwAAjlREE7tLd1eMTAHSNHqI7c109CW0XLIrieltBtkxjknNfbw4CHSdZ8HfwM2XAot5S
X-Gm-Message-State: AOJu0YwbIBChwCwMF9G/puPICNApNV8/W81XtjhvudVfuMsdL4eoVy5D
	7veLPZ6cJEMaW5GgpkB+UZ/1l1jASoVidw1lHevio+/xASNXbwJflBmjaxn+EjM=
X-Google-Smtp-Source: AGHT+IG0zOMeIXAZKtGkaGkYMDbA0TJClGnE+TMJJZXkxFvHDGGTT9Qi+laKp696WC+OBF1yN6ki/g==
X-Received: by 2002:a05:6512:b9c:b0:51a:cafd:3872 with SMTP id 2adb3069b0e04-529644ec0cfmr9508409e87.3.1716900992046;
        Tue, 28 May 2024 05:56:32 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm996984e87.127.2024.05.28.05.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:56:31 -0700 (PDT)
Message-ID: <39e8aa68-a68f-48d8-9845-0d273004e21b@linaro.org>
Date: Tue, 28 May 2024 14:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable
 USB multiport controller
To: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/24 20:04, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Lenovo Flex 5G has a camera attached to the multiport USB
> controller, enable the controller and the four phys to enable this.

Any chance you could leave a comment above each pair of PHYs that would
say e.g.

/* Left rear port */
&usb_mp0_hsphy {

...


?

[...]

> +&usb_mp0_hsphy {
> +	status = "okay";
> +	vdda-pll-supply = <&vreg_l5e_0p88>;
> +	vdda18-supply = <&vreg_l12a_1p8>;
> +	vdda33-supply = <&vreg_l16e_3p0>;

status last


> +};
> +
> +&usb_mp0_qmpphy {
> +	vdda-phy-supply = <&vreg_l3c_1p2>;
> +	vdda-pll-supply = <&vreg_l5e_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp1_hsphy {
> +	status = "okay";
> +	vdda-pll-supply = <&vreg_l5e_0p88>;
> +	vdda18-supply = <&vreg_l12a_1p8>;
> +	vdda33-supply = <&vreg_l16e_3p0>;

ditto


Konrad


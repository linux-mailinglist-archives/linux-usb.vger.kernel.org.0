Return-Path: <linux-usb+bounces-5764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C36846EAF
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 12:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059801C26F4A
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 11:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6932413BEBD;
	Fri,  2 Feb 2024 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0LKSOLD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1707995B
	for <linux-usb@vger.kernel.org>; Fri,  2 Feb 2024 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706872174; cv=none; b=OyHW5ePq2cjLiLrA/cRuh2gXKBTqd+euscwr+WhbGwvu86a7xM43rG6sYy0M6Kvq6ZShtqKCt0ZDCppYmnyUwDVW7ljbheEEPptNsUMG5ODJ1qfsNOer8R8ltvearWAhgDCeGjpkvkLCXI9KZND/mvYm1d30oD7/+psOq4oPIhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706872174; c=relaxed/simple;
	bh=Eu8VoJ9ElRl4Ti4H7L7mr+pD0JyjB1NFMiib0/jTe6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhkFZzkZia5I83zQTSxw6RiuZ1l0fiSbFnAhqjM7MbmLAh1Z8jI7MQqxEQhzZASkP39xAVB2WR2SrGPQDGOtNGU8U9ppPcSBRZTfr3UlCtZyT0QZpPdYqy0y4DgmBTy3xVbnsx5G4cgaSE5F19Pr595r5P5SL+5Aw56hsd5mNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0LKSOLD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a354408e6bfso522939966b.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Feb 2024 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706872170; x=1707476970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xn698sT3hqowVoFBpOH49ecidIHK5lYcw6cxpLypKrA=;
        b=y0LKSOLDbQU8k/0tZKBA4fa/ZNAt9YIYZiT4UPwHeEaXyQL7l8P2qCO6o+XqPAj1Bi
         lZOOQz4zZBcXPAwoIUpExrE55kF496QoDk9tyyI/76obM1tagFVFHftDdhTFkkjgvR0s
         hR0aeOTdaFMtz0yFBUh3q8cfPjLwP9gqa41+UH2ryCvyFv6EBnCfmARSkcAh7ocKzHOT
         StUBHKIWfwr/VvrDLcr/o/DXzScf1wmpyXGRrEQsl5uTq3OhE0vrCNsto3m+5/IYdzZY
         33dzFQR3QUPdmZbaMfT0SF9JloIsCeqVsFHXWhskC0IZy8WDRzziPUFOISfoPzrRMpUX
         fAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706872170; x=1707476970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn698sT3hqowVoFBpOH49ecidIHK5lYcw6cxpLypKrA=;
        b=p9cQbSvXwk0ru/vHL8byhQHGVBBGOgM5/MkQUS6xOZv5tMlEVv4nAr3CUkRvfK92Hk
         dQxz72jjtU9mWjSoAYUfqho2QSaCdZ7PlGkfQ1EWhmqhIdfnlF0eKiWmZhBduNpm+vLU
         WnXJP/oI1eABzmgYbAk35LVvcdWXiGYyGcLHmj40RslIe2rlQ2IzyRU93MZjJoSb+Xae
         G/URJjUSk1x2GO85ilY8EbgAeqGLm2k/mjUd4FrbOKVGLc5YllJRJ6/AkN46+W3J7/qA
         XGg2/KSqpY5I2/jiyyAdR0W3ysLvO0AlTN7627qeNH6EXc0S3/GdwD8kCxkY8x/vc3bK
         y5bw==
X-Gm-Message-State: AOJu0YzCA7pYnHiKvpzjdvY/zeyof9TiU0Wj5a/Zv0EifNRbyQc1NCwR
	vlDR/aNT93+GBW1E5xlSfJgCBtA6Lc9ZUgRFp0KIF30B2Pt6XFjPQnpgxr7l9gk=
X-Google-Smtp-Source: AGHT+IG8YXNN1Ln7KIQkoz9wo8mDWAprRyXk1RZs8xLt/r5QYO493GyhTlCiJLFSiQD7frrReXbXJw==
X-Received: by 2002:a17:906:6a13:b0:a36:877a:edde with SMTP id qw19-20020a1709066a1300b00a36877aeddemr1779373ejc.11.1706872169866;
        Fri, 02 Feb 2024 03:09:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVXdMVQGhdL/6RJjX/3ZdM1BwfXILvpLZGEDFPAzWDCo/+sm+xfSei/Mi9HvNKlYPnnf1/auQEnLmW0g8vK+DCebwY45lS/5VWRpohKmdrzUNYdgCaqyG1LTCglZQIf4TUeT54g8RGI1Pm0ZTqSmbHsaPD76D82ImJoSRAzrIuLAuidxNgNtAuXC9LkLCJP0J7wcWYWZjlFLysgJ68hliWJ9JoVKTaRCsy6qMlWJYFjqYp2ylrc9oUe1rydo7fWNmIOz16VoNE9427/R0Om+Veuzlny2R5P3K7f+GzmvCM7mmdo0vw0egHlc875IrwmX7cz/y5+3aBe26qnLM/qFxHaEjoRzHGW45hgJx1E5+LhyY/yH8sOzMS+IOXBJxvKgi5R8aIZySwdAYjEmXDW1II9Uayc0DXHtTOqNuG2UcvzqLUftJqZ6thXcuMxWpdOCL+t5wnqUOUPFPgM2Q==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id z22-20020a170906241600b00a31805b4165sm781731eja.11.2024.02.02.03.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 03:09:29 -0800 (PST)
Message-ID: <97a52b03-3317-41e3-8cbb-c5feb6e12095@linaro.org>
Date: Fri, 2 Feb 2024 12:09:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
 <20240202-pm4125-typec-v2-2-12771d85700d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240202-pm4125-typec-v2-2-12771d85700d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2024 00:55, Dmitry Baryshkov wrote:
> The PM4125 PMIC has the same Type-C register block as the PMI632.

...

> @@ -14,9 +14,15 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pmi632-typec
> -      - qcom,pm8150b-typec
> +    oneOf:
> +      - enum:
> +          - qcom,pmi632-typec
> +          - qcom,pm8150b-typec
> +      - items:
> +          - enum:
> +              - qcom,pm4125-typec
> +          - const: qcom,pmi632-typec
> +
>  

If there is going to be a new version, please drop redundant blank line
(so only one).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-usb+bounces-5186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88000830BDE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 18:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2273F1F22196
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 17:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A248C22618;
	Wed, 17 Jan 2024 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/6PgKE7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5FE1E863
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705512208; cv=none; b=rysQTk52OBpzKSsjMMS4tIOU0AGVTFfROzBwlNMk7J1ldzt9P7kt+L43tqLmLKlwhHgxI+8FpgCanuk0tgzKGUOVttk/exTTsDFXITNbjZ2NveE1c6gZhGc31e4kyFXFeLZYnPn7GSRm8yDXLufiIHJ7/eq91kjvt46SbHN5Be8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705512208; c=relaxed/simple;
	bh=ksNwOf1AW+zd0/noaPs2Oap2P6xZdOxTfhNySTwR4Fw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=MQePxe3Yd3SdyUWJxei0CUXIWeISaZzexi3MYb4PREdHz5oNDoK9Neu/WaSuWnUqNR2CTb1hCedQNrO/NlTAgta82D8yEcqxGy7K8TOQ08aB2AS1u8Ewn82c6wcIs6RGrgSyVJsEeURNVVQ4faozujweDbycF21OTBofKMS/22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X/6PgKE7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337c536865aso510901f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705512204; x=1706117004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTCtMquQwSHvUe3rlom2viCrA/hRn2YuWQ9TWaWnJ4g=;
        b=X/6PgKE7eQrsnbVdcagsXJOdE5QtjMgic8EgXMQe8O8pkDTpq3UhoFaySNclm3Ks9k
         C1jX3uawqKbWRBKfkFvJaRG9Wo2BeoO5tL+TlRdOy/Ztq6+kvu8C4YUwZOMLRAnDusKc
         Fn9egyUrNtavCyKvYBtNvKkjVNQHWf/kcC/Y6AnLPLjiv3M6441g6mGrrj14AexsXVdl
         UJHy72xqDq295SduBDY5i0/cIV3/z4Lkri/tPyTngLouS9WVtVkAxnpd6ZaNNLGkrYXq
         Wl10OppT3NTw6xvA7aJ7VdVdWGDXcs1ln+qJ+VCf3nxkxQQNiw2OtLaNNOqjfIHMMj+5
         feyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705512204; x=1706117004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTCtMquQwSHvUe3rlom2viCrA/hRn2YuWQ9TWaWnJ4g=;
        b=ErZKV4Pq6Th8deTA2iR/n/NahmE/MTaQ9jT3+oxxT7hYo3BWcEyu6RltkK8fwRGZWz
         X2ZKko05b74ZU8lYvKD8HRLGihjGp1rFugxvAx2Ps/BfAju5D+nCcTln8BU+Y9sFdwhp
         sLoTXeCUcUs0z6ovu2nxwonqCGGyEZE0NXFLIT4CCrpy9omCX8b5HQfCFS098yVlLOeo
         jwyyMQtjqOHJRnYuaUS0FLlulpEWEITW3dcjMAi0LZGgZnc/PftZImewsw3Czj/JG72w
         /+zsMQMpNepH5UFGYyXRxFRWOKyZExXJJ6i7gEi/SI0cCPX4uVetcgSpnmKS7fwkmH4t
         QiVQ==
X-Gm-Message-State: AOJu0YzrMk5g8xnww/BJ6Hm5yCIeI539LEVnWW8lEt0uv4P1qSiXJTbV
	AiHjSDjUQqy52D+UEu7/ZblqLozz8LM6GA==
X-Google-Smtp-Source: AGHT+IFFlacrehhEntQ4bUfUJOL0yxIor5gjgggfLwRY9ubluouFJBmzUtYn1rnyZRRNO+pA4e2wvw==
X-Received: by 2002:a05:600c:4d1f:b0:40e:76a3:6e2d with SMTP id u31-20020a05600c4d1f00b0040e76a36e2dmr2960527wmp.4.1705512203552;
        Wed, 17 Jan 2024 09:23:23 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0040e3bdff98asm26761374wmn.23.2024.01.17.09.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 09:23:23 -0800 (PST)
Message-ID: <28e019ce-7612-4b10-8068-17c3fef4dba8@linaro.org>
Date: Wed, 17 Jan 2024 17:23:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org>
 <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
 <CAA8EJpo7qH43FyvO-N9vFH=6K3rMdPpnGp9w6pGW2cz4bMK+0g@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJpo7qH43FyvO-N9vFH=6K3rMdPpnGp9w6pGW2cz4bMK+0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/01/2024 10:43, Dmitry Baryshkov wrote:
> On Mon, 15 Jan 2024 at 12:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
>>> Define VBUS regulator and the Type-C handling block as present on the
>>> Quacomm PMI632 PMIC.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
>>>   1 file changed, 30 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>> index 4eb79e0ce40a..d6832f0b7b80 100644
>>> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>> @@ -45,6 +45,36 @@ pmic@2 {
>>>                #address-cells = <1>;
>>>                #size-cells = <0>;
>>>
>>> +             pmi632_vbus: usb-vbus-regulator@1100 {
>>> +                     compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
>>> +                     reg = <0x1100>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>> +             pmi632_typec: typec@1500 {
>>> +                     compatible = "qcom,pmi632-typec";
>>> +                     reg = <0x1500>;
>>> +                     interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
>>> +                                  <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
>>> +                                  <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
>>> +                                  <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
>>> +                                  <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
>>> +                                  <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
>>> +                                  <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
>>> +                                  <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
>> This differs from the downstream irq types:
>>
>> <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
>> <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
>> <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
>> <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;
> 
> I must admit, I copied the IRQs from the pm8150b rather than from the
> vendor kernel.
> 
> Bryan, any idea which set of flags is more correct?

My € says 1:1 with the downstream pmi632.dtsi

qcom,typec@1500 {
     reg = <0x1500 0x100>;
     interrupts = <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
                  <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
                  <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
                  <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
                  <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
                  <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
                  <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
                  <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;

     interrupt-names = "typec-or-rid-detect-change",
                       "typec-vpd-detect",
                       "typec-cc-state-change",
                       "typec-vconn-oc",
                       "typec-vbus-change",
                       "typec-attach-detach",
                       "typec-legacy-cable-detect",
                       "typec-try-snk-src-detect";
};




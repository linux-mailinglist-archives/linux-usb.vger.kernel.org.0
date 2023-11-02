Return-Path: <linux-usb+bounces-2474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150027DFA24
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 19:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C8C9B20B70
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 18:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14AA200AB;
	Thu,  2 Nov 2023 18:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ulnjtFJn"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37E215484
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 18:41:08 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF37133
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 11:41:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c5056059e0so17887851fa.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698950460; x=1699555260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEpZhe0N2sN6GVcRg3szCztdEpMXAkzbYdbkv3mYVKg=;
        b=ulnjtFJnhHlwKCyC1/AZ1zSE6jmTjNnGl+1gPQ9y5WwhoY2j3Zz9bYXPidm0rIx7QQ
         nW8jd00MIhV0SCLK5tPh33JCTPsPEgqkXjhZ/k+iAKRGweTzwac/BhJhrLKrXLcJnXqB
         AMekWuvy9ntZniv+v6b/i1k8kcwUQYbR6ri1CCeiqeTVlLoQWTJDVasEWqot/hEZVKzp
         Eh0OdoOqIm3YkU5E6efCiE2W5FNKctZZEiE/0nFPrBDUoiAhShEwLIZGubrQ2Ab7WVXX
         +Hd7GS+j688NSzCG6Quf2788tdHucq+L1mofbLXSx/z//aDwpgPTmKMzwj5iBWNMHI6E
         HiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698950460; x=1699555260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEpZhe0N2sN6GVcRg3szCztdEpMXAkzbYdbkv3mYVKg=;
        b=EIHKVaSxjwqGnG9z/F1MdR6O8cMwRxOpJui21q6d42Ao/Hk01HtwCy56s8Pfasa4Nw
         6wNXm9ICEeEXniwnT1gyW3U+2zQuSm7gsfAi6zYg8utyblDiJ1H97vfKfGrxtoW/rh2W
         DrvF9JsOS7A+XVMxQEQow1AFEB+wBgoimdAAqtJZF3QBJeGculizLK0JPG+PWbVKvRT7
         Ng1WY0fOiNy6/68Kpye8/6fXtZqxupfwSKJLo/eySE81FfaQ9GuPInm4N4C/ww1fXCUL
         BUZMcotFAMKulPvpCzaxQE4Cpc44a3dYMPGe2GvAGsnnuJxt2SsJR0Wwh88SRMpqG3WY
         3O6g==
X-Gm-Message-State: AOJu0Yzi73mO7ixGx4wq4k2Nws6hoOQfm/zA3Ll49serBtam+XCVJxI1
	S+jfvh48OGHworCMETYtAhKE7A==
X-Google-Smtp-Source: AGHT+IHOG6JY6QHe6uEhX0t0A0QtG2EyhAEZkQBZ47BXTPo2Tx8sm8ASqdDLXlJVbPtHx31RMFUn0w==
X-Received: by 2002:a05:651c:336:b0:2c5:15dc:ba99 with SMTP id b22-20020a05651c033600b002c515dcba99mr12946673ljp.51.1698950460025;
        Thu, 02 Nov 2023 11:41:00 -0700 (PDT)
Received: from [192.168.67.140] (92.40.204.37.threembb.co.uk. [92.40.204.37])
        by smtp.gmail.com with ESMTPSA id a11-20020a05600c2d4b00b00405c33a9a12sm1481939wmg.0.2023.11.02.11.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 11:40:59 -0700 (PDT)
Message-ID: <dbf4a48e-c808-4611-96b1-563ece1e451a@linaro.org>
Date: Thu, 2 Nov 2023 18:40:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/8] dt-bindings: usb: qcom,dwc3: Add bindings to enable
 runtime
Content-Language: en-US
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: quic_wcheng@quicinc.com, linux-usb@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-2-quic_kriskura@quicinc.com>
 <272a9764-1cae-4d86-88b1-00175de83333@linaro.org>
 <960101cc-78c0-49cf-ab62-90614eeb9ee2@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <960101cc-78c0-49cf-ab62-90614eeb9ee2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Hi Caleb,
> 
>    There are two types of platforms, some use extcon and some use 
> role-switch to deliver vbus/id notifications. Extcon targets already 
> have this qscratch modifications present today in vbus and id handlers. 
> But for role-switch based targets we don't have any way to get this 
> notification to dwc3-qcom. In this implementation, I wanted to get those 
> notications from core to glue and for this we implenented vendor hooks.
> 
> The property added has been used to do two things:
> 
> 1. Register glue's vendor hooks to core driver
> 2. Do runtime_allow for glue (and by default for core as the dt is not 
> flattened)
> 
> In case of extcon, we don't want to register vendor hooks as 
> notifications are not necessary.

Could it just be enabled when role_switch is present then?
> 
> For xhci, we opted to enable runtime from userspace.

>>>         HS/FS/LS modes are supported.
>>>       type: boolean
>>> +  qcom,enable-rt:
>>> +    description:
>>> +      If present, register vendor hooks to facilitate runtime 
>>> suspend/resume
>>> +    type: boolean
>>
>> A Krzysztof pointed out, properties should define the hardware 
>> behaviour, not tot the implementation details. For this case the 
>> hardware isn't wired up to vbus, so maybe something like "qcom,no-vbus"?
>>> +
> 
> On all targets, vbus is not routed to hardware. This vbus toggle 
> indication is given to controller via qscratch only.
> 
> Regards,
> Krishna,

-- 
// Caleb (they/them)


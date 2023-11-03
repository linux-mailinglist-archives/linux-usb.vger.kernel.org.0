Return-Path: <linux-usb+bounces-2492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B27E0517
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 15:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C64B8B2136B
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 14:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B111A58D;
	Fri,  3 Nov 2023 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pn24tQiU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ADE1A287
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 14:56:49 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D508D4B
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 07:56:43 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso30551801fa.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Nov 2023 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699023401; x=1699628201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzRav2ZfuBCwiXlPtdX/9u8isJFM6SrzAhyoI7wYWQE=;
        b=Pn24tQiUjPLyBLkG3Qe2NpyvS10i7qITQ7YbnU1hGUUdtW+034F7pXZ27hmtaeVd2Y
         +BB2M18gEOq+1Xfg+CnuPGz8iuBUijfEYPWJ4cP3PqM3/gsL2wMd8ozxgYWyP92FFOU3
         NlJbDtSKDEWzNd3yaqN9ec9AAxIncQH+aOmP508WeqgYr/COzepVlf49nZcES5y+wQxF
         t1Jf/UGUWv6gX/h6iM81V8NULbY2LpEpYhqI7Iyoj+88NdDEb4DYJJmwUT8pmb18tDOJ
         gICf859WcxLFEmPgonKhOTgepAo4r8IaXzPTEFssBF8/ltxbZzxjKlJl+TrAa6Acp5N8
         f7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699023401; x=1699628201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzRav2ZfuBCwiXlPtdX/9u8isJFM6SrzAhyoI7wYWQE=;
        b=jAxMxJo2ncPH9sdPMyoL9m4qsuPiZrFi6bh8r3EKHUO1uz3XUhqMUboeY8iU5Avi4Y
         IPrGIot423P6rRqlxfi9rHmMHkRXQ8CTPGi2BJ+t3AwFEFUv3ZKidhmXAc4JKtFEgJEv
         4sqstLj7dPd0Ptv1o4AYAmDQ0iuICeh+sMqjDUbYVo3EkGXykMFs0FPY7iQbYxOpUfyZ
         vQRnmUFwib/klgm78x1cZl87JzhZ4Sqx2ZfUr1hviK+4K1QcQ4FmLTnfayBAppAWoxAO
         3hx1hhomhZMdEbsBsM/Kgd9pZnuZwGOeEQf5KS8eTUVa9EZ58YRi95rfjMhc+KQ4kgjr
         hsjQ==
X-Gm-Message-State: AOJu0YzPXOQO0fM1aU1rwCBoBj4EEHxxoVu2Zytq3sQn5mUf6Gd72ttt
	iZyZjVpWjY103dvE9YlJihIADA==
X-Google-Smtp-Source: AGHT+IHrwPsCOO5sN+SmbdkmMIdCW6kgWzAR/USeO8iPtpDH8HwcJAhi+6vW3PBDfaeLUzgkB8gAOQ==
X-Received: by 2002:a2e:be0c:0:b0:2c5:1bd9:f95c with SMTP id z12-20020a2ebe0c000000b002c51bd9f95cmr20995596ljq.53.1699023400703;
        Fri, 03 Nov 2023 07:56:40 -0700 (PDT)
Received: from [192.168.1.7] (host-92-25-138-185.as13285.net. [92.25.138.185])
        by smtp.gmail.com with ESMTPSA id er14-20020a05600c84ce00b0040472ad9a3dsm2656519wmb.14.2023.11.03.07.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:56:40 -0700 (PDT)
Message-ID: <96b3ebe5-781a-432a-9a73-2217a2a674f4@linaro.org>
Date: Fri, 3 Nov 2023 14:56:39 +0000
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
 <dbf4a48e-c808-4611-96b1-563ece1e451a@linaro.org>
 <f0820464-16d6-47fd-90bc-cf80b5d76058@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <f0820464-16d6-47fd-90bc-cf80b5d76058@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/11/2023 05:34, Krishna Kurapati PSSNV wrote:
> 
> 
> On 11/3/2023 12:10 AM, Caleb Connolly wrote:
>>> Hi Caleb,
>>>
>>>    There are two types of platforms, some use extcon and some use
>>> role-switch to deliver vbus/id notifications. Extcon targets already
>>> have this qscratch modifications present today in vbus and id
>>> handlers. But for role-switch based targets we don't have any way to
>>> get this notification to dwc3-qcom. In this implementation, I wanted
>>> to get those notications from core to glue and for this we
>>> implenented vendor hooks.
>>>
>>> The property added has been used to do two things:
>>>
>>> 1. Register glue's vendor hooks to core driver
>>> 2. Do runtime_allow for glue (and by default for core as the dt is
>>> not flattened)
>>>
>>> In case of extcon, we don't want to register vendor hooks as
>>> notifications are not necessary.
>>
>> Could it just be enabled when role_switch is present then?
>>>
> 
> So we would register vendor hooks when usb-role-switch is present but
> don't do runtime allow, and leave that option to user space right ?
> I think it would work and we can do away with the binding completely.

Can we still enable runtime suspend? Maybe someone else wants to chime
in here, but I'd guess that it's preferable to have it enabled by
default, particularly for devices like phones. Or are there side effects
from this?
> 
> Will wait for comments from other folks as well on this approach.

Sounds good, thanks!
> 
> Thanks for the review,
> Krishna,

-- 
// Caleb (they/them)


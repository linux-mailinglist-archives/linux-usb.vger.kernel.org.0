Return-Path: <linux-usb+bounces-8913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 642AF8982D5
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 10:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AFA1F27016
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 08:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9FF67752;
	Thu,  4 Apr 2024 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRBZ9hmj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CFA5C919
	for <linux-usb@vger.kernel.org>; Thu,  4 Apr 2024 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712218054; cv=none; b=mk51H6GeuW4RZaBqMkniVdi9xSPX5Isx0vgqFw5blTvIfHwQbqk7/8w00kOncxFc2eNZLWjYD8wvAaO+R165iMnftrBJqLn81Uv2kAvwpJcnDPLRNs3JrJD5/7/1/poi5zqR09D9E28r8yd1MeYsN1y6vQ4TL+apwNFFBDZGFpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712218054; c=relaxed/simple;
	bh=FUyUXwFhDB1woilQzI42oNSlwR0worgsUnu152hRI5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7cSkMBhI15gyDogH+Nc97ePv5hKcAYt1Ch4ZXf4vNxJ47uAmewyi9DuoCHY8DfOW16qbGN6XHGgOlPeFIrfUoW6Ap1uV9HAGRB/zCR9KmoMnk4XS/KL778BK6JmOQ3HU4Y114X3NoalAxC7v8KrH3T9E/9L6GJOQLshbqqLxrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRBZ9hmj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4e62f3e63dso80651266b.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Apr 2024 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712218050; x=1712822850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dCTUAhZJFbzQDyd/4w6lsOOlLiMl8pEzapP9VBzi7qE=;
        b=yRBZ9hmjifjcKUkG5HuzE8uvtKV1lcOJ7xIoYYSay6nouvyhDl09Q3f44xl3a3QHuv
         /4C/I524/6JUK+bAo1XpiWpR74Dhdvk/gjO5vwbnQjceiEcl6ApvQ5A6su92SA1fPyDx
         /E8h1dRusoaMkVn3rL2eTu3fVitRKIDm8m6M333zg7huF2LYM8YqoCJL/vwT4Bzbgji2
         K01pqw7fiYtGd+cNG5sVhH8b+MXbNikFVPxXahCGVOD1ZSTR6iaNH+7hUn2qw+3DjnQq
         ri6cr8FFNh+gSkrPkhfqVhubcPNrn6xKflPqlNRUqUQSFTw/7u9jGLxJ8gmjVAabLLfO
         Spdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712218050; x=1712822850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCTUAhZJFbzQDyd/4w6lsOOlLiMl8pEzapP9VBzi7qE=;
        b=H27TNtFxy+KVb2pWsBIJZAe557DzHKNNfHp9z2D/3KxyX9jyss+PoXMnUxNJnCiNh1
         gK0cgAwz4FgUAvXlwemvCJGp6/nswC2SCZnLMUuaciiy6a28XPo/HHOTF0SJQn1kdRSO
         xaz5EdEGEwU4Yuu9vEOcGU5jEeNCnj4ho3ZUdfezccGeWcFXPNc9MZUfDylMH6nn8L7V
         K0FyMeSsUmehesia+x7eQ2wAsO1VarAHMwQnXHSukrE23Mi28NqUlMrEALs+Icb7WjoL
         NG+XSjrAVmFO9MGTFjk5yOVl8YNmcBW6Bk5CRdfqxjEVfJKI3WaXwZIz3M0gEr5DWrVg
         AUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb/AoA+4SsmqUUMwqUQ6PIK4/LMS6JQzW+u0zEsgUKBskKz1Ooh0rjtGZ0R4ikOvgmNS2SSdWWj0h3vG68ECOI8PLkIw4LQA8H
X-Gm-Message-State: AOJu0Yzs098lRVh0J+QeJedH1mCgByHI/dX0oCorzvrITPD0J7fASKfG
	CSrp6LJ1jQciaIvGcYgUy9EGCvOCMP2i2CQII1GGnxSRHzPE2AXaW6kQQf+BhNw=
X-Google-Smtp-Source: AGHT+IGqeZwfGX52j9azQa0nCOGmXL/fBRyDHbnuxWaSuZOTA7FEg5wiMKsZSXMNOhAtOp/trwFeFQ==
X-Received: by 2002:a17:907:bb95:b0:a46:de64:c479 with SMTP id xo21-20020a170907bb9500b00a46de64c479mr1021624ejc.69.1712218050380;
        Thu, 04 Apr 2024 01:07:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906311b00b00a4ea1167a52sm1746165ejx.25.2024.04.04.01.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 01:07:29 -0700 (PDT)
Message-ID: <f16e1280-8f7e-40a7-ab45-9acaeb3e90cb@linaro.org>
Date: Thu, 4 Apr 2024 10:07:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/9] usb: dwc3: core: Access XHCI address space
 temporarily to read port info
To: Johan Hovold <johan@kernel.org>,
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240404051229.3082902-1-quic_kriskura@quicinc.com>
 <20240404051229.3082902-3-quic_kriskura@quicinc.com>
 <Zg5VDnbaaBXJyRjV@hovoldconsulting.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zg5VDnbaaBXJyRjV@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 09:21, Johan Hovold wrote:
> On Thu, Apr 04, 2024 at 10:42:22AM +0530, Krishna Kurapati wrote:
>  
>> +static int dwc3_get_num_ports(struct dwc3 *dwc)
>> +{
>> +	void __iomem *base;
>> +	u8 major_revision;
>> +	u32 offset;
>> +	u32 val;
>> +
>> +	/*
>> +	 * Remap xHCI address space to access XHCI ext cap regs since it is
>> +	 * needed to get information on number of ports present.
>> +	 */
>> +	base = ioremap(dwc->xhci_resources[0].start,
>> +		       resource_size(&dwc->xhci_resources[0]));
>> +	if (!base)
>> +		return PTR_ERR(base);
> 
> This is obviously still broken. You need to update the return value as
> well.
> 
> Fix in v20.

If one patchset reaches 20 versions, I think it is time to stop and
really think from the beginning, why issues keep appearing and reviewers
are still not happy.

Maybe you did not perform extensive internal review, which you are
encouraged to by your own internal policies, AFAIR. Before posting next
version, please really get some internal review first.

Best regards,
Krzysztof



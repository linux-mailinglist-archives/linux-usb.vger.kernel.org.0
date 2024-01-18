Return-Path: <linux-usb+bounces-5222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7A831AE4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751741F26ADD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 13:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689AF25605;
	Thu, 18 Jan 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMO8vjFW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF825611
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705586099; cv=none; b=L4GhNrbSSLhOMr4t6PbwVmxoKESH8nF41FV6AqAsoEMFeqk+Q0woM4L7Q9Y9OzZHFb5z2Qwar29u4sXSE4Wuxd90NempRVuzET0UVHNZs9hYq7YbEGKCtE/Bovcn1vqUNUCkg4mXCEjAWRsv698t8y/OfZuG6WZj7tdeRQgITe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705586099; c=relaxed/simple;
	bh=ps1E8PJMTt8mzlLH9eECx/CQbcZhGFU/1wZdq7L4X7U=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=jgIK7//k16nOmTr1eGHHMPc92eJmx410mmQAfT+sz/A5ZEUvchMfpnQ1XdL48RXJZktqr14l4Gq9WQbt8RylQgw06CZKojL1WwRsBFzwfZMsjXFL0Vn2bwmmgv8H8/Xws6kum0tmvaG4/WzQyw8HPlNgBtSpSkyhukyVBilf3X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMO8vjFW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e67f70f34so13070679e87.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705586095; x=1706190895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ps1E8PJMTt8mzlLH9eECx/CQbcZhGFU/1wZdq7L4X7U=;
        b=eMO8vjFWQ3mLQEcF9OVRKUcV8xq494PRj7nXY1uEX18N2uT+1U++WnIF31AH5f9QYV
         M5+vJvnPlhu3Vt6Y/cc35q6yCz5RWvXlB/MPB5GRu9RflYkXahandtDYfT3ED7cUroRb
         B0bIjyNmqjdE+4Iu9UkuSh1SCwmbyaV7pdzxBUfPB7wef/qmYDHHn+qPPDhH/HcoFxVo
         NbZgi7KzWgwMO0qTknkSaSKV4TnQKqlw+a8BcpsQIxjLQIb2tIAqm1ljFpB0wsM8sjSW
         5qZRjvQWX14VRxqgTR/zNV2x7V8UgOQ20NVKnAMFumItnNwSnd75igwmURnSDFbYT50I
         rbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705586095; x=1706190895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ps1E8PJMTt8mzlLH9eECx/CQbcZhGFU/1wZdq7L4X7U=;
        b=NNLTRV3KizE5HWx6z1R0hoDjO9GBX0zJMdz2QGKKQ91E1OfyVszPbqQgXaEF20GRi+
         VF/DgyOL/rHDFw++YkyIV/XOa7QQWlHOGnxX6DMECXwo/ugf3yqXEBycE8DedF7z3BeI
         6zuGGG3q/yiELecju2H4muA6EYONXvshTk8AT80rwqJwUpGTetiZ++s2wiINL7/KHX0H
         Adp8nYMkjCiw1HXGi6qqWeY5fKUxFMAisECLAZnPy7yKGZ4CHKQpxOqwV2vUR6ATCwpO
         jl2XTKNiJ0Si2ZOmFMlKBu2wG59ANPGK2uEKXekc7kxcSasvqhA68ZMQ6pp9LbbdY1do
         jn/g==
X-Gm-Message-State: AOJu0Yx+KEalmgMwLskM8yGxtB9Ky+8fV+I2eJAutCoQbM8td3pnB7C/
	7VsKlYULTKG7b8wjT9s8pZApelogk+C8rOdRXxuyQvoJsoJ7Y+Hwo56hvLIfBkM=
X-Google-Smtp-Source: AGHT+IG81baX14qnfLZc7lP1lCoEd/MVMqnvyBVS2danUVivMYbgvenMBVknrh3McJP0uFBgXyCTSg==
X-Received: by 2002:a05:6512:3c92:b0:50e:78f3:dbed with SMTP id h18-20020a0565123c9200b0050e78f3dbedmr612042lfv.91.1705586095296;
        Thu, 18 Jan 2024 05:54:55 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x7-20020ac24887000000b0050eab7d397bsm637771lfc.256.2024.01.18.05.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 05:54:54 -0800 (PST)
Message-ID: <e28dc651-a573-4c73-b030-19dd69c48493@linaro.org>
Date: Thu, 18 Jan 2024 14:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <20240117220153.GA649327@hu-bjorande-lv.qualcomm.com>
 <9a24a065-b649-4431-b8fb-78c733c07671@linaro.org>
 <CAA8EJppEFSy2=GKgkqC3uS15cO51KfxDrHtxHhAnA10kScYKhQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppEFSy2=GKgkqC3uS15cO51KfxDrHtxHhAnA10kScYKhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/18/24 14:38, Dmitry Baryshkov wrote:
> On Thu, 18 Jan 2024 at 13:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 1/17/24 23:01, Bjorn Andersson wrote:
>>> On Mon, Jan 15, 2024 at 11:00:53AM +0100, Konrad Dybcio wrote:
>>>> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
>>>>> Define VBUS regulator and the Type-C handling block as present on the
>>>>> Quacomm PMI632 PMIC.
>>>>>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---

[...]

> Is there an ack?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad


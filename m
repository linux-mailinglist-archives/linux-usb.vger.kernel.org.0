Return-Path: <linux-usb+bounces-2905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096337EC868
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 17:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B605228120E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 16:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E0A39FE4;
	Wed, 15 Nov 2023 16:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkWcuGjH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D9381C4
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 16:21:21 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24481BE
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 08:21:19 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c5056059e0so100075841fa.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065278; x=1700670078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vVv1D9dMzK2tGtDx8E6+Meyyl7KM9X9Cid8vZyXVWLQ=;
        b=nkWcuGjHWJlB5oS6s7QCKl3FJKD8BYVs9YdjKPKINd9d1LnpFfakwqEXoBS7xW5Nt5
         Gtcc37cKfSDpibVFQ2NsQLabGSJ2a4xAJ3BY+g5hEQHo505zfTZGvkKfY90pQ0BrqgOg
         sqAg1UIbM9In5PqbYpkX0DSsgDCzkAYFGUhfBPqAirROTXdLQBZ2m5iFBWKa775OEjpD
         y72smCeEQIzruatQXYPlhJEvptIWmrYSb0kq0GKwiYZCgqK1BkAIM624D/gHbsmhKmO7
         EGbE7NkgOfSu2eKZ5qlTTLcM1xmHkk9S2GnrhOHnD2j/z1KeqPJHXp2j352wQ/Y8INFf
         tqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065278; x=1700670078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVv1D9dMzK2tGtDx8E6+Meyyl7KM9X9Cid8vZyXVWLQ=;
        b=hzqljZlvNlbITnoxglfvEhu6kzfBX1L0QGoYQzDehyPFzb/1NAKWvVhR/t+yd0g1Ot
         W9IJGPNSMj3lG7uZ2VPpuXzpDV9yC1PzewlwgYGs7jPvFJc8pg0e+urCDJ8ht2jrLuA8
         L0I1Pnb4finOnkgAxOlGId/P7C/VSsai6Ls+vKs7H4O6ksMbkRP/PQb5i6V1amrF1a7i
         irTkOEwnNA8vGlmmEfVDQWCx0hhGGPXN/GPKnvagqGFR98OqQP6wkylJZkTxoPgg90RU
         oG1RPKgCGE3+A+URgy+MEl2x9eCrb3buTex/koTsjk5p/uSquSet4USzh/8FlfOPOwFT
         /tyw==
X-Gm-Message-State: AOJu0YwipsJu6Da3Two10j5sThh3VDY7yMgJcur92QyiVuMGr7a1Z5Pm
	b5MH8Fgn6JT1BKY6oR1eMevwlw==
X-Google-Smtp-Source: AGHT+IFCLx6HHI+jGJHV1et2rTKGgSRQshmq5seiuQChkp/OhZAw87J/KqKNvRdslV7HkciiBmhLaA==
X-Received: by 2002:a2e:7811:0:b0:2c5:1e70:7d30 with SMTP id t17-20020a2e7811000000b002c51e707d30mr4743696ljc.30.1700065277935;
        Wed, 15 Nov 2023 08:21:17 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651c0a0800b002bce77e4ddfsm1699622ljq.97.2023.11.15.08.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:21:17 -0800 (PST)
Message-ID: <e603c4ef-d834-4d23-81a1-abe6ba45d61d@linaro.org>
Date: Wed, 15 Nov 2023 17:21:16 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: connector: usb: provide bindings for
 altmodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
 <ae5131e3-b282-437d-9a80-ae8b697eea3c@redhat.com>
 <CAA8EJpq_vXefsNHmUCopmyATF8=PsjG0-EwJCY65yfvkCK+A4w@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpq_vXefsNHmUCopmyATF8=PsjG0-EwJCY65yfvkCK+A4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 23:13, Dmitry Baryshkov wrote:
> On Mon, 13 Nov 2023 at 18:07, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 11/13/23 15:33, Dmitry Baryshkov wrote:
>>> In some cases we need a way to specify USB-C AltModes that can be
>>> supportd on the particular USB-C connector. For example, x86 INT33FE
>>> driver does this by populating fwnode properties internally. For the
>>> Qualcomm Robotics RB5 platform (and several similar devices which use
>>> Qualcomm PMIC TCPM) we have to put this information to the DT.
>>>
>>> Provide the DT bindings for this kind of information and while we are at
>>> it, change svid property to be 16-bit unsigned integer instead of a
>>> simple u32.
>>
>> Thank you for your patches. I'm fine with this, one remark though:
>>
>> Since at least the existing arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> is already using this I'm not sure of changing the svid property to
>> an u16 is really a good idea from devicetree compatibility pov ?
> 
> Usually we try to keep DT compatible, that's true. And I also do not
> fully like the u16 notation. However I'm not sure whether using full
> u32 for explicitly u16 value is correct. I'll wait for the guidance
> from DT binding and USB maintainers.
> 
> I'll mention the qrb5165-rb5 explicitly in the cover letter.
I'd say it's fine since it was incorrect from the start (+ bindings
shouldn't describe linux's flaws)

Konrad


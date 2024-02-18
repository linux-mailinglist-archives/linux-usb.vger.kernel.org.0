Return-Path: <linux-usb+bounces-6704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1C8598F8
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 20:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC09281470
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 19:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB60071B27;
	Sun, 18 Feb 2024 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeOqP6LT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22636F517
	for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 19:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708283432; cv=none; b=G95dOU0w40H/dh8x3mD3wuYdNh5Gic3XJ5YTzdG8eLayTzpKUuBZMx3LmIIi4LfXvghWelHmqiofowPCmiVpCuo67PyK+gxedlp7Dlt5y/CJkieQnWVzShY0cOXqdg0lB3K96BpJQbVgs7zurGGgQJXI641ve/a7ItoEPHuuirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708283432; c=relaxed/simple;
	bh=2OiUQOvcZKm6PUzGnZ1RrYTTFoV1/H907nhnVmgSlG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6D5e3YjBakiZe38i34w39cxsm0z8V6BehaCJBzya6SNcTxCgv8Y/yWj29hNhCvbOITEBZemeXzTKd+5/iGbbGLiCXO7NCP4XwtaV1K11+MPJ+J7B0se4as/bEIxh+PpFCvks42iucPjhWmyAvO7egEbIbxpBfthuOeMP/qWWRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeOqP6LT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56439b7c7a9so1017101a12.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 11:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708283429; x=1708888229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ah3PVEu8tN1U7WxibGyKTgjBe3AELLyTP3yUvUcDK7E=;
        b=PeOqP6LTEl3a83ku7rMNhngJiFP7D2M4eN5dENNd9dXGwAL3lDFSt7KxvGt8ZiFwge
         jB91W2Nk5YxSXZ243KwqhNPIaqL7Nrfnb/dljD/Oh1VC6RdDFaXgMH/T/qMASGIkrkEu
         cO+ORYoSomxtxjcEWlBuYKqo3VpxmvYqt5H+L17nfm3M794qbvjRr1fD60GevYLJ0/kN
         b6210WenCgIr83wXBgNFoORIjEM+M1LsnYO+SLO4GbdwPBw0WNGSzh7cUfI/8ZglgSOO
         qsWNWbLyPp1XgWmUIQQs9XCY41w248B6q85UKzMW0L9WRTCIPoyNWgpLXbxItut8bsLS
         2U6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708283429; x=1708888229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah3PVEu8tN1U7WxibGyKTgjBe3AELLyTP3yUvUcDK7E=;
        b=jmXQLEFTslhpEfDIJ26iTe/FRseBSvoDb2y++tzvE2iv+382eulQ1BnrxMsQQOP35W
         9I5DEkMF18hk9QALBdlyHc/aLHHjpkr/fxPbxrugW8OeZlyLM254/WeoCR0fsVwyy+Ga
         BG9EKfSlIsjVGUt8elNcIiVlvdoSISQseoDVDe42GD4hr1nVkmvhf8Qqr8q8nQJEQM2n
         N5w/Dd3r4k28L5OZFKphAXdEoF0eyH4KRvWUwwDBq/l0W62UyquJSikVUqwj2hz0UES+
         yb7fFXuCchy+HkoULQbKuD8hwYBzN4NeiFukRvTD4NDWT/e+pfZoL28Kmf9r86A6NXoP
         e3cw==
X-Forwarded-Encrypted: i=1; AJvYcCUqkEv6J2Xq8zp93YFxjwnc557aMriVX3b3oN23jRSkWgqIWGNQfMwPJjyiTyYqdV+iuc6sufffkPrpeoexBs7pAhvqgVOuVuPy
X-Gm-Message-State: AOJu0YwrQHoWiUQKiMsEcxoNJFBTpICeuxVfoyYrA22v7XQQfDAoNEAQ
	HSgVylhQj5k33/CWRhOe2nzscXd0RxKkQdJvEptW4UsUWxMj/d7IkSenC5dFfrI=
X-Google-Smtp-Source: AGHT+IHG7EUQ1Lj6VSnjTbKaODUnEDyms7rRXGLPDHhArV02Xl+7l8pWi7wkq1Hz+7C0klZApkVexw==
X-Received: by 2002:a50:fb84:0:b0:564:2518:adfd with SMTP id e4-20020a50fb84000000b005642518adfdmr3719731edq.10.1708283428977;
        Sun, 18 Feb 2024 11:10:28 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id p24-20020aa7c898000000b005617a858f21sm1942850eds.93.2024.02.18.11.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 11:10:28 -0800 (PST)
Message-ID: <f4e2cd9f-d8d2-4669-9bbc-57f67a24e734@linaro.org>
Date: Sun, 18 Feb 2024 19:10:27 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm6150: define USB-C related blocks
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, quic_wcheng@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240217163201.32989-1-danila@jiaxyga.com>
 <20240217163201.32989-4-danila@jiaxyga.com>
 <6bf11ccd-ff08-369b-913f-277c189afb76@linaro.org>
 <b0b732b8-456a-4021-8277-cd51f01ead17@jiaxyga.com>
 <44c669a0-3722-4a58-be78-0c91f0573ca1@linaro.org>
 <60728953-bdf0-4a06-a90a-d1191d41962b@jiaxyga.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <60728953-bdf0-4a06-a90a-d1191d41962b@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2024 6:52 p.m., Danila Tikhonov wrote:
> You are referring to Dmitry Baryshkov, as I see. But Dmitry has already 
> reviewed my patch (message above).

Yes we previously debated and discussed verbatim copy of downstream 
versus the format we used for 8150b.

The original driver I wrote for tcpm and the dts that went with it 
derived from 4.19 where the interrupt definition was already right, so 
in that case copy/paste of downstream is fine.

However with earlier kernels, 4.14 in this case the signalling isn't right.

Please read the discussion and reconsider your patch.

> So it would be rude to change anything without his knowledge. Let's wait 
> for his answer
He'd have to be arguing against his own patch.....

One final nag - please use the kernel discussion format of bottom not 
top posting.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/sc8280xp-v6.8-rc4-camss/Documentation/process/submitting-patches.rst?ref_type=heads

---
bod



Return-Path: <linux-usb+bounces-3433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B457FC578
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44FF1282E6B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 20:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD785ABA5;
	Tue, 28 Nov 2023 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SiwLo2O0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A9E19A7
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 12:31:59 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7b37a2e6314so5397139f.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701203519; x=1701808319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XKy/giFFBzRIyzsC6NU3QO7zkRURqbCQ/tW1YwEn6Y=;
        b=SiwLo2O0OhSmKDYpHILB9ohM2R3qBHSzWMgVUb7M2dWwniXNSGgCcmuJcoGePpAOeG
         S0fFFAjutdIyjJMXXNv6nA+njDrO2oOZpZ2AeUu1tFLc7QqUfMBrMDW58fbvePNvlnnC
         jXJwF/SOE3oeGUX/e21onWUce0Q/bin7331Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701203519; x=1701808319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XKy/giFFBzRIyzsC6NU3QO7zkRURqbCQ/tW1YwEn6Y=;
        b=kG5HPVJkyagY7NFQxnYmg89xTWu/fuq/ZYet2qrfXso5d6yMK2LDir6urP0H53xyfm
         A+R2X/vaynWCdTG0djDTeChziyWIDuBQnGVQdP4zZzW1akFnqtb4Bx5KiSiBpHclDn24
         gB3xoBlpCnxqROCSwXoIOc4B+cD/7R5XWeIovx5DWfAb8dC4m+6pdWeNtU7uJQY4a/s6
         /1mQgwXY4Qh29y4PPVN9FjrxHZDJDG+hBk8OYBySPqmEsX4PA+G/f5Hy1igpyPiDBgA8
         OnK8Z8sj0f+r4X5gmNi/WpQudz4dQ76IKQW620jy3gWqWxam+4kKP6RhxxvOjBm7CeiT
         K01Q==
X-Gm-Message-State: AOJu0YxRttyYmB9CMlAkU9SBqRo4mJYN9MOe1t/Kul2cgwpRhwql6zjg
	LMM2235FOLN64LpNsN5Y47ZsyA==
X-Google-Smtp-Source: AGHT+IFna264rM5zePA54oe3gS4wTFePNviMXEcNhpU5WbPBZPcIwYZstfSmI2NMsYQlR27ceiOn8Q==
X-Received: by 2002:a05:6602:2e0f:b0:792:6068:dcc8 with SMTP id o15-20020a0566022e0f00b007926068dcc8mr20561718iow.2.1701203519002;
        Tue, 28 Nov 2023 12:31:59 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id q1-20020a056638238100b004596858b397sm3103355jat.7.2023.11.28.12.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 12:31:58 -0800 (PST)
Message-ID: <c9c09012-9df8-406b-a299-1310d9c626b2@linuxfoundation.org>
Date: Tue, 28 Nov 2023 13:31:58 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: Don't submit special requests twice
Content-Language: en-US
To: Simon Holesch <simon@holesch.de>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231128000955.119735-1-simon@holesch.de>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231128000955.119735-1-simon@holesch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/23 17:08, Simon Holesch wrote:
> Skip submitting URBs, when identical requests were already sent in
> tweak_special_requests(). Instead call the completion handler directly
> to return the result of the URB.
> 

Sounds reasonable. What happens when a tweak_* routine does nothing
or returns an error.

tweak_reset_device_cmd() returns 0 when it can't get the device lock
and after calling usb_reset_device().

tweak_set_interface_cmd() and tweak_clear_halt_cmd() return the value
the usb_* routine they call. Don't these cases be handled as well?

thanks,
-- Shuah


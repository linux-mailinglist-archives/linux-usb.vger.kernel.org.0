Return-Path: <linux-usb+bounces-3386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C87FAD7F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 23:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9822D1C20E22
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 22:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1D24594E;
	Mon, 27 Nov 2023 22:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d/kZFQmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838561AD
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 14:33:52 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7b38ff8a517so21869239f.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701124432; x=1701729232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRurvJBixT9EaPt149GqF23JO/Hj3FJOfl0g3s+cV30=;
        b=d/kZFQmSqL/CVbe8x/MUYwLDMONqAUs8YcXijkfvYPIRComGmCw4fXjT3b0M2Mcpb6
         Jr1ql3VL3wNfkJVVHplNgIWy/y1TrIaIaI0eg2RAFcZgKhCFpmAyAi5lLZW55OgQyOqx
         DGMVP6bc+Clb2lGACqMGopBdrVHyQUytYf6G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124432; x=1701729232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRurvJBixT9EaPt149GqF23JO/Hj3FJOfl0g3s+cV30=;
        b=MLlwgS8qFFBuwhdWAmPNpN76Ul++jwXEIKgiFge1fcGFQuNFva5EIruUahHDmB5cgj
         ZcJJ0byS1U8d0orZXfATrwu4b8+QzeWtEMWQbDa2RmtWaCgrmYmakoxGiFPR1KxTa2Rn
         psWdsd3iEAle7Agx/ouqKK8ZsJyUvIaQtLcmEAVTCUqYjdxdpLPkAYblDlAkiLgf4oKv
         ORjEd4jj+e9NhitrO+A0lITnb4pznoP2wfJsEIvBugZnpEnkoUY4CaqUB4ZO/GCWVqYj
         2IQu2+XgDuinn4DtoSljprv4iRKgaNLDRN7AwNbgW07Q6llpFKSR1hxjNsfusmaw8WHE
         LycQ==
X-Gm-Message-State: AOJu0Yy86J1139q0wpa88FdXxUkoHeBv4yk5H9qkC/cIDhIUS9uITmJk
	RLkRFI8agrSgxgIJ1Pyggq2vuQ==
X-Google-Smtp-Source: AGHT+IGh5IiXqi5dcw0tW55Z6m25NZgO5YspNsDlNPeNkzRHiMxeLfGiS5mMw/2e+Xpfx5UIOjXfjg==
X-Received: by 2002:a6b:7a07:0:b0:7b3:92ea:3438 with SMTP id h7-20020a6b7a07000000b007b392ea3438mr6812083iom.2.1701124431854;
        Mon, 27 Nov 2023 14:33:51 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id w30-20020a056638379e00b004665c3f56ebsm2579841jal.15.2023.11.27.14.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 14:33:51 -0800 (PST)
Message-ID: <b0ab598c-4303-449d-8a01-349e642d8c11@linuxfoundation.org>
Date: Mon, 27 Nov 2023 15:33:50 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Don't submit special requests twice
Content-Language: en-US
To: Simon Holesch <simon@holesch.de>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231126234839.52434-1-simon@holesch.de>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231126234839.52434-1-simon@holesch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/23 16:48, Simon Holesch wrote:
> Even though submitting those requests twice should be harmless, there
> are USB devices that react poorly to some duplicated requests.
> 

The change looks good to me. I want to see the change explained in
the commit log. I see the information on why the change is needed.

Please add a bit more information on the change.

> One example is the ChipIdea controller implementation in U-Boot: The
> second SET_CONFIURATION request makes U-Boot disable and re-enable all
> endpoints. Re-enabling an endpoint in the ChipIdea controller, however,
> was broken until U-Boot commit b272c8792502 ("usb: ci: Fix gadget
> reinit").
> 
> Signed-off-by: Simon Holesch <simon@holesch.de>

thanks,
-- Shuah


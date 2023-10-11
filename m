Return-Path: <linux-usb+bounces-1461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF87C5238
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 13:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CB41C20EB1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8800B1E530;
	Wed, 11 Oct 2023 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJYYvnrI"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9015EBB
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 11:36:01 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B0D93
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 04:35:59 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bffc55af02so80131141fa.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024158; x=1697628958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfU6ATFelrGu966VZVs/blAhCg+Ba8qkIlUWqDpamxM=;
        b=nJYYvnrItx07ylnqmU6Yqw21DH6o0xsnEzFr7EHRZJXDxww8PnP9jAJPnGltO6/Z4T
         lzierFc0lE+8puAu/shdeuSP1BCDcbGqDL42ZO+gVR5EmAt3i3C32FAO7w6EbSnZfkYp
         3wTNZq8QOOBuBByhMFwwOc7r/DJHRN6QcTZZfOaquJgEssObpkU2P7hTMwJGsej0lPUE
         Zwaik8hQyZqR1MLYu+J/st1wzgls8NJOi2irDfQg+op33neopZGhQ/3UOezqeP1QtcUz
         EVHPfcdQkm1ZHq1yIgIvR/0Rld/6ItmdzADVV4c2Edsw0nJTHtwQjYzJr2rLVdzLIQXY
         OCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024158; x=1697628958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfU6ATFelrGu966VZVs/blAhCg+Ba8qkIlUWqDpamxM=;
        b=dFLQ2LDuTRAZkgDwR9wngnAhz2kV92q2ZSrnZI63Y04MFsfWjeQvOvRL1VUQCDisog
         KOHyowUcp1M3nvo8yqmyAZIP/QnQQHxaS6E3Ces6QXi/9GmiL1av3nsy4bRIppZW4ZsW
         tISz36XqNb73/+3bLRf3esI6PVp2DuvItu4luX/KFZcK6gSJBS7wzbo10Qo4fljexjU+
         juBn9NgmMHalFhKVchyKFoJ6tMu32RtclAokkMfNd9nA1X0CW/imI7gLbXaZWpNrM4dq
         Wo7cloTNYesLAs7T+iSM2wJ9r3+jw0LjOf56tg/jeBpFYdfnc0URtj7UZpy2wliegF4y
         Q4JA==
X-Gm-Message-State: AOJu0Yygu6uZLXpsGfDsw+pPMffFgyd3oHrvkc1eG16tsrnHzQtyYEgH
	ykrsXMk8OjKBLEgROV+F6seqWw==
X-Google-Smtp-Source: AGHT+IEBaybj1t+dM2dbVVaw650KkAnqX2ygF1+tkCcOl8TohGtw/R9IYJXv5TipuD9uPEwiyFb/iw==
X-Received: by 2002:a2e:9e19:0:b0:2bf:f989:b8e5 with SMTP id e25-20020a2e9e19000000b002bff989b8e5mr16412060ljk.33.1697024158103;
        Wed, 11 Oct 2023 04:35:58 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c5-20020a2ea1c5000000b002bcbb464a28sm2882350ljm.59.2023.10.11.04.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 04:35:57 -0700 (PDT)
Message-ID: <21adc424-22e7-4469-b363-41e99f29c3bf@linaro.org>
Date: Wed, 11 Oct 2023 13:35:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable DisplayPort altmode support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
 <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/11/23 12:32, Dmitry Baryshkov wrote:
> Enable the DisplayPort altmode, it is required to get DisplayPort output
> to work on devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Weird nobody enabled it to date

Reviewd-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

